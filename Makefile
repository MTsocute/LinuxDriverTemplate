KDIR := /home/momo/workspace/rk3566_tspi/kernel-develop-4.19
CC_PREFIX := aarch64-linux-gnu-
ARCH := arm64
OBJ_NAME := cdev.o

obj-m += $(OBJ_NAME)

all:
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=$(ARCH) CROSS_COMPILE=$(CC_PREFIX) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=$(ARCH) CROSS_COMPILE=$(CC_PREFIX) clean

compdb:
	intercept-build --append --cdb $(PWD)/.vscode/compile_commands.json \
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=$(ARCH) CROSS_COMPILE=$(CC_PREFIX) modules
