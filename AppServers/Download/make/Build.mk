# build makefile
# date	: 2009-10-15
# note  : ��װ�˱�����򣬺�ͷ�ļ�������ϵ

#ͷ�ļ������ļ����Ŀ¼
DEPS_DIR:=./deps


#���п��·��
ALL_LIBDIR:=$(patsubst -L%,:%,$(patsubst -l%,,$(LINK_LIB)))

#makefile����·��
VPATH := $(DEPS_DIR):$(VPATH):$(ALL_LIBDIR)

#����Դ�ļ���ͷ�ļ���������ϵ
deps:$(patsubst   %.cpp,$(DEPS_DIR)/%.d,$(wildcard *.cpp))

#�Զ��Ƶ��������
.cpp.o:
	mkdir -p $(OBJ_DIR)
	$(CXX) $(CFLAGS) ${LINK_INC} -c $< -o $(OBJ_DIR)/$@

.c.o:
	mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) ${LINK_INC} -c $< -o $(OBJ_DIR)/$@

#���ɶ�ͷ�ļ�������ϵ�ļ�
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

#��������������ϵ���ļ�
include $(patsubst   %.cpp,$(DEPS_DIR)/%.d,$(wildcard *.cpp))


