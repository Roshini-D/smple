#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sstream>
#include <signal.h>

#include <tinyxml.h>
#include <string.h>
#include <vector>
#include <map>
#include "ros/ros.h"
 #include "std_msgs/Int32.h"
#include "std_msgs/Int32MultiArray.h"
#include "std_msgs/MultiArrayLayout.h"
#include "std_msgs/MultiArrayDimension.h"
#include "std_msgs/Int32MultiArray.h"
#include <vector>
#include <semaphore.h>
#include <fcntl.h> 
#include <mutex_guard.h>
#include <remote_mutex.h>
//#include <set>
#include "toradex_gpio.hpp"
#include "safety_controller.h"

#include "svaya_control/JointLimit.h"

#include "svaya_control/SafetyPlane.h"
//#include "global_shared_variables.h"


#include "svaya_control/Tool.h"
#include "svaya_control/SafetyData.h"
#include "svaya_control/SafetyDataArr.h"
#include "svaya_control/SafetyError.h"
#include "svaya_control/SafetyErrorArr.h"
#include "svaya_control/master_id.h"
#include "sensor_msgs/JointState.h"
//Shared memory
#include <sys/stat.h>        
#include <sys/shm.h>
#include <sys/mman.h>
#include <string.h>


#include <tinyxml.h>
using namespace std; 
using namespace message_filters;

static const double BILLION = 1000000000.0;

std::vector<int> masterIdarr;
//std::vector<int> Idarr;
//std::set<int>masterIdarr;
std_msgs::Int32 masterIddata;
std_msgs::Int32MultiArray msg_arr;
sem_t * arr_lock;
ros::Publisher pub;
bool mutex_lock;
bool mutex_unlock;
bool mutex_status;
 



  //;
vector<int> gpio_pins;
vector<int> gpio_out_pins;

//={0,1,2,3,4,5,6,7};
//int gpio_cnt=0;
int calc_checksum=0;
//int recv_checksum=100;
vector<bool> gpio_values;
vector<bool> gpio_out_values;

toradex_io::gpio gpio_obj;

//gpio_values.resize(8);
struct timespec prev_time,current_time;
double time_diff;
double time_error,time_threshold=100;
typedef void (*EXIT_CALLBACK)(int);

string master_name,node_name;
//,publisher_name,subscriber_name,;
int master_id,master_cnt ;
struct prev_checksum
{
  int checksum;
 ros::Time timestamp;
};
struct Check_sum
{
  int master_id;
  int checksumMaxIndex;
  int checksumIndex;
  std::vector<prev_checksum> checksumarr;
  
  
  
};

Check_sum* checksums;

bool active_flag;


int first_time=0;

//bool safety_data_flag=false;



 void safety_init(string file)
 {
   
   TiXmlDocument doc(file);
   bool loaded =doc.LoadFile();
   if(loaded)
   {
     printf("loading Sucess  \n");
     TiXmlElement* root=doc.RootElement();
     master_cnt=stoi(root->FirstAttribute()->ValueStr(),0,20);
      printf("master CNT %d\n",master_cnt);
      checksums= new Check_sum[master_cnt];
      for(int i=0;i<master_cnt;i++)
      {
        checksums[i].checksumIndex=0;
        checksums[i].checksumMaxIndex=5;
      }
     root=root->FirstChildElement();
     
     master_name=root->FirstAttribute()->ValueStr();
      printf("master name %s \n",master_name.c_str());
     TiXmlElement* details=root->FirstChildElement();
     TiXmlAttribute* attribute= details->FirstAttribute();
     master_id=stoi(attribute->ValueStr(),0,20);
     printf("master ID %d\n",master_id);
     attribute=attribute->Next();
     node_name=attribute->ValueStr();
     printf("node name %s\n",node_name.c_str());
      }
   else
    {
       printf("loading failed\n %s\n",doc.ErrorDesc() );
       //return -1;
        exit(1);
    }

   //gpio_values.resize();  
  gpio_obj.init();
  gpio_out_values={1,1};
   gpio_obj.write(gpio_out_pins,gpio_out_values);
   arr_lock=sem_open("/arr_lock",O_CREAT | O_RDWR , 0777,1);

  }

