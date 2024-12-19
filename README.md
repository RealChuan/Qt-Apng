# Qt-Apng

Apng image plugin for Qt to support animated PNGs

[![CMake build](https://github.com/RealChuan/Qt-Apng/workflows/CMake%20Build/badge.svg)](https://github.com/RealChuan/Qt-Apng/actions?query=workflow%3A%22CMake+Build%22)

## Usage

Simply use the default Qt classes like `QImageReader`, `QMovie` etc. and open the apng files just like you would open normal images/animations (like gif files)

**Format Detection:**
Since the png format is already used by Qt, `*.png` files will **not** use the plugin. To load a png as animated, you can either rename the file to `*.apng`, or set the format explicitly

```cpp
QMovie movie("path/to/image.png", "apng");
```
