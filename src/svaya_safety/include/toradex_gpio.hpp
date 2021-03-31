// Created : 2 Dec 2020
// Last Modified : 12 Jan 2021
// MAPS are reduntant , need to remove later

/**
 * @file toradex_gpio.hpp
 *
 * @This file is having gpio class with read/write calls GPIOs in toradex.
 *
 
 * @author ABHIN PHILIP P
 * Contact: abhin.pulikkottil@svayarobotics.com
 *			+91-8891101358
 */

// Currently HARD CODED .
/**
* .................Also Refer Datasheet..................
*
*

**/
//[GPIO_PIN][GPIO_BANK]
int IO[8][2] = {{26,1},
				{22,1},
				{1,1},
				{7,1},
				{16,1},
				{19,1},
				{20,1},
				{21,1}};// In the order -> IO0----IO7

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <gpiod.h>
#include <iostream>
#include <string.h>
#include <time.h>
#include <vector>

//For Maps
#include <iterator>
#include <map>

// #define DEBUG 0 
 

int gpio_cnt;
using namespace std;


// For gpio
struct gpiod_line *get_gpio_line(char* bank, int gpio)
{
	struct gpiod_chip *chip;
	struct gpiod_line *line;

	/* open the GPIO bank */
	chip = gpiod_chip_open_by_name(bank);
	if (chip == NULL)
		return NULL;

	/* open the GPIO line */
	line = gpiod_chip_get_line(chip, gpio);
	if (line == NULL)
		return NULL;

	return line;
}

unsigned int error_number = 0;

struct gpiod_line *output_line[20];
struct gpiod_line *input_line[20];
char gpio_chip[10];

namespace toradex_io

{
		
	
	

	class gpio
	{
		public:

			int numDigitalIn = 0;
			int numDigitalOut = 0;
			int init();
					
			//Config IOs
			int read(int,bool &);
			int write(int,bool);
			int write(vector<int>, vector<bool>);
			int read(vector<int>, vector<bool> &);

			
		private:

			int file = 0;
			
			int digitalCount = 0;
			int analogCount = 0;
			
			map<int, vector<int>> inmap;
			map<int, vector<int>> outmap;
			

		
	};		

	int gpio::init()
	{
		int ret;
	    int ioconfig = 0x00f0; // In the order IO7 IO6.......IO1 IO0
	    for(int i=0;i<8;i++) // i<2, becoz, current one input and output for testing
	    {
	    		int result = 0;
				result = (ioconfig >> i) & 1;
				cout<<"\n i :"<<i;
						
				if(result==1)
				{
					
					inmap[inmap.size()] = (vector<int>){IO[i][0],IO[i][1]};
					snprintf(gpio_chip, sizeof(gpio_chip), "gpiochip%d",IO[i][1]);
					input_line[inmap.size() - 1] =  get_gpio_line(gpio_chip,(IO[i][0]));
					ret = gpiod_line_request_rising_edge_events(input_line[inmap.size() - 1], "gpio-test");
				  	if (ret < 0) 
				 	{
				    	perror("Request events failed\n");
				    	return EXIT_FAILURE;
				  	}
				  	
 					
				}
				else
				{
					outmap[outmap.size()] = (vector<int>){IO[i][0],IO[i][1]};
					snprintf(gpio_chip, sizeof(gpio_chip), "gpiochip%d",IO[i][1]);
					output_line[outmap.size() - 1] =  get_gpio_line(gpio_chip,(IO[i][0]));
					ret = gpiod_line_request_output(output_line[outmap.size() - 1], "gpio-test",
					GPIOD_LINE_ACTIVE_STATE_HIGH);
					if (ret < 0) 
					{
					    perror("Request output failed\n");
					    return EXIT_FAILURE;
					}
										
				}
	    }
	    numDigitalIn = inmap.size();
		numDigitalOut = outmap.size();
		cout<<"\n INIT SUCCESS\n";
	    return 0;
		 
	}

	

	/********************************SMBUS SLAVE IO EXPANDER MCP23017 as digital input read/write pin***************************/
	int gpio::read(int config_in, bool &output)
	{
		if(!numDigitalIn)
			return 2; // Error 2 indicates init error

		
		if(config_in<inmap.size())
		{
			
			output = (bool)gpiod_line_get_value(input_line[config_in]);
						
		}
		else
		{
			#ifdef DEBUG
				cout<<"Ooopsss.........The config_in is Out of Range\n\n\n\n";
			#endif
			return (error_number+8);
		}
		return 0;
	}

		
	int gpio::read(vector<int> configin_pin, vector<bool> &output)

	{
		
		if(!numDigitalIn)
			return 2; // Error 2 indicates init error
				
		for( int i=0;i<configin_pin.size();i++)
		{
			output[i] = 0;
			if(configin_pin[i]<inmap.size())
			output[i] = (bool)gpiod_line_get_value(input_line[configin_pin[i]]);
			else
			cout<<"\n PIN out of range";
		}

		return 0;
		
	}
	
	int gpio::write(int config_out_pin,bool value)
	{	

		if(!numDigitalOut)
			return 2; // Error 2 indicates init error
				
		if(config_out_pin<outmap.size())	
		{

			int line_value = 0;
			line_value = (int) value;
			gpiod_line_set_value(output_line[config_out_pin], line_value);
			cout<<"\n Done Inside";

		}
		else
			return (error_number+11);


		return 0;

	}

		
	int gpio::write(vector<int> out_pin, vector<bool> value)	

	{
		if(!numDigitalOut)
			return 2; // Error 2 indicates init error
		

		for (int i=0;i<out_pin.size();i++)
		{
			if(out_pin[i]<outmap.size())
			gpiod_line_set_value(output_line[out_pin[i]],(int) value[i]);
		    else
		    	cout<<"\n PIN out of range";
		}

		return 0;

	}
	
}


