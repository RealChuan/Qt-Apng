if(CMAKE_HOST_WIN32)
  list(APPEND CMAKE_PREFIX_PATH "C:\\Qt\\6.8.1\\msvc2022_64")
elseif(CMAKE_HOST_APPLE)

elseif(CMAKE_HOST_LINUX)
  list(APPEND CMAKE_PREFIX_PATH "/opt/Qt/6.8.1/gcc_64")
endif()

add_definitions(-DQT_DEPRECATED_WARNINGS)
