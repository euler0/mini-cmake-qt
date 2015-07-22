# Reference: http://qt-project.org/doc/qt-5.0/qtdoc/cmake-manual.html

cmake_minimum_required(VERSION 3.0)

# Add folder where are supportive functions
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Include qt basic functions
include(QtCommon)

# Basic info about project

project(example VERSION 1.0)

fix_project_version()

set(COMPANY "Example")
set(COPYRIGHT "Copyright (c) 2014 Vincent Lee. All rights reserved.")
set(IDENTIFIER "com.example.Example")

set(SOURCE_FILES
    src/main.cc
    src/mainwindow.cc
)

add_project_meta(META_FILES)


set(RESOURCE_FILES example.qrc)

find_package(Qt5Widgets REQUIRED)

# source_group("UI Files" FILES ${UI_FILES})

add_executable(${PROJECT_NAME} ${APP_TYPE}
    ${SOURCE_FILES} ${META_FILES} ${RESOURCE_FILES}
)
# target_link_libraries (${PROJECT_NAME} mainwindow)

qt5_use_modules(${PROJECT_NAME} Widgets)
