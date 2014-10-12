# build makefile
# date	: 2009-10-15
# note  : 封装了编译规则，和头文件依赖关系

#头文件依赖文件存放目录
DEPS_DIR:=./deps


#所有库的路径
ALL_LIBDIR:=$(patsubst -L%,:%,$(patsubst -l%,,$(LINK_LIB)))

#makefile搜索路径
VPATH := $(DEPS_DIR):$(VPATH):$(ALL_LIBDIR)

#建立源文件和头文件的依赖关系
deps:$(patsubst   %.cpp,$(DEPS_DIR)/%.d,$(wildcard *.cpp))

#自动推导编译规则
.cpp.o:
	mkdir -p $(OBJ_DIR)
	$(CXX) $(CFLAGS) ${LINK_INC} -c $< -o $(OBJ_DIR)/$@

.c.o:
	mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) ${LINK_INC} -c $< -o $(OBJ_DIR)/$@

#生成对头文件依赖关系文件
$(DEPS_DIR)/%.d:%.cpp
	mkdir -p $(DEPS_DIR)
	@set -e; rm -f $@;
	-$(CC) -MM ${LINK_INC} $<   > $@.tmp;
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' <  $@.tmp  > $@;
	rm -f $@.tmp

clean:
	rm -f $(OBJ_DIR)/*.o  $(RELEASE_DIR)/$(TARGET) $(DEPS_DIR)/*.d
	rmdir $(DEPS_DIR)
	rmdir $(OBJ_DIR)

#包含所有依赖关系的文件
include $(patsubst   %.cpp,$(DEPS_DIR)/%.d,$(wildcard *.cpp))


