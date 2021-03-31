// Auto-generated. Do not edit!

// (in-package remote_mutex_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class mutexSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.requestor = null;
      this.requestType = null;
    }
    else {
      if (initObj.hasOwnProperty('requestor')) {
        this.requestor = initObj.requestor
      }
      else {
        this.requestor = '';
      }
      if (initObj.hasOwnProperty('requestType')) {
        this.requestType = initObj.requestType
      }
      else {
        this.requestType = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mutexSrvRequest
    // Serialize message field [requestor]
    bufferOffset = _serializer.string(obj.requestor, buffer, bufferOffset);
    // Serialize message field [requestType]
    bufferOffset = _serializer.uint8(obj.requestType, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mutexSrvRequest
    let len;
    let data = new mutexSrvRequest(null);
    // Deserialize message field [requestor]
    data.requestor = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [requestType]
    data.requestType = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.requestor.length;
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'remote_mutex_msgs/mutexSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '92c5b59df7e6f9662ed83c871edc5264';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string requestor
    uint8 requestType
    uint8 TYPE_LOCK = 1
    uint8 TYPE_UNLOCK = 2
    uint8 TYPE_POLL = 3
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mutexSrvRequest(null);
    if (msg.requestor !== undefined) {
      resolved.requestor = msg.requestor;
    }
    else {
      resolved.requestor = ''
    }

    if (msg.requestType !== undefined) {
      resolved.requestType = msg.requestType;
    }
    else {
      resolved.requestType = 0
    }

    return resolved;
    }
};

// Constants for message
mutexSrvRequest.Constants = {
  TYPE_LOCK: 1,
  TYPE_UNLOCK: 2,
  TYPE_POLL: 3,
}

class mutexSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.status = null;
    }
    else {
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mutexSrvResponse
    // Serialize message field [status]
    bufferOffset = _serializer.uint8(obj.status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mutexSrvResponse
    let len;
    let data = new mutexSrvResponse(null);
    // Deserialize message field [status]
    data.status = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'remote_mutex_msgs/mutexSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6d5878401ab4f108105f53837a17fdb3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 status
    uint8 STATUS_LOCKED = 1
    uint8 STATUS_UNLOCKED = 0 
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mutexSrvResponse(null);
    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = 0
    }

    return resolved;
    }
};

// Constants for message
mutexSrvResponse.Constants = {
  STATUS_LOCKED: 1,
  STATUS_UNLOCKED: 0,
}

module.exports = {
  Request: mutexSrvRequest,
  Response: mutexSrvResponse,
  md5sum() { return '76380b12c62c62b1c75ef04892016d2b'; },
  datatype() { return 'remote_mutex_msgs/mutexSrv'; }
};
