find_package(GTest 1.15.2 EXACT CONFIG REQUIRED)
message(STATUS "Found GTest in ${GTest_DIR}")

include(CMakePrintHelpers)
cmake_print_properties(
    TARGETS
        GTest::gtest_main
        GTest::gtest
    PROPERTIES
        LOCATION
        LOCATION_DEBUG
        LOCATION_RELEASE
        LOCATION_RELWITHDEBINFO
)


add_executable(Test1 Test1.cpp)
target_link_libraries(Test1 PRIVATE GTest::gtest_main)
add_test(NAME Test1 COMMAND Test1)

add_executable(Test2 Test2.cpp)
target_link_libraries(Test2 PRIVATE GTest::gtest_main)
add_test(NAME Test2 COMMAND Test2)

add_executable(Test3 Test3.cpp)
target_link_libraries(Test3 PRIVATE GTest::gtest_main)
add_test(NAME Test3_1 COMMAND Test3)
