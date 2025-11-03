
# Linux Kernel Driver Module Template

This project is a template for an arm64 architecture Linux kernel driver module, with scripts configured for automatic code completion and intelligent indexing in VS Code.

## Directory Structure
- `cdev.c`: Main driver source code, can be replaced as needed (remember to also update the filename in the Makefile)
- `Makefile`: Module build script, supports Clang/LLVM
- `.vscode/compile_commands.json`: Compilation database for code completion

## Dependencies
- Linux kernel source code (specified by the KDIR variable)
- Clang/LLVM toolchain (recommended) or aarch64-linux-gnu-gcc
- lld linker (required for Clang toolchain)
- intercept-build (optional, for generating compile_commands.json)

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
