cmake_minimum_required(VERSION 3.21)

project(
  CMakeQtAPKExample
  VERSION 1.0
  DESCRIPTION
    "An example repository to showcase how to build a simple C++ android app with Qt/QML and CMake"
  LANGUAGES CXX)

find_package(Qt5 REQUIRED COMPONENTS Core Quick) 
# Qt5 is from CMAKE_PREFIX_PATH, it will find Core and Quick in that path (5.15.2/include)
# You can also view .h files in this folder
set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android") # To include file AndroidManifest.xml

# Whether to handle moc automatically for Qt targets.
# This variable is used to initialize the AUTOMOC property on all the targets. See that target property for additional information.
set(CMAKE_AUTOMOC ON)

# Whether to handle rcc automatically for Qt targets.
# This variable is used to initialize the AUTORCC property on all the targets. See that target property for additional information.
set(CMAKE_AUTORCC ON)

if(NOT ANDROID)
  add_executable(QMLDesktopExample)
elseif(ANDROID)
  add_library(QMLDesktopExample SHARED)
  find_package(Qt5 REQUIRED AndroidExtras)
  target_link_libraries(QMLDesktopExample PRIVATE Qt5::AndroidExtras) # This module is for building android project
  set_target_properties(QMLDesktopExample PROPERTIES LIBRARY_OUTPUT_NAME CMakeQtAPKExample) # This will output new file with name CMakeQtAPKExample.apk
  add_dependencies(apk QMLDesktopExample) # This line is required for command `cmake --build . --target apk`
endif()

target_sources(QMLDesktopExample PRIVATE src/main.cpp src/slideshow.cpp src/qml/qml.qrc)
target_link_libraries(QMLDesktopExample PRIVATE Qt5::Core Qt5::Quick)
