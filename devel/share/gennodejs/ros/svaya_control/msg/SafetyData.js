// Auto-generated. Do not edit!

// (in-package svaya_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let JointLimit = require('./JointLimit.js');
let SafetyPlane = require('./SafetyPlane.js');
let Tool = require('./Tool.js');

//-----------------------------------------------------------

class SafetyData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Robot_limits = null;
      this.JointLimitdata = null;
      this.SafetyPlanedata = null;
      this.Tooldata = null;
      this.SafetyInputIo = null;
      this.underSingularity = null;
      this.too_close_point = null;
      this.safety_flag = null;
    }
    else {
      if (initObj.hasOwnProperty('Robot_limits')) {
        this.Robot_limits = initObj.Robot_limits
      }
      else {
        this.Robot_limits = [];
      }
      if (initObj.hasOwnProperty('JointLimitdata')) {
        this.JointLimitdata = initObj.JointLimitdata
      }
      else {
        this.JointLimitdata = [];
      }
      if (initObj.hasOwnProperty('SafetyPlanedata')) {
        this.SafetyPlanedata = initObj.SafetyPlanedata
      }
      else {
        this.SafetyPlanedata = [];
      }
      if (initObj.hasOwnProperty('Tooldata')) {
        this.Tooldata = initObj.Tooldata
      }
      else {
        this.Tooldata = [];
      }
      if (initObj.hasOwnProperty('SafetyInputIo')) {
        this.SafetyInputIo = initObj.SafetyInputIo
      }
      else {
        this.SafetyInputIo = [];
      }
      if (initObj.hasOwnProperty('underSingularity')) {
        this.underSingularity = initObj.underSingularity
      }
      else {
        this.underSingularity = false;
      }
      if (initObj.hasOwnProperty('too_close_point')) {
        this.too_close_point = initObj.too_close_point
      }
      else {
        this.too_close_point = false;
      }
      if (initObj.hasOwnProperty('safety_flag')) {
        this.safety_flag = initObj.safety_flag
      }
      else {
        this.safety_flag = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SafetyData
    // Serialize message field [Robot_limits]
    bufferOffset = _arraySerializer.float64(obj.Robot_limits, buffer, bufferOffset, null);
    // Serialize message field [JointLimitdata]
    // Serialize the length for message field [JointLimitdata]
    bufferOffset = _serializer.uint32(obj.JointLimitdata.length, buffer, bufferOffset);
    obj.JointLimitdata.forEach((val) => {
      bufferOffset = JointLimit.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [SafetyPlanedata]
    // Serialize the length for message field [SafetyPlanedata]
    bufferOffset = _serializer.uint32(obj.SafetyPlanedata.length, buffer, bufferOffset);
    obj.SafetyPlanedata.forEach((val) => {
      bufferOffset = SafetyPlane.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [Tooldata]
    // Serialize the length for message field [Tooldata]
    bufferOffset = _serializer.uint32(obj.Tooldata.length, buffer, bufferOffset);
    obj.Tooldata.forEach((val) => {
      bufferOffset = Tool.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [SafetyInputIo]
    bufferOffset = _arraySerializer.int32(obj.SafetyInputIo, buffer, bufferOffset, null);
    // Serialize message field [underSingularity]
    bufferOffset = _serializer.bool(obj.underSingularity, buffer, bufferOffset);
    // Serialize message field [too_close_point]
    bufferOffset = _serializer.bool(obj.too_close_point, buffer, bufferOffset);
    // Serialize message field [safety_flag]
    bufferOffset = _serializer.bool(obj.safety_flag, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SafetyData
    let len;
    let data = new SafetyData(null);
    // Deserialize message field [Robot_limits]
    data.Robot_limits = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [JointLimitdata]
    // Deserialize array length for message field [JointLimitdata]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.JointLimitdata = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.JointLimitdata[i] = JointLimit.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [SafetyPlanedata]
    // Deserialize array length for message field [SafetyPlanedata]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.SafetyPlanedata = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.SafetyPlanedata[i] = SafetyPlane.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [Tooldata]
    // Deserialize array length for message field [Tooldata]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.Tooldata = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.Tooldata[i] = Tool.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [SafetyInputIo]
    data.SafetyInputIo = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [underSingularity]
    data.underSingularity = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [too_close_point]
    data.too_close_point = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [safety_flag]
    data.safety_flag = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.Robot_limits.length;
    object.JointLimitdata.forEach((val) => {
      length += JointLimit.getMessageSize(val);
    });
    object.SafetyPlanedata.forEach((val) => {
      length += SafetyPlane.getMessageSize(val);
    });
    object.Tooldata.forEach((val) => {
      length += Tool.getMessageSize(val);
    });
    length += 4 * object.SafetyInputIo.length;
    return length + 23;
  }

  static datatype() {
    // Returns string type for a message object
    return 'svaya_control/SafetyData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '72b89a176f586ae89e501cc07a269f6d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new SafetyData(null);
    if (msg.Robot_limits !== undefined) {
      resolved.Robot_limits = msg.Robot_limits;
    }
    else {
      resolved.Robot_limits = []
    }

    if (msg.JointLimitdata !== undefined) {
      resolved.JointLimitdata = new Array(msg.JointLimitdata.length);
      for (let i = 0; i < resolved.JointLimitdata.length; ++i) {
        resolved.JointLimitdata[i] = JointLimit.Resolve(msg.JointLimitdata[i]);
      }
    }
    else {
      resolved.JointLimitdata = []
    }

    if (msg.SafetyPlanedata !== undefined) {
      resolved.SafetyPlanedata = new Array(msg.SafetyPlanedata.length);
      for (let i = 0; i < resolved.SafetyPlanedata.length; ++i) {
        resolved.SafetyPlanedata[i] = SafetyPlane.Resolve(msg.SafetyPlanedata[i]);
      }
    }
    else {
      resolved.SafetyPlanedata = []
    }

    if (msg.Tooldata !== undefined) {
      resolved.Tooldata = new Array(msg.Tooldata.length);
      for (let i = 0; i < resolved.Tooldata.length; ++i) {
        resolved.Tooldata[i] = Tool.Resolve(msg.Tooldata[i]);
      }
    }
    else {
      resolved.Tooldata = []
    }

    if (msg.SafetyInputIo !== undefined) {
      resolved.SafetyInputIo = msg.SafetyInputIo;
    }
    else {
      resolved.SafetyInputIo = []
    }

    if (msg.underSingularity !== undefined) {
      resolved.underSingularity = msg.underSingularity;
    }
    else {
      resolved.underSingularity = false
    }

    if (msg.too_close_point !== undefined) {
      resolved.too_close_point = msg.too_close_point;
    }
    else {
      resolved.too_close_point = false
    }

    if (msg.safety_flag !== undefined) {
      resolved.safety_flag = msg.safety_flag;
    }
    else {
      resolved.safety_flag = false
    }

    return resolved;
    }
};

module.exports = SafetyData;
