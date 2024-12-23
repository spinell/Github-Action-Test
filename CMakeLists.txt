cmake_minimum_required(VERSION 3.27)
project(TestGitHubAction)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_EXTENSIONS Off)

option(BUILD_TEST    "Build all the tests." ON)

find_package(SDL2 2.30.10 EXACT REQUIRED CONFIG)
message(STATUS "Found SDL2 in ${SDL2_DIR}")

find_package(EnTT 3.14.0  EXACT REQUIRED CONFIG)
message(STATUS "Found EnTT in ${EnTT_DIR}")

find_package(lua   REQUIRED CONFIG)

#target_link_libraries(main PRIVATE $<TARGET_NAME_IF_EXISTS:SDL2::SDL2main> $<IF:$<TARGET_EXISTS:SDL2::SDL2>,SDL2::SDL2,SDL2::SDL2-static> )
# target_link_libraries(main PRIVATE GTest::gtest GTest::gtest_main GTest::gmock GTest::gmock_main)
#target_link_libraries(main PRIVATE EnTT::EnTT)

if(BUILD_TEST)
    # Enable testing for current directory and below.
    # This command should be in the source directory root because ctest expects
    # to find a test file in the build directory root.
    enable_testing()
    add_subdirectory(tests)
endif(BUILD_TEST)
