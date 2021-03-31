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

class SafetyError {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.error_list = null;
      this.mode_of_operation = null;
      this.recovery_mode_flag = null;
      this.safety_limits_flag = null;
      this.status = null;
    }
    else {
      if (initObj.hasOwnProperty('error_list')) {
        this.error_list = initObj.error_list
      }
      else {
        this.error_list = [];
      }
      if (initObj.hasOwnProperty('mode_of_operation')) {
        this.mode_of_operation = initObj.mode_of_operation
      }
      else {
        this.mode_of_operation = false;
      }
      if (initObj.hasOwnProperty('recovery_mode_flag')) {
        this.recovery_mode_flag = initObj.recovery_mode_flag
      }
      else {
        this.recovery_mode_flag = false;
      }
      if (initObj.hasOwnProperty('safety_limits_flag')) {
        this.safety_limits_flag = initObj.safety_limits_flag
      }
      else {
        this.safety_limits_flag = false;
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SafetyError
    // Serialize message field [error_list]
    bufferOffset = _arraySerializer.float64(obj.error_list, buffer, bufferOffset, null);
    // Serialize message field [mode_of_operation]
    bufferOffset = _serializer.bool(obj.mode_of_operation, buffer, bufferOffset);
    // Serialize message field [recovery_mode_flag]
    bufferOffset = _serializer.bool(obj.recovery_mode_flag, buffer, bufferOffset);
    // Serialize message field [safety_limits_flag]
    bufferOffset = _serializer.bool(obj.safety_limits_flag, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = _arraySerializer.int32(obj.status, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SafetyError
    let len;
    let data = new SafetyError(null);
    // Deserialize message field [error_list]
    data.error_list = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [mode_of_operation]
    data.mode_of_operation = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [recovery_mode_flag]
    data.recovery_mode_flag = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [safety_limits_flag]
    data.safety_limits_flag = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.error_list.length;
    length += 4 * object.status.length;
    return length + 11;
  }

  static datatype() {
    // Returns string type for a message object
    return 'svaya_control/SafetyError';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'effb15012df92429b21d6d9d6f7df6c3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] error_list
    bool mode_of_operation
    bool recovery_mode_flag
    bool safety_limits_flag
    int32[] status
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SafetyError(null);
    if (msg.error_list !== undefined) {
      resolved.error_list = msg.error_list;
    }
    else {
      resolved.error_list = []
    }

    if (msg.mode_of_operation !== undefined) {
      resolved.mode_of_operation = msg.mode_of_operation;
    }
    else {
      resolved.mode_of_operation = false
    }

    if (msg.recovery_mode_flag !== undefined) {
      resolved.recovery_mode_flag = msg.recovery_mode_flag;
    }
    else {
      resolved.recovery_mode_flag = false
    }

    if (msg.safety_limits_flag !== undefined) {
      resolved.safety_limits_flag = msg.safety_limits_flag;
    }
    else {
      resolved.safety_limits_flag = false
    }

    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = []
    }

    return resolved;
    }
};

module.exports = SafetyError;
