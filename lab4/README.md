## 实验目的
- 了解内核线程创建/执行的管理过程
- 了解内核线程的切换和基本调度过程

## 实验内容
实验2/3完成了物理和虚拟内存管理，这给创建内核线程（内核线程是一种特殊的进程）打下了提供内存管理的基础。当一个程序加载到内存中运行时，首先通过ucore OS的内存管理子系统分配合适的空间，然后就需要考虑如何分时使用CPU来“并发”执行多个程序，让每个运行的程序（这里用线程或进程表示）“感到”它们各自拥有“自己”的CPU。

本次实验将首先接触的是内核线程的管理。内核线程是一种特殊的进程，内核线程与用户进程的区别有两个：

- 内核线程只运行在内核态
- 用户进程会在在用户态和内核态交替运行
- 所有内核线程共用ucore内核内存空间，不需为每个内核线程维护单独的内存空间
- 而用户进程需要维护各自的用户内存空间
相关原理介绍可看附录B：【原理】进程/线程的属性与特征解析。

## 练习0： 填写已有实验
本实验依赖实验1/2/3。请把你做的实验1/2/3的代码填入本实验中代码中有“LAB1”,“LAB2”,“LAB3”的注释相应部分。

同lab2 3，使用meld即可

## 练习1：分配并初始化一个进程控制块（需要编码）

```c
        proc->state = PROC_UNINIT; // 进程状态
        proc->pid = -1; // 进程ID
        proc->runs = 0; // 进程时间片
        proc->kstack = 0; // 进程所使用的内存栈地址
        proc->need_resched = NULL; // 进程是否能被调度
        proc->parent = NULL; // 父进程
        proc->mm = NULL; // 进程所用的虚拟内存
        memset(&(proc->context), 0, sizeof(struct context)); // 进程的上下文
        proc->tf = NULL; // 中断帧指针
        proc->cr3 = boot_cr3; // 页目录表地址 设为 内核页目录表基址
        proc->flags = 0; // 标志位
        memset(&(proc->name), 0, PROC_NAME_LEN); // 进程名

```
请在实验报告中简要说明你的设计实现过程。请回答如下问题：

- 请说明proc_struct中struct context context和struct trapframe *tf成员变量含义和在本实验中的作用是啥？（提示通过看代码和编程调试可以判断出来）

context作用时在进行上下文切换的过程中，保存当前寄存器的值。其定义在kern/process/proc.h中：

```c
struct context {
    uint32_t eip;
    uint32_t esp;
    uint32_t ebx;
    uint32_t ecx;
    uint32_t edx;
    uint32_t esi;
    uint32_t edi;
    uint32_t ebp;
};

```

trapframe *tf用于记录发生中断之前的栈帧的内容，其中一部分为硬件保存。定义在kern/trap/trap.h中：

```c
struct trapframe {
    struct pushregs tf_regs;
    uint16_t tf_gs;
    uint16_t tf_padding0;
    uint16_t tf_fs;
    uint16_t tf_padding1;
    uint16_t tf_es;
    uint16_t tf_padding2;
    uint16_t tf_ds;
    uint16_t tf_padding3;
    uint32_t tf_trapno;
    /* below here defined by x86 hardware */
    uint32_t tf_err;
    uintptr_t tf_eip;
    uint16_t tf_cs;
    uint16_t tf_padding4;
    uint32_t tf_eflags;
    /* below here only when crossing rings, such as from user to kernel */
    uintptr_t tf_esp;
    uint16_t tf_ss;
    uint16_t tf_padding5;
} __attribute__((packed));
```
## 练习2：为新创建的内核线程分配资源（需要编码）

创建一个内核线程需要分配和设置好很多资源。kernel_thread函数通过调用do_fork函数完成具体内核线程的创建工作。do_kernel函数会调用alloc_proc函数来分配并初始化一个进程控制块，但alloc_proc只是找到了一小块内存用以记录进程的必要信息，并没有实际分配这些资源。ucore一般通过do_fork实际创建新的内核线程。do_fork的作用是，创建当前内核线程的一个副本，它们的执行上下文、代码、数据都一样，但是存储位置不同。在这个过程中，需要给新内核线程分配资源，并且复制原进程的状态。你需要完成在kern/process/proc.c中的do_fork函数中的处理过程。它的大致执行步骤包括：

- 调用alloc_proc，首先获得一块用户信息块。
- 为进程分配一个内核栈。
- 复制原进程的内存管理信息到新进程（但内核线程不必做此事）
- 复制原进程上下文到新进程
- 将新进程添加到进程列表
- 唤醒新进程
- 返回新进程号

![](img/img1.png)

请在实验报告中简要说明你的设计实现过程。请回答如下问题：

- 请说明ucore是否做到给每个新fork的线程一个唯一的id？请说明你的分析和理由。

## 练习3：阅读代码，理解 proc_run 函数和它调用的函数如何完成进程切换的。（无编码工作）
请在实验报告中简要说明你对proc_run函数的分析。并回答如下问题：

```c
当前进程/线程 切换到 proc 这个进程/线程
void proc_run(struct proc_struct *proc) {
    if (proc != current) {
        bool intr_flag;
        struct proc_struct *prev = current, *next = proc;
        local_intr_save(intr_flag); // 关闭中断
        {
            current = proc; // 将当前进程换为 要切换到的进程
            // 设置任务状态段tss中的特权级0下的 esp0 指针为 next 内核线程 的内核栈的栈顶
            load_esp0(next->kstack + KSTACKSIZE);
            lcr3(next->cr3); // 重新加载 cr3 寄存器(页目录表基址) 进行进程间的页表切换
            switch_to(&(prev->context), &(next->context)); // 调用 switch_to 进行上下文的保存与切换
        }
        local_intr_restore(intr_flag);
    }
}
```


在本实验的执行过程中，创建且运行了几个内核线程？

两个内核线程 一个为 idle_proc 为 第 0 个内核线程 完成内核中的初始化 然后调度执行其他进程或线程
另一个为 init_proc 本次实验的内核线程 只用来打印字符串

语句local_intr_save(intr_flag);....local_intr_restore(intr_flag);在这里有何作用?请说明理由

关闭中断 避免进程切换的中途 再被中断(其他进程再进行调度)

完成代码编写后，编译并运行代码：make qemu

```shell
WARNING: Image format was not specified for 'bin/ucore.img' and probing guessed raw.
+ setup timer interrupts
```

## 扩展练习Challenge：实现支持任意大小的内存分配算法