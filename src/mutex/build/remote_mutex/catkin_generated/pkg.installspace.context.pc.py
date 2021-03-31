# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;remote_mutex_msgs".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lremote_mutex;-lmutex_guard".split(';') if "-lremote_mutex;-lmutex_guard" != "" else []
PROJECT_NAME = "remote_mutex"
PROJECT_SPACE_DIR = "/home/aiu/Documents/safety/src/mutex/install"
PROJECT_VERSION = "0.0.0"
