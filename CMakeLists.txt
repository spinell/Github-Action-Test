cmake_minimum_required(VERSION 3.27)
project(TestGitHubAction)

#
# For debugging only
#
include(CMakePrintHelpers)

message(STATUS "=============================================")
message(STATUS "               System Info")
message(STATUS "=============================================")
cmake_print_variables(CMAKE_SYSTEM)
cmake_print_variables(CMAKE_SYSTEM_NAME)
cmake_print_variables(CMAKE_SYSTEM_PROCESSOR)
cmake_print_variables(CMAKE_SYSTEM_VERSION)
cmake_print_variables(CMAKE_HOST_SYSTEM)
cmake_print_variables(CMAKE_HOST_SYSTEM_NAME)
cmake_print_variables(CMAKE_HOST_SYSTEM_PROCESSOR)
cmake_print_variables(CMAKE_HOST_SYSTEM_VERSION)

message(STATUS "=============================================")
message(STATUS "               Build Info")
message(STATUS "=============================================")
cmake_print_variables(CMAKE_COMMAND)
cmake_print_variables(CMAKE_GENERATOR)
cmake_print_variables(CMAKE_GENERATOR_INSTANCE)
cmake_print_variables(CMAKE_GENERATOR_PLATFORM)
cmake_print_variables(CMAKE_GENERATOR_TOOLSET)
cmake_print_variables(CMAKE_MAJOR_VERSION)
cmake_print_variables(CMAKE_MINOR_VERSION)
cmake_print_variables(CMAKE_MAKE_PROGRAM)

cmake_print_variables(CMAKE_BUILD_TYPE)
cmake_print_variables(CMAKE_DEFAULT_BUILD_TYPE)
cmake_print_variables(CMAKE_BUILD_CONFIG)
cmake_print_variables(CMAKE_DEFAULT_BUILD_CONFIG)
cmake_print_variables(CMAKE_MODULE_PATH)
cmake_print_variables(CMAKE_PREFIX_PATH)
cmake_print_variables(CMAKE_C_COMPILER)
cmake_print_variables(CMAKE_CXX_COMPILER)
cmake_print_variables(CMAKE_C_COMPILER_ID)
cmake_print_variables(CMAKE_CXX_COMPILER_ID)
cmake_print_variables(CMAKE_C_SIMULATE_ID)
cmake_print_variables(CMAKE_CXX_SIMULATE_ID)
cmake_print_variables(CMAKE_CXX_SIMULATE_VERSION)
cmake_print_variables(CMAKE_C_COMPILER_FRONTEND_VARIANT)
cmake_print_variables(CMAKE_CXX_COMPILER_FRONTEND_VARIANT)
cmake_print_variables(CMAKE_C_CLANG_TIDY)
cmake_print_variables(CMAKE_CXX_CLANG_TIDY)
cmake_print_variables(CMAKE_C_INCLUDE_WHAT_YOU_USE)
cmake_print_variables(CMAKE_CXX_INCLUDE_WHAT_YOU_USE)
cmake_print_variables(CMAKE_CXX_FLAGS)
cmake_print_variables(CMAKE_CXX_FLAGS_DEBUG)
cmake_print_variables(CMAKE_CXX_FLAGS_DEDWITHRELINFO)
cmake_print_variables(CMAKE_CXX_FLAGS_RELEASE)
cmake_print_variables(CMAKE_CXX_FLAGS_MINSIZEREL)
cmake_print_variables(CMAKE_CXX_STANDARD)
cmake_print_variables(MSVC)
cmake_print_variables(MSVC_VERSION)
cmake_print_variables(MSVC_TOOLSET_VERSION)
cmake_print_variables(MSVC_IDE)
cmake_print_variables(MINGW)      # compiler targeting the GNU ABI on Windows
cmake_print_variables(MSYS)       # MSYS Makefiles generator
cmake_print_variables(CMAKE_INCLUDE_SYSTEM_FLAG_CXX)



set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_EXTENSIONS Off)

option(BUILD_TEST    "Build all the tests." ON)

find_package(SDL2 2.30.10 EXACT REQUIRED CONFIG)
message(STATUS "Found SDL2 in ${SDL2_DIR}")

find_package(EnTT 3.14.0  EXACT REQUIRED CONFIG)
message(STATUS "Found EnTT in ${EnTT_DIR}")

find_package(unofficial-lua REQUIRED CONFIG)

add_subdirectory(App)

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

install(TARGETS App)
