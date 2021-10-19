cmake_minimum_required(VERSION 3.13)
project(Forth)
set(CMAKE_CXX_STANDARD 20)

find_package(LLVM REQUIRED CONFIG)

set(SOURCE_FILES main.cpp)

include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

add_executable(Forth ${SOURCE_FILES})

llvm_map_components_to_libnames(llvm_libs support core irreader)
target_link_libraries(Forth ${llvm_libs})
