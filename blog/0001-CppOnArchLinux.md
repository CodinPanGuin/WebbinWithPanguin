---
layout: post
title: "Coding On Arch"
title2: "Setting up C++ development environment on Arch Linux"
loc: blog
latex: false
date: 2025-01-19
---
# Introduction
Hi there, I am CodinPanGuin and I mainly code on [Arch Linux](https://archlinux.org/){:target="_blank"} therefore this guide is focused on Arch Linux. But even if you don't use Arch Linux, I hope you can still find this post somehow useful.

---
## Setting up the environment
Hi again, so today we shall set up the environment for C++. First of all, I will show you step-by-step instructions to explain what does what, and then I will provide a bash script which does the whole process in one go.

First of all, we need to set up the tools we will use for our C++ development. We will use the following tools:
- [gcc (GNU Compiler Collection)](https://gcc.gnu.org/){:target="_blank"} - A compiler for C, C++, and some other languages.
- [cmake (Cross-platform Make)](https://cmake.org/){:target="_blank"} - A generator for building projects from source code.
- [Visual Studio Code](https://code.visualstudio.com/docs){:target="_blank"} - A simple powerful editor with a lot of plugins for C++ development. Although I prefer Neovim, it is much easier to set up VSCode with just plug-and-play plugins.

---
## Installing the tools
Installing gcc and cmake is pretty simple on Arch Linux since they are in the official repositories. You can install them easily with the following command:
```bash
sudo pacman -S gcc cmake
```
For installing Visual Studio Code, the installation is a bit more complicated since it is not in the official repositories. You can install it from the [AUR (Arch User Repository)](https://aur.archlinux.org/packages?O=0&SeB=nd&K=visual-studio-code-bin){:target="_blank"} with the following commands:
#### Download the package from the AUR
```bash
git clone https://aur.archlinux.org/visual-studio-code-bin.git
```
#### Change the directory to the package
```bash
cd visual-studio-code-bin && makepkg -si
```
#### Clean up the directory
```bash
cd .. && rm -rvf visual-studio-code-bin
```

---

## Setting up the project
##### Creating projects directory
We did it! Now we have all the tools we need. I am gonna set up the projects directory. I will create a directory called "Dev-Cpp". I like to keep all my projects
```bash
mkdir Dev-Cpp && cd Dev-Cpp
```
##### Creating the project
Now we shall create the project directory and set it up with cmake. First lets create neccecary directories. For the project name I will use "0001_HelloWorld" but you can use any name you want.
```bash
mkdir 0001_HelloWorld ./0001_HelloWorld/src ./0001_HelloWorld/build ./0001_HelloWorld/release && cd 0001_HelloWorld
```
---
##### Setting up the project with CMake
To set up the Cmake we need to create a file called "CMakeLists.txt" in the project directory. To do this I recommend using [NANO](https://www.nano-editor.org/) editor, it is easier to use than VIM and it is pre-installed on Arch Linux. The set up should look like this:
```cmake
# GNU nano 8.3  CMakeLists.txt
cmake_minimum_required(VERSION 3.5)
project(0001_HelloWorld)

# Setting up C++ flags
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror")

# Set Source Directory
set(source_dir "${CMAKE_SOURCE_DIR}/src")

# Add the source files
file(GLOB_RECURSE source_files "${source_dir}/*.cpp")

# Add the executable
add_executable(0001_HelloWorld ${source_files})

# [ Welcome to nano.  For basic help, type Ctrl+G. ]
#^G Help  ^O Write Out  ^F Where Is  ^K Cut    ^T Execute  ^C Location    M-U Undo  M-A Set Mark
#^X Exit  ^R Read File  ^\ Replace   ^U Paste  ^J Justify  ^/ Go To Line  M-E Redo  M-6 Copy       
```
<br>
To exit NANO press `Ctrl+S` to save the file and `Ctrl+X` to exit.
<br><br>

---
##### Building the project
Lets set script to build the project which I will call "build.sh" in the project directory. The script should look like this:
```bash
# GNU nano 8.3  build.sh
#!/bin/bash

set -e # Exit on error

# Set the CMake build type to Release
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -S . -B build

# Build the project
cmake --build build

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Build successful!"
    mv build/$project_name release/ || { echo "Failed to move executable"; exit 1; }
    
    echo "Running the program..."
    ./release/$project_name || { echo "Failed to execute program"; exit 1; }
else
    echo "Build failed."
    exit 1
fi

# [ Welcome to nano.  For basic help, type Ctrl+G. ]
#^G Help  ^O Write Out  ^F Where Is  ^K Cut    ^T Execute  ^C Location    M-U Undo  M-A Set Mark
#^X Exit  ^R Read File  ^\ Replace   ^U Paste  ^J Justify  ^/ Go To Line  M-E Redo  M-6 Copy       
```
<br>
As before, to exit NANO press `Ctrl+S` to save the file and `Ctrl+X` to exit. To make the script executable, run the following command:

`chmod +x build.sh`
<br><br>

---
# Time to code
Now that everything is set up, you can create file in the `src` directory called `main.cpp` and write your code inside. Open your VSCode and start coding! 

Any time you want to build the project, just run the `build.sh`


### Recomanded plugin pack for VSCode:

- [C/C++ Extension Pack](https://marketplace.visualstudio.com/items?itemName=Kr4is.cpptools-extension-pack){:target="_blank"} - For IntelliSense(Coding assistance), and code browsing for C/C++

##### Bash to make the whole thing in one go
```bash
#!/usr/bin/env bash

# Install development tools if needed
read -p "Do you want to install development tools (gcc, cmake and VScode?)? [y/N]: " install_tools
if [[ "$install_tools" =~ ^[Yy]$ ]]; then
    echo "Installing development tools..."
    sudo pacman -Sy --needed gcc cmake || { echo "Failed to install tools"; exit 1; }
    git clone https://aur.archlinux.org/visual-studio-code-bin.git && cd visual-studio-code-bin && makepkg -si && cd .. && rm -rvf visual-studio-code-bin || { echo "Failed to install VScode"; exit 1; }
fi

# Create a directory for cpp projects
if [ ! -d "./cpp" ]; then
    echo "Creating a directory for cpp projects"
    mkdir cpp || { echo "Failed to create cpp directory"; exit 1; }
fi

# Navigate to cpp directory
cd ./cpp || { echo "Failed to navigate to cpp directory"; exit 1; }

# Ask user for the project name
echo "Enter the project name: "
read project_name

# Create a directory for the project
if [ ! -d "./$project_name" ]; then
    echo "Creating project directory: $project_name"
    mkdir "$project_name" || { echo "Failed to create project directory"; exit 1; }
fi

cd "$project_name" || { echo "Failed to navigate to project directory"; exit 1; }
mkdir -p src build release || { echo "Failed to create project subdirectories"; exit 1; }

# Create main.cpp with a basic template
cat <<EOL > ./src/main.cpp
#include <iostream>

int main() {
    std::cout << "Hello, $project_name!" << std::endl;
    return 0;
}
EOL

# Create CMakeLists.txt
cat <<EOL > CMakeLists.txt
cmake_minimum_required(VERSION 3.5)
project($project_name)

# Set C++ Standard and Flags
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "\${CMAKE_CXX_FLAGS} -Wall -Werror")

# Set Source Directory
set(source_dir "\${CMAKE_CURRENT_SOURCE_DIR}/src")

# Add Source Files
file(GLOB source_files "\${source_dir}/*.cpp")

# Add Executable
add_executable($project_name \${source_files})
EOL

# Create build.sh script
cat <<EOL > compile.sh
#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -S . -B build
cmake --build build
if [ $? -eq 0 ]; then
    echo "Build successful!"
    mv build/$project_name release/ || { echo "Failed to move executable"; exit 1; }
    echo "Running the program..."
    ./release/$project_name || { echo "Failed to execute program"; exit 1; }
else
    echo "Build failed."
    exit 1
fi
EOL

chmod +x compile.sh

# Final message
echo "Project setup complete!"
echo "To build the project, run ./build.sh in the project directory."
```

---
### Final words
I hope you learned something new today and I hope you have a great day.
- [CodinPanGuin](/)
<br>
<br>