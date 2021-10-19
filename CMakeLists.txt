cmake_minimum_required(VERSION 3.7 FATAL_ERROR)
project(Forth)

set(CMAKE_CXX_STANDARD 14)

set(ANTLR4_JAR_LOCATION /usr/local/lib)
set(ANTLR_EXECUTABLE /usr/local/lib/antlr-4.9-complete.jar)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

add_definitions(-DANTLR4CPP_STATIC)

set(ANTLR4_WITH_STATIC_CRT OFF)
include(ExternalAntlr4Cpp)
include_directories(${ANTLR4_INCLUDE_DIRS})

find_package(LLVM REQUIRED CONFIG)
find_package(ANTLR REQUIRED)

antlr_target(
    ForthGrammar
    ${CMAKE_CURRENT_SOURCE_DIR}/Forth.g4
    BOTH
    "forth::grammar"
)

set(SOURCE_FILES main.cpp)

include_directories(${ANTLR_ForthGrammar_OUTPUT_DIR})

include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

add_executable(Forth ${SOURCE_FILES} ${ANTLR_ForthGrammar_CXX_OUTPUTS})

llvm_map_components_to_libnames(llvm_libs support core irreader)
target_link_libraries(Forth ${llvm_libs} antlr4_static)
