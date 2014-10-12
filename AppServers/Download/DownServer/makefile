#定义开发根目录
BASE_DIR = ..
#设置生产的obj文件所放的路径 
OBJ_DIR:=./obj
#设置可执行程序所放的路径
RELEASE_DIR:=./

#包含makefile公共头文件,定义了基础库和头文件的路径
include $(BASE_DIR)/make/Inc.mk

#
#添加库和头文件路径
#
LINK_INC:= -I../lib $(LINK_INC)
LINK_LIB:= -L../lib -lprotocol $(LINK_LIB)

#所有的目标文件必须在这指定
TARGET =download_server


all:${TARGET}

download_server:DownloadServerMain.o DownloadServer.o
	$(CXX) -o $(RELEASE_DIR)/$@ $(patsubst %.o,$(OBJ_DIR)/%.o,$(^F)) $(LINK_LIB)
	
install:
	cp $(TARGET) $(BINARY).conf  ../bin


#Build.mk定义了自动编译的规则，包括头文件的依赖关系
#注意，一定要放在makefile的最后
include $(BASE_DIR)/make/Build.mk

