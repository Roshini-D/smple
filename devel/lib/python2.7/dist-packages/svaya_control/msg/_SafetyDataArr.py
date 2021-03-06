# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from svaya_control/SafetyDataArr.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import svaya_control.msg

class SafetyDataArr(genpy.Message):
  _md5sum = "81b65946d816237f6be348b30fb1605b"
  _type = "svaya_control/SafetyDataArr"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """SafetyData[] msgdata

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

"""
  __slots__ = ['msgdata']
  _slot_types = ['svaya_control/SafetyData[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       msgdata

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(SafetyDataArr, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.msgdata is None:
        self.msgdata = []
    else:
      self.msgdata = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.msgdata)
      buff.write(_struct_I.pack(length))
      for val1 in self.msgdata:
        length = len(val1.Robot_limits)
        buff.write(_struct_I.pack(length))
        pattern = '<%sd'%length
        buff.write(struct.Struct(pattern).pack(*val1.Robot_limits))
        length = len(val1.JointLimitdata)
        buff.write(_struct_I.pack(length))
        for val2 in val1.JointLimitdata:
          _x = val2.joint_cnt
          buff.write(_get_struct_B().pack(_x))
          length = len(val2.joint_max_pos_limit_normal_mode)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(struct.Struct(pattern).pack(*val2.joint_max_pos_limit_normal_mode))
          length = len(val2.joint_min_pos_limit_normal_mode)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(struct.Struct(pattern).pack(*val2.joint_min_pos_limit_normal_mode))
          length = len(val2.joint_max_pos_limit_reduced_mode)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(struct.Struct(pattern).pack(*val2.joint_max_pos_limit_reduced_mode))
          length = len(val2.joint_min_pos_limit_reduced_mode)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(struct.Struct(pattern).pack(*val2.joint_min_pos_limit_reduced_mode))
          length = len(val2.joint_vel_limit_reduced_mode)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(struct.Struct(pattern).pack(*val2.joint_vel_limit_reduced_mode))
          length = len(val2.joint_vel_limit_normal_mode)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(struct.Struct(pattern).pack(*val2.joint_vel_limit_normal_mode))
        length = len(val1.SafetyPlanedata)
        buff.write(_struct_I.pack(length))
        for val2 in val1.SafetyPlanedata:
          _x = val2.plane_cnt
          buff.write(_get_struct_B().pack(_x))
          length = len(val2.plane_origin_x)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(struct.Struct(pattern).pack(*val2.plane_origin_x))
          length = len(val2.plane_origin_y)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(struct.Struct(pattern).pack(*val2.plane_origin_y))
          length = len(val2.plane_origin_z)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(struct.Struct(pattern).pack(*val2.plane_origin_z))
          length = len(val2.normal_dir_x)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(struct.Struct(pattern).pack(*val2.normal_dir_x))
          length = len(val2.normal_dir_y)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(struct.Struct(pattern).pack(*val2.normal_dir_y))
          length = len(val2.normal_dir_z)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(struct.Struct(pattern).pack(*val2.normal_dir_z))
          length = len(val2.safety_feat)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(struct.Struct(pattern).pack(*val2.safety_feat))
          length = len(val2.elbow_restrict)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(struct.Struct(pattern).pack(*val2.elbow_restrict))
        length = len(val1.Tooldata)
        buff.write(_struct_I.pack(length))
        for val2 in val1.Tooldata:
          _x = val2.tool_cnt
          buff.write(_get_struct_B().pack(_x))
          length = len(val2.tool_position_x)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(struct.Struct(pattern).pack(*val2.tool_position_x))
          length = len(val2.tool_position_y)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(struct.Struct(pattern).pack(*val2.tool_position_y))
          length = len(val2.tool_position_z)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(struct.Struct(pattern).pack(*val2.tool_position_z))
          length = len(val2.tool_radius)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(struct.Struct(pattern).pack(*val2.tool_radius))
          _x = val2
          buff.write(_get_struct_7d().pack(_x.cone_orient_x, _x.cone_orient_y, _x.cone_orient_z, _x.tool_direction_feat, _x.solid_angle, _x.pan_angle, _x.tilt_angle))
        length = len(val1.SafetyInputIo)
        buff.write(_struct_I.pack(length))
        pattern = '<%si'%length
        buff.write(struct.Struct(pattern).pack(*val1.SafetyInputIo))
        _x = val1
        buff.write(_get_struct_3B().pack(_x.underSingularity, _x.too_close_point, _x.safety_flag))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.msgdata is None:
        self.msgdata = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.msgdata = []
      for i in range(0, length):
        val1 = svaya_control.msg.SafetyData()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sd'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.Robot_limits = s.unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.JointLimitdata = []
        for i in range(0, length):
          val2 = svaya_control.msg.JointLimit()
          start = end
          end += 1
          (val2.joint_cnt,) = _get_struct_B().unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.joint_max_pos_limit_normal_mode = s.unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.joint_min_pos_limit_normal_mode = s.unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.joint_max_pos_limit_reduced_mode = s.unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.joint_min_pos_limit_reduced_mode = s.unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.joint_vel_limit_reduced_mode = s.unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.joint_vel_limit_normal_mode = s.unpack(str[start:end])
          val1.JointLimitdata.append(val2)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.SafetyPlanedata = []
        for i in range(0, length):
          val2 = svaya_control.msg.SafetyPlane()
          start = end
          end += 1
          (val2.plane_cnt,) = _get_struct_B().unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.plane_origin_x = s.unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.plane_origin_y = s.unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.plane_origin_z = s.unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.normal_dir_x = s.unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.normal_dir_y = s.unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.normal_dir_z = s.unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.safety_feat = s.unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.elbow_restrict = s.unpack(str[start:end])
          val1.SafetyPlanedata.append(val2)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.Tooldata = []
        for i in range(0, length):
          val2 = svaya_control.msg.Tool()
          start = end
          end += 1
          (val2.tool_cnt,) = _get_struct_B().unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.tool_position_x = s.unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.tool_position_y = s.unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.tool_position_z = s.unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.tool_radius = s.unpack(str[start:end])
          _x = val2
          start = end
          end += 56
          (_x.cone_orient_x, _x.cone_orient_y, _x.cone_orient_z, _x.tool_direction_feat, _x.solid_angle, _x.pan_angle, _x.tilt_angle,) = _get_struct_7d().unpack(str[start:end])
          val1.Tooldata.append(val2)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%si'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.SafetyInputIo = s.unpack(str[start:end])
        _x = val1
        start = end
        end += 3
        (_x.underSingularity, _x.too_close_point, _x.safety_flag,) = _get_struct_3B().unpack(str[start:end])
        val1.underSingularity = bool(val1.underSingularity)
        val1.too_close_point = bool(val1.too_close_point)
        val1.safety_flag = bool(val1.safety_flag)
        self.msgdata.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.msgdata)
      buff.write(_struct_I.pack(length))
      for val1 in self.msgdata:
        length = len(val1.Robot_limits)
        buff.write(_struct_I.pack(length))
        pattern = '<%sd'%length
        buff.write(val1.Robot_limits.tostring())
        length = len(val1.JointLimitdata)
        buff.write(_struct_I.pack(length))
        for val2 in val1.JointLimitdata:
          _x = val2.joint_cnt
          buff.write(_get_struct_B().pack(_x))
          length = len(val2.joint_max_pos_limit_normal_mode)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(val2.joint_max_pos_limit_normal_mode.tostring())
          length = len(val2.joint_min_pos_limit_normal_mode)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(val2.joint_min_pos_limit_normal_mode.tostring())
          length = len(val2.joint_max_pos_limit_reduced_mode)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(val2.joint_max_pos_limit_reduced_mode.tostring())
          length = len(val2.joint_min_pos_limit_reduced_mode)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(val2.joint_min_pos_limit_reduced_mode.tostring())
          length = len(val2.joint_vel_limit_reduced_mode)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(val2.joint_vel_limit_reduced_mode.tostring())
          length = len(val2.joint_vel_limit_normal_mode)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(val2.joint_vel_limit_normal_mode.tostring())
        length = len(val1.SafetyPlanedata)
        buff.write(_struct_I.pack(length))
        for val2 in val1.SafetyPlanedata:
          _x = val2.plane_cnt
          buff.write(_get_struct_B().pack(_x))
          length = len(val2.plane_origin_x)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(val2.plane_origin_x.tostring())
          length = len(val2.plane_origin_y)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(val2.plane_origin_y.tostring())
          length = len(val2.plane_origin_z)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(val2.plane_origin_z.tostring())
          length = len(val2.normal_dir_x)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(val2.normal_dir_x.tostring())
          length = len(val2.normal_dir_y)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(val2.normal_dir_y.tostring())
          length = len(val2.normal_dir_z)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(val2.normal_dir_z.tostring())
          length = len(val2.safety_feat)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(val2.safety_feat.tostring())
          length = len(val2.elbow_restrict)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(val2.elbow_restrict.tostring())
        length = len(val1.Tooldata)
        buff.write(_struct_I.pack(length))
        for val2 in val1.Tooldata:
          _x = val2.tool_cnt
          buff.write(_get_struct_B().pack(_x))
          length = len(val2.tool_position_x)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(val2.tool_position_x.tostring())
          length = len(val2.tool_position_y)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(val2.tool_position_y.tostring())
          length = len(val2.tool_position_z)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(val2.tool_position_z.tostring())
          length = len(val2.tool_radius)
          buff.write(_struct_I.pack(length))
          pattern = '<%sd'%length
          buff.write(val2.tool_radius.tostring())
          _x = val2
          buff.write(_get_struct_7d().pack(_x.cone_orient_x, _x.cone_orient_y, _x.cone_orient_z, _x.tool_direction_feat, _x.solid_angle, _x.pan_angle, _x.tilt_angle))
        length = len(val1.SafetyInputIo)
        buff.write(_struct_I.pack(length))
        pattern = '<%si'%length
        buff.write(val1.SafetyInputIo.tostring())
        _x = val1
        buff.write(_get_struct_3B().pack(_x.underSingularity, _x.too_close_point, _x.safety_flag))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.msgdata is None:
        self.msgdata = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.msgdata = []
      for i in range(0, length):
        val1 = svaya_control.msg.SafetyData()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sd'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.Robot_limits = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.JointLimitdata = []
        for i in range(0, length):
          val2 = svaya_control.msg.JointLimit()
          start = end
          end += 1
          (val2.joint_cnt,) = _get_struct_B().unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.joint_max_pos_limit_normal_mode = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.joint_min_pos_limit_normal_mode = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.joint_max_pos_limit_reduced_mode = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.joint_min_pos_limit_reduced_mode = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.joint_vel_limit_reduced_mode = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.joint_vel_limit_normal_mode = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
          val1.JointLimitdata.append(val2)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.SafetyPlanedata = []
        for i in range(0, length):
          val2 = svaya_control.msg.SafetyPlane()
          start = end
          end += 1
          (val2.plane_cnt,) = _get_struct_B().unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.plane_origin_x = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.plane_origin_y = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.plane_origin_z = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.normal_dir_x = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.normal_dir_y = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.normal_dir_z = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.safety_feat = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.elbow_restrict = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
          val1.SafetyPlanedata.append(val2)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.Tooldata = []
        for i in range(0, length):
          val2 = svaya_control.msg.Tool()
          start = end
          end += 1
          (val2.tool_cnt,) = _get_struct_B().unpack(str[start:end])
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.tool_position_x = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.tool_position_y = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.tool_position_z = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          pattern = '<%sd'%length
          start = end
          s = struct.Struct(pattern)
          end += s.size
          val2.tool_radius = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
          _x = val2
          start = end
          end += 56
          (_x.cone_orient_x, _x.cone_orient_y, _x.cone_orient_z, _x.tool_direction_feat, _x.solid_angle, _x.pan_angle, _x.tilt_angle,) = _get_struct_7d().unpack(str[start:end])
          val1.Tooldata.append(val2)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%si'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.SafetyInputIo = numpy.frombuffer(str[start:end], dtype=numpy.int32, count=length)
        _x = val1
        start = end
        end += 3
        (_x.underSingularity, _x.too_close_point, _x.safety_flag,) = _get_struct_3B().unpack(str[start:end])
        val1.underSingularity = bool(val1.underSingularity)
        val1.too_close_point = bool(val1.too_close_point)
        val1.safety_flag = bool(val1.safety_flag)
        self.msgdata.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3B = None
def _get_struct_3B():
    global _struct_3B
    if _struct_3B is None:
        _struct_3B = struct.Struct("<3B")
    return _struct_3B
_struct_7d = None
def _get_struct_7d():
    global _struct_7d
    if _struct_7d is None:
        _struct_7d = struct.Struct("<7d")
    return _struct_7d
_struct_B = None
def _get_struct_B():
    global _struct_B
    if _struct_B is None:
        _struct_B = struct.Struct("<B")
    return _struct_B
