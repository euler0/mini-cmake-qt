# Reference: http://qt-project.org/doc/qt-5.0/qtdoc/cmake-manual.html

cmake_minimum_required(VERSION 2.8.12)
cmake_policy(SET CMP0020 NEW)

set(PROJECT "example")

project(${PROJECT} VERSION 1.0)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Let's do the cmake job for us
set(CMAKE_AUTOMOC ON) # For meta object compiler
set(CMAKE_AUTORCC ON) # Resource files
set(CMAKE_AUTOUIC ON) # UI files

find_package(Qt5Widgets REQUIRED)

set(SOURCE_FILES
    src/main.cc
    src/mainwindow.h
    src/mainwindow.cc
)

set(UI_FILES
    ui/mainwindow.ui
)
set(COPYRIGHT "Copyright (c) 2014 Vincent Lee. All rights reserved.")
set(IDENTIFIER "com.example.Example")
set(RESOURCE_FILES example.qrc)
source_group("UI Files" FILES ${UI_FILES})

qt5_use_modules(${PROJECT} Widgets)

if (WIN32)
    set(SOURCE_FILES ${SOURCE_FILES} win/example.rc)
endif ()

if (APPLE)
    set(SOURCE_FILES ${SOURCE_FILES} AppIcon.icns)
    set_source_files_properties(AppIcon.icns PROPERTIES MACOSX_PACKAGE_LOCATION Resources)
endif ()

add_executable(${PROJECT} MACOSX_BUNDLE
    ${SOURCE_FILES}
    ${UI_FILES}
    ${RESOURCE_FILES}
)

# Identify MacOS bundle
set(MACOSX_BUNDLE_BUNDLE_NAME ${PROJECT_NAME})
set(MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION})
set(MACOSX_BUNDLE_LONG_VERSION_STRING ${PROJECT_VERSION})
set(MACOSX_BUNDLE_SHORT_VERSION_STRING "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}")
set(MACOSX_BUNDLE_COPYRIGHT ${COPYRIGHT})
set(MACOSX_BUNDLE_GUI_IDENTIFIER ${IDENTIFIER})
set(MACOSX_BUNDLE_ICON_FILE AppIcon.icns)



if (MSVC)
    set_target_properties(${PROJECT} PROPERTIES
        WIN32_EXECUTABLE YES
        LINK_FLAGS "/ENTRY:mainCRTStartup"
    )
endif ()
