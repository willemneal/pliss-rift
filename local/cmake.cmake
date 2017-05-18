message(STATUS "Loading local configuration")

# if you are using the provided VM, you can leave this untouched. Otherwise the LLVM_COMPILE_DIR must point to the folder which contains the `src`, `debug` and `release` folders for LLVM sources and builds as specified in the README.md
set(LLVM_COMPILE_DIR "/home/user/Documents/llvm-4.0.0")

# Specify whether to link against debug, or release version of LLVM
#set(LLVM_LINK_AGAINST ${CMAKE_BUILD_TYPE})
set(LLVM_LINK_AGAINST "Release")

# unless your setup deviates from the README.md you do not have to touch the next lines

if(LLVM_LINK_AGAINST STREQUAL "Release")
    set(LLVM_DIR "${LLVM_COMPILE_DIR}/release/cmake/modules/CMakeFiles")
elseif(LLVM_LINK_AGAINST STREQUAL "Debug")
    set(LLVM_DIR "${LLVM_COMPILE_DIR}/debug/cmake/modules/CMakeFiles")
else()
    message(FATAL_ERROR "Unknown LLVM build type: ${LLVM_LINK_AGAINST}")
endif()

message(STATUS "Linking to LLVM at ${LLVM_DIR} in ${LLVM_LINK_AGAINST} mode")

# due to problems with llvm makefiles and headers, we are including the correct headers explicitly
include_directories("${LLVM_COMPILE_DIR}/../llvm-4.0.0.src/include")

#add_definitions(-std=c++11 -O2)
add_definitions(-std=c++11 -g)

set(LOCAL_CONFIG 1)
