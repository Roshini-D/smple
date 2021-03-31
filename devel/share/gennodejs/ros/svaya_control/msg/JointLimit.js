// Auto-generated. Do not edit!

// (in-package svaya_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class JointLimit {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_cnt = null;
      this.joint_max_pos_limit_normal_mode = null;
      this.joint_min_pos_limit_normal_mode = null;
      this.joint_max_pos_limit_reduced_mode = null;
      this.joint_min_pos_limit_reduced_mode = null;
      this.joint_vel_limit_reduced_mode = null;
      this.joint_vel_limit_normal_mode = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_cnt')) {
        this.joint_cnt = initObj.joint_cnt
      }
      else {
        this.joint_cnt = 0;
      }
      if (initObj.hasOwnProperty('joint_max_pos_limit_normal_mode')) {
        this.joint_max_pos_limit_normal_mode = initObj.joint_max_pos_limit_normal_mode
      }
      else {
        this.joint_max_pos_limit_normal_mode = [];
      }
      if (initObj.hasOwnProperty('joint_min_pos_limit_normal_mode')) {
        this.joint_min_pos_limit_normal_mode = initObj.joint_min_pos_limit_normal_mode
      }
      else {
        this.joint_min_pos_limit_normal_mode = [];
      }
      if (initObj.hasOwnProperty('joint_max_pos_limit_reduced_mode')) {
        this.joint_max_pos_limit_reduced_mode = initObj.joint_max_pos_limit_reduced_mode
      }
      else {
        this.joint_max_pos_limit_reduced_mode = [];
      }
      if (initObj.hasOwnProperty('joint_min_pos_limit_reduced_mode')) {
        this.joint_min_pos_limit_reduced_mode = initObj.joint_min_pos_limit_reduced_mode
      }
      else {
        this.joint_min_pos_limit_reduced_mode = [];
      }
      if (initObj.hasOwnProperty('joint_vel_limit_reduced_mode')) {
        this.joint_vel_limit_reduced_mode = initObj.joint_vel_limit_reduced_mode
      }
      else {
        this.joint_vel_limit_reduced_mode = [];
      }
      if (initObj.hasOwnProperty('joint_vel_limit_normal_mode')) {
        this.joint_vel_limit_normal_mode = initObj.joint_vel_limit_normal_mode
      }
      else {
        this.joint_vel_limit_normal_mode = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JointLimit
    // Serialize message field [joint_cnt]
    bufferOffset = _serializer.uint8(obj.joint_cnt, buffer, bufferOffset);
    // Serialize message field [joint_max_pos_limit_normal_mode]
    bufferOffset = _arraySerializer.float64(obj.joint_max_pos_limit_normal_mode, buffer, bufferOffset, null);
    // Serialize message field [joint_min_pos_limit_normal_mode]
    bufferOffset = _arraySerializer.float64(obj.joint_min_pos_limit_normal_mode, buffer, bufferOffset, null);
    // Serialize message field [joint_max_pos_limit_reduced_mode]
    bufferOffset = _arraySerializer.float64(obj.joint_max_pos_limit_reduced_mode, buffer, bufferOffset, null);
    // Serialize message field [joint_min_pos_limit_reduced_mode]
    bufferOffset = _arraySerializer.float64(obj.joint_min_pos_limit_reduced_mode, buffer, bufferOffset, null);
    // Serialize message field [joint_vel_limit_reduced_mode]
    bufferOffset = _arraySerializer.float64(obj.joint_vel_limit_reduced_mode, buffer, bufferOffset, null);
    // Serialize message field [joint_vel_limit_normal_mode]
    bufferOffset = _arraySerializer.float64(obj.joint_vel_limit_normal_mode, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JointLimit
    let len;
    let data = new JointLimit(null);
    // Deserialize message field [joint_cnt]
    data.joint_cnt = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [joint_max_pos_limit_normal_mode]
    data.joint_max_pos_limit_normal_mode = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [joint_min_pos_limit_normal_mode]
    data.joint_min_pos_limit_normal_mode = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [joint_max_pos_limit_reduced_mode]
    data.joint_max_pos_limit_reduced_mode = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [joint_min_pos_limit_reduced_mode]
    data.joint_min_pos_limit_reduced_mode = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [joint_vel_limit_reduced_mode]
    data.joint_vel_limit_reduced_mode = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [joint_vel_limit_normal_mode]
    data.joint_vel_limit_normal_mode = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.joint_max_pos_limit_normal_mode.length;
    length += 8 * object.joint_min_pos_limit_normal_mode.length;
    length += 8 * object.joint_max_pos_limit_reduced_mode.length;
    length += 8 * object.joint_min_pos_limit_reduced_mode.length;
    length += 8 * object.joint_vel_limit_reduced_mode.length;
    length += 8 * object.joint_vel_limit_normal_mode.length;
    return length + 25;
  }

  static datatype() {
    // Returns string type for a message object
    return 'svaya_control/JointLimit';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5401a4925cdae95fe53c373fe45e169d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 joint_cnt
    float64[] joint_max_pos_limit_normal_mode
    float64[] joint_min_pos_limit_normal_mode
    float64[] joint_max_pos_limit_reduced_mode
    float64[] joint_min_pos_limit_reduced_mode
    float64[] joint_vel_limit_reduced_mode
    float64[] joint_vel_limit_normal_mode
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new JointLimit(null);
    if (msg.joint_cnt !== undefined) {
      resolved.joint_cnt = msg.joint_cnt;
    }
    else {
      resolved.joint_cnt = 0
    }

    if (msg.joint_max_pos_limit_normal_mode !== undefined) {
      resolved.joint_max_pos_limit_normal_mode = msg.joint_max_pos_limit_normal_mode;
    }
    else {
      resolved.joint_max_pos_limit_normal_mode = []
    }

    if (msg.joint_min_pos_limit_normal_mode !== undefined) {
      resolved.joint_min_pos_limit_normal_mode = msg.joint_min_pos_limit_normal_mode;
    }
    else {
      resolved.joint_min_pos_limit_normal_mode = []
    }

    if (msg.joint_max_pos_limit_reduced_mode !== undefined) {
      resolved.joint_max_pos_limit_reduced_mode = msg.joint_max_pos_limit_reduced_mode;
    }
    else {
      resolved.joint_max_pos_limit_reduced_mode = []
    }

    if (msg.joint_min_pos_limit_reduced_mode !== undefined) {
      resolved.joint_min_pos_limit_reduced_mode = msg.joint_min_pos_limit_reduced_mode;
    }
    else {
      resolved.joint_min_pos_limit_reduced_mode = []
    }

    if (msg.joint_vel_limit_reduced_mode !== undefined) {
      resolved.joint_vel_limit_reduced_mode = msg.joint_vel_limit_reduced_mode;
    }
    else {
      resolved.joint_vel_limit_reduced_mode = []
    }

    if (msg.joint_vel_limit_normal_mode !== undefined) {
      resolved.joint_vel_limit_normal_mode = msg.joint_vel_limit_normal_mode;
    }
    else {
      resolved.joint_vel_limit_normal_mode = []
    }

    return resolved;
    }
};

module.exports = JointLimit;
