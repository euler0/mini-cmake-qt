# Minimal CMake Template for Qt 5 Projects

[As I've briefly introduced](http://euler.kr/trl/2014/08/19/minimal-cmake-template.html), this is a minimal, but complete and production-ready CMake project template for Qt 5 projects. This may be a starting point for your new application. If that is not intent to be a cross-platform project, you can clean up that stuffs (such as OS X bundle) from the template.

If you want to deploy your application on OS X, I would recommend you have to read below document.

[Deploying an Application on Mac OS X (The Mac Deployment Tool)](http://qt-project.org/doc/qt-4.8/deployment-mac.html#the-mac-deployment-tool)

## Features
  * Handling all possible Qt stuffs (UI, resources, ~~translations~~)
  * OS X bundle
  * Windows executable icon

## References
  * CMake manual: http://qt-project.org/doc/qt-5.0/qtdoc/cmake-manual.html
  * Using CMake with Qt 5: http://www.kdab.com/using-cmake-with-qt-5/