void Safety_DataCallback(const svaya_control::SafetyDataArr::ConstPtr& msg)
{
//  printf("CallBack\n");
       int try_safety_robot_limit=1,try_safety_joint_limit=1,num_joints, try_safety_plane=1, num_planes,try_tool=1,num_tools;
      try_safety_robot_limit= sem_trywait( sem_safety);
        const svaya_control::SafetyData &safedata=msg->msgdata[0]; 
       //Robot_Limits

       if(try_safety_robot_limit==0)
       {
             printf("Robot LImits data\n");

     
        int j=0;
        for (auto itr = safedata.Robot_limits.begin(); itr !=  safedata.Robot_limits.end(); itr++)
          {
            printf("In for\n");
            printf(" ROBOT LIMITS%lf ", *itr);
              shm_safety_robot_limits[j]=*itr;
              j++;
          }
  //       printf("\n");
    //      printf("SEMAPHORE\n");
       }
           sem_post(sem_safety);
       // }
     int try_safety_io=1;
     try_safety_io = sem_trywait(safety_in_access);                   
      if(try_safety_io == 0)
          {
         printf("IO Data\n");
      int i=0;
      for (auto itr = safedata.SafetyInputIo.begin(); itr !=  safedata.SafetyInputIo.end(); itr++)
      {
         shm_safety_in[i]=*itr;
            i++;
         printf("    io=====%d  ", shm_safety_in[i]);
       }
      gpio_cnt=shm_safety_in[0];
     gpio_values.resize(2*gpio_cnt);
    gpio_pins.resize(2*gpio_cnt);
     for(int i=0,j=0;i<gpio_cnt;i++)
     { 
       
        //gpio_pins[i]= shm_safety_in[5*i+2];
       // gpio_pins[i+1]= shm_safety_in[5*i+4];
        gpio_pins[j]=i;
        gpio_pins[j+1]= i+1;
        j+=2; 
       printf("%d , %d,", gpio_pins[j], gpio_pins[j+1]);
     }
              printf("\n");
//        safety_data_flag=true;  
          } 
       sem_post(safety_in_access);         
      underSingularity= safedata.underSingularity;
        too_close_point = safedata.too_close_point;
       safety_flag=safedata.safety_flag;
       //Joint_limits
         try_safety_joint_limit= sem_trywait( sem_safety1);
        if(try_safety_joint_limit == 0)
         {
           printf("Joint data\n");
            for(int k=0;k<safedata.JointLimitdata.size();k++)
          
           {
              // printf("In for 2\n");
                const svaya_control::JointLimit &data=safedata.JointLimitdata[k];
        
              
          
             for(int jnt_cnt=0;jnt_cnt<data.joint_cnt;jnt_cnt++)
             {
               // printf("In for 3\n");
              //const coro_control::SafetyData &ptr = msg->JointLimitdata.begin();
              //printf("joint_max_pos_limit_normal_mode %lf ",data.joint_max_pos_limit_normal_mode[jnt_cnt] );
              shm_safety_joint_limits[6*jnt_cnt] =data.joint_max_pos_limit_normal_mode[jnt_cnt];
              shm_safety_joint_limits[6*jnt_cnt+1] = data.joint_min_pos_limit_normal_mode[jnt_cnt];
              shm_safety_joint_limits[6*jnt_cnt+2] = data.joint_max_pos_limit_reduced_mode[jnt_cnt];
              shm_safety_joint_limits[6*jnt_cnt+3] = data.joint_min_pos_limit_reduced_mode[jnt_cnt];
              shm_safety_joint_limits[6*jnt_cnt+4] = data.joint_vel_limit_reduced_mode[jnt_cnt];
              shm_safety_joint_limits[6*jnt_cnt+5] = data.joint_vel_limit_normal_mode[jnt_cnt];

             }
             

          }
         }
        
           sem_post(sem_safety1);
      //  }
    
      //Safety Plane Data

     try_safety_plane= sem_trywait( sem_safety2);
      if(try_safety_plane == 0)
       {
          printf("SAfety Plane data\n");
          for(int k=0;k<safedata.SafetyPlanedata.size();k++)

            {

              const svaya_control::SafetyPlane &data1=safedata.SafetyPlanedata[k];
              shm_safety_plane_data[0]=data1.plane_cnt;
              for (unsigned int plane_cnt = 0; plane_cnt < data1.plane_cnt; plane_cnt++)
              {
                // printf("In for 4\n");
                 //printf("plane_origin_z %lf\n",data1.plane_origin_z[plane_cnt] );
                shm_safety_plane_data[8*plane_cnt+1] = data1.plane_origin_x[plane_cnt];
                shm_safety_plane_data[8*plane_cnt+2] = data1.plane_origin_y[plane_cnt];
                shm_safety_plane_data[8*plane_cnt+3] = data1.plane_origin_z[plane_cnt];
                shm_safety_plane_data[8*plane_cnt+4] = data1.normal_dir_x[plane_cnt];
                shm_safety_plane_data[8*plane_cnt+4] = data1.normal_dir_y[plane_cnt];
                shm_safety_plane_data[8*plane_cnt+6] = data1. normal_dir_z[plane_cnt];
                shm_safety_plane_data[8*plane_cnt+7] = data1.safety_feat[plane_cnt];
                shm_safety_plane_data[8*plane_cnt+8] = data1.elbow_restrict[plane_cnt];


              }
            }
          }

         sem_post(sem_safety2);
      // }

       //Tool Data
        try_tool= sem_trywait( sem_safety3);
       if(try_tool == 0)
       {
          printf("Tool Data\n");
            for(int k=0;k<safedata.Tooldata.size();k++)

             {
                   const svaya_control::Tool &data2=safedata.Tooldata[k];
                   shm_safety_tool_position[0]=data2.tool_cnt;
                   for (unsigned int tool_cnt = 0; tool_cnt <data2.tool_cnt ; tool_cnt++)
                   {
                     //printf("In for 5\n");
                     //printf(" tool_position_x %lf\n",data2.tool_position_x[tool_cnt] );
                      shm_safety_tool_position[4*tool_cnt+1] = data2.tool_position_x[tool_cnt];
                      shm_safety_tool_position[4*tool_cnt+2] = data2.tool_position_y[tool_cnt];
                      shm_safety_tool_position[4*tool_cnt+3] = data2.tool_position_z[tool_cnt];

                       shm_safety_tool_position[4*tool_cnt+4] = data2.tool_radius[tool_cnt];
                    }
                                 

                       shm_safety_tool_direction[0] = data2.cone_orient_x;
                       shm_safety_tool_direction[1] = data2.cone_orient_y;
                       shm_safety_tool_direction[2] = data2.cone_orient_z;
                       
                       shm_safety_tool_direction[3] = data2.tool_direction_feat;
                       shm_safety_tool_direction[4] = data2.solid_angle;

                      shm_safety_tool_direction[5] = data2.pan_angle;
                    printf(" tilt_angle %lf\n",data2.tilt_angle );
                       shm_safety_tool_direction[6] = data2.tilt_angle;
                   
                   
               }

             }
         

                sem_post(sem_safety3);
            





       }



