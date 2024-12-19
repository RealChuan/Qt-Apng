cmake_minimum_required(VERSION 3.25.1)

include(cmake/vcpkg.cmake)
include(cmake/qt.cmake)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(utils)
include(qt_utils)

project(
  QtApng
  VERSION 0.1.0
  LANGUAGES CXX)

include(cmake/common.cmake)

find_package(ZLIB REQUIRED)
if(ZLIB_FOUND)
  message(STATUS "found ZLIB")
endif()

find_package(PNG CONFIG REQUIRED)
if(PNG_FOUND)
  message(STATUS "found PNG")
endif()

option(APNG_TESTS "Enable tests" OFF)
option(APNG_EXAMPLES "Enable examples" OFF)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core)
message(STATUS "Found Qt ${QT_VERSION}")
if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
  set(APNG_QT_VERSION 6)
else()
  set(APNG_QT_VERSION 5)
  include(cmake/Qt5Plugin.cmake)
endif()

find_package(Qt${APNG_QT_VERSION} REQUIRED COMPONENTS Core Gui)

add_subdirectory(src)

if(APNG_TESTS)
  find_package(Qt${APNG_QT_VERSION} REQUIRED COMPONENTS Test)
  add_subdirectory(tests)
endif()

if(APNG_TESTS)
  find_package(Qt${APNG_QT_VERSION} REQUIRED COMPONENTS Widgets)
  add_subdirectory(examples)
endif()
