
# cdev Kernel Module Build Instructions

This project is an example character device driver for the arm64 architecture based on the Linux kernel, supporting cross-compilation with Clang/LLVM or GNU toolchains.

## Directory Structure
- `cdev.c`: Main driver source code
- `Makefile`: Module build script, supports Clang/LLVM
- `.vscode/compile_commands.json`: Compilation database for code completion

## Dependencies
- Linux kernel source code (specified by the KDIR variable)
- Clang/LLVM toolchain (recommended) or aarch64-linux-gnu-gcc
- lld linker (required for Clang toolchain)
- bear or intercept-build (optional, for generating compile_commands.json)

## Build Instructions

### Install Environment
```sh
sudo apt install clang lld llvm
```

### Build ko File
```sh
make
```

### Clean
```sh
make clean
```

### Generate compile_commands.json
```sh
make cmp
```

## Common Issues
- Missing ld.lld: Please install lld
- VS Code cannot provide code completion: Ensure the path to .vscode/compile_commands.json is correct
- Make sure the .vscode folder exists

---

## 中文版
[中文版 (README_ZH.md)](./README_ZH.md)
