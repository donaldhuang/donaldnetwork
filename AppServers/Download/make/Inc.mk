# include makefile
# date	: 2011-03-20
# note  :
CC			= gcc
CXX			= g++
CFLAGS		= -g -Wall -D__SLOG_FULL__ 

#makefile 搜索源码路径
VPATH 	  := $(OBJ_DIR):$(RELEASE_DIR):$(BASE_DIR)/common:$(VPATH)

#通用的server基础库

#公共的库和头文件目录
INCDIR_COMM=-I./ -I$(BASE_DIR)/include \
	-I$(BASE_DIR)/include/svr \
	-I/usr/local/include/libnetframework \

LIBDIR_COMM=-L$(BASE_DIR)/lib -lslog /usr/local/lib/libnetframework.a -lpthread

# 编译需要的所有头文件路径
LINK_INC	= $(INCDIR_COMM)
LINK_LIB	= $(LIBDIR_COMM) 

