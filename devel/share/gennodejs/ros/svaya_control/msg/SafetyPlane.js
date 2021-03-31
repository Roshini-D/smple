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

class SafetyPlane {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.plane_cnt = null;
      this.plane_origin_x = null;
      this.plane_origin_y = null;
      this.plane_origin_z = null;
      this.normal_dir_x = null;
      this.normal_dir_y = null;
      this.normal_dir_z = null;
      this.safety_feat = null;
      this.elbow_restrict = null;
    }
    else {
      if (initObj.hasOwnProperty('plane_cnt')) {
        this.plane_cnt = initObj.plane_cnt
      }
      else {
        this.plane_cnt = 0;
      }
      if (initObj.hasOwnProperty('plane_origin_x')) {
        this.plane_origin_x = initObj.plane_origin_x
      }
      else {
        this.plane_origin_x = [];
      }
      if (initObj.hasOwnProperty('plane_origin_y')) {
        this.plane_origin_y = initObj.plane_origin_y
      }
      else {
        this.plane_origin_y = [];
      }
      if (initObj.hasOwnProperty('plane_origin_z')) {
        this.plane_origin_z = initObj.plane_origin_z
      }
      else {
        this.plane_origin_z = [];
      }
      if (initObj.hasOwnProperty('normal_dir_x')) {
        this.normal_dir_x = initObj.normal_dir_x
      }
      else {
        this.normal_dir_x = [];
      }
      if (initObj.hasOwnProperty('normal_dir_y')) {
        this.normal_dir_y = initObj.normal_dir_y
      }
      else {
        this.normal_dir_y = [];
      }
      if (initObj.hasOwnProperty('normal_dir_z')) {
        this.normal_dir_z = initObj.normal_dir_z
      }
      else {
        this.normal_dir_z = [];
      }
      if (initObj.hasOwnProperty('safety_feat')) {
        this.safety_feat = initObj.safety_feat
      }
      else {
        this.safety_feat = [];
      }
      if (initObj.hasOwnProperty('elbow_restrict')) {
        this.elbow_restrict = initObj.elbow_restrict
      }
      else {
        this.elbow_restrict = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SafetyPlane
    // Serialize message field [plane_cnt]
    bufferOffset = _serializer.uint8(obj.plane_cnt, buffer, bufferOffset);
    // Serialize message field [plane_origin_x]
    bufferOffset = _arraySerializer.float64(obj.plane_origin_x, buffer, bufferOffset, null);
    // Serialize message field [plane_origin_y]
    bufferOffset = _arraySerializer.float64(obj.plane_origin_y, buffer, bufferOffset, null);
    // Serialize message field [plane_origin_z]
    bufferOffset = _arraySerializer.float64(obj.plane_origin_z, buffer, bufferOffset, null);
    // Serialize message field [normal_dir_x]
    bufferOffset = _arraySerializer.float64(obj.normal_dir_x, buffer, bufferOffset, null);
    // Serialize message field [normal_dir_y]
    bufferOffset = _arraySerializer.float64(obj.normal_dir_y, buffer, bufferOffset, null);
    // Serialize message field [normal_dir_z]
    bufferOffset = _arraySerializer.float64(obj.normal_dir_z, buffer, bufferOffset, null);
    // Serialize message field [safety_feat]
    bufferOffset = _arraySerializer.float64(obj.safety_feat, buffer, bufferOffset, null);
    // Serialize message field [elbow_restrict]
    bufferOffset = _arraySerializer.float64(obj.elbow_restrict, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SafetyPlane
    let len;
    let data = new SafetyPlane(null);
    // Deserialize message field [plane_cnt]
    data.plane_cnt = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [plane_origin_x]
    data.plane_origin_x = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [plane_origin_y]
    data.plane_origin_y = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [plane_origin_z]
    data.plane_origin_z = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [normal_dir_x]
    data.normal_dir_x = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [normal_dir_y]
    data.normal_dir_y = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [normal_dir_z]
    data.normal_dir_z = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [safety_feat]
    data.safety_feat = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [elbow_restrict]
    data.elbow_restrict = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.plane_origin_x.length;
    length += 8 * object.plane_origin_y.length;
    length += 8 * object.plane_origin_z.length;
    length += 8 * object.normal_dir_x.length;
    length += 8 * object.normal_dir_y.length;
    length += 8 * object.normal_dir_z.length;
    length += 8 * object.safety_feat.length;
    length += 8 * object.elbow_restrict.length;
    return length + 33;
  }

  static datatype() {
    // Returns string type for a message object
    return 'svaya_control/SafetyPlane';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '660c688686d98eb493ccc943cb987589';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 plane_cnt
    float64[]  plane_origin_x
    float64[]  plane_origin_y
    float64[]  plane_origin_z
    
    float64[]  normal_dir_x
    float64[]  normal_dir_y
    float64[]  normal_dir_z
    
    float64[]  safety_feat
    float64[]  elbow_restrict
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SafetyPlane(null);
    if (msg.plane_cnt !== undefined) {
      resolved.plane_cnt = msg.plane_cnt;
    }
    else {
      resolved.plane_cnt = 0
    }

    if (msg.plane_origin_x !== undefined) {
      resolved.plane_origin_x = msg.plane_origin_x;
    }
    else {
      resolved.plane_origin_x = []
    }

    if (msg.plane_origin_y !== undefined) {
      resolved.plane_origin_y = msg.plane_origin_y;
    }
    else {
      resolved.plane_origin_y = []
    }

    if (msg.plane_origin_z !== undefined) {
      resolved.plane_origin_z = msg.plane_origin_z;
    }
    else {
      resolved.plane_origin_z = []
    }

    if (msg.normal_dir_x !== undefined) {
      resolved.normal_dir_x = msg.normal_dir_x;
    }
    else {
      resolved.normal_dir_x = []
    }

    if (msg.normal_dir_y !== undefined) {
      resolved.normal_dir_y = msg.normal_dir_y;
    }
    else {
      resolved.normal_dir_y = []
    }

    if (msg.normal_dir_z !== undefined) {
      resolved.normal_dir_z = msg.normal_dir_z;
    }
    else {
      resolved.normal_dir_z = []
    }

    if (msg.safety_feat !== undefined) {
      resolved.safety_feat = msg.safety_feat;
    }
    else {
      resolved.safety_feat = []
    }

    if (msg.elbow_restrict !== undefined) {
      resolved.elbow_restrict = msg.elbow_restrict;
    }
    else {
      resolved.elbow_restrict = []
    }

    return resolved;
    }
};

module.exports = SafetyPlane;
