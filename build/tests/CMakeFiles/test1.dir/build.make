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
include tests/CMakeFiles/test1.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tests/CMakeFiles/test1.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/test1.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/test1.dir/flags.make

tests/CMakeFiles/test1.dir/test1.cpp.o: tests/CMakeFiles/test1.dir/flags.make
tests/CMakeFiles/test1.dir/test1.cpp.o: /home/muuuchen/workspace/specdec/cpp/tests/test1.cpp
tests/CMakeFiles/test1.dir/test1.cpp.o: tests/CMakeFiles/test1.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/muuuchen/workspace/specdec/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/test1.dir/test1.cpp.o"
	cd /home/muuuchen/workspace/specdec/build/tests && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tests/CMakeFiles/test1.dir/test1.cpp.o -MF CMakeFiles/test1.dir/test1.cpp.o.d -o CMakeFiles/test1.dir/test1.cpp.o -c /home/muuuchen/workspace/specdec/cpp/tests/test1.cpp

tests/CMakeFiles/test1.dir/test1.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test1.dir/test1.cpp.i"
	cd /home/muuuchen/workspace/specdec/build/tests && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/muuuchen/workspace/specdec/cpp/tests/test1.cpp > CMakeFiles/test1.dir/test1.cpp.i

tests/CMakeFiles/test1.dir/test1.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test1.dir/test1.cpp.s"
	cd /home/muuuchen/workspace/specdec/build/tests && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/muuuchen/workspace/specdec/cpp/tests/test1.cpp -o CMakeFiles/test1.dir/test1.cpp.s

# Object files for target test1
test1_OBJECTS = \
"CMakeFiles/test1.dir/test1.cpp.o"

# External object files for target test1
test1_EXTERNAL_OBJECTS =

tests/test1: tests/CMakeFiles/test1.dir/test1.cpp.o
tests/test1: tests/CMakeFiles/test1.dir/build.make
tests/test1: src/libcast.a
tests/test1: tests/CMakeFiles/test1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/muuuchen/workspace/specdec/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test1"
	cd /home/muuuchen/workspace/specdec/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/test1.dir/build: tests/test1
.PHONY : tests/CMakeFiles/test1.dir/build

tests/CMakeFiles/test1.dir/clean:
	cd /home/muuuchen/workspace/specdec/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/test1.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/test1.dir/clean

tests/CMakeFiles/test1.dir/depend:
	cd /home/muuuchen/workspace/specdec/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/muuuchen/workspace/specdec/cpp /home/muuuchen/workspace/specdec/cpp/tests /home/muuuchen/workspace/specdec/build /home/muuuchen/workspace/specdec/build/tests /home/muuuchen/workspace/specdec/build/tests/CMakeFiles/test1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/test1.dir/depend

