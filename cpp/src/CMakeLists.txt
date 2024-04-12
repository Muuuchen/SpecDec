add_library(cast cast.hpp cast.cpp)

# 访问这个库的时候就可以看到这个共享文件夹下的所有文件
target_include_directories(cast PUBLIC ${CMAKE_CURRENT_LIST_DIR})
