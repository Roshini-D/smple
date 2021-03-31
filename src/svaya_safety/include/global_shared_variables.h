/*!
 * \author Rohan Bampal
 *
 * \file include/coro_ethercat/global_user_info.h
 *
 * \brief This header will store the single instance of variables defined
 * 		  in this file. There will be a single instance of the variables
 *        where ever this header file is included.
 *        The variables points to the shared memory segment to be used by
 *        other modules.
 *
 * \date 26th September, 2018
 **/

#ifndef GLOBAL_SHARED_VARIABLES_H
#define GLOBAL_SHARED_VARIABLES_H
#include<string>
#include<semaphore.h>
#include<vector>

#define REAL_MODE 0
#define RUN_GAZEBO 0

/*extern sem_t *drive_state[7];
extern sem_t *drive_err_lock[7];
extern int drive_err_type[7];
extern double sent_pos[7];
extern double sent_vel[7];
extern double sent_acc[7];


extern int *drive_status;
extern int *auto_out;
extern int *auto_in;

extern double *drive_temperature;
extern int *drive_error_codes;*/

extern int *shm_safety_in;
extern int *shm_safety_out;
extern int *shm_force_mode_data;
extern bool *shm_force_mode_enable;
extern bool *shm_mode_of_operation;
extern bool *shm_recovery_mode_flag;

extern double *shm_safety_plane_data;
extern double *shm_safety_tool_position;
extern double *shm_safety_tool_direction;
extern double *shm_safety_joint_limits;
extern double *shm_safety_robot_limits;
extern double *shm_safety_error_list;

extern bool reduced_mode;
extern bool new_traj;
extern double time_red_mode;
extern double last_time_val;
extern double red_factor;
extern double time_data_uptime;
extern double last_time_normal_mode;
extern double prev_start_time;
extern std::vector<double> traj_start_time;
extern int traj_start_time_ctr;
extern bool slider_traj;
extern bool ft_sensor_present;
extern double ft_sensor_values[6];

extern bool drive_init;

extern bool safety_limits_flag;
extern bool safety_flag;

// extern void *shm_ptr;
extern char* name ; //= "drive_err_state";
const std::string D_STATE[7] ={"/drive_state_0","/drive_state_1","/drive_state_2","/drive_state_3","/drive_state_4","/drive_state_5","/drive_state_6"};
const std::string D_STATUS[7] ={"/drive_status_lock_0","/drive_status_lock_1","/drive_status_lock_2","/drive_status_lock_3","/drive_status_lock_4","/drive_status_lock_5","/drive_status_lock_6"};


#endif // GLOBAL_SHARED_VARIABLES_H
