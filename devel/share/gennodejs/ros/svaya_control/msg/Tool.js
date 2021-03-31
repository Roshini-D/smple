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

class Tool {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tool_cnt = null;
      this.tool_position_x = null;
      this.tool_position_y = null;
      this.tool_position_z = null;
      this.tool_radius = null;
      this.cone_orient_x = null;
      this.cone_orient_y = null;
      this.cone_orient_z = null;
      this.tool_direction_feat = null;
      this.solid_angle = null;
      this.pan_angle = null;
      this.tilt_angle = null;
    }
    else {
      if (initObj.hasOwnProperty('tool_cnt')) {
        this.tool_cnt = initObj.tool_cnt
      }
      else {
        this.tool_cnt = 0;
      }
      if (initObj.hasOwnProperty('tool_position_x')) {
        this.tool_position_x = initObj.tool_position_x
      }
      else {
        this.tool_position_x = [];
      }
      if (initObj.hasOwnProperty('tool_position_y')) {
        this.tool_position_y = initObj.tool_position_y
      }
      else {
        this.tool_position_y = [];
      }
      if (initObj.hasOwnProperty('tool_position_z')) {
        this.tool_position_z = initObj.tool_position_z
      }
      else {
        this.tool_position_z = [];
      }
      if (initObj.hasOwnProperty('tool_radius')) {
        this.tool_radius = initObj.tool_radius
      }
      else {
        this.tool_radius = [];
      }
      if (initObj.hasOwnProperty('cone_orient_x')) {
        this.cone_orient_x = initObj.cone_orient_x
      }
      else {
        this.cone_orient_x = 0.0;
      }
      if (initObj.hasOwnProperty('cone_orient_y')) {
        this.cone_orient_y = initObj.cone_orient_y
      }
      else {
        this.cone_orient_y = 0.0;
      }
      if (initObj.hasOwnProperty('cone_orient_z')) {
        this.cone_orient_z = initObj.cone_orient_z
      }
      else {
        this.cone_orient_z = 0.0;
      }
      if (initObj.hasOwnProperty('tool_direction_feat')) {
        this.tool_direction_feat = initObj.tool_direction_feat
      }
      else {
        this.tool_direction_feat = 0.0;
      }
      if (initObj.hasOwnProperty('solid_angle')) {
        this.solid_angle = initObj.solid_angle
      }
      else {
        this.solid_angle = 0.0;
      }
      if (initObj.hasOwnProperty('pan_angle')) {
        this.pan_angle = initObj.pan_angle
      }
      else {
        this.pan_angle = 0.0;
      }
      if (initObj.hasOwnProperty('tilt_angle')) {
        this.tilt_angle = initObj.tilt_angle
      }
      else {
        this.tilt_angle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Tool
    // Serialize message field [tool_cnt]
    bufferOffset = _serializer.uint8(obj.tool_cnt, buffer, bufferOffset);
    // Serialize message field [tool_position_x]
    bufferOffset = _arraySerializer.float64(obj.tool_position_x, buffer, bufferOffset, null);
    // Serialize message field [tool_position_y]
    bufferOffset = _arraySerializer.float64(obj.tool_position_y, buffer, bufferOffset, null);
    // Serialize message field [tool_position_z]
    bufferOffset = _arraySerializer.float64(obj.tool_position_z, buffer, bufferOffset, null);
    // Serialize message field [tool_radius]
    bufferOffset = _arraySerializer.float64(obj.tool_radius, buffer, bufferOffset, null);
    // Serialize message field [cone_orient_x]
    bufferOffset = _serializer.float64(obj.cone_orient_x, buffer, bufferOffset);
    // Serialize message field [cone_orient_y]
    bufferOffset = _serializer.float64(obj.cone_orient_y, buffer, bufferOffset);
    // Serialize message field [cone_orient_z]
    bufferOffset = _serializer.float64(obj.cone_orient_z, buffer, bufferOffset);
    // Serialize message field [tool_direction_feat]
    bufferOffset = _serializer.float64(obj.tool_direction_feat, buffer, bufferOffset);
    // Serialize message field [solid_angle]
    bufferOffset = _serializer.float64(obj.solid_angle, buffer, bufferOffset);
    // Serialize message field [pan_angle]
    bufferOffset = _serializer.float64(obj.pan_angle, buffer, bufferOffset);
    // Serialize message field [tilt_angle]
    bufferOffset = _serializer.float64(obj.tilt_angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Tool
    let len;
    let data = new Tool(null);
    // Deserialize message field [tool_cnt]
    data.tool_cnt = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [tool_position_x]
    data.tool_position_x = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [tool_position_y]
    data.tool_position_y = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [tool_position_z]
    data.tool_position_z = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [tool_radius]
    data.tool_radius = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [cone_orient_x]
    data.cone_orient_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [cone_orient_y]
    data.cone_orient_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [cone_orient_z]
    data.cone_orient_z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [tool_direction_feat]
    data.tool_direction_feat = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [solid_angle]
    data.solid_angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pan_angle]
    data.pan_angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [tilt_angle]
    data.tilt_angle = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.tool_position_x.length;
    length += 8 * object.tool_position_y.length;
    length += 8 * object.tool_position_z.length;
    length += 8 * object.tool_radius.length;
    return length + 73;
  }

  static datatype() {
    // Returns string type for a message object
    return 'svaya_control/Tool';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3ee97d849631d40fd56f1eb1fec29f41';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new Tool(null);
    if (msg.tool_cnt !== undefined) {
      resolved.tool_cnt = msg.tool_cnt;
    }
    else {
      resolved.tool_cnt = 0
    }

    if (msg.tool_position_x !== undefined) {
      resolved.tool_position_x = msg.tool_position_x;
    }
    else {
      resolved.tool_position_x = []
    }

    if (msg.tool_position_y !== undefined) {
      resolved.tool_position_y = msg.tool_position_y;
    }
    else {
      resolved.tool_position_y = []
    }

    if (msg.tool_position_z !== undefined) {
      resolved.tool_position_z = msg.tool_position_z;
    }
    else {
      resolved.tool_position_z = []
    }

    if (msg.tool_radius !== undefined) {
      resolved.tool_radius = msg.tool_radius;
    }
    else {
      resolved.tool_radius = []
    }

    if (msg.cone_orient_x !== undefined) {
      resolved.cone_orient_x = msg.cone_orient_x;
    }
    else {
      resolved.cone_orient_x = 0.0
    }

    if (msg.cone_orient_y !== undefined) {
      resolved.cone_orient_y = msg.cone_orient_y;
    }
    else {
      resolved.cone_orient_y = 0.0
    }

    if (msg.cone_orient_z !== undefined) {
      resolved.cone_orient_z = msg.cone_orient_z;
    }
    else {
      resolved.cone_orient_z = 0.0
    }

    if (msg.tool_direction_feat !== undefined) {
      resolved.tool_direction_feat = msg.tool_direction_feat;
    }
    else {
      resolved.tool_direction_feat = 0.0
    }

    if (msg.solid_angle !== undefined) {
      resolved.solid_angle = msg.solid_angle;
    }
    else {
      resolved.solid_angle = 0.0
    }

    if (msg.pan_angle !== undefined) {
      resolved.pan_angle = msg.pan_angle;
    }
    else {
      resolved.pan_angle = 0.0
    }

    if (msg.tilt_angle !== undefined) {
      resolved.tilt_angle = msg.tilt_angle;
    }
    else {
      resolved.tilt_angle = 0.0
    }

    return resolved;
    }
};

module.exports = Tool;
