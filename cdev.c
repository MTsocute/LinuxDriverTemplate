#include <linux/fs.h>
#include <linux/init.h>
#include <linux/kdev_t.h>
#include <linux/module.h>

MODULE_DESCRIPTION("A simple character device");

static int __init my_cdev_init(void)
{
    printk(KERN_INFO "[cdve] Device initialized\n");
    return 0;
}

static void __exit my_cdev_exit(void)
{
    printk(KERN_INFO "[cdve] Device exited\n");
}

module_init(my_cdev_init);
module_exit(my_cdev_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Momo");
MODULE_VERSION("1.0");