void jointstateCallback(const  sensor_msgs::JointState::ConstPtr& msg)
{
   int try_state=1;
  
    try_state=sem_trywait(sem_joints_state);
     if(try_state==0)
     {
        printf("Joint States\n");

        for (int i=0;i<7;i++)
         {
          
          //printf("In jointstate\n");
             shm_joints_pos[i]= msg->position[i];
             shm_joints_vel[i]=msg->velocity[i];
             shm_joints_eff[i]=msg->effort[i];
          
         }
     }
        sem_post(sem_joints_state);
     // }

     
    
     
    
  
}


    

void update( safety_controllers::SafetyController & safety_obj)
  {
    /*clock_gettime(CLOCK_MONOTONIC,&current_time_);
    elapsed_time_ = ros::Duration(current_time_.tv_sec - last_time_.tv_sec + (current_time_.tv_nsec - last_time_.tv_nsec) / BILLION);
    last_time_ = current_time_;
/*    const double cycle_time_error = (elapsed_time_ - desired_update_freq_).toSec();
    if (cycle_time_error > cycle_time_error_threshold_)
    {
      ROS_WARN_STREAM_NAMED(name_,"Cycle time exceeded error threshold by: "
                      << cycle_time_error
                      << ", cycle time: "
                      << elapsed_time_
                      << ", threshold: "
                      << cycle_time_error_threshold_);
    }*/
//    std::cout<<" loop : line read "<<std::endl;

     printf("Before Starting\n"); 
    safety_obj.starting();
  //     printf("After Starting\n");

    safety_obj.update();
    // printf("After Update\n");

  }


 

