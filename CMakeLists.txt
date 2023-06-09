cmake_minimum_required(VERSION 3.12)
project(math-library C)

# Set C standard to C99
set(CMAKE_C_STANDARD 99)

# Add the include directories
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src)

# Add the source files
set(SOURCE_FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/main.c
)

# Add the SIMD backend if enabled
option(BACKEND_SIMD "Enable SIMD backend" OFF)
if (BACKEND_SIMD)
    message(STATUS "Using SIMD backend")
    set(SOURCE_FILES ${SOURCE_FILES} ${CMAKE_CURRENT_SOURCE_DIR}/src/backends/impl_simd.m)
endif()

# Add the vDSP backend if enabled
option(BACKEND_VDSP "Enable vDSP backend" OFF)
if (BACKEND_VDSP)
    message(STATUS "Using vDSP backend")
    set(SOURCE_FILES ${SOURCE_FILES} ${CMAKE_CURRENT_SOURCE_DIR}/src/backends/impl_vdsp.m)
endif()

# Add the assembly backend if enabled
option(BACKEND_ASM1 "Enable assembly (arm64) backend (v1)" OFF)
if (BACKEND_ASM1)
    message(STATUS "Using assembly (arm64) backend (v1)")
    enable_language(ASM)
    set(SOURCE_FILES ${SOURCE_FILES} ${CMAKE_CURRENT_SOURCE_DIR}/src/backends/impl_asm_arm64_v1.s)
endif()

# Add the assembly backend if enabled
option(BACKEND_ASM2 "Enable assembly (arm64) backend (v2)" OFF)
if (BACKEND_ASM2)
    message(STATUS "Using assembly (arm64) backend (v2)")
    enable_language(ASM)
    set(SOURCE_FILES ${SOURCE_FILES} ${CMAKE_CURRENT_SOURCE_DIR}/src/backends/impl_asm_arm64_v2.s)
endif()


# Add the default backend if no specific backend is enabled
if(NOT BACKEND_SIMD AND NOT BACKEND_VDSP AND NOT BACKEND_ASM1 AND NOT BACKEND_ASM2)
    message(STATUS "No backend specified, using default")
    set(SOURCE_FILES ${SOURCE_FILES} ${CMAKE_CURRENT_SOURCE_DIR}/src/backends/impl_default.c)
endif()

# Add the target executable
add_executable(math-library ${SOURCE_FILES})

# Set the target properties
set_target_properties(math-library PROPERTIES
    OUTPUT_NAME math-library
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

# Add compile definitions based on selected backend
target_compile_definitions(math-library PRIVATE $<$<BOOL:${BACKEND_SIMD}>:BACKEND_SIMD>)
target_compile_definitions(math-library PRIVATE $<$<BOOL:${BACKEND_VDSP}>:BACKEND_VDSP>)
target_compile_definitions(math-library PRIVATE $<$<BOOL:${BACKEND_ASM1}>:BACKEND_ASM1>)
target_compile_definitions(math-library PRIVATE $<$<BOOL:${BACKEND_ASM2}>:BACKEND_ASM2>)

# Link the Accelerate framework for vDSP backend
if (BACKEND_VDSP OR BACKEND_SIMD)
    if (APPLE)
        find_library(ACCELERATE_FRAMEWORK Accelerate)
        target_link_libraries(math-library PRIVATE ${ACCELERATE_FRAMEWORK})
    endif (APPLE)
endif (BACKEND_VDSP OR BACKEND_SIMD)
