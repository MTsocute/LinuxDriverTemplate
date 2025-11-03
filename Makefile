KDIR := /home/momo/workspace/rk3566_tspi/kernel-develop-4.19
ARCH := arm64
OBJ_NAME := cdev.o			# ! Replace with your module name

obj-m += $(OBJ_NAME)

# Using Clang/LLVM Toolchain
LLVM := 1
LLVM_IAS := 1
CROSS_COMPILE := aarch64-linux-gnu-

all:
	$(MAKE) -C $(KDIR) \
		M=$(PWD) \
		ARCH=$(ARCH) \
		LLVM=$(LLVM) \
		LLVM_IAS=$(LLVM_IAS) \
		CROSS_COMPILE=$(CROSS_COMPILE) \
		-j$(shell nproc) modules

clean:
	$(MAKE) -C $(KDIR) \
		M=$(PWD) \
		ARCH=$(ARCH) \
		LLVM=$(LLVM) \
		LLVM_IAS=$(LLVM_IAS) \
		CROSS_COMPILE=$(CROSS_COMPILE) \
		clean

compdb:
	intercept-build --append --cdb $(PWD)/.vscode/compile_commands.json \
	$(MAKE) -C $(KDIR) \
		M=$(PWD) \
		ARCH=$(ARCH) \
		LLVM=$(LLVM) \
		LLVM_IAS=$(LLVM_IAS) \
		CROSS_COMPILE=$(CROSS_COMPILE) \
		modules