//void mutex_Func(MutexGuard &mutex_obj)
void mutex_Func(RemoteMutex &mutex_obj)
{
  printf("Inside Mutex function\n");
   //std::string holder="Publisher-2";
   mutex_status= mutex_obj.getStatus();
  if(!mutex_status)
  {
           //mutex_lock= mutex_obj.tryLock( holder); 
           mutex_lock= mutex_obj.tryLock( ); 
           if(mutex_lock)
       {
       //masterIdarr.push_back(master_id);
       /*}
          for (auto itr = masterIdarr.begin(); itr != masterIdarr.end(); ++itr)
            printf("%d ,", *itr);
         printf("\n");*/
           msg_arr.data=masterIdarr;
    
                for (std::vector<int>::const_iterator itr = masterIdarr.begin(); itr != masterIdarr.end(); itr++)
            printf("%d ,", *itr);
         printf("\n");     
           pub.publish(msg_arr); 
  //  mutex_unlock =mutex_obj.unlock(holder); 
    mutex_unlock =mutex_obj.unlock(); 
    //if(mutex_unlock)
    //printf("Mutex Unlock\n");     
        }
      
            
   }      

  
}  
    

    

void masterIdCallback(const std_msgs::Int32MultiArray::ConstPtr& msg)
{
   int try_arr= sem_trywait(arr_lock);
  //printf("In Callback\n");
  bool flag=false;
  
      
    if(try_arr == 0)
      {
  
  int i=0;
  //masterIdarr.clear();
  for (std::vector<int>::const_iterator itr = msg->data.begin(); itr !=  msg->data.end(); itr++)
          {
     masterIdarr[i]=*itr;
     i++;
   }
  for (std::vector<int>::const_iterator itr = masterIdarr.begin(); itr != masterIdarr.end(); itr++) 
  {  
       if(*itr==master_id)
       {
        flag=true;
         break;
       }
    // printf("%d ,", *itr);
    
     }
    
     if(flag==false)
        masterIdarr.push_back(master_id);

     msg_arr.data=masterIdarr;
        for (std::vector<int>::const_iterator itr = masterIdarr.begin(); itr != masterIdarr.end(); itr++)
            printf("%d ,", *itr);
         printf("\n");
       
        pub.publish(msg_arr);
       if(masterIdarr[0]!=master_id && active_flag==false)
         master_name="master";
      else if(masterIdarr[0]!=master_id && active_flag == true)
        master_name="slave";
      else
         master_name="master";
         //MutexGuard mutex_obj("mute_gaurd2");  
        //RemoteMutex mutex_obj ("mute_gaurd");
       // mutex_Func(mutex_obj);
        //pub.publish(msg_arr);
        
      }
      sem_post(arr_lock);
    // printf("\n");
    
    //  pub.publish(msg);
/*  if(msg2->master_id!=master_id)
  {
    int id=msg2->master_id-1;
    // ros::Duration diff=msg->header.stamp- ros::Time::now ();
  //printf("time_diff : %lf\n",diff);
     //recv_checksum=msg->data;
  
    if ((checksums[id].checksumIndex) < (checksums[id].checksumMaxIndex))
        {
            // Add checksum to the array
            checksums[id].checksumarr[checksums[id].checksumIndex].checksum=(msg2->data);
            checksums[id].checksumarr[checksums[id].checksumIndex].timestamp=(msg2->header.stamp);
            checksums[id].checksumIndex++;
        }
     else
        {
            checksums[id].checksumIndex = 0;
            checksums[id].checksumarr[checksums[id].checksumIndex].checksum=(msg2->data);
            checksums[id].checksumarr[checksums[id].checksumIndex].timestamp=(msg2->header.stamp);
            checksums[id].checksumIndex++;
        }

       // if(masterIdarr[0]==)
  }*/



}



