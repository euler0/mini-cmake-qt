macro(fix_project_version)
if(NOT PROJECT_VERSION_PATCH)
set(PROJECT_VERSION_PATCH 0)
endif()
if(NOT PROJECT_VERSION_TWEAK)
set(PROJECT_VERSION_TWEAK 0)
endif()
endmacro()

macro(add_project_meta)
if(NOT RESOURCE_FOLDER)
set(RESOURCE_FOLDER res)
endif()
if(NOT ICON_NAME)
set(ICON_NAME AppIcon)
endif()
if(APPLE)
set(ICON_FILE ${RESOURCE_FOLDER}/${ICON_NAME}.icns)
elseif(WIN32)
set(ICON_FILE ${RESOURCE_FOLDER}/${ICON_NAME}.ico)
endif()

if (WIN32)
configure_file("${PROJECT_SOURCE_DIR}/${RESOURCE_FOLDER}/windows_metafile.rc.in"
  "windows_metafile.rc"
)
    set(SOURCE_FILES ${SOURCE_FILES} "windows_metafile.rc")
endif ()

if (APPLE)
    set_source_files_properties(${ICON_FILE} PROPERTIES MACOSX_PACKAGE_LOCATION Resources)

# Identify MacOS bundle
set(MACOSX_BUNDLE_BUNDLE_NAME ${PROJECT_NAME})
set(MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION})
set(MACOSX_BUNDLE_LONG_VERSION_STRING ${PROJECT_VERSION})
set(MACOSX_BUNDLE_SHORT_VERSION_STRING "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}")
set(MACOSX_BUNDLE_COPYRIGHT ${COPYRIGHT})
set(MACOSX_BUNDLE_GUI_IDENTIFIER ${IDENTIFIER})
set(MACOSX_BUNDLE_ICON_FILE ${ICON_NAME})
endif ()
endmacro()

macro(init_app_type)
if (APPLE)
set(APP_TYPE MACOSX_BUNDLE)
elseif(WIN32)
set(APP_TYPE WIN32)
endif()
endmacro()

macro(fix_win_compiler)
if (MSVC)
    set_target_properties(${PROJECT_NAME} PROPERTIES
        WIN32_EXECUTABLE YES
        LINK_FLAGS "/ENTRY:mainCRTStartup"
    )
endif()
endmacro()

macro(init_qt)
# Let's do the cmake job for us
set(CMAKE_AUTOMOC ON) # For meta object compiler
set(CMAKE_AUTORCC ON) # Resource files
set(CMAKE_AUTOUIC ON) # UI files
endmacro()

init_app_type()
init_qt()
fix_win_compiler()