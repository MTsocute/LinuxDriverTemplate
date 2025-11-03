KDIR := /home/momo/workspace/rk3566_tspi/kernel-develop-4.19
ARCH := arm64
OBJ_NAME := cdev.o			# ! Replace with your module name

BUILD_DIR := $(PWD)/build
obj-m := $(OBJ_NAME)

# Using Clang/LLVM Toolchain
LLVM := 1
LLVM_IAS := 1
CROSS_COMPILE := aarch64-linux-gnu-

all: prepare_build_dir
	$(MAKE) -C $(KDIR) \
		M=$(BUILD_DIR) \
		ARCH=$(ARCH) \
		LLVM=$(LLVM) \
		LLVM_IAS=$(LLVM_IAS) \
		CROSS_COMPILE=$(CROSS_COMPILE) \
		-j$(shell nproc) modules

prepare_build_dir:
	mkdir -p $(BUILD_DIR)
	cp -a $(filter-out build,$(wildcard *)) $(BUILD_DIR)/

clean:
	$(MAKE) -C $(KDIR) \
		M=$(BUILD_DIR) \
		ARCH=$(ARCH) \
		LLVM=$(LLVM) \
		LLVM_IAS=$(LLVM_IAS) \
		CROSS_COMPILE=$(CROSS_COMPILE) \
		clean
	rm -rf $(BUILD_DIR)

# compile compile_commands.json in .vscode/
cmp: prepare_build_dir
	intercept-build --append --cdb $(PWD)/.vscode/compile_commands.json \
	$(MAKE) -C $(KDIR) \
		M=$(BUILD_DIR) \
		ARCH=$(ARCH) \
		LLVM=$(LLVM) \
		LLVM_IAS=$(LLVM_IAS) \
		CROSS_COMPILE=$(CROSS_COMPILE) \
		modules
