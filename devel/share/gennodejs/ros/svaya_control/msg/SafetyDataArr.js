// Auto-generated. Do not edit!

// (in-package svaya_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let SafetyData = require('./SafetyData.js');

//-----------------------------------------------------------

class SafetyDataArr {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.msgdata = null;
    }
    else {
      if (initObj.hasOwnProperty('msgdata')) {
        this.msgdata = initObj.msgdata
      }
      else {
        this.msgdata = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SafetyDataArr
    // Serialize message field [msgdata]
    // Serialize the length for message field [msgdata]
    bufferOffset = _serializer.uint32(obj.msgdata.length, buffer, bufferOffset);
    obj.msgdata.forEach((val) => {
      bufferOffset = SafetyData.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SafetyDataArr
    let len;
    let data = new SafetyDataArr(null);
    // Deserialize message field [msgdata]
    // Deserialize array length for message field [msgdata]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.msgdata = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.msgdata[i] = SafetyData.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.msgdata.forEach((val) => {
      length += SafetyData.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'svaya_control/SafetyDataArr';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '81b65946d816237f6be348b30fb1605b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    SafetyData[] msgdata
    
    ================================================================================
    MSG: svaya_control/SafetyData
    float64[] Robot_limits
    
    JointLimit[] JointLimitdata 
    
    SafetyPlane[] SafetyPlanedata
    
    Tool[]   Tooldata
    
    int32[] SafetyInputIo
    
    bool underSingularity
    bool too_close_point 
    bool safety_flag
    
    
    
    ================================================================================
    MSG: svaya_control/JointLimit
    uint8 joint_cnt
    float64[] joint_max_pos_limit_normal_mode
    float64[] joint_min_pos_limit_normal_mode
    float64[] joint_max_pos_limit_reduced_mode
    float64[] joint_min_pos_limit_reduced_mode
    float64[] joint_vel_limit_reduced_mode
    float64[] joint_vel_limit_normal_mode
    
    
    ================================================================================
    MSG: svaya_control/SafetyPlane
    uint8 plane_cnt
    float64[]  plane_origin_x
    float64[]  plane_origin_y
    float64[]  plane_origin_z
    
    float64[]  normal_dir_x
    float64[]  normal_dir_y
    float64[]  normal_dir_z
    
    float64[]  safety_feat
    float64[]  elbow_restrict
    
    ================================================================================
    MSG: svaya_control/Tool
    uint8 tool_cnt
    float64[]  tool_position_x
    float64[]  tool_position_y
    float64[]  tool_position_z
    float64[]  tool_radius
    
    float64  cone_orient_x
    float64  cone_orient_y
    float64  cone_orient_z
    float64  tool_direction_feat
    float64  solid_angle
    float64  pan_angle
    float64  tilt_angle
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SafetyDataArr(null);
    if (msg.msgdata !== undefined) {
      resolved.msgdata = new Array(msg.msgdata.length);
      for (let i = 0; i < resolved.msgdata.length; ++i) {
        resolved.msgdata[i] = SafetyData.Resolve(msg.msgdata[i]);
      }
    }
    else {
      resolved.msgdata = []
    }

    return resolved;
    }
};

module.exports = SafetyDataArr;
