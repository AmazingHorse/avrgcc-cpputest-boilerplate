# Hey emacs, this is a -*- makefile                                              
# is public domain, believed to be neutral to any flavor of "make"               
# # (GNU make, BSD make, SysV make)  
#Set this to @ to keep the makefile quiet
SILENCE = @

#---- Outputs ----#
COMPONENT_NAME = example

#--- Inputs ----#
PROJECT_HOME_DIR = .

    
ifeq "$(CPPUTEST_HOME)" ""
Ifeq ($(OS), Windows_NT)
    CPPUTEST_HOME = C:/tools/cpputest-3.6
Else
    CPPUTEST_HOME = ~/tools/cpputest-3.6
endif
Endif

# Make does not offer a recursive wildcard function, so here is one
rwildcard=$(wildcard $(addsuffix $2, $1)) $(foreach d,$(wildcard $(addsuffix *, $1)),$(call rwildcard,$d/,$2))
# --- SRC_FILES ---
# Use SRC_FILES to specifiy individual production
# code files.
# These files are compiled and put into the
# ProductionCode library and links with the test runner
# Search the source directory for all c files
SRC_FILES := $(call rwildcard,$(SRC_DIR)/,*.c)

# --- SRC_DIRS ---
# Use SRC_DIRS to specifiy production directories
# code files.
# These files are compiled and put into a the
# ProductionCode library and links with the test runner
SRC_DIRS = \

# --- TEST_SRC_FILES ---
# TEST_SRC_FILES specifies individual test files to build.  Test
# files are always included in the build and they
# pull in production code from the library
TEST_SRC_FILES = \

# --- TEST_SRC_DIRS ---
# Like TEST_SRC_FILES, but biulds everyting in the directory
TEST_SRC_DIRS = \

# --- MOCKS_SRC_DIRS ---
# MOCKS_SRC_DIRS specifies a directories where you can put your
# mocks, stubs and fakes.  You can also just put them
# in TEST_SRC_DIRS
MOCKS_SRC_DIRS = \

# Turn on CppUMock
CPPUTEST_USE_EXTENSIONS = Y

INCLUDE_DIRS =\
  .\
  $(CPPUTEST_HOME)/include/ \
  $(CPPUTEST_HOME)/include/Platforms/Gcc \
  ./include \

# --- CPPUTEST_OBJS_DIR ---
# if you have to use "../" to get to your source path
# the makefile will put the .o and .d files in surprising 
# places.
# To make up for each level of "../", add place holder 
# sub directories in CPPUTEST_OBJS_DIR
# each "../".  It is kind of a kludge, but it causes the
# .o and .d files to be put under objs.
# e.g. if you have "../../src", set to "test-objs/1/2"
# This is set no "../" in the source path.
CPPUTEST_OBJS_DIR = test-obj

CPPUTEST_LIB_DIR = test-lib
CPPUTEST_WARNINGFLAGS = -Wall -Werror -Wswitch-default  -Wfatal-errors
CPPUTEST_CXXFLAGS =  -std=c++0x
CPPUTEST_CFLAGS = -std=c99

# Look at $(CPPUTEST_HOME)/build/MakefileWorker.mk for more controls

include $(CPPUTEST_HOME)/build/MakefileWorker.mk
