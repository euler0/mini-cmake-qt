# Minimal CMake Template for Qt 5 Projects

[As I've briefly introduced](https://www.euler.kr/trl/2014/08/19/minimal-cmake-template/), this is a minimal, but complete and production-ready CMake project template for Qt 5 projects. This may be a starting point for your new application. If that is not intent to be a cross-platform project, you can clean up that stuffs from the template.

## Features
  * Handling all possible Qt stuffs (UI, resources, ~~translations~~)
  * macOS bundle
  * Windows executable icon

## macOS Deployment

If you want to deploy your application on macOS, I would recommend you read below documents.

* [Qt for macOS](https://doc.qt.io/qt-5/macos.html)
  * [Qt for macOS - Deployment](https://doc.qt.io/qt-5/macos-deployment.html)
  * [Qt for macOS - Specific Issues](https://doc.qt.io/qt-5/macos-issues.html)

## References
  * Building with CMake: https://doc.qt.io/qt-5/cmake-manual.html
  * Using CMake with Qt 5: https://www.kdab.com/using-cmake-with-qt-5/
