
#include "ros/ros.h" 
#include <rosparam_shortcuts/rosparam_shortcuts.h>
#include <message_filters/subscriber.h>
#include <message_filters/time_synchronizer.h>
#include "safety.hpp"
 using namespace std; 
// safety_controllers::SafetyController safety_obj;
  
//static const double BILLION = 1000000000.0;
 





int main(int argc, char **argv)
{
   //name_="Safety_rosnode";
   safety_init("config_file.xml");

  ros::init(argc, argv, node_name);
  ros::AsyncSpinner spinner(0);
 spinner.start();


  ros::master::setRetryTimeout((ros::WallDuration)1);
  ros::NodeHandle n;
/*  ros::NodeHandle rpsnh(n,name_);
  std::size_t error = 0;
    error += !rosparam_shortcuts::get(name_,rpsnh,"loop_hz",loop_hz_);
    rosparam_shortcuts::shutdownIfError(name_,error);*/
    desired_update_freq_ = ros::Duration(1/loop_hz_);
  int try_sem_error_list=1;
//  ros::AsyncSpinner spinner(0);
 //spinner.start();
     
    safety_controllers::SafetyController safety_obj;
  
   safety_obj.init(n);
 

   // MutexGuard mutex_obj("mute_gaurd");
     RemoteMutex mutex_obj ("mute_gaurd");

   ros::Publisher safety_error_pub = n.advertise<svaya_control::SafetyErrorArr>("/coro/SafetyErrorData",100);
   ros::Publisher checksum_pub = n.advertise<svaya_control::master_id>("Checksum", 100,true);
     pub = n.advertise<std_msgs::Int32MultiArray>("master_idTopic", 10);
/*   message_filters::Subscriber<std_msgs::Int32MultiArray>masterIdsub(n,"master_idTopic",10);
  message_filters::Subscriber<coro_control::master_id>checksum_sub(n,"Checksum", 10);
    TimeSynchronizer<std_msgs::Int32MultiArray,coro_control::master_id>sync(masterIdsub,checksum_sub,10);
    sync.registerCallback(masterIdCallback);
*/
ros::Subscriber joint_state_sub=n.subscribe<sensor_msgs::JointState>("/svaya/joint_states",1,&jointstateCallback);
ros::Subscriber masterId_sub=n.subscribe<std_msgs::Int32MultiArray>("master_idTopic", 1,&masterIdCallback);
ros::Subscriber  checksum_sub=n.subscribe<svaya_control::master_id>("Checksum", 1,&SafetyChecksum_Callback,ros::TransportHints().tcpNoDelay());
ros::Subscriber safety_data_sub = n.subscribe<svaya_control::SafetyDataArr>("/coro/SafetyData",1,&Safety_DataCallback);
ros::Rate loop_rate(10);  
 svaya_control::SafetyErrorArr safety_error_dataarr;
   svaya_control::SafetyError safety_error_data;
vector<double>error_list;
ros::Time time_smp;
int count;
svaya_control::master_id ChecksumData;
 ChecksumData.header.frame_id =master_name;
 ChecksumData.master_id=master_id;



int  try_arr=1;
//try_arr = sem_trywait(arr_lock);
  //  if(try_arr == 0)
    {
       printf("Before Mutex Func\n");
      masterIdarr.push_back(master_id);
      mutex_Func(mutex_obj);
      }
  
  //sem_post(arr_lock);
vector<int>status;  
sleep(1);
while(1)
  {  
   if(ros::master::check())
   {
  //sleep(1);
   // safety_obj. update();   
    update( safety_obj);
   calc_checksum=Checksum_Calc();
      time_smp=ros::Time::now ();
       
//     Checksum_cmp(time_smp,calc_checksum);
    printf("APPENDING CHECKSUM DATA\n");      
     ChecksumData.header.stamp =time_smp;
     ChecksumData.header.seq=count;
     ChecksumData.data=calc_checksum;
     checksum_pub.publish(ChecksumData);
     
    

     
    
    
    count++;
    try_sem_error_list=sem_trywait(sem_error_list);
  if(try_sem_error_list==0)
   {
     
       error_list.resize(5*(shm_safety_error_list[0])+1);
      error_list[0]=shm_safety_error_list[0];
     printf("Error List try\n");
   for(int i=0;i<shm_safety_error_list[0];i++)
    { 
     
      error_list[5*i+1]=shm_safety_error_list[5*i+1];
      error_list[5*i+2]=shm_safety_error_list[5*i+2];
       error_list[5*i+3]=shm_safety_error_list[5*i+3];
      error_list[5*i+4]=shm_safety_error_list[5*i+4];
      error_list[5*i+5]=shm_safety_error_list[5*i+5];
/*     printf("%lf::::: %lf\n ",shm_safety_error_list[5*i+1],error_list[5*i+1]);
      printf("%lf::::: %lf\n ",shm_safety_error_list[5*i+2],error_list[5*i+2]);
     printf("%lf::::: %lf\n ",shm_safety_error_list[5*i+3],error_list[5*i+3]);
     printf("%lf::::: %lf\n ",shm_safety_error_list[5*i+4],error_list[5*i+4]);
     printf("%lf::::: %lf\n ",shm_safety_error_list[5*i+5],error_list[5*i+5]);
  */
     }
  // printf("\n");
       safety_error_data.error_list=error_list;
      safety_error_data.mode_of_operation=*shm_mode_of_operation;
      safety_error_data.recovery_mode_flag=*shm_recovery_mode_flag;
       safety_error_data.safety_limits_flag=safety_limits_flag;   
//status.resize(gpio_values.size());  
 for(auto it=gpio_values.begin();it!=gpio_values.end();it++)
   { 
      status.push_back(*it);
   }   
   safety_error_data.status=status;
   status.clear();
      /*int try_safety_io=1;
      try_safety_io = sem_trywait(safety_in_access);
                        
       if(try_safety_io == 0)
      {
        safety_error_data.status.resize(shm_safety_in[0])
        for(int i=0;i<shm_safety_in[0];i=i+2)
        {
          cccccccccccccc[i]=shm_safety_in[5*i+3];
          safety_error_data.status[i+1]=shm_safety_in[5*i+5];
        }
      }
       sem_post(safety_in_access);*/

      safety_error_dataarr.msgdata.push_back( safety_error_data);
    }
        if(master_name=="master")
        safety_error_pub.publish( safety_error_dataarr);
    error_list.clear(); 
     safety_error_data.error_list.clear();
      safety_error_dataarr.msgdata.clear();
     safety_error_data.status.clear();
    
          sem_post(sem_error_list);
  // }
     ros::spinOnce();
     loop_rate.sleep();

    }
    else
     {
        gpio_out_values={0,0};
        gpio_obj.write(gpio_out_pins, gpio_out_values);
        exit(1);
     }
   
  
  

  

}

ros::spin();
ros::waitForShutdown();
  return 0;
}





