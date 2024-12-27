find_package(GTest 1.15.2 EXACT CONFIG REQUIRED)
message(STATUS "Found GTest in ${GTest_DIR}")

include(CMakePrintHelpers)
cmake_print_properties(TARGETS GTest::gtest_main PROPERTIES LOCATION)
cmake_print_properties(TARGETS GTest::gtest_main PROPERTIES INTERFACE_LINK_LIBRARIES)
cmake_print_properties(TARGETS GTest::gtest_main PROPERTIES INTERFACE_INCLUDE_DIRECTORIES)
cmake_print_properties(TARGETS GTest::gtest_main PROPERTIES INCLUDE_DIRECTORIES)

cmake_print_properties(TARGETS GTest::gtest PROPERTIES LOCATION)
cmake_print_properties(TARGETS GTest::gtest PROPERTIES INTERFACE_LINK_LIBRARIES)
cmake_print_properties(TARGETS GTest::gtest PROPERTIES INTERFACE_INCLUDE_DIRECTORIES)
cmake_print_properties(TARGETS GTest::gtest PROPERTIES INCLUDE_DIRECTORIES)


add_executable(Test1 Test1.cpp)
target_link_libraries(
    Test1
    PRIVATE
        GTest::gtest_main
)
add_test(NAME Test1 COMMAND Test1)

add_executable(Test2 Test2.cpp)
target_link_libraries(
    Test2
    PRIVATE
        GTest::gtest_main
)
add_test(NAME Test2 COMMAND Test2)

add_executable(Test3 Test3.cpp)
target_link_libraries(
    Test3
    PRIVATE
        GTest::gtest_main
)
add_test(NAME Test3_1 COMMAND Test3)
add_test(NAME Test3_2 COMMAND Test3)
