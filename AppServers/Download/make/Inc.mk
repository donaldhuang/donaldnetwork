# include makefile
# date	: 2011-03-20
# note  :
CC			= gcc
CXX			= g++
CFLAGS		= -g -Wall -D__SLOG_FULL__ 

#makefile ����Դ��·��
VPATH 	  := $(OBJ_DIR):$(RELEASE_DIR):$(BASE_DIR)/common:$(VPATH)

#ͨ�õ�server������

#�����Ŀ��ͷ�ļ�Ŀ¼
INCDIR_COMM=-I./ -I$(BASE_DIR)/include \
	-I$(BASE_DIR)/include/svr \
	-I/usr/local/include/libnetframework \

LIBDIR_COMM=-L$(BASE_DIR)/lib -lslog /usr/local/lib/libnetframework.a -lpthread

# ������Ҫ������ͷ�ļ�·��
LINK_INC	= $(INCDIR_COMM)
LINK_LIB	= $(LIBDIR_COMM) 

