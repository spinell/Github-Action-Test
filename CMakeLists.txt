cmake_minimum_required(VERSION 3.27)
project(TestGitHubAction)

find_package(SDL2 2.30.10 EXACT REQUIRED CONFIG)
message(STATUS "Found SDL2 in ${SDL2_DIR}")

find_package(EnTT 3.14.0  EXACT REQUIRED CONFIG)
message(STATUS "Found EnTT in ${EnTT_DIR}")

find_package(lua   REQUIRED CONFIG)

#target_link_libraries(main PRIVATE $<TARGET_NAME_IF_EXISTS:SDL2::SDL2main> $<IF:$<TARGET_EXISTS:SDL2::SDL2>,SDL2::SDL2,SDL2::SDL2-static> )
# target_link_libraries(main PRIVATE GTest::gtest GTest::gtest_main GTest::gmock GTest::gmock_main)
#target_link_libraries(main PRIVATE EnTT::EnTT)

enable_testing()
find_package(GTest 1.15.2 EXACT CONFIG REQUIRED)
message(STATUS "Found GTest in ${GTest_DIR}")
