# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.12.1/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.12.1/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/shen/Documents/workspace/cs201/cs201/HelloPass-LLVM/Pass/Transforms/ValueNumbering

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/shen/Documents/workspace/cs201/cs201/HelloPass-LLVM/Pass/build

# Include any dependencies generated for this target.
include CMakeFiles/LLVMValueNumberingPass.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/LLVMValueNumberingPass.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/LLVMValueNumberingPass.dir/flags.make

CMakeFiles/LLVMValueNumberingPass.dir/ValueNumbering.cpp.o: CMakeFiles/LLVMValueNumberingPass.dir/flags.make
CMakeFiles/LLVMValueNumberingPass.dir/ValueNumbering.cpp.o: /Users/shen/Documents/workspace/cs201/cs201/HelloPass-LLVM/Pass/Transforms/ValueNumbering/ValueNumbering.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/shen/Documents/workspace/cs201/cs201/HelloPass-LLVM/Pass/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/LLVMValueNumberingPass.dir/ValueNumbering.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/LLVMValueNumberingPass.dir/ValueNumbering.cpp.o -c /Users/shen/Documents/workspace/cs201/cs201/HelloPass-LLVM/Pass/Transforms/ValueNumbering/ValueNumbering.cpp

CMakeFiles/LLVMValueNumberingPass.dir/ValueNumbering.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMValueNumberingPass.dir/ValueNumbering.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/shen/Documents/workspace/cs201/cs201/HelloPass-LLVM/Pass/Transforms/ValueNumbering/ValueNumbering.cpp > CMakeFiles/LLVMValueNumberingPass.dir/ValueNumbering.cpp.i

CMakeFiles/LLVMValueNumberingPass.dir/ValueNumbering.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMValueNumberingPass.dir/ValueNumbering.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/shen/Documents/workspace/cs201/cs201/HelloPass-LLVM/Pass/Transforms/ValueNumbering/ValueNumbering.cpp -o CMakeFiles/LLVMValueNumberingPass.dir/ValueNumbering.cpp.s

# Object files for target LLVMValueNumberingPass
LLVMValueNumberingPass_OBJECTS = \
"CMakeFiles/LLVMValueNumberingPass.dir/ValueNumbering.cpp.o"

# External object files for target LLVMValueNumberingPass
LLVMValueNumberingPass_EXTERNAL_OBJECTS =

libLLVMValueNumberingPass.so: CMakeFiles/LLVMValueNumberingPass.dir/ValueNumbering.cpp.o
libLLVMValueNumberingPass.so: CMakeFiles/LLVMValueNumberingPass.dir/build.make
libLLVMValueNumberingPass.so: CMakeFiles/LLVMValueNumberingPass.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/shen/Documents/workspace/cs201/cs201/HelloPass-LLVM/Pass/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared module libLLVMValueNumberingPass.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LLVMValueNumberingPass.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/LLVMValueNumberingPass.dir/build: libLLVMValueNumberingPass.so

.PHONY : CMakeFiles/LLVMValueNumberingPass.dir/build

CMakeFiles/LLVMValueNumberingPass.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/LLVMValueNumberingPass.dir/cmake_clean.cmake
.PHONY : CMakeFiles/LLVMValueNumberingPass.dir/clean

CMakeFiles/LLVMValueNumberingPass.dir/depend:
	cd /Users/shen/Documents/workspace/cs201/cs201/HelloPass-LLVM/Pass/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shen/Documents/workspace/cs201/cs201/HelloPass-LLVM/Pass/Transforms/ValueNumbering /Users/shen/Documents/workspace/cs201/cs201/HelloPass-LLVM/Pass/Transforms/ValueNumbering /Users/shen/Documents/workspace/cs201/cs201/HelloPass-LLVM/Pass/build /Users/shen/Documents/workspace/cs201/cs201/HelloPass-LLVM/Pass/build /Users/shen/Documents/workspace/cs201/cs201/HelloPass-LLVM/Pass/build/CMakeFiles/LLVMValueNumberingPass.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/LLVMValueNumberingPass.dir/depend

