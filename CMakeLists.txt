cmake_minimum_required(VERSION 3.8)

project(PAPYRUS)

set(PAPYRUS_VERSION_MAJOR 1)
set(PAPYRUS_VERSION_MINOR 0)
set(PAPYRUS_VERSION_PATCH 0)

set(PAPYRUS_USE_FORTRAN OFF CACHE BOOL "Enable support for Fortran 90")

option(PAPYRUS_BUILD_WITH_SPACK "Bulid with Spack" OFF)

if(PAPYRUS_USE_FORTRAN)
    enable_language(Fortran)
endif()

find_package(MPI REQUIRED)
MESSAGE (STATUS "MPI_CXX_COMPILER ${MPI_CXX_COMPILER}")
MESSAGE (STATUS "MPI_C_COMPILER ${MPI_C_COMPILER}")
MESSAGE (STATUS "MPI_Fortran_COMPILER ${MPI_Fortran_COMPILER}")

if (NOT "${MPI_C_COMPILER}" STREQUAL "MPI_C_COMPILER-NOTFOUND")
    set(CMAKE_C_COMPILER "${MPI_C_COMPILER}")
endif()
if (NOT "${MPI_CXX_COMPILER}" STREQUAL "MPI_CXX_COMPILER-NOTFOUND")
    set(CMAKE_CXX_COMPILER "${MPI_CXX_COMPILER}")
endif()
if (NOT "${MPI_Fortran_COMPILER}" STREQUAL "MPI_Fortran_COMPILER-NOTFOUND")
    set(CMAKE_Fortran_COMPILER "${MPI_Fortran_COMPILER}")
endif()
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

include(CTest)

add_subdirectory(include)
add_subdirectory(kv)
