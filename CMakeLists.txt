# Reference: http://qt-project.org/doc/qt-5.0/qtdoc/cmake-manual.html

cmake_minimum_required(VERSION 2.8.12)
cmake_policy(SET CMP0020 NEW)

set(PROJECT "example")

project(${PROJECT})

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt5Widgets REQUIRED)

set(SOURCE_FILES
  src/main.cc
  src/mainwindow.h
  src/mainwindow.cc
)

set(UI_FILES
  ui/mainwindow.ui
)
source_group("UI Files" FILES ${UI_FILES})

qt5_wrap_ui(UI_HEADERS ${UI_FILES})
source_group("Generated UI Headers" FILES ${UI_HEADERS})

add_executable(${PROJECT} ${SOURCE_FILES} ${UI_HEADERS} ${UI_FILES})

qt5_use_modules(${PROJECT} Widgets)

if (MSVC)
  set_target_properties(${PROJECT} PROPERTIES
    WIN32_EXECUTABLE YES
    LINK_FLAGS "/ENTRY:mainCRTStartup"
  )
endif ()
