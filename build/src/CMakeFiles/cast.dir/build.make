# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/muuuchen/workspace/specdec/cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/muuuchen/workspace/specdec/build

# Include any dependencies generated for this target.
include src/CMakeFiles/cast.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/CMakeFiles/cast.dir/compiler_depend.make

# Include the progress variables for this target.
include src/CMakeFiles/cast.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/cast.dir/flags.make

src/CMakeFiles/cast.dir/cast.cpp.o: src/CMakeFiles/cast.dir/flags.make
src/CMakeFiles/cast.dir/cast.cpp.o: /home/muuuchen/workspace/specdec/cpp/src/cast.cpp
src/CMakeFiles/cast.dir/cast.cpp.o: src/CMakeFiles/cast.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/muuuchen/workspace/specdec/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/cast.dir/cast.cpp.o"
	cd /home/muuuchen/workspace/specdec/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/cast.dir/cast.cpp.o -MF CMakeFiles/cast.dir/cast.cpp.o.d -o CMakeFiles/cast.dir/cast.cpp.o -c /home/muuuchen/workspace/specdec/cpp/src/cast.cpp

src/CMakeFiles/cast.dir/cast.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cast.dir/cast.cpp.i"
	cd /home/muuuchen/workspace/specdec/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/muuuchen/workspace/specdec/cpp/src/cast.cpp > CMakeFiles/cast.dir/cast.cpp.i

src/CMakeFiles/cast.dir/cast.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cast.dir/cast.cpp.s"
	cd /home/muuuchen/workspace/specdec/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/muuuchen/workspace/specdec/cpp/src/cast.cpp -o CMakeFiles/cast.dir/cast.cpp.s

# Object files for target cast
cast_OBJECTS = \
"CMakeFiles/cast.dir/cast.cpp.o"

# External object files for target cast
cast_EXTERNAL_OBJECTS =

src/libcast.a: src/CMakeFiles/cast.dir/cast.cpp.o
src/libcast.a: src/CMakeFiles/cast.dir/build.make
src/libcast.a: src/CMakeFiles/cast.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/muuuchen/workspace/specdec/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libcast.a"
	cd /home/muuuchen/workspace/specdec/build/src && $(CMAKE_COMMAND) -P CMakeFiles/cast.dir/cmake_clean_target.cmake
	cd /home/muuuchen/workspace/specdec/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cast.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/cast.dir/build: src/libcast.a
.PHONY : src/CMakeFiles/cast.dir/build

src/CMakeFiles/cast.dir/clean:
	cd /home/muuuchen/workspace/specdec/build/src && $(CMAKE_COMMAND) -P CMakeFiles/cast.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/cast.dir/clean

src/CMakeFiles/cast.dir/depend:
	cd /home/muuuchen/workspace/specdec/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/muuuchen/workspace/specdec/cpp /home/muuuchen/workspace/specdec/cpp/src /home/muuuchen/workspace/specdec/build /home/muuuchen/workspace/specdec/build/src /home/muuuchen/workspace/specdec/build/src/CMakeFiles/cast.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/cast.dir/depend

