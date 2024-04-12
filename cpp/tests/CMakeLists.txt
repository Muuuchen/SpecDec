add_executable(test1 test1.cpp)

target_link_libraries(test1 PUBLIC cast)

add_test(
    NAME mytest1
    COMMAND test1
    )
