cmake_minimum_required(VERSION 3.24)
project(arap_wasm)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)


find_package(VTK REQUIRED)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/bin)
add_executable(${CMAKE_PROJECT_NAME} main.cpp)

target_link_libraries(${CMAKE_PROJECT_NAME} ${VTK_LIBRARIES})