void setCtrlCHandler(EXIT_CALLBACK user_callback)
{
    // ctrl c handler
    struct sigaction sigIntHandler;
    sigIntHandler.sa_handler = user_callback;
    sigemptyset(&sigIntHandler.sa_mask);
    sigIntHandler.sa_flags = 0;
    sigaction(SIGINT, &sigIntHandler, NULL);
        
}
void ctrl_c_handler(int s)
{
   /* int fd3 = open("/sys/class/gpio/unexport", O_WRONLY);
    if (fd3 == -1) 
    {
        perror("Unable to open /sys/class/gpio/unexport");
         exit(1);
       }
      
      if (write(fd3, "24", 2) != 2) 
      {
      perror("Error writing to /sys/class/gpio/unexport");
      exit(1);
      }
     close(fd3);
     close(fd4);
     //  gpioTerminate();
*/ 
  exit(1);

}

void SafetyChecksum_Callback(const svaya_control::master_id::ConstPtr& msg)
{
  


  if(msg->master_id!=master_id)
  {
    int id=msg->master_id-1;
    // ros::Duration diff=msg->header.stamp- ros::Time::now ();
  //printf("time_diff : %lf\n",diff);
     //recv_checksum=msg->data;
  
    if ((checksums[id].checksumIndex) < (checksums[id].checksumMaxIndex))
        {
            // Add checksum to the array
            checksums[id].checksumarr[checksums[id].checksumIndex].checksum=(msg->data);
            checksums[id].checksumarr[checksums[id].checksumIndex].timestamp=(msg->header.stamp);
            checksums[id].checksumIndex++;
        }
     else
        {
            checksums[id].checksumIndex = 0;
            checksums[id].checksumarr[checksums[id].checksumIndex].checksum=(msg->data);
            checksums[id].checksumarr[checksums[id].checksumIndex].timestamp=(msg->header.stamp);
            checksums[id].checksumIndex++;
        }

     first_time=0;
    active_flag=true;
  }
  else
   {
     if(first_time==0)
      {
         clock_gettime(CLOCK_MONOTONIC,&prev_time);
         first_time=-1;
       }
     else
    {
        clock_gettime(CLOCK_MONOTONIC,&current_time);
        time_diff = current_time.tv_sec - prev_time.tv_sec + (current_time.tv_nsec - prev_time.tv_nsec);
        //prev_time = current_time;
        //time_error = time_diff.toSec();
       if (time_diff > time_threshold)
       {
        printf("TimeExceeded\n");  
        active_flag=false;
       }
    }
   }


}
int  Checksum_Calc()
{
 printf("Inside Checksum Calc function\n");
   //toradex_io::gpio gpio_obj;
   /*gpio_pins.resize(2*gpio_cnt);
   gpio_values.resize(2*gpio_cnt); 
   for(int i=0;i<gpio_cnt;i+=2)
    {
      gpio_pins[i]=;
       gpio_pins[i+1]=i+1;

    } */
  bool read_status= gpio_obj.read(gpio_pins,gpio_values);
   if(read_status==0)
   {
    printf("reading Io success\n");
    int i, j=0;
  int try_safety_io=1;
  try_safety_io = sem_trywait(safety_in_access);
  printf("SAFETY IO UPDATE\n");                    
 if(try_safety_io == 0)
  {
 //if(safety_data_flag)
 //{
  for(i=0;i<gpio_cnt;i=i+2)
  {  printf("IN SAFETY IO FOR\n");
      shm_safety_in[5*i+3]=gpio_values[i];
      shm_safety_in[5*i+5]=gpio_values[i+1];
 //      printf("I safety Io end\n");  
  }
// }  
 }
   sem_post(safety_in_access);

   }
 
 else
 printf("IO READ FAILED\n");  
  
  //data.Status.clear();
  int length=(sizeof(gpio_values)/sizeof(bool));
  assert(length>=0);
  assert(length<(1<<24)); 
 // Main summing loop
int  i=0,sum=0;
  //while(length > 1)
for(i=0;i<length;i++)  
{
    sum = sum +  gpio_values[i];
    //length = length - 2;
    //i++;
  }

  // Add left-over byte, if any
  //if (length > 0)
    //sum = sum + *((char *) gpio_values);

  // Fold 32-bit sum to 16 bits
  while (sum>>16)
    sum = (sum & 0xFFFF) + (sum >> 16);

  
  return (~sum);
}
  /*int first_time=0;
   
 // if(calc_checksum!=recv_checksum)
 for(auto it=checksumarr.begin();it!=checksumarr.end();it++)
  { 
    if(calc_checksum!=*it)
    {
      
    }
    //printf("NOT Equal\n");
    /*if(first_time==0)
    {
      clock_gettime(CLOCK_MONOTONIC,&prev_time);
      first_time=-1;
    }
    else
    {
        clock_gettime(CLOCK_MONOTONIC,&current_time);
        time_diff = current_time.tv_sec - prev_time.tv_sec + (current_time.tv_nsec - prev_time.tv_nsec);
        //prev_time = current_time;
        //time_error = time_diff.toSec();
       if (time_diff > time_threshold)
       {
        printf("TimeExceeded\n");
        /* if (write(fd2, "1", 1) != 1) 
             {
                perror("Error writing to /sys/class/gpio/gpio24/value");
                //exit(1);
            }
                   
       //}
     
   // }
    }
    //else
     // {
    //printf("Equal\n");
    /* if (write(fd2, "0", 1) != 1) 
             {
                perror("Error writing to /sys/class/gpio/gpio24/value");
                //exit(1);
             }
     }
      close(fd2);
}*/
void Checksum_cmp(ros::Time time_stamp,int calc_checksum)
{
    printf("In CHECKSUM CMP\n");
  double  diff,tempdiff;
  int idx;
  
  for(int i=1;i<=master_cnt;i++)
  {
    if(i!=master_id)
    {

        diff=(checksums[i].checksumarr[0].timestamp-time_stamp).toSec();
        idx=0;
         
        //Getting INdex of Nearest Timestamp
        for(int j=1;j<checksums[i].checksumMaxIndex;j++)
        {
          
          tempdiff=(checksums[i].checksumarr[j].timestamp-time_stamp).toSec();
           if(tempdiff < diff)
           {
              idx = j;
              diff=tempdiff;
           }
        }
        
       
        if(calc_checksum==checksums[i].checksumarr[idx].checksum)
        {
          //CheckSUM MAtches.
        }
        else
        {
          
        }
      }
  }
 
}

  
  

      
    
      
 




