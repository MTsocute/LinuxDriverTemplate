# Linux 内核驱动模块模板

本项目为基于 Linux 内核的 arm64 架构驱动模块模板，配置好了`Vscode`内核代码自动补全和智能索引的生成脚本

## 目录结构
- `cdev.c`：主驱动源码，可以根据需求替换，记得同时替换 Makefile里文件名字
- `Makefile`：模块编译脚本，支持 Clang/LLVM
- `.vscode/compile_commands.json`：用于代码补全的编译数据库

## 依赖环境
- Linux 内核源码（KDIR 变量指定）
- Clang/LLVM 工具链（推荐）或 aarch64-linux-gnu-gcc
- lld 链接器（Clang 工具链需安装）
- intercept-build（生成 compile_commands.json 可选）

## 编译方法

### 安装环境
```sh
sudo apt install clang lld llvm
```

### 编译 ko 文件
``` sh
make
```

### 清理
```sh
make clean
```

### 生成 compile_commands.json
```sh
make cmp
```

## 常见问题
- 缺少 ld.lld：请安装 lld
- VS Code 无法补全：请确保 .vscode/compile_commands.json 路径正确
- 确保 .vscode 文件夹的存在

---

## English Version
[English Version (README.md)](./README.md)
