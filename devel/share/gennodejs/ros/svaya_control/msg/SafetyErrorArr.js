// Auto-generated. Do not edit!

// (in-package svaya_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let SafetyError = require('./SafetyError.js');

//-----------------------------------------------------------

class SafetyErrorArr {
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
    // Serializes a message object of type SafetyErrorArr
    // Serialize message field [msgdata]
    // Serialize the length for message field [msgdata]
    bufferOffset = _serializer.uint32(obj.msgdata.length, buffer, bufferOffset);
    obj.msgdata.forEach((val) => {
      bufferOffset = SafetyError.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SafetyErrorArr
    let len;
    let data = new SafetyErrorArr(null);
    // Deserialize message field [msgdata]
    // Deserialize array length for message field [msgdata]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.msgdata = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.msgdata[i] = SafetyError.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.msgdata.forEach((val) => {
      length += SafetyError.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'svaya_control/SafetyErrorArr';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'dee21b917a60d8be2263a10f8e5c4054';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    SafetyError[] msgdata
    
    ================================================================================
    MSG: svaya_control/SafetyError
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
    const resolved = new SafetyErrorArr(null);
    if (msg.msgdata !== undefined) {
      resolved.msgdata = new Array(msg.msgdata.length);
      for (let i = 0; i < resolved.msgdata.length; ++i) {
        resolved.msgdata[i] = SafetyError.Resolve(msg.msgdata[i]);
      }
    }
    else {
      resolved.msgdata = []
    }

    return resolved;
    }
};

module.exports = SafetyErrorArr;
