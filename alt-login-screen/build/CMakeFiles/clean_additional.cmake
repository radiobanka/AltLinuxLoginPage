# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/github-splash-screen_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/github-splash-screen_autogen.dir/ParseCache.txt"
  "github-splash-screen_autogen"
  )
endif()
