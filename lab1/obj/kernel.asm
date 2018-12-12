
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 18             	sub    $0x18,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 80 fd 10 00       	mov    $0x10fd80,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	83 ec 04             	sub    $0x4,%esp
  100017:	50                   	push   %eax
  100018:	6a 00                	push   $0x0
  10001a:	68 16 ea 10 00       	push   $0x10ea16
  10001f:	e8 a4 2d 00 00       	call   102dc8 <memset>
  100024:	83 c4 10             	add    $0x10,%esp

    cons_init();                // init the console
  100027:	e8 50 15 00 00       	call   10157c <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002c:	c7 45 f4 60 35 10 00 	movl   $0x103560,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100033:	83 ec 08             	sub    $0x8,%esp
  100036:	ff 75 f4             	pushl  -0xc(%ebp)
  100039:	68 7c 35 10 00       	push   $0x10357c
  10003e:	e8 0a 02 00 00       	call   10024d <cprintf>
  100043:	83 c4 10             	add    $0x10,%esp

    print_kerninfo();
  100046:	e8 a1 08 00 00       	call   1008ec <print_kerninfo>

    grade_backtrace();
  10004b:	e8 79 00 00 00       	call   1000c9 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100050:	e8 37 2a 00 00       	call   102a8c <pmm_init>

    pic_init();                 // init interrupt controller
  100055:	e8 65 16 00 00       	call   1016bf <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005a:	e8 c6 17 00 00       	call   101825 <idt_init>

    clock_init();               // init clock interrupt
  10005f:	e8 fd 0c 00 00       	call   100d61 <clock_init>
    intr_enable();              // enable irq interrupt
  100064:	e8 93 17 00 00       	call   1017fc <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  100069:	e8 50 01 00 00       	call   1001be <lab1_switch_test>

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	55                   	push   %ebp
  100071:	89 e5                	mov    %esp,%ebp
  100073:	83 ec 08             	sub    $0x8,%esp
    mon_backtrace(0, NULL, NULL);
  100076:	83 ec 04             	sub    $0x4,%esp
  100079:	6a 00                	push   $0x0
  10007b:	6a 00                	push   $0x0
  10007d:	6a 00                	push   $0x0
  10007f:	e8 cb 0c 00 00       	call   100d4f <mon_backtrace>
  100084:	83 c4 10             	add    $0x10,%esp
}
  100087:	90                   	nop
  100088:	c9                   	leave  
  100089:	c3                   	ret    

0010008a <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  10008a:	55                   	push   %ebp
  10008b:	89 e5                	mov    %esp,%ebp
  10008d:	53                   	push   %ebx
  10008e:	83 ec 04             	sub    $0x4,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  100091:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  100094:	8b 55 0c             	mov    0xc(%ebp),%edx
  100097:	8d 5d 08             	lea    0x8(%ebp),%ebx
  10009a:	8b 45 08             	mov    0x8(%ebp),%eax
  10009d:	51                   	push   %ecx
  10009e:	52                   	push   %edx
  10009f:	53                   	push   %ebx
  1000a0:	50                   	push   %eax
  1000a1:	e8 ca ff ff ff       	call   100070 <grade_backtrace2>
  1000a6:	83 c4 10             	add    $0x10,%esp
}
  1000a9:	90                   	nop
  1000aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000ad:	c9                   	leave  
  1000ae:	c3                   	ret    

001000af <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000af:	55                   	push   %ebp
  1000b0:	89 e5                	mov    %esp,%ebp
  1000b2:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace1(arg0, arg2);
  1000b5:	83 ec 08             	sub    $0x8,%esp
  1000b8:	ff 75 10             	pushl  0x10(%ebp)
  1000bb:	ff 75 08             	pushl  0x8(%ebp)
  1000be:	e8 c7 ff ff ff       	call   10008a <grade_backtrace1>
  1000c3:	83 c4 10             	add    $0x10,%esp
}
  1000c6:	90                   	nop
  1000c7:	c9                   	leave  
  1000c8:	c3                   	ret    

001000c9 <grade_backtrace>:

void
grade_backtrace(void) {
  1000c9:	55                   	push   %ebp
  1000ca:	89 e5                	mov    %esp,%ebp
  1000cc:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000cf:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000d4:	83 ec 04             	sub    $0x4,%esp
  1000d7:	68 00 00 ff ff       	push   $0xffff0000
  1000dc:	50                   	push   %eax
  1000dd:	6a 00                	push   $0x0
  1000df:	e8 cb ff ff ff       	call   1000af <grade_backtrace0>
  1000e4:	83 c4 10             	add    $0x10,%esp
}
  1000e7:	90                   	nop
  1000e8:	c9                   	leave  
  1000e9:	c3                   	ret    

001000ea <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  1000ea:	55                   	push   %ebp
  1000eb:	89 e5                	mov    %esp,%ebp
  1000ed:	83 ec 18             	sub    $0x18,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  1000f0:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  1000f3:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  1000f6:	8c 45 f2             	mov    %es,-0xe(%ebp)
  1000f9:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  1000fc:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100100:	0f b7 c0             	movzwl %ax,%eax
  100103:	83 e0 03             	and    $0x3,%eax
  100106:	89 c2                	mov    %eax,%edx
  100108:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10010d:	83 ec 04             	sub    $0x4,%esp
  100110:	52                   	push   %edx
  100111:	50                   	push   %eax
  100112:	68 81 35 10 00       	push   $0x103581
  100117:	e8 31 01 00 00       	call   10024d <cprintf>
  10011c:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  cs = %x\n", round, reg1);
  10011f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100123:	0f b7 d0             	movzwl %ax,%edx
  100126:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10012b:	83 ec 04             	sub    $0x4,%esp
  10012e:	52                   	push   %edx
  10012f:	50                   	push   %eax
  100130:	68 8f 35 10 00       	push   $0x10358f
  100135:	e8 13 01 00 00       	call   10024d <cprintf>
  10013a:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ds = %x\n", round, reg2);
  10013d:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100141:	0f b7 d0             	movzwl %ax,%edx
  100144:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100149:	83 ec 04             	sub    $0x4,%esp
  10014c:	52                   	push   %edx
  10014d:	50                   	push   %eax
  10014e:	68 9d 35 10 00       	push   $0x10359d
  100153:	e8 f5 00 00 00       	call   10024d <cprintf>
  100158:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  es = %x\n", round, reg3);
  10015b:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10015f:	0f b7 d0             	movzwl %ax,%edx
  100162:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100167:	83 ec 04             	sub    $0x4,%esp
  10016a:	52                   	push   %edx
  10016b:	50                   	push   %eax
  10016c:	68 ab 35 10 00       	push   $0x1035ab
  100171:	e8 d7 00 00 00       	call   10024d <cprintf>
  100176:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ss = %x\n", round, reg4);
  100179:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10017d:	0f b7 d0             	movzwl %ax,%edx
  100180:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100185:	83 ec 04             	sub    $0x4,%esp
  100188:	52                   	push   %edx
  100189:	50                   	push   %eax
  10018a:	68 b9 35 10 00       	push   $0x1035b9
  10018f:	e8 b9 00 00 00       	call   10024d <cprintf>
  100194:	83 c4 10             	add    $0x10,%esp
    round ++;
  100197:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10019c:	83 c0 01             	add    $0x1,%eax
  10019f:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001a4:	90                   	nop
  1001a5:	c9                   	leave  
  1001a6:	c3                   	ret    

001001a7 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001a7:	55                   	push   %ebp
  1001a8:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
	asm volatile (
  1001aa:	83 ec 08             	sub    $0x8,%esp
  1001ad:	cd 78                	int    $0x78
  1001af:	89 ec                	mov    %ebp,%esp
			"int %0 \n"
			"movl %%ebp, %%esp"
			:
			: "i"(T_SWITCH_TOU)
	);
}
  1001b1:	90                   	nop
  1001b2:	5d                   	pop    %ebp
  1001b3:	c3                   	ret    

001001b4 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001b4:	55                   	push   %ebp
  1001b5:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
	asm volatile(
  1001b7:	cd 79                	int    $0x79
  1001b9:	89 ec                	mov    %ebp,%esp
			"int %0 \n"
			"movl %%ebp,%%esp \n"
			:
			: "i"(T_SWITCH_TOK)
	);
}
  1001bb:	90                   	nop
  1001bc:	5d                   	pop    %ebp
  1001bd:	c3                   	ret    

001001be <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001be:	55                   	push   %ebp
  1001bf:	89 e5                	mov    %esp,%ebp
  1001c1:	83 ec 08             	sub    $0x8,%esp
    lab1_print_cur_status();
  1001c4:	e8 21 ff ff ff       	call   1000ea <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001c9:	83 ec 0c             	sub    $0xc,%esp
  1001cc:	68 c8 35 10 00       	push   $0x1035c8
  1001d1:	e8 77 00 00 00       	call   10024d <cprintf>
  1001d6:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_user();
  1001d9:	e8 c9 ff ff ff       	call   1001a7 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001de:	e8 07 ff ff ff       	call   1000ea <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001e3:	83 ec 0c             	sub    $0xc,%esp
  1001e6:	68 e8 35 10 00       	push   $0x1035e8
  1001eb:	e8 5d 00 00 00       	call   10024d <cprintf>
  1001f0:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_kernel();
  1001f3:	e8 bc ff ff ff       	call   1001b4 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  1001f8:	e8 ed fe ff ff       	call   1000ea <lab1_print_cur_status>
}
  1001fd:	90                   	nop
  1001fe:	c9                   	leave  
  1001ff:	c3                   	ret    

00100200 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100200:	55                   	push   %ebp
  100201:	89 e5                	mov    %esp,%ebp
  100203:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  100206:	83 ec 0c             	sub    $0xc,%esp
  100209:	ff 75 08             	pushl  0x8(%ebp)
  10020c:	e8 9c 13 00 00       	call   1015ad <cons_putc>
  100211:	83 c4 10             	add    $0x10,%esp
    (*cnt) ++;
  100214:	8b 45 0c             	mov    0xc(%ebp),%eax
  100217:	8b 00                	mov    (%eax),%eax
  100219:	8d 50 01             	lea    0x1(%eax),%edx
  10021c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10021f:	89 10                	mov    %edx,(%eax)
}
  100221:	90                   	nop
  100222:	c9                   	leave  
  100223:	c3                   	ret    

00100224 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100224:	55                   	push   %ebp
  100225:	89 e5                	mov    %esp,%ebp
  100227:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  10022a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100231:	ff 75 0c             	pushl  0xc(%ebp)
  100234:	ff 75 08             	pushl  0x8(%ebp)
  100237:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10023a:	50                   	push   %eax
  10023b:	68 00 02 10 00       	push   $0x100200
  100240:	e8 b9 2e 00 00       	call   1030fe <vprintfmt>
  100245:	83 c4 10             	add    $0x10,%esp
    return cnt;
  100248:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10024b:	c9                   	leave  
  10024c:	c3                   	ret    

0010024d <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10024d:	55                   	push   %ebp
  10024e:	89 e5                	mov    %esp,%ebp
  100250:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100253:	8d 45 0c             	lea    0xc(%ebp),%eax
  100256:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100259:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10025c:	83 ec 08             	sub    $0x8,%esp
  10025f:	50                   	push   %eax
  100260:	ff 75 08             	pushl  0x8(%ebp)
  100263:	e8 bc ff ff ff       	call   100224 <vcprintf>
  100268:	83 c4 10             	add    $0x10,%esp
  10026b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10026e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100271:	c9                   	leave  
  100272:	c3                   	ret    

00100273 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100273:	55                   	push   %ebp
  100274:	89 e5                	mov    %esp,%ebp
  100276:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  100279:	83 ec 0c             	sub    $0xc,%esp
  10027c:	ff 75 08             	pushl  0x8(%ebp)
  10027f:	e8 29 13 00 00       	call   1015ad <cons_putc>
  100284:	83 c4 10             	add    $0x10,%esp
}
  100287:	90                   	nop
  100288:	c9                   	leave  
  100289:	c3                   	ret    

0010028a <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10028a:	55                   	push   %ebp
  10028b:	89 e5                	mov    %esp,%ebp
  10028d:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  100290:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100297:	eb 14                	jmp    1002ad <cputs+0x23>
        cputch(c, &cnt);
  100299:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10029d:	83 ec 08             	sub    $0x8,%esp
  1002a0:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002a3:	52                   	push   %edx
  1002a4:	50                   	push   %eax
  1002a5:	e8 56 ff ff ff       	call   100200 <cputch>
  1002aa:	83 c4 10             	add    $0x10,%esp
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  1002ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1002b0:	8d 50 01             	lea    0x1(%eax),%edx
  1002b3:	89 55 08             	mov    %edx,0x8(%ebp)
  1002b6:	0f b6 00             	movzbl (%eax),%eax
  1002b9:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002bc:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002c0:	75 d7                	jne    100299 <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  1002c2:	83 ec 08             	sub    $0x8,%esp
  1002c5:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002c8:	50                   	push   %eax
  1002c9:	6a 0a                	push   $0xa
  1002cb:	e8 30 ff ff ff       	call   100200 <cputch>
  1002d0:	83 c4 10             	add    $0x10,%esp
    return cnt;
  1002d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002d6:	c9                   	leave  
  1002d7:	c3                   	ret    

001002d8 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002d8:	55                   	push   %ebp
  1002d9:	89 e5                	mov    %esp,%ebp
  1002db:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002de:	e8 fa 12 00 00       	call   1015dd <cons_getc>
  1002e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1002e6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1002ea:	74 f2                	je     1002de <getchar+0x6>
        /* do nothing */;
    return c;
  1002ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002ef:	c9                   	leave  
  1002f0:	c3                   	ret    

001002f1 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  1002f1:	55                   	push   %ebp
  1002f2:	89 e5                	mov    %esp,%ebp
  1002f4:	83 ec 18             	sub    $0x18,%esp
    if (prompt != NULL) {
  1002f7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1002fb:	74 13                	je     100310 <readline+0x1f>
        cprintf("%s", prompt);
  1002fd:	83 ec 08             	sub    $0x8,%esp
  100300:	ff 75 08             	pushl  0x8(%ebp)
  100303:	68 07 36 10 00       	push   $0x103607
  100308:	e8 40 ff ff ff       	call   10024d <cprintf>
  10030d:	83 c4 10             	add    $0x10,%esp
    }
    int i = 0, c;
  100310:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100317:	e8 bc ff ff ff       	call   1002d8 <getchar>
  10031c:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10031f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100323:	79 0a                	jns    10032f <readline+0x3e>
            return NULL;
  100325:	b8 00 00 00 00       	mov    $0x0,%eax
  10032a:	e9 82 00 00 00       	jmp    1003b1 <readline+0xc0>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  10032f:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100333:	7e 2b                	jle    100360 <readline+0x6f>
  100335:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  10033c:	7f 22                	jg     100360 <readline+0x6f>
            cputchar(c);
  10033e:	83 ec 0c             	sub    $0xc,%esp
  100341:	ff 75 f0             	pushl  -0x10(%ebp)
  100344:	e8 2a ff ff ff       	call   100273 <cputchar>
  100349:	83 c4 10             	add    $0x10,%esp
            buf[i ++] = c;
  10034c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10034f:	8d 50 01             	lea    0x1(%eax),%edx
  100352:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100355:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100358:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  10035e:	eb 4c                	jmp    1003ac <readline+0xbb>
        }
        else if (c == '\b' && i > 0) {
  100360:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100364:	75 1a                	jne    100380 <readline+0x8f>
  100366:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10036a:	7e 14                	jle    100380 <readline+0x8f>
            cputchar(c);
  10036c:	83 ec 0c             	sub    $0xc,%esp
  10036f:	ff 75 f0             	pushl  -0x10(%ebp)
  100372:	e8 fc fe ff ff       	call   100273 <cputchar>
  100377:	83 c4 10             	add    $0x10,%esp
            i --;
  10037a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10037e:	eb 2c                	jmp    1003ac <readline+0xbb>
        }
        else if (c == '\n' || c == '\r') {
  100380:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100384:	74 06                	je     10038c <readline+0x9b>
  100386:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10038a:	75 8b                	jne    100317 <readline+0x26>
            cputchar(c);
  10038c:	83 ec 0c             	sub    $0xc,%esp
  10038f:	ff 75 f0             	pushl  -0x10(%ebp)
  100392:	e8 dc fe ff ff       	call   100273 <cputchar>
  100397:	83 c4 10             	add    $0x10,%esp
            buf[i] = '\0';
  10039a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10039d:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1003a2:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003a5:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1003aa:	eb 05                	jmp    1003b1 <readline+0xc0>
        }
    }
  1003ac:	e9 66 ff ff ff       	jmp    100317 <readline+0x26>
}
  1003b1:	c9                   	leave  
  1003b2:	c3                   	ret    

001003b3 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003b3:	55                   	push   %ebp
  1003b4:	89 e5                	mov    %esp,%ebp
  1003b6:	83 ec 18             	sub    $0x18,%esp
    if (is_panic) {
  1003b9:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  1003be:	85 c0                	test   %eax,%eax
  1003c0:	75 5f                	jne    100421 <__panic+0x6e>
        goto panic_dead;
    }
    is_panic = 1;
  1003c2:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  1003c9:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003cc:	8d 45 14             	lea    0x14(%ebp),%eax
  1003cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003d2:	83 ec 04             	sub    $0x4,%esp
  1003d5:	ff 75 0c             	pushl  0xc(%ebp)
  1003d8:	ff 75 08             	pushl  0x8(%ebp)
  1003db:	68 0a 36 10 00       	push   $0x10360a
  1003e0:	e8 68 fe ff ff       	call   10024d <cprintf>
  1003e5:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  1003e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003eb:	83 ec 08             	sub    $0x8,%esp
  1003ee:	50                   	push   %eax
  1003ef:	ff 75 10             	pushl  0x10(%ebp)
  1003f2:	e8 2d fe ff ff       	call   100224 <vcprintf>
  1003f7:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  1003fa:	83 ec 0c             	sub    $0xc,%esp
  1003fd:	68 26 36 10 00       	push   $0x103626
  100402:	e8 46 fe ff ff       	call   10024d <cprintf>
  100407:	83 c4 10             	add    $0x10,%esp
    
    cprintf("stack trackback:\n");
  10040a:	83 ec 0c             	sub    $0xc,%esp
  10040d:	68 28 36 10 00       	push   $0x103628
  100412:	e8 36 fe ff ff       	call   10024d <cprintf>
  100417:	83 c4 10             	add    $0x10,%esp
    print_stackframe();
  10041a:	e8 17 06 00 00       	call   100a36 <print_stackframe>
  10041f:	eb 01                	jmp    100422 <__panic+0x6f>
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
    if (is_panic) {
        goto panic_dead;
  100421:	90                   	nop
    print_stackframe();
    
    va_end(ap);

panic_dead:
    intr_disable();
  100422:	e8 dc 13 00 00       	call   101803 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100427:	83 ec 0c             	sub    $0xc,%esp
  10042a:	6a 00                	push   $0x0
  10042c:	e8 44 08 00 00       	call   100c75 <kmonitor>
  100431:	83 c4 10             	add    $0x10,%esp
    }
  100434:	eb f1                	jmp    100427 <__panic+0x74>

00100436 <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100436:	55                   	push   %ebp
  100437:	89 e5                	mov    %esp,%ebp
  100439:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    va_start(ap, fmt);
  10043c:	8d 45 14             	lea    0x14(%ebp),%eax
  10043f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100442:	83 ec 04             	sub    $0x4,%esp
  100445:	ff 75 0c             	pushl  0xc(%ebp)
  100448:	ff 75 08             	pushl  0x8(%ebp)
  10044b:	68 3a 36 10 00       	push   $0x10363a
  100450:	e8 f8 fd ff ff       	call   10024d <cprintf>
  100455:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  100458:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10045b:	83 ec 08             	sub    $0x8,%esp
  10045e:	50                   	push   %eax
  10045f:	ff 75 10             	pushl  0x10(%ebp)
  100462:	e8 bd fd ff ff       	call   100224 <vcprintf>
  100467:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  10046a:	83 ec 0c             	sub    $0xc,%esp
  10046d:	68 26 36 10 00       	push   $0x103626
  100472:	e8 d6 fd ff ff       	call   10024d <cprintf>
  100477:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  10047a:	90                   	nop
  10047b:	c9                   	leave  
  10047c:	c3                   	ret    

0010047d <is_kernel_panic>:

bool
is_kernel_panic(void) {
  10047d:	55                   	push   %ebp
  10047e:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100480:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100485:	5d                   	pop    %ebp
  100486:	c3                   	ret    

00100487 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  100487:	55                   	push   %ebp
  100488:	89 e5                	mov    %esp,%ebp
  10048a:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  10048d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100490:	8b 00                	mov    (%eax),%eax
  100492:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100495:	8b 45 10             	mov    0x10(%ebp),%eax
  100498:	8b 00                	mov    (%eax),%eax
  10049a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10049d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1004a4:	e9 d2 00 00 00       	jmp    10057b <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  1004a9:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004ac:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004af:	01 d0                	add    %edx,%eax
  1004b1:	89 c2                	mov    %eax,%edx
  1004b3:	c1 ea 1f             	shr    $0x1f,%edx
  1004b6:	01 d0                	add    %edx,%eax
  1004b8:	d1 f8                	sar    %eax
  1004ba:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1004bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004c0:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004c3:	eb 04                	jmp    1004c9 <stab_binsearch+0x42>
            m --;
  1004c5:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004cc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004cf:	7c 1f                	jl     1004f0 <stab_binsearch+0x69>
  1004d1:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004d4:	89 d0                	mov    %edx,%eax
  1004d6:	01 c0                	add    %eax,%eax
  1004d8:	01 d0                	add    %edx,%eax
  1004da:	c1 e0 02             	shl    $0x2,%eax
  1004dd:	89 c2                	mov    %eax,%edx
  1004df:	8b 45 08             	mov    0x8(%ebp),%eax
  1004e2:	01 d0                	add    %edx,%eax
  1004e4:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004e8:	0f b6 c0             	movzbl %al,%eax
  1004eb:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004ee:	75 d5                	jne    1004c5 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  1004f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004f3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004f6:	7d 0b                	jge    100503 <stab_binsearch+0x7c>
            l = true_m + 1;
  1004f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004fb:	83 c0 01             	add    $0x1,%eax
  1004fe:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100501:	eb 78                	jmp    10057b <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  100503:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10050a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10050d:	89 d0                	mov    %edx,%eax
  10050f:	01 c0                	add    %eax,%eax
  100511:	01 d0                	add    %edx,%eax
  100513:	c1 e0 02             	shl    $0x2,%eax
  100516:	89 c2                	mov    %eax,%edx
  100518:	8b 45 08             	mov    0x8(%ebp),%eax
  10051b:	01 d0                	add    %edx,%eax
  10051d:	8b 40 08             	mov    0x8(%eax),%eax
  100520:	3b 45 18             	cmp    0x18(%ebp),%eax
  100523:	73 13                	jae    100538 <stab_binsearch+0xb1>
            *region_left = m;
  100525:	8b 45 0c             	mov    0xc(%ebp),%eax
  100528:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10052b:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  10052d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100530:	83 c0 01             	add    $0x1,%eax
  100533:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100536:	eb 43                	jmp    10057b <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100538:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10053b:	89 d0                	mov    %edx,%eax
  10053d:	01 c0                	add    %eax,%eax
  10053f:	01 d0                	add    %edx,%eax
  100541:	c1 e0 02             	shl    $0x2,%eax
  100544:	89 c2                	mov    %eax,%edx
  100546:	8b 45 08             	mov    0x8(%ebp),%eax
  100549:	01 d0                	add    %edx,%eax
  10054b:	8b 40 08             	mov    0x8(%eax),%eax
  10054e:	3b 45 18             	cmp    0x18(%ebp),%eax
  100551:	76 16                	jbe    100569 <stab_binsearch+0xe2>
            *region_right = m - 1;
  100553:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100556:	8d 50 ff             	lea    -0x1(%eax),%edx
  100559:	8b 45 10             	mov    0x10(%ebp),%eax
  10055c:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10055e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100561:	83 e8 01             	sub    $0x1,%eax
  100564:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100567:	eb 12                	jmp    10057b <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100569:	8b 45 0c             	mov    0xc(%ebp),%eax
  10056c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10056f:	89 10                	mov    %edx,(%eax)
            l = m;
  100571:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100574:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  100577:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  10057b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10057e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100581:	0f 8e 22 ff ff ff    	jle    1004a9 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  100587:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10058b:	75 0f                	jne    10059c <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  10058d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100590:	8b 00                	mov    (%eax),%eax
  100592:	8d 50 ff             	lea    -0x1(%eax),%edx
  100595:	8b 45 10             	mov    0x10(%ebp),%eax
  100598:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  10059a:	eb 3f                	jmp    1005db <stab_binsearch+0x154>
    if (!any_matches) {
        *region_right = *region_left - 1;
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  10059c:	8b 45 10             	mov    0x10(%ebp),%eax
  10059f:	8b 00                	mov    (%eax),%eax
  1005a1:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1005a4:	eb 04                	jmp    1005aa <stab_binsearch+0x123>
  1005a6:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1005aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ad:	8b 00                	mov    (%eax),%eax
  1005af:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1005b2:	7d 1f                	jge    1005d3 <stab_binsearch+0x14c>
  1005b4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005b7:	89 d0                	mov    %edx,%eax
  1005b9:	01 c0                	add    %eax,%eax
  1005bb:	01 d0                	add    %edx,%eax
  1005bd:	c1 e0 02             	shl    $0x2,%eax
  1005c0:	89 c2                	mov    %eax,%edx
  1005c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1005c5:	01 d0                	add    %edx,%eax
  1005c7:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005cb:	0f b6 c0             	movzbl %al,%eax
  1005ce:	3b 45 14             	cmp    0x14(%ebp),%eax
  1005d1:	75 d3                	jne    1005a6 <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1005d3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d6:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005d9:	89 10                	mov    %edx,(%eax)
    }
}
  1005db:	90                   	nop
  1005dc:	c9                   	leave  
  1005dd:	c3                   	ret    

001005de <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1005de:	55                   	push   %ebp
  1005df:	89 e5                	mov    %esp,%ebp
  1005e1:	83 ec 38             	sub    $0x38,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005e4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e7:	c7 00 58 36 10 00    	movl   $0x103658,(%eax)
    info->eip_line = 0;
  1005ed:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005f0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005f7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005fa:	c7 40 08 58 36 10 00 	movl   $0x103658,0x8(%eax)
    info->eip_fn_namelen = 9;
  100601:	8b 45 0c             	mov    0xc(%ebp),%eax
  100604:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10060b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10060e:	8b 55 08             	mov    0x8(%ebp),%edx
  100611:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100614:	8b 45 0c             	mov    0xc(%ebp),%eax
  100617:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  10061e:	c7 45 f4 8c 3e 10 00 	movl   $0x103e8c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100625:	c7 45 f0 08 b9 10 00 	movl   $0x10b908,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10062c:	c7 45 ec 09 b9 10 00 	movl   $0x10b909,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100633:	c7 45 e8 5f d9 10 00 	movl   $0x10d95f,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10063a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10063d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100640:	76 0d                	jbe    10064f <debuginfo_eip+0x71>
  100642:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100645:	83 e8 01             	sub    $0x1,%eax
  100648:	0f b6 00             	movzbl (%eax),%eax
  10064b:	84 c0                	test   %al,%al
  10064d:	74 0a                	je     100659 <debuginfo_eip+0x7b>
        return -1;
  10064f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100654:	e9 91 02 00 00       	jmp    1008ea <debuginfo_eip+0x30c>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100659:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100660:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100663:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100666:	29 c2                	sub    %eax,%edx
  100668:	89 d0                	mov    %edx,%eax
  10066a:	c1 f8 02             	sar    $0x2,%eax
  10066d:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  100673:	83 e8 01             	sub    $0x1,%eax
  100676:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100679:	ff 75 08             	pushl  0x8(%ebp)
  10067c:	6a 64                	push   $0x64
  10067e:	8d 45 e0             	lea    -0x20(%ebp),%eax
  100681:	50                   	push   %eax
  100682:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100685:	50                   	push   %eax
  100686:	ff 75 f4             	pushl  -0xc(%ebp)
  100689:	e8 f9 fd ff ff       	call   100487 <stab_binsearch>
  10068e:	83 c4 14             	add    $0x14,%esp
    if (lfile == 0)
  100691:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100694:	85 c0                	test   %eax,%eax
  100696:	75 0a                	jne    1006a2 <debuginfo_eip+0xc4>
        return -1;
  100698:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10069d:	e9 48 02 00 00       	jmp    1008ea <debuginfo_eip+0x30c>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a5:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1006a8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006ab:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006ae:	ff 75 08             	pushl  0x8(%ebp)
  1006b1:	6a 24                	push   $0x24
  1006b3:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1006b6:	50                   	push   %eax
  1006b7:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006ba:	50                   	push   %eax
  1006bb:	ff 75 f4             	pushl  -0xc(%ebp)
  1006be:	e8 c4 fd ff ff       	call   100487 <stab_binsearch>
  1006c3:	83 c4 14             	add    $0x14,%esp

    if (lfun <= rfun) {
  1006c6:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1006c9:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006cc:	39 c2                	cmp    %eax,%edx
  1006ce:	7f 7c                	jg     10074c <debuginfo_eip+0x16e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1006d0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006d3:	89 c2                	mov    %eax,%edx
  1006d5:	89 d0                	mov    %edx,%eax
  1006d7:	01 c0                	add    %eax,%eax
  1006d9:	01 d0                	add    %edx,%eax
  1006db:	c1 e0 02             	shl    $0x2,%eax
  1006de:	89 c2                	mov    %eax,%edx
  1006e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006e3:	01 d0                	add    %edx,%eax
  1006e5:	8b 00                	mov    (%eax),%eax
  1006e7:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1006ea:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1006ed:	29 d1                	sub    %edx,%ecx
  1006ef:	89 ca                	mov    %ecx,%edx
  1006f1:	39 d0                	cmp    %edx,%eax
  1006f3:	73 22                	jae    100717 <debuginfo_eip+0x139>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  1006f5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006f8:	89 c2                	mov    %eax,%edx
  1006fa:	89 d0                	mov    %edx,%eax
  1006fc:	01 c0                	add    %eax,%eax
  1006fe:	01 d0                	add    %edx,%eax
  100700:	c1 e0 02             	shl    $0x2,%eax
  100703:	89 c2                	mov    %eax,%edx
  100705:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100708:	01 d0                	add    %edx,%eax
  10070a:	8b 10                	mov    (%eax),%edx
  10070c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10070f:	01 c2                	add    %eax,%edx
  100711:	8b 45 0c             	mov    0xc(%ebp),%eax
  100714:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100717:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10071a:	89 c2                	mov    %eax,%edx
  10071c:	89 d0                	mov    %edx,%eax
  10071e:	01 c0                	add    %eax,%eax
  100720:	01 d0                	add    %edx,%eax
  100722:	c1 e0 02             	shl    $0x2,%eax
  100725:	89 c2                	mov    %eax,%edx
  100727:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10072a:	01 d0                	add    %edx,%eax
  10072c:	8b 50 08             	mov    0x8(%eax),%edx
  10072f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100732:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100735:	8b 45 0c             	mov    0xc(%ebp),%eax
  100738:	8b 40 10             	mov    0x10(%eax),%eax
  10073b:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10073e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100741:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100744:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100747:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10074a:	eb 15                	jmp    100761 <debuginfo_eip+0x183>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10074c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10074f:	8b 55 08             	mov    0x8(%ebp),%edx
  100752:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100755:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100758:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  10075b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10075e:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  100761:	8b 45 0c             	mov    0xc(%ebp),%eax
  100764:	8b 40 08             	mov    0x8(%eax),%eax
  100767:	83 ec 08             	sub    $0x8,%esp
  10076a:	6a 3a                	push   $0x3a
  10076c:	50                   	push   %eax
  10076d:	e8 ca 24 00 00       	call   102c3c <strfind>
  100772:	83 c4 10             	add    $0x10,%esp
  100775:	89 c2                	mov    %eax,%edx
  100777:	8b 45 0c             	mov    0xc(%ebp),%eax
  10077a:	8b 40 08             	mov    0x8(%eax),%eax
  10077d:	29 c2                	sub    %eax,%edx
  10077f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100782:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  100785:	83 ec 0c             	sub    $0xc,%esp
  100788:	ff 75 08             	pushl  0x8(%ebp)
  10078b:	6a 44                	push   $0x44
  10078d:	8d 45 d0             	lea    -0x30(%ebp),%eax
  100790:	50                   	push   %eax
  100791:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  100794:	50                   	push   %eax
  100795:	ff 75 f4             	pushl  -0xc(%ebp)
  100798:	e8 ea fc ff ff       	call   100487 <stab_binsearch>
  10079d:	83 c4 20             	add    $0x20,%esp
    if (lline <= rline) {
  1007a0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007a3:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007a6:	39 c2                	cmp    %eax,%edx
  1007a8:	7f 24                	jg     1007ce <debuginfo_eip+0x1f0>
        info->eip_line = stabs[rline].n_desc;
  1007aa:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007ad:	89 c2                	mov    %eax,%edx
  1007af:	89 d0                	mov    %edx,%eax
  1007b1:	01 c0                	add    %eax,%eax
  1007b3:	01 d0                	add    %edx,%eax
  1007b5:	c1 e0 02             	shl    $0x2,%eax
  1007b8:	89 c2                	mov    %eax,%edx
  1007ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007bd:	01 d0                	add    %edx,%eax
  1007bf:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  1007c3:	0f b7 d0             	movzwl %ax,%edx
  1007c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007c9:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007cc:	eb 13                	jmp    1007e1 <debuginfo_eip+0x203>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  1007ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007d3:	e9 12 01 00 00       	jmp    1008ea <debuginfo_eip+0x30c>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  1007d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007db:	83 e8 01             	sub    $0x1,%eax
  1007de:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007e1:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007e4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007e7:	39 c2                	cmp    %eax,%edx
  1007e9:	7c 56                	jl     100841 <debuginfo_eip+0x263>
           && stabs[lline].n_type != N_SOL
  1007eb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007ee:	89 c2                	mov    %eax,%edx
  1007f0:	89 d0                	mov    %edx,%eax
  1007f2:	01 c0                	add    %eax,%eax
  1007f4:	01 d0                	add    %edx,%eax
  1007f6:	c1 e0 02             	shl    $0x2,%eax
  1007f9:	89 c2                	mov    %eax,%edx
  1007fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007fe:	01 d0                	add    %edx,%eax
  100800:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100804:	3c 84                	cmp    $0x84,%al
  100806:	74 39                	je     100841 <debuginfo_eip+0x263>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100808:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10080b:	89 c2                	mov    %eax,%edx
  10080d:	89 d0                	mov    %edx,%eax
  10080f:	01 c0                	add    %eax,%eax
  100811:	01 d0                	add    %edx,%eax
  100813:	c1 e0 02             	shl    $0x2,%eax
  100816:	89 c2                	mov    %eax,%edx
  100818:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10081b:	01 d0                	add    %edx,%eax
  10081d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100821:	3c 64                	cmp    $0x64,%al
  100823:	75 b3                	jne    1007d8 <debuginfo_eip+0x1fa>
  100825:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100828:	89 c2                	mov    %eax,%edx
  10082a:	89 d0                	mov    %edx,%eax
  10082c:	01 c0                	add    %eax,%eax
  10082e:	01 d0                	add    %edx,%eax
  100830:	c1 e0 02             	shl    $0x2,%eax
  100833:	89 c2                	mov    %eax,%edx
  100835:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100838:	01 d0                	add    %edx,%eax
  10083a:	8b 40 08             	mov    0x8(%eax),%eax
  10083d:	85 c0                	test   %eax,%eax
  10083f:	74 97                	je     1007d8 <debuginfo_eip+0x1fa>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  100841:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100844:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100847:	39 c2                	cmp    %eax,%edx
  100849:	7c 46                	jl     100891 <debuginfo_eip+0x2b3>
  10084b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10084e:	89 c2                	mov    %eax,%edx
  100850:	89 d0                	mov    %edx,%eax
  100852:	01 c0                	add    %eax,%eax
  100854:	01 d0                	add    %edx,%eax
  100856:	c1 e0 02             	shl    $0x2,%eax
  100859:	89 c2                	mov    %eax,%edx
  10085b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10085e:	01 d0                	add    %edx,%eax
  100860:	8b 00                	mov    (%eax),%eax
  100862:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100865:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100868:	29 d1                	sub    %edx,%ecx
  10086a:	89 ca                	mov    %ecx,%edx
  10086c:	39 d0                	cmp    %edx,%eax
  10086e:	73 21                	jae    100891 <debuginfo_eip+0x2b3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  100870:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100873:	89 c2                	mov    %eax,%edx
  100875:	89 d0                	mov    %edx,%eax
  100877:	01 c0                	add    %eax,%eax
  100879:	01 d0                	add    %edx,%eax
  10087b:	c1 e0 02             	shl    $0x2,%eax
  10087e:	89 c2                	mov    %eax,%edx
  100880:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100883:	01 d0                	add    %edx,%eax
  100885:	8b 10                	mov    (%eax),%edx
  100887:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10088a:	01 c2                	add    %eax,%edx
  10088c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10088f:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  100891:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100894:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100897:	39 c2                	cmp    %eax,%edx
  100899:	7d 4a                	jge    1008e5 <debuginfo_eip+0x307>
        for (lline = lfun + 1;
  10089b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10089e:	83 c0 01             	add    $0x1,%eax
  1008a1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1008a4:	eb 18                	jmp    1008be <debuginfo_eip+0x2e0>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1008a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008a9:	8b 40 14             	mov    0x14(%eax),%eax
  1008ac:	8d 50 01             	lea    0x1(%eax),%edx
  1008af:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008b2:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  1008b5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008b8:	83 c0 01             	add    $0x1,%eax
  1008bb:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008be:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008c1:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  1008c4:	39 c2                	cmp    %eax,%edx
  1008c6:	7d 1d                	jge    1008e5 <debuginfo_eip+0x307>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008c8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008cb:	89 c2                	mov    %eax,%edx
  1008cd:	89 d0                	mov    %edx,%eax
  1008cf:	01 c0                	add    %eax,%eax
  1008d1:	01 d0                	add    %edx,%eax
  1008d3:	c1 e0 02             	shl    $0x2,%eax
  1008d6:	89 c2                	mov    %eax,%edx
  1008d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008db:	01 d0                	add    %edx,%eax
  1008dd:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1008e1:	3c a0                	cmp    $0xa0,%al
  1008e3:	74 c1                	je     1008a6 <debuginfo_eip+0x2c8>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  1008e5:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1008ea:	c9                   	leave  
  1008eb:	c3                   	ret    

001008ec <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  1008ec:	55                   	push   %ebp
  1008ed:	89 e5                	mov    %esp,%ebp
  1008ef:	83 ec 08             	sub    $0x8,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  1008f2:	83 ec 0c             	sub    $0xc,%esp
  1008f5:	68 62 36 10 00       	push   $0x103662
  1008fa:	e8 4e f9 ff ff       	call   10024d <cprintf>
  1008ff:	83 c4 10             	add    $0x10,%esp
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100902:	83 ec 08             	sub    $0x8,%esp
  100905:	68 00 00 10 00       	push   $0x100000
  10090a:	68 7b 36 10 00       	push   $0x10367b
  10090f:	e8 39 f9 ff ff       	call   10024d <cprintf>
  100914:	83 c4 10             	add    $0x10,%esp
    cprintf("  etext  0x%08x (phys)\n", etext);
  100917:	83 ec 08             	sub    $0x8,%esp
  10091a:	68 5f 35 10 00       	push   $0x10355f
  10091f:	68 93 36 10 00       	push   $0x103693
  100924:	e8 24 f9 ff ff       	call   10024d <cprintf>
  100929:	83 c4 10             	add    $0x10,%esp
    cprintf("  edata  0x%08x (phys)\n", edata);
  10092c:	83 ec 08             	sub    $0x8,%esp
  10092f:	68 16 ea 10 00       	push   $0x10ea16
  100934:	68 ab 36 10 00       	push   $0x1036ab
  100939:	e8 0f f9 ff ff       	call   10024d <cprintf>
  10093e:	83 c4 10             	add    $0x10,%esp
    cprintf("  end    0x%08x (phys)\n", end);
  100941:	83 ec 08             	sub    $0x8,%esp
  100944:	68 80 fd 10 00       	push   $0x10fd80
  100949:	68 c3 36 10 00       	push   $0x1036c3
  10094e:	e8 fa f8 ff ff       	call   10024d <cprintf>
  100953:	83 c4 10             	add    $0x10,%esp
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100956:	b8 80 fd 10 00       	mov    $0x10fd80,%eax
  10095b:	05 ff 03 00 00       	add    $0x3ff,%eax
  100960:	ba 00 00 10 00       	mov    $0x100000,%edx
  100965:	29 d0                	sub    %edx,%eax
  100967:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10096d:	85 c0                	test   %eax,%eax
  10096f:	0f 48 c2             	cmovs  %edx,%eax
  100972:	c1 f8 0a             	sar    $0xa,%eax
  100975:	83 ec 08             	sub    $0x8,%esp
  100978:	50                   	push   %eax
  100979:	68 dc 36 10 00       	push   $0x1036dc
  10097e:	e8 ca f8 ff ff       	call   10024d <cprintf>
  100983:	83 c4 10             	add    $0x10,%esp
}
  100986:	90                   	nop
  100987:	c9                   	leave  
  100988:	c3                   	ret    

00100989 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  100989:	55                   	push   %ebp
  10098a:	89 e5                	mov    %esp,%ebp
  10098c:	81 ec 28 01 00 00    	sub    $0x128,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  100992:	83 ec 08             	sub    $0x8,%esp
  100995:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100998:	50                   	push   %eax
  100999:	ff 75 08             	pushl  0x8(%ebp)
  10099c:	e8 3d fc ff ff       	call   1005de <debuginfo_eip>
  1009a1:	83 c4 10             	add    $0x10,%esp
  1009a4:	85 c0                	test   %eax,%eax
  1009a6:	74 15                	je     1009bd <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1009a8:	83 ec 08             	sub    $0x8,%esp
  1009ab:	ff 75 08             	pushl  0x8(%ebp)
  1009ae:	68 06 37 10 00       	push   $0x103706
  1009b3:	e8 95 f8 ff ff       	call   10024d <cprintf>
  1009b8:	83 c4 10             	add    $0x10,%esp
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  1009bb:	eb 65                	jmp    100a22 <print_debuginfo+0x99>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009bd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1009c4:	eb 1c                	jmp    1009e2 <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  1009c6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1009c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009cc:	01 d0                	add    %edx,%eax
  1009ce:	0f b6 00             	movzbl (%eax),%eax
  1009d1:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009d7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009da:	01 ca                	add    %ecx,%edx
  1009dc:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009de:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1009e2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009e5:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  1009e8:	7f dc                	jg     1009c6 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  1009ea:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  1009f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009f3:	01 d0                	add    %edx,%eax
  1009f5:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  1009f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  1009fb:	8b 55 08             	mov    0x8(%ebp),%edx
  1009fe:	89 d1                	mov    %edx,%ecx
  100a00:	29 c1                	sub    %eax,%ecx
  100a02:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a05:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a08:	83 ec 0c             	sub    $0xc,%esp
  100a0b:	51                   	push   %ecx
  100a0c:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a12:	51                   	push   %ecx
  100a13:	52                   	push   %edx
  100a14:	50                   	push   %eax
  100a15:	68 22 37 10 00       	push   $0x103722
  100a1a:	e8 2e f8 ff ff       	call   10024d <cprintf>
  100a1f:	83 c4 20             	add    $0x20,%esp
                fnname, eip - info.eip_fn_addr);
    }
}
  100a22:	90                   	nop
  100a23:	c9                   	leave  
  100a24:	c3                   	ret    

00100a25 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a25:	55                   	push   %ebp
  100a26:	89 e5                	mov    %esp,%ebp
  100a28:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a2b:	8b 45 04             	mov    0x4(%ebp),%eax
  100a2e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a31:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a34:	c9                   	leave  
  100a35:	c3                   	ret    

00100a36 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a36:	55                   	push   %ebp
  100a37:	89 e5                	mov    %esp,%ebp
  100a39:	83 ec 28             	sub    $0x28,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100a3c:	89 e8                	mov    %ebp,%eax
  100a3e:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100a41:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
	uint32_t ebp = read_ebp();
  100a44:	89 45 f4             	mov    %eax,-0xc(%ebp)
	uint32_t eip = read_eip();
  100a47:	e8 d9 ff ff ff       	call   100a25 <read_eip>
  100a4c:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int i;
	for(i = 0; i < STACKFRAME_DEPTH && ebp != 0; ++i) {
  100a4f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100a56:	e9 9b 00 00 00       	jmp    100af6 <print_stackframe+0xc0>
		cprintf("The value of ebp:0x%08x eip:0x%08x", ebp, eip);
  100a5b:	83 ec 04             	sub    $0x4,%esp
  100a5e:	ff 75 f0             	pushl  -0x10(%ebp)
  100a61:	ff 75 f4             	pushl  -0xc(%ebp)
  100a64:	68 34 37 10 00       	push   $0x103734
  100a69:	e8 df f7 ff ff       	call   10024d <cprintf>
  100a6e:	83 c4 10             	add    $0x10,%esp
		uint32_t *arg = (uint32_t *)ebp + 2;
  100a71:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a74:	83 c0 08             	add    $0x8,%eax
  100a77:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		cprintf(" arg:");
  100a7a:	83 ec 0c             	sub    $0xc,%esp
  100a7d:	68 57 37 10 00       	push   $0x103757
  100a82:	e8 c6 f7 ff ff       	call   10024d <cprintf>
  100a87:	83 c4 10             	add    $0x10,%esp
		int j;
		for(j = 0; j < 4; ++j) {
  100a8a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100a91:	eb 24                	jmp    100ab7 <print_stackframe+0x81>
			cprintf("0x%08x  ", arg + j);
  100a93:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a96:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100a9d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100aa0:	01 d0                	add    %edx,%eax
  100aa2:	83 ec 08             	sub    $0x8,%esp
  100aa5:	50                   	push   %eax
  100aa6:	68 5d 37 10 00       	push   $0x10375d
  100aab:	e8 9d f7 ff ff       	call   10024d <cprintf>
  100ab0:	83 c4 10             	add    $0x10,%esp
	for(i = 0; i < STACKFRAME_DEPTH && ebp != 0; ++i) {
		cprintf("The value of ebp:0x%08x eip:0x%08x", ebp, eip);
		uint32_t *arg = (uint32_t *)ebp + 2;
		cprintf(" arg:");
		int j;
		for(j = 0; j < 4; ++j) {
  100ab3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  100ab7:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100abb:	7e d6                	jle    100a93 <print_stackframe+0x5d>
			cprintf("0x%08x  ", arg + j);
		}
		cputs("");
  100abd:	83 ec 0c             	sub    $0xc,%esp
  100ac0:	68 66 37 10 00       	push   $0x103766
  100ac5:	e8 c0 f7 ff ff       	call   10028a <cputs>
  100aca:	83 c4 10             	add    $0x10,%esp
		print_debuginfo(eip - 1);
  100acd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ad0:	83 e8 01             	sub    $0x1,%eax
  100ad3:	83 ec 0c             	sub    $0xc,%esp
  100ad6:	50                   	push   %eax
  100ad7:	e8 ad fe ff ff       	call   100989 <print_debuginfo>
  100adc:	83 c4 10             	add    $0x10,%esp
		eip = ((uint32_t *)ebp)[1];
  100adf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ae2:	83 c0 04             	add    $0x4,%eax
  100ae5:	8b 00                	mov    (%eax),%eax
  100ae7:	89 45 f0             	mov    %eax,-0x10(%ebp)
		ebp = ((uint32_t*)ebp)[0];
  100aea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aed:	8b 00                	mov    (%eax),%eax
  100aef:	89 45 f4             	mov    %eax,-0xc(%ebp)
      *                   the calling funciton's ebp = ss:[ebp]
      */
	uint32_t ebp = read_ebp();
	uint32_t eip = read_eip();
	int i;
	for(i = 0; i < STACKFRAME_DEPTH && ebp != 0; ++i) {
  100af2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100af6:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100afa:	7f 0a                	jg     100b06 <print_stackframe+0xd0>
  100afc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100b00:	0f 85 55 ff ff ff    	jne    100a5b <print_stackframe+0x25>
		cputs("");
		print_debuginfo(eip - 1);
		eip = ((uint32_t *)ebp)[1];
		ebp = ((uint32_t*)ebp)[0];
	} 
}
  100b06:	90                   	nop
  100b07:	c9                   	leave  
  100b08:	c3                   	ret    

00100b09 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b09:	55                   	push   %ebp
  100b0a:	89 e5                	mov    %esp,%ebp
  100b0c:	83 ec 18             	sub    $0x18,%esp
    int argc = 0;
  100b0f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b16:	eb 0c                	jmp    100b24 <parse+0x1b>
            *buf ++ = '\0';
  100b18:	8b 45 08             	mov    0x8(%ebp),%eax
  100b1b:	8d 50 01             	lea    0x1(%eax),%edx
  100b1e:	89 55 08             	mov    %edx,0x8(%ebp)
  100b21:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b24:	8b 45 08             	mov    0x8(%ebp),%eax
  100b27:	0f b6 00             	movzbl (%eax),%eax
  100b2a:	84 c0                	test   %al,%al
  100b2c:	74 1e                	je     100b4c <parse+0x43>
  100b2e:	8b 45 08             	mov    0x8(%ebp),%eax
  100b31:	0f b6 00             	movzbl (%eax),%eax
  100b34:	0f be c0             	movsbl %al,%eax
  100b37:	83 ec 08             	sub    $0x8,%esp
  100b3a:	50                   	push   %eax
  100b3b:	68 e8 37 10 00       	push   $0x1037e8
  100b40:	e8 c4 20 00 00       	call   102c09 <strchr>
  100b45:	83 c4 10             	add    $0x10,%esp
  100b48:	85 c0                	test   %eax,%eax
  100b4a:	75 cc                	jne    100b18 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100b4c:	8b 45 08             	mov    0x8(%ebp),%eax
  100b4f:	0f b6 00             	movzbl (%eax),%eax
  100b52:	84 c0                	test   %al,%al
  100b54:	74 69                	je     100bbf <parse+0xb6>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b56:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b5a:	75 12                	jne    100b6e <parse+0x65>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b5c:	83 ec 08             	sub    $0x8,%esp
  100b5f:	6a 10                	push   $0x10
  100b61:	68 ed 37 10 00       	push   $0x1037ed
  100b66:	e8 e2 f6 ff ff       	call   10024d <cprintf>
  100b6b:	83 c4 10             	add    $0x10,%esp
        }
        argv[argc ++] = buf;
  100b6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b71:	8d 50 01             	lea    0x1(%eax),%edx
  100b74:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100b77:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b7e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b81:	01 c2                	add    %eax,%edx
  100b83:	8b 45 08             	mov    0x8(%ebp),%eax
  100b86:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b88:	eb 04                	jmp    100b8e <parse+0x85>
            buf ++;
  100b8a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b8e:	8b 45 08             	mov    0x8(%ebp),%eax
  100b91:	0f b6 00             	movzbl (%eax),%eax
  100b94:	84 c0                	test   %al,%al
  100b96:	0f 84 7a ff ff ff    	je     100b16 <parse+0xd>
  100b9c:	8b 45 08             	mov    0x8(%ebp),%eax
  100b9f:	0f b6 00             	movzbl (%eax),%eax
  100ba2:	0f be c0             	movsbl %al,%eax
  100ba5:	83 ec 08             	sub    $0x8,%esp
  100ba8:	50                   	push   %eax
  100ba9:	68 e8 37 10 00       	push   $0x1037e8
  100bae:	e8 56 20 00 00       	call   102c09 <strchr>
  100bb3:	83 c4 10             	add    $0x10,%esp
  100bb6:	85 c0                	test   %eax,%eax
  100bb8:	74 d0                	je     100b8a <parse+0x81>
            buf ++;
        }
    }
  100bba:	e9 57 ff ff ff       	jmp    100b16 <parse+0xd>
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
            break;
  100bbf:	90                   	nop
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100bc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100bc3:	c9                   	leave  
  100bc4:	c3                   	ret    

00100bc5 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100bc5:	55                   	push   %ebp
  100bc6:	89 e5                	mov    %esp,%ebp
  100bc8:	83 ec 58             	sub    $0x58,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100bcb:	83 ec 08             	sub    $0x8,%esp
  100bce:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100bd1:	50                   	push   %eax
  100bd2:	ff 75 08             	pushl  0x8(%ebp)
  100bd5:	e8 2f ff ff ff       	call   100b09 <parse>
  100bda:	83 c4 10             	add    $0x10,%esp
  100bdd:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100be0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100be4:	75 0a                	jne    100bf0 <runcmd+0x2b>
        return 0;
  100be6:	b8 00 00 00 00       	mov    $0x0,%eax
  100beb:	e9 83 00 00 00       	jmp    100c73 <runcmd+0xae>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100bf0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100bf7:	eb 59                	jmp    100c52 <runcmd+0x8d>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100bf9:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100bfc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bff:	89 d0                	mov    %edx,%eax
  100c01:	01 c0                	add    %eax,%eax
  100c03:	01 d0                	add    %edx,%eax
  100c05:	c1 e0 02             	shl    $0x2,%eax
  100c08:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c0d:	8b 00                	mov    (%eax),%eax
  100c0f:	83 ec 08             	sub    $0x8,%esp
  100c12:	51                   	push   %ecx
  100c13:	50                   	push   %eax
  100c14:	e8 50 1f 00 00       	call   102b69 <strcmp>
  100c19:	83 c4 10             	add    $0x10,%esp
  100c1c:	85 c0                	test   %eax,%eax
  100c1e:	75 2e                	jne    100c4e <runcmd+0x89>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c20:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c23:	89 d0                	mov    %edx,%eax
  100c25:	01 c0                	add    %eax,%eax
  100c27:	01 d0                	add    %edx,%eax
  100c29:	c1 e0 02             	shl    $0x2,%eax
  100c2c:	05 08 e0 10 00       	add    $0x10e008,%eax
  100c31:	8b 10                	mov    (%eax),%edx
  100c33:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c36:	83 c0 04             	add    $0x4,%eax
  100c39:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c3c:	83 e9 01             	sub    $0x1,%ecx
  100c3f:	83 ec 04             	sub    $0x4,%esp
  100c42:	ff 75 0c             	pushl  0xc(%ebp)
  100c45:	50                   	push   %eax
  100c46:	51                   	push   %ecx
  100c47:	ff d2                	call   *%edx
  100c49:	83 c4 10             	add    $0x10,%esp
  100c4c:	eb 25                	jmp    100c73 <runcmd+0xae>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c4e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c52:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c55:	83 f8 02             	cmp    $0x2,%eax
  100c58:	76 9f                	jbe    100bf9 <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100c5a:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100c5d:	83 ec 08             	sub    $0x8,%esp
  100c60:	50                   	push   %eax
  100c61:	68 0b 38 10 00       	push   $0x10380b
  100c66:	e8 e2 f5 ff ff       	call   10024d <cprintf>
  100c6b:	83 c4 10             	add    $0x10,%esp
    return 0;
  100c6e:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c73:	c9                   	leave  
  100c74:	c3                   	ret    

00100c75 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100c75:	55                   	push   %ebp
  100c76:	89 e5                	mov    %esp,%ebp
  100c78:	83 ec 18             	sub    $0x18,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100c7b:	83 ec 0c             	sub    $0xc,%esp
  100c7e:	68 24 38 10 00       	push   $0x103824
  100c83:	e8 c5 f5 ff ff       	call   10024d <cprintf>
  100c88:	83 c4 10             	add    $0x10,%esp
    cprintf("Type 'help' for a list of commands.\n");
  100c8b:	83 ec 0c             	sub    $0xc,%esp
  100c8e:	68 4c 38 10 00       	push   $0x10384c
  100c93:	e8 b5 f5 ff ff       	call   10024d <cprintf>
  100c98:	83 c4 10             	add    $0x10,%esp

    if (tf != NULL) {
  100c9b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100c9f:	74 0e                	je     100caf <kmonitor+0x3a>
        print_trapframe(tf);
  100ca1:	83 ec 0c             	sub    $0xc,%esp
  100ca4:	ff 75 08             	pushl  0x8(%ebp)
  100ca7:	e8 31 0d 00 00       	call   1019dd <print_trapframe>
  100cac:	83 c4 10             	add    $0x10,%esp
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100caf:	83 ec 0c             	sub    $0xc,%esp
  100cb2:	68 71 38 10 00       	push   $0x103871
  100cb7:	e8 35 f6 ff ff       	call   1002f1 <readline>
  100cbc:	83 c4 10             	add    $0x10,%esp
  100cbf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cc2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100cc6:	74 e7                	je     100caf <kmonitor+0x3a>
            if (runcmd(buf, tf) < 0) {
  100cc8:	83 ec 08             	sub    $0x8,%esp
  100ccb:	ff 75 08             	pushl  0x8(%ebp)
  100cce:	ff 75 f4             	pushl  -0xc(%ebp)
  100cd1:	e8 ef fe ff ff       	call   100bc5 <runcmd>
  100cd6:	83 c4 10             	add    $0x10,%esp
  100cd9:	85 c0                	test   %eax,%eax
  100cdb:	78 02                	js     100cdf <kmonitor+0x6a>
                break;
            }
        }
    }
  100cdd:	eb d0                	jmp    100caf <kmonitor+0x3a>

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
            if (runcmd(buf, tf) < 0) {
                break;
  100cdf:	90                   	nop
            }
        }
    }
}
  100ce0:	90                   	nop
  100ce1:	c9                   	leave  
  100ce2:	c3                   	ret    

00100ce3 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100ce3:	55                   	push   %ebp
  100ce4:	89 e5                	mov    %esp,%ebp
  100ce6:	83 ec 18             	sub    $0x18,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100ce9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100cf0:	eb 3c                	jmp    100d2e <mon_help+0x4b>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100cf2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cf5:	89 d0                	mov    %edx,%eax
  100cf7:	01 c0                	add    %eax,%eax
  100cf9:	01 d0                	add    %edx,%eax
  100cfb:	c1 e0 02             	shl    $0x2,%eax
  100cfe:	05 04 e0 10 00       	add    $0x10e004,%eax
  100d03:	8b 08                	mov    (%eax),%ecx
  100d05:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d08:	89 d0                	mov    %edx,%eax
  100d0a:	01 c0                	add    %eax,%eax
  100d0c:	01 d0                	add    %edx,%eax
  100d0e:	c1 e0 02             	shl    $0x2,%eax
  100d11:	05 00 e0 10 00       	add    $0x10e000,%eax
  100d16:	8b 00                	mov    (%eax),%eax
  100d18:	83 ec 04             	sub    $0x4,%esp
  100d1b:	51                   	push   %ecx
  100d1c:	50                   	push   %eax
  100d1d:	68 75 38 10 00       	push   $0x103875
  100d22:	e8 26 f5 ff ff       	call   10024d <cprintf>
  100d27:	83 c4 10             	add    $0x10,%esp

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100d2a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100d2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d31:	83 f8 02             	cmp    $0x2,%eax
  100d34:	76 bc                	jbe    100cf2 <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100d36:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d3b:	c9                   	leave  
  100d3c:	c3                   	ret    

00100d3d <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d3d:	55                   	push   %ebp
  100d3e:	89 e5                	mov    %esp,%ebp
  100d40:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d43:	e8 a4 fb ff ff       	call   1008ec <print_kerninfo>
    return 0;
  100d48:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d4d:	c9                   	leave  
  100d4e:	c3                   	ret    

00100d4f <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100d4f:	55                   	push   %ebp
  100d50:	89 e5                	mov    %esp,%ebp
  100d52:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100d55:	e8 dc fc ff ff       	call   100a36 <print_stackframe>
    return 0;
  100d5a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d5f:	c9                   	leave  
  100d60:	c3                   	ret    

00100d61 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d61:	55                   	push   %ebp
  100d62:	89 e5                	mov    %esp,%ebp
  100d64:	83 ec 18             	sub    $0x18,%esp
  100d67:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d6d:	c6 45 ef 34          	movb   $0x34,-0x11(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d71:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  100d75:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d79:	ee                   	out    %al,(%dx)
  100d7a:	66 c7 45 f4 40 00    	movw   $0x40,-0xc(%ebp)
  100d80:	c6 45 f0 9c          	movb   $0x9c,-0x10(%ebp)
  100d84:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
  100d88:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  100d8c:	ee                   	out    %al,(%dx)
  100d8d:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d93:	c6 45 f1 2e          	movb   $0x2e,-0xf(%ebp)
  100d97:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d9b:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d9f:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100da0:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100da7:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100daa:	83 ec 0c             	sub    $0xc,%esp
  100dad:	68 7e 38 10 00       	push   $0x10387e
  100db2:	e8 96 f4 ff ff       	call   10024d <cprintf>
  100db7:	83 c4 10             	add    $0x10,%esp
    pic_enable(IRQ_TIMER);
  100dba:	83 ec 0c             	sub    $0xc,%esp
  100dbd:	6a 00                	push   $0x0
  100dbf:	e8 ce 08 00 00       	call   101692 <pic_enable>
  100dc4:	83 c4 10             	add    $0x10,%esp
}
  100dc7:	90                   	nop
  100dc8:	c9                   	leave  
  100dc9:	c3                   	ret    

00100dca <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100dca:	55                   	push   %ebp
  100dcb:	89 e5                	mov    %esp,%ebp
  100dcd:	83 ec 10             	sub    $0x10,%esp
  100dd0:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dd6:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100dda:	89 c2                	mov    %eax,%edx
  100ddc:	ec                   	in     (%dx),%al
  100ddd:	88 45 f4             	mov    %al,-0xc(%ebp)
  100de0:	66 c7 45 fc 84 00    	movw   $0x84,-0x4(%ebp)
  100de6:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  100dea:	89 c2                	mov    %eax,%edx
  100dec:	ec                   	in     (%dx),%al
  100ded:	88 45 f5             	mov    %al,-0xb(%ebp)
  100df0:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100df6:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100dfa:	89 c2                	mov    %eax,%edx
  100dfc:	ec                   	in     (%dx),%al
  100dfd:	88 45 f6             	mov    %al,-0xa(%ebp)
  100e00:	66 c7 45 f8 84 00    	movw   $0x84,-0x8(%ebp)
  100e06:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  100e0a:	89 c2                	mov    %eax,%edx
  100e0c:	ec                   	in     (%dx),%al
  100e0d:	88 45 f7             	mov    %al,-0x9(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e10:	90                   	nop
  100e11:	c9                   	leave  
  100e12:	c3                   	ret    

00100e13 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e13:	55                   	push   %ebp
  100e14:	89 e5                	mov    %esp,%ebp
  100e16:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e19:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e20:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e23:	0f b7 00             	movzwl (%eax),%eax
  100e26:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e2a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e2d:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e32:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e35:	0f b7 00             	movzwl (%eax),%eax
  100e38:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e3c:	74 12                	je     100e50 <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e3e:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e45:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e4c:	b4 03 
  100e4e:	eb 13                	jmp    100e63 <cga_init+0x50>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e50:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e53:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e57:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e5a:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e61:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e63:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e6a:	0f b7 c0             	movzwl %ax,%eax
  100e6d:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  100e71:	c6 45 ea 0e          	movb   $0xe,-0x16(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e75:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  100e79:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  100e7d:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e7e:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e85:	83 c0 01             	add    $0x1,%eax
  100e88:	0f b7 c0             	movzwl %ax,%eax
  100e8b:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e8f:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e93:	89 c2                	mov    %eax,%edx
  100e95:	ec                   	in     (%dx),%al
  100e96:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  100e99:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  100e9d:	0f b6 c0             	movzbl %al,%eax
  100ea0:	c1 e0 08             	shl    $0x8,%eax
  100ea3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100ea6:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ead:	0f b7 c0             	movzwl %ax,%eax
  100eb0:	66 89 45 f0          	mov    %ax,-0x10(%ebp)
  100eb4:	c6 45 ec 0f          	movb   $0xf,-0x14(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eb8:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  100ebc:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  100ec0:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100ec1:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ec8:	83 c0 01             	add    $0x1,%eax
  100ecb:	0f b7 c0             	movzwl %ax,%eax
  100ece:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ed2:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100ed6:	89 c2                	mov    %eax,%edx
  100ed8:	ec                   	in     (%dx),%al
  100ed9:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100edc:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ee0:	0f b6 c0             	movzbl %al,%eax
  100ee3:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100ee6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ee9:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100eee:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ef1:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100ef7:	90                   	nop
  100ef8:	c9                   	leave  
  100ef9:	c3                   	ret    

00100efa <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100efa:	55                   	push   %ebp
  100efb:	89 e5                	mov    %esp,%ebp
  100efd:	83 ec 28             	sub    $0x28,%esp
  100f00:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100f06:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f0a:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
  100f0e:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f12:	ee                   	out    %al,(%dx)
  100f13:	66 c7 45 f4 fb 03    	movw   $0x3fb,-0xc(%ebp)
  100f19:	c6 45 db 80          	movb   $0x80,-0x25(%ebp)
  100f1d:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  100f21:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  100f25:	ee                   	out    %al,(%dx)
  100f26:	66 c7 45 f2 f8 03    	movw   $0x3f8,-0xe(%ebp)
  100f2c:	c6 45 dc 0c          	movb   $0xc,-0x24(%ebp)
  100f30:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  100f34:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f38:	ee                   	out    %al,(%dx)
  100f39:	66 c7 45 f0 f9 03    	movw   $0x3f9,-0x10(%ebp)
  100f3f:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
  100f43:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f47:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  100f4b:	ee                   	out    %al,(%dx)
  100f4c:	66 c7 45 ee fb 03    	movw   $0x3fb,-0x12(%ebp)
  100f52:	c6 45 de 03          	movb   $0x3,-0x22(%ebp)
  100f56:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  100f5a:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f5e:	ee                   	out    %al,(%dx)
  100f5f:	66 c7 45 ec fc 03    	movw   $0x3fc,-0x14(%ebp)
  100f65:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
  100f69:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  100f6d:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  100f71:	ee                   	out    %al,(%dx)
  100f72:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f78:	c6 45 e0 01          	movb   $0x1,-0x20(%ebp)
  100f7c:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  100f80:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f84:	ee                   	out    %al,(%dx)
  100f85:	66 c7 45 e8 fd 03    	movw   $0x3fd,-0x18(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f8b:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
  100f8f:	89 c2                	mov    %eax,%edx
  100f91:	ec                   	in     (%dx),%al
  100f92:	88 45 e1             	mov    %al,-0x1f(%ebp)
    return data;
  100f95:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f99:	3c ff                	cmp    $0xff,%al
  100f9b:	0f 95 c0             	setne  %al
  100f9e:	0f b6 c0             	movzbl %al,%eax
  100fa1:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100fa6:	66 c7 45 e6 fa 03    	movw   $0x3fa,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fac:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100fb0:	89 c2                	mov    %eax,%edx
  100fb2:	ec                   	in     (%dx),%al
  100fb3:	88 45 e2             	mov    %al,-0x1e(%ebp)
  100fb6:	66 c7 45 e4 f8 03    	movw   $0x3f8,-0x1c(%ebp)
  100fbc:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100fc0:	89 c2                	mov    %eax,%edx
  100fc2:	ec                   	in     (%dx),%al
  100fc3:	88 45 e3             	mov    %al,-0x1d(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fc6:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fcb:	85 c0                	test   %eax,%eax
  100fcd:	74 0d                	je     100fdc <serial_init+0xe2>
        pic_enable(IRQ_COM1);
  100fcf:	83 ec 0c             	sub    $0xc,%esp
  100fd2:	6a 04                	push   $0x4
  100fd4:	e8 b9 06 00 00       	call   101692 <pic_enable>
  100fd9:	83 c4 10             	add    $0x10,%esp
    }
}
  100fdc:	90                   	nop
  100fdd:	c9                   	leave  
  100fde:	c3                   	ret    

00100fdf <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fdf:	55                   	push   %ebp
  100fe0:	89 e5                	mov    %esp,%ebp
  100fe2:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fe5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fec:	eb 09                	jmp    100ff7 <lpt_putc_sub+0x18>
        delay();
  100fee:	e8 d7 fd ff ff       	call   100dca <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100ff3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100ff7:	66 c7 45 f4 79 03    	movw   $0x379,-0xc(%ebp)
  100ffd:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  101001:	89 c2                	mov    %eax,%edx
  101003:	ec                   	in     (%dx),%al
  101004:	88 45 f3             	mov    %al,-0xd(%ebp)
    return data;
  101007:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10100b:	84 c0                	test   %al,%al
  10100d:	78 09                	js     101018 <lpt_putc_sub+0x39>
  10100f:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101016:	7e d6                	jle    100fee <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  101018:	8b 45 08             	mov    0x8(%ebp),%eax
  10101b:	0f b6 c0             	movzbl %al,%eax
  10101e:	66 c7 45 f8 78 03    	movw   $0x378,-0x8(%ebp)
  101024:	88 45 f0             	mov    %al,-0x10(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101027:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
  10102b:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  10102f:	ee                   	out    %al,(%dx)
  101030:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  101036:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  10103a:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10103e:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101042:	ee                   	out    %al,(%dx)
  101043:	66 c7 45 fa 7a 03    	movw   $0x37a,-0x6(%ebp)
  101049:	c6 45 f2 08          	movb   $0x8,-0xe(%ebp)
  10104d:	0f b6 45 f2          	movzbl -0xe(%ebp),%eax
  101051:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101055:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101056:	90                   	nop
  101057:	c9                   	leave  
  101058:	c3                   	ret    

00101059 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101059:	55                   	push   %ebp
  10105a:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  10105c:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101060:	74 0d                	je     10106f <lpt_putc+0x16>
        lpt_putc_sub(c);
  101062:	ff 75 08             	pushl  0x8(%ebp)
  101065:	e8 75 ff ff ff       	call   100fdf <lpt_putc_sub>
  10106a:	83 c4 04             	add    $0x4,%esp
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  10106d:	eb 1e                	jmp    10108d <lpt_putc+0x34>
lpt_putc(int c) {
    if (c != '\b') {
        lpt_putc_sub(c);
    }
    else {
        lpt_putc_sub('\b');
  10106f:	6a 08                	push   $0x8
  101071:	e8 69 ff ff ff       	call   100fdf <lpt_putc_sub>
  101076:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub(' ');
  101079:	6a 20                	push   $0x20
  10107b:	e8 5f ff ff ff       	call   100fdf <lpt_putc_sub>
  101080:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub('\b');
  101083:	6a 08                	push   $0x8
  101085:	e8 55 ff ff ff       	call   100fdf <lpt_putc_sub>
  10108a:	83 c4 04             	add    $0x4,%esp
    }
}
  10108d:	90                   	nop
  10108e:	c9                   	leave  
  10108f:	c3                   	ret    

00101090 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101090:	55                   	push   %ebp
  101091:	89 e5                	mov    %esp,%ebp
  101093:	53                   	push   %ebx
  101094:	83 ec 14             	sub    $0x14,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101097:	8b 45 08             	mov    0x8(%ebp),%eax
  10109a:	b0 00                	mov    $0x0,%al
  10109c:	85 c0                	test   %eax,%eax
  10109e:	75 07                	jne    1010a7 <cga_putc+0x17>
        c |= 0x0700;
  1010a0:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1010aa:	0f b6 c0             	movzbl %al,%eax
  1010ad:	83 f8 0a             	cmp    $0xa,%eax
  1010b0:	74 4e                	je     101100 <cga_putc+0x70>
  1010b2:	83 f8 0d             	cmp    $0xd,%eax
  1010b5:	74 59                	je     101110 <cga_putc+0x80>
  1010b7:	83 f8 08             	cmp    $0x8,%eax
  1010ba:	0f 85 8a 00 00 00    	jne    10114a <cga_putc+0xba>
    case '\b':
        if (crt_pos > 0) {
  1010c0:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010c7:	66 85 c0             	test   %ax,%ax
  1010ca:	0f 84 a0 00 00 00    	je     101170 <cga_putc+0xe0>
            crt_pos --;
  1010d0:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010d7:	83 e8 01             	sub    $0x1,%eax
  1010da:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010e0:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010e5:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1010ec:	0f b7 d2             	movzwl %dx,%edx
  1010ef:	01 d2                	add    %edx,%edx
  1010f1:	01 d0                	add    %edx,%eax
  1010f3:	8b 55 08             	mov    0x8(%ebp),%edx
  1010f6:	b2 00                	mov    $0x0,%dl
  1010f8:	83 ca 20             	or     $0x20,%edx
  1010fb:	66 89 10             	mov    %dx,(%eax)
        }
        break;
  1010fe:	eb 70                	jmp    101170 <cga_putc+0xe0>
    case '\n':
        crt_pos += CRT_COLS;
  101100:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101107:	83 c0 50             	add    $0x50,%eax
  10110a:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101110:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  101117:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  10111e:	0f b7 c1             	movzwl %cx,%eax
  101121:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  101127:	c1 e8 10             	shr    $0x10,%eax
  10112a:	89 c2                	mov    %eax,%edx
  10112c:	66 c1 ea 06          	shr    $0x6,%dx
  101130:	89 d0                	mov    %edx,%eax
  101132:	c1 e0 02             	shl    $0x2,%eax
  101135:	01 d0                	add    %edx,%eax
  101137:	c1 e0 04             	shl    $0x4,%eax
  10113a:	29 c1                	sub    %eax,%ecx
  10113c:	89 ca                	mov    %ecx,%edx
  10113e:	89 d8                	mov    %ebx,%eax
  101140:	29 d0                	sub    %edx,%eax
  101142:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  101148:	eb 27                	jmp    101171 <cga_putc+0xe1>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  10114a:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  101150:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101157:	8d 50 01             	lea    0x1(%eax),%edx
  10115a:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  101161:	0f b7 c0             	movzwl %ax,%eax
  101164:	01 c0                	add    %eax,%eax
  101166:	01 c8                	add    %ecx,%eax
  101168:	8b 55 08             	mov    0x8(%ebp),%edx
  10116b:	66 89 10             	mov    %dx,(%eax)
        break;
  10116e:	eb 01                	jmp    101171 <cga_putc+0xe1>
    case '\b':
        if (crt_pos > 0) {
            crt_pos --;
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
        }
        break;
  101170:	90                   	nop
        crt_buf[crt_pos ++] = c;     // write the character
        break;
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101171:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101178:	66 3d cf 07          	cmp    $0x7cf,%ax
  10117c:	76 59                	jbe    1011d7 <cga_putc+0x147>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10117e:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101183:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101189:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10118e:	83 ec 04             	sub    $0x4,%esp
  101191:	68 00 0f 00 00       	push   $0xf00
  101196:	52                   	push   %edx
  101197:	50                   	push   %eax
  101198:	e8 6b 1c 00 00       	call   102e08 <memmove>
  10119d:	83 c4 10             	add    $0x10,%esp
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011a0:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011a7:	eb 15                	jmp    1011be <cga_putc+0x12e>
            crt_buf[i] = 0x0700 | ' ';
  1011a9:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011b1:	01 d2                	add    %edx,%edx
  1011b3:	01 d0                	add    %edx,%eax
  1011b5:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011ba:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1011be:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011c5:	7e e2                	jle    1011a9 <cga_putc+0x119>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  1011c7:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011ce:	83 e8 50             	sub    $0x50,%eax
  1011d1:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011d7:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011de:	0f b7 c0             	movzwl %ax,%eax
  1011e1:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011e5:	c6 45 e8 0e          	movb   $0xe,-0x18(%ebp)
  1011e9:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
  1011ed:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011f1:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011f2:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011f9:	66 c1 e8 08          	shr    $0x8,%ax
  1011fd:	0f b6 c0             	movzbl %al,%eax
  101200:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101207:	83 c2 01             	add    $0x1,%edx
  10120a:	0f b7 d2             	movzwl %dx,%edx
  10120d:	66 89 55 f0          	mov    %dx,-0x10(%ebp)
  101211:	88 45 e9             	mov    %al,-0x17(%ebp)
  101214:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101218:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  10121c:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  10121d:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101224:	0f b7 c0             	movzwl %ax,%eax
  101227:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  10122b:	c6 45 ea 0f          	movb   $0xf,-0x16(%ebp)
  10122f:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  101233:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101237:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  101238:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10123f:	0f b6 c0             	movzbl %al,%eax
  101242:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101249:	83 c2 01             	add    $0x1,%edx
  10124c:	0f b7 d2             	movzwl %dx,%edx
  10124f:	66 89 55 ec          	mov    %dx,-0x14(%ebp)
  101253:	88 45 eb             	mov    %al,-0x15(%ebp)
  101256:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  10125a:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  10125e:	ee                   	out    %al,(%dx)
}
  10125f:	90                   	nop
  101260:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101263:	c9                   	leave  
  101264:	c3                   	ret    

00101265 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101265:	55                   	push   %ebp
  101266:	89 e5                	mov    %esp,%ebp
  101268:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10126b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101272:	eb 09                	jmp    10127d <serial_putc_sub+0x18>
        delay();
  101274:	e8 51 fb ff ff       	call   100dca <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101279:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10127d:	66 c7 45 f8 fd 03    	movw   $0x3fd,-0x8(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101283:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  101287:	89 c2                	mov    %eax,%edx
  101289:	ec                   	in     (%dx),%al
  10128a:	88 45 f7             	mov    %al,-0x9(%ebp)
    return data;
  10128d:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  101291:	0f b6 c0             	movzbl %al,%eax
  101294:	83 e0 20             	and    $0x20,%eax
  101297:	85 c0                	test   %eax,%eax
  101299:	75 09                	jne    1012a4 <serial_putc_sub+0x3f>
  10129b:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1012a2:	7e d0                	jle    101274 <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  1012a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1012a7:	0f b6 c0             	movzbl %al,%eax
  1012aa:	66 c7 45 fa f8 03    	movw   $0x3f8,-0x6(%ebp)
  1012b0:	88 45 f6             	mov    %al,-0xa(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012b3:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  1012b7:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1012bb:	ee                   	out    %al,(%dx)
}
  1012bc:	90                   	nop
  1012bd:	c9                   	leave  
  1012be:	c3                   	ret    

001012bf <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012bf:	55                   	push   %ebp
  1012c0:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  1012c2:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012c6:	74 0d                	je     1012d5 <serial_putc+0x16>
        serial_putc_sub(c);
  1012c8:	ff 75 08             	pushl  0x8(%ebp)
  1012cb:	e8 95 ff ff ff       	call   101265 <serial_putc_sub>
  1012d0:	83 c4 04             	add    $0x4,%esp
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  1012d3:	eb 1e                	jmp    1012f3 <serial_putc+0x34>
serial_putc(int c) {
    if (c != '\b') {
        serial_putc_sub(c);
    }
    else {
        serial_putc_sub('\b');
  1012d5:	6a 08                	push   $0x8
  1012d7:	e8 89 ff ff ff       	call   101265 <serial_putc_sub>
  1012dc:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub(' ');
  1012df:	6a 20                	push   $0x20
  1012e1:	e8 7f ff ff ff       	call   101265 <serial_putc_sub>
  1012e6:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub('\b');
  1012e9:	6a 08                	push   $0x8
  1012eb:	e8 75 ff ff ff       	call   101265 <serial_putc_sub>
  1012f0:	83 c4 04             	add    $0x4,%esp
    }
}
  1012f3:	90                   	nop
  1012f4:	c9                   	leave  
  1012f5:	c3                   	ret    

001012f6 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012f6:	55                   	push   %ebp
  1012f7:	89 e5                	mov    %esp,%ebp
  1012f9:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1012fc:	eb 33                	jmp    101331 <cons_intr+0x3b>
        if (c != 0) {
  1012fe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101302:	74 2d                	je     101331 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101304:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101309:	8d 50 01             	lea    0x1(%eax),%edx
  10130c:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  101312:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101315:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  10131b:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101320:	3d 00 02 00 00       	cmp    $0x200,%eax
  101325:	75 0a                	jne    101331 <cons_intr+0x3b>
                cons.wpos = 0;
  101327:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  10132e:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  101331:	8b 45 08             	mov    0x8(%ebp),%eax
  101334:	ff d0                	call   *%eax
  101336:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101339:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  10133d:	75 bf                	jne    1012fe <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  10133f:	90                   	nop
  101340:	c9                   	leave  
  101341:	c3                   	ret    

00101342 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101342:	55                   	push   %ebp
  101343:	89 e5                	mov    %esp,%ebp
  101345:	83 ec 10             	sub    $0x10,%esp
  101348:	66 c7 45 f8 fd 03    	movw   $0x3fd,-0x8(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10134e:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  101352:	89 c2                	mov    %eax,%edx
  101354:	ec                   	in     (%dx),%al
  101355:	88 45 f7             	mov    %al,-0x9(%ebp)
    return data;
  101358:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  10135c:	0f b6 c0             	movzbl %al,%eax
  10135f:	83 e0 01             	and    $0x1,%eax
  101362:	85 c0                	test   %eax,%eax
  101364:	75 07                	jne    10136d <serial_proc_data+0x2b>
        return -1;
  101366:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10136b:	eb 2a                	jmp    101397 <serial_proc_data+0x55>
  10136d:	66 c7 45 fa f8 03    	movw   $0x3f8,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101373:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101377:	89 c2                	mov    %eax,%edx
  101379:	ec                   	in     (%dx),%al
  10137a:	88 45 f6             	mov    %al,-0xa(%ebp)
    return data;
  10137d:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101381:	0f b6 c0             	movzbl %al,%eax
  101384:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101387:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  10138b:	75 07                	jne    101394 <serial_proc_data+0x52>
        c = '\b';
  10138d:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101394:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101397:	c9                   	leave  
  101398:	c3                   	ret    

00101399 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101399:	55                   	push   %ebp
  10139a:	89 e5                	mov    %esp,%ebp
  10139c:	83 ec 08             	sub    $0x8,%esp
    if (serial_exists) {
  10139f:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1013a4:	85 c0                	test   %eax,%eax
  1013a6:	74 10                	je     1013b8 <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  1013a8:	83 ec 0c             	sub    $0xc,%esp
  1013ab:	68 42 13 10 00       	push   $0x101342
  1013b0:	e8 41 ff ff ff       	call   1012f6 <cons_intr>
  1013b5:	83 c4 10             	add    $0x10,%esp
    }
}
  1013b8:	90                   	nop
  1013b9:	c9                   	leave  
  1013ba:	c3                   	ret    

001013bb <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013bb:	55                   	push   %ebp
  1013bc:	89 e5                	mov    %esp,%ebp
  1013be:	83 ec 18             	sub    $0x18,%esp
  1013c1:	66 c7 45 ec 64 00    	movw   $0x64,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013c7:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1013cb:	89 c2                	mov    %eax,%edx
  1013cd:	ec                   	in     (%dx),%al
  1013ce:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013d1:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013d5:	0f b6 c0             	movzbl %al,%eax
  1013d8:	83 e0 01             	and    $0x1,%eax
  1013db:	85 c0                	test   %eax,%eax
  1013dd:	75 0a                	jne    1013e9 <kbd_proc_data+0x2e>
        return -1;
  1013df:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013e4:	e9 5d 01 00 00       	jmp    101546 <kbd_proc_data+0x18b>
  1013e9:	66 c7 45 f0 60 00    	movw   $0x60,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013ef:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1013f3:	89 c2                	mov    %eax,%edx
  1013f5:	ec                   	in     (%dx),%al
  1013f6:	88 45 ea             	mov    %al,-0x16(%ebp)
    return data;
  1013f9:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013fd:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  101400:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  101404:	75 17                	jne    10141d <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  101406:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10140b:	83 c8 40             	or     $0x40,%eax
  10140e:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101413:	b8 00 00 00 00       	mov    $0x0,%eax
  101418:	e9 29 01 00 00       	jmp    101546 <kbd_proc_data+0x18b>
    } else if (data & 0x80) {
  10141d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101421:	84 c0                	test   %al,%al
  101423:	79 47                	jns    10146c <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101425:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10142a:	83 e0 40             	and    $0x40,%eax
  10142d:	85 c0                	test   %eax,%eax
  10142f:	75 09                	jne    10143a <kbd_proc_data+0x7f>
  101431:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101435:	83 e0 7f             	and    $0x7f,%eax
  101438:	eb 04                	jmp    10143e <kbd_proc_data+0x83>
  10143a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10143e:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101441:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101445:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10144c:	83 c8 40             	or     $0x40,%eax
  10144f:	0f b6 c0             	movzbl %al,%eax
  101452:	f7 d0                	not    %eax
  101454:	89 c2                	mov    %eax,%edx
  101456:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10145b:	21 d0                	and    %edx,%eax
  10145d:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101462:	b8 00 00 00 00       	mov    $0x0,%eax
  101467:	e9 da 00 00 00       	jmp    101546 <kbd_proc_data+0x18b>
    } else if (shift & E0ESC) {
  10146c:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101471:	83 e0 40             	and    $0x40,%eax
  101474:	85 c0                	test   %eax,%eax
  101476:	74 11                	je     101489 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101478:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  10147c:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101481:	83 e0 bf             	and    $0xffffffbf,%eax
  101484:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  101489:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10148d:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101494:	0f b6 d0             	movzbl %al,%edx
  101497:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10149c:	09 d0                	or     %edx,%eax
  10149e:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  1014a3:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014a7:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  1014ae:	0f b6 d0             	movzbl %al,%edx
  1014b1:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014b6:	31 d0                	xor    %edx,%eax
  1014b8:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014bd:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014c2:	83 e0 03             	and    $0x3,%eax
  1014c5:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014cc:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014d0:	01 d0                	add    %edx,%eax
  1014d2:	0f b6 00             	movzbl (%eax),%eax
  1014d5:	0f b6 c0             	movzbl %al,%eax
  1014d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014db:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014e0:	83 e0 08             	and    $0x8,%eax
  1014e3:	85 c0                	test   %eax,%eax
  1014e5:	74 22                	je     101509 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1014e7:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014eb:	7e 0c                	jle    1014f9 <kbd_proc_data+0x13e>
  1014ed:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014f1:	7f 06                	jg     1014f9 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014f3:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014f7:	eb 10                	jmp    101509 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014f9:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014fd:	7e 0a                	jle    101509 <kbd_proc_data+0x14e>
  1014ff:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  101503:	7f 04                	jg     101509 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  101505:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101509:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10150e:	f7 d0                	not    %eax
  101510:	83 e0 06             	and    $0x6,%eax
  101513:	85 c0                	test   %eax,%eax
  101515:	75 2c                	jne    101543 <kbd_proc_data+0x188>
  101517:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  10151e:	75 23                	jne    101543 <kbd_proc_data+0x188>
        cprintf("Rebooting!\n");
  101520:	83 ec 0c             	sub    $0xc,%esp
  101523:	68 99 38 10 00       	push   $0x103899
  101528:	e8 20 ed ff ff       	call   10024d <cprintf>
  10152d:	83 c4 10             	add    $0x10,%esp
  101530:	66 c7 45 ee 92 00    	movw   $0x92,-0x12(%ebp)
  101536:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10153a:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10153e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101542:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101543:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101546:	c9                   	leave  
  101547:	c3                   	ret    

00101548 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101548:	55                   	push   %ebp
  101549:	89 e5                	mov    %esp,%ebp
  10154b:	83 ec 08             	sub    $0x8,%esp
    cons_intr(kbd_proc_data);
  10154e:	83 ec 0c             	sub    $0xc,%esp
  101551:	68 bb 13 10 00       	push   $0x1013bb
  101556:	e8 9b fd ff ff       	call   1012f6 <cons_intr>
  10155b:	83 c4 10             	add    $0x10,%esp
}
  10155e:	90                   	nop
  10155f:	c9                   	leave  
  101560:	c3                   	ret    

00101561 <kbd_init>:

static void
kbd_init(void) {
  101561:	55                   	push   %ebp
  101562:	89 e5                	mov    %esp,%ebp
  101564:	83 ec 08             	sub    $0x8,%esp
    // drain the kbd buffer
    kbd_intr();
  101567:	e8 dc ff ff ff       	call   101548 <kbd_intr>
    pic_enable(IRQ_KBD);
  10156c:	83 ec 0c             	sub    $0xc,%esp
  10156f:	6a 01                	push   $0x1
  101571:	e8 1c 01 00 00       	call   101692 <pic_enable>
  101576:	83 c4 10             	add    $0x10,%esp
}
  101579:	90                   	nop
  10157a:	c9                   	leave  
  10157b:	c3                   	ret    

0010157c <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  10157c:	55                   	push   %ebp
  10157d:	89 e5                	mov    %esp,%ebp
  10157f:	83 ec 08             	sub    $0x8,%esp
    cga_init();
  101582:	e8 8c f8 ff ff       	call   100e13 <cga_init>
    serial_init();
  101587:	e8 6e f9 ff ff       	call   100efa <serial_init>
    kbd_init();
  10158c:	e8 d0 ff ff ff       	call   101561 <kbd_init>
    if (!serial_exists) {
  101591:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101596:	85 c0                	test   %eax,%eax
  101598:	75 10                	jne    1015aa <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  10159a:	83 ec 0c             	sub    $0xc,%esp
  10159d:	68 a5 38 10 00       	push   $0x1038a5
  1015a2:	e8 a6 ec ff ff       	call   10024d <cprintf>
  1015a7:	83 c4 10             	add    $0x10,%esp
    }
}
  1015aa:	90                   	nop
  1015ab:	c9                   	leave  
  1015ac:	c3                   	ret    

001015ad <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1015ad:	55                   	push   %ebp
  1015ae:	89 e5                	mov    %esp,%ebp
  1015b0:	83 ec 08             	sub    $0x8,%esp
    lpt_putc(c);
  1015b3:	ff 75 08             	pushl  0x8(%ebp)
  1015b6:	e8 9e fa ff ff       	call   101059 <lpt_putc>
  1015bb:	83 c4 04             	add    $0x4,%esp
    cga_putc(c);
  1015be:	83 ec 0c             	sub    $0xc,%esp
  1015c1:	ff 75 08             	pushl  0x8(%ebp)
  1015c4:	e8 c7 fa ff ff       	call   101090 <cga_putc>
  1015c9:	83 c4 10             	add    $0x10,%esp
    serial_putc(c);
  1015cc:	83 ec 0c             	sub    $0xc,%esp
  1015cf:	ff 75 08             	pushl  0x8(%ebp)
  1015d2:	e8 e8 fc ff ff       	call   1012bf <serial_putc>
  1015d7:	83 c4 10             	add    $0x10,%esp
}
  1015da:	90                   	nop
  1015db:	c9                   	leave  
  1015dc:	c3                   	ret    

001015dd <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015dd:	55                   	push   %ebp
  1015de:	89 e5                	mov    %esp,%ebp
  1015e0:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015e3:	e8 b1 fd ff ff       	call   101399 <serial_intr>
    kbd_intr();
  1015e8:	e8 5b ff ff ff       	call   101548 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015ed:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015f3:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015f8:	39 c2                	cmp    %eax,%edx
  1015fa:	74 36                	je     101632 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015fc:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101601:	8d 50 01             	lea    0x1(%eax),%edx
  101604:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  10160a:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  101611:	0f b6 c0             	movzbl %al,%eax
  101614:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101617:	a1 80 f0 10 00       	mov    0x10f080,%eax
  10161c:	3d 00 02 00 00       	cmp    $0x200,%eax
  101621:	75 0a                	jne    10162d <cons_getc+0x50>
            cons.rpos = 0;
  101623:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  10162a:	00 00 00 
        }
        return c;
  10162d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101630:	eb 05                	jmp    101637 <cons_getc+0x5a>
    }
    return 0;
  101632:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101637:	c9                   	leave  
  101638:	c3                   	ret    

00101639 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101639:	55                   	push   %ebp
  10163a:	89 e5                	mov    %esp,%ebp
  10163c:	83 ec 14             	sub    $0x14,%esp
  10163f:	8b 45 08             	mov    0x8(%ebp),%eax
  101642:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101646:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10164a:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  101650:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101655:	85 c0                	test   %eax,%eax
  101657:	74 36                	je     10168f <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  101659:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10165d:	0f b6 c0             	movzbl %al,%eax
  101660:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101666:	88 45 fa             	mov    %al,-0x6(%ebp)
  101669:	0f b6 45 fa          	movzbl -0x6(%ebp),%eax
  10166d:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101671:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  101672:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101676:	66 c1 e8 08          	shr    $0x8,%ax
  10167a:	0f b6 c0             	movzbl %al,%eax
  10167d:	66 c7 45 fc a1 00    	movw   $0xa1,-0x4(%ebp)
  101683:	88 45 fb             	mov    %al,-0x5(%ebp)
  101686:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  10168a:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  10168e:	ee                   	out    %al,(%dx)
    }
}
  10168f:	90                   	nop
  101690:	c9                   	leave  
  101691:	c3                   	ret    

00101692 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101692:	55                   	push   %ebp
  101693:	89 e5                	mov    %esp,%ebp
    pic_setmask(irq_mask & ~(1 << irq));
  101695:	8b 45 08             	mov    0x8(%ebp),%eax
  101698:	ba 01 00 00 00       	mov    $0x1,%edx
  10169d:	89 c1                	mov    %eax,%ecx
  10169f:	d3 e2                	shl    %cl,%edx
  1016a1:	89 d0                	mov    %edx,%eax
  1016a3:	f7 d0                	not    %eax
  1016a5:	89 c2                	mov    %eax,%edx
  1016a7:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1016ae:	21 d0                	and    %edx,%eax
  1016b0:	0f b7 c0             	movzwl %ax,%eax
  1016b3:	50                   	push   %eax
  1016b4:	e8 80 ff ff ff       	call   101639 <pic_setmask>
  1016b9:	83 c4 04             	add    $0x4,%esp
}
  1016bc:	90                   	nop
  1016bd:	c9                   	leave  
  1016be:	c3                   	ret    

001016bf <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016bf:	55                   	push   %ebp
  1016c0:	89 e5                	mov    %esp,%ebp
  1016c2:	83 ec 30             	sub    $0x30,%esp
    did_init = 1;
  1016c5:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016cc:	00 00 00 
  1016cf:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016d5:	c6 45 d6 ff          	movb   $0xff,-0x2a(%ebp)
  1016d9:	0f b6 45 d6          	movzbl -0x2a(%ebp),%eax
  1016dd:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016e1:	ee                   	out    %al,(%dx)
  1016e2:	66 c7 45 fc a1 00    	movw   $0xa1,-0x4(%ebp)
  1016e8:	c6 45 d7 ff          	movb   $0xff,-0x29(%ebp)
  1016ec:	0f b6 45 d7          	movzbl -0x29(%ebp),%eax
  1016f0:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  1016f4:	ee                   	out    %al,(%dx)
  1016f5:	66 c7 45 fa 20 00    	movw   $0x20,-0x6(%ebp)
  1016fb:	c6 45 d8 11          	movb   $0x11,-0x28(%ebp)
  1016ff:	0f b6 45 d8          	movzbl -0x28(%ebp),%eax
  101703:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101707:	ee                   	out    %al,(%dx)
  101708:	66 c7 45 f8 21 00    	movw   $0x21,-0x8(%ebp)
  10170e:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
  101712:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101716:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  10171a:	ee                   	out    %al,(%dx)
  10171b:	66 c7 45 f6 21 00    	movw   $0x21,-0xa(%ebp)
  101721:	c6 45 da 04          	movb   $0x4,-0x26(%ebp)
  101725:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
  101729:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10172d:	ee                   	out    %al,(%dx)
  10172e:	66 c7 45 f4 21 00    	movw   $0x21,-0xc(%ebp)
  101734:	c6 45 db 03          	movb   $0x3,-0x25(%ebp)
  101738:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  10173c:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  101740:	ee                   	out    %al,(%dx)
  101741:	66 c7 45 f2 a0 00    	movw   $0xa0,-0xe(%ebp)
  101747:	c6 45 dc 11          	movb   $0x11,-0x24(%ebp)
  10174b:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  10174f:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101753:	ee                   	out    %al,(%dx)
  101754:	66 c7 45 f0 a1 00    	movw   $0xa1,-0x10(%ebp)
  10175a:	c6 45 dd 28          	movb   $0x28,-0x23(%ebp)
  10175e:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101762:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  101766:	ee                   	out    %al,(%dx)
  101767:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  10176d:	c6 45 de 02          	movb   $0x2,-0x22(%ebp)
  101771:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  101775:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101779:	ee                   	out    %al,(%dx)
  10177a:	66 c7 45 ec a1 00    	movw   $0xa1,-0x14(%ebp)
  101780:	c6 45 df 03          	movb   $0x3,-0x21(%ebp)
  101784:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  101788:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  10178c:	ee                   	out    %al,(%dx)
  10178d:	66 c7 45 ea 20 00    	movw   $0x20,-0x16(%ebp)
  101793:	c6 45 e0 68          	movb   $0x68,-0x20(%ebp)
  101797:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  10179b:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10179f:	ee                   	out    %al,(%dx)
  1017a0:	66 c7 45 e8 20 00    	movw   $0x20,-0x18(%ebp)
  1017a6:	c6 45 e1 0a          	movb   $0xa,-0x1f(%ebp)
  1017aa:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  1017ae:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  1017b2:	ee                   	out    %al,(%dx)
  1017b3:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  1017b9:	c6 45 e2 68          	movb   $0x68,-0x1e(%ebp)
  1017bd:	0f b6 45 e2          	movzbl -0x1e(%ebp),%eax
  1017c1:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1017c5:	ee                   	out    %al,(%dx)
  1017c6:	66 c7 45 e4 a0 00    	movw   $0xa0,-0x1c(%ebp)
  1017cc:	c6 45 e3 0a          	movb   $0xa,-0x1d(%ebp)
  1017d0:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
  1017d4:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
  1017d8:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017d9:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017e0:	66 83 f8 ff          	cmp    $0xffff,%ax
  1017e4:	74 13                	je     1017f9 <pic_init+0x13a>
        pic_setmask(irq_mask);
  1017e6:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017ed:	0f b7 c0             	movzwl %ax,%eax
  1017f0:	50                   	push   %eax
  1017f1:	e8 43 fe ff ff       	call   101639 <pic_setmask>
  1017f6:	83 c4 04             	add    $0x4,%esp
    }
}
  1017f9:	90                   	nop
  1017fa:	c9                   	leave  
  1017fb:	c3                   	ret    

001017fc <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1017fc:	55                   	push   %ebp
  1017fd:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1017ff:	fb                   	sti    
    sti();
}
  101800:	90                   	nop
  101801:	5d                   	pop    %ebp
  101802:	c3                   	ret    

00101803 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  101803:	55                   	push   %ebp
  101804:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  101806:	fa                   	cli    
    cli();
}
  101807:	90                   	nop
  101808:	5d                   	pop    %ebp
  101809:	c3                   	ret    

0010180a <print_ticks>:
#include <console.h>
#include <kdebug.h>
#include <string.h>
#define TICK_NUM 100

static void print_ticks() {
  10180a:	55                   	push   %ebp
  10180b:	89 e5                	mov    %esp,%ebp
  10180d:	83 ec 08             	sub    $0x8,%esp
    cprintf("%d ticks\n",TICK_NUM);
  101810:	83 ec 08             	sub    $0x8,%esp
  101813:	6a 64                	push   $0x64
  101815:	68 e0 38 10 00       	push   $0x1038e0
  10181a:	e8 2e ea ff ff       	call   10024d <cprintf>
  10181f:	83 c4 10             	add    $0x10,%esp
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101822:	90                   	nop
  101823:	c9                   	leave  
  101824:	c3                   	ret    

00101825 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101825:	55                   	push   %ebp
  101826:	89 e5                	mov    %esp,%ebp
  101828:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
	 extern uintptr_t __vectors[];
	 int i;
	 for(i = 0;  i < 256; ++i){
  10182b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101832:	e9 c3 00 00 00       	jmp    1018fa <idt_init+0xd5>
		 SETGATE(idt[i],0,GD_KTEXT,__vectors[i],DPL_KERNEL);
  101837:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10183a:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101841:	89 c2                	mov    %eax,%edx
  101843:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101846:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  10184d:	00 
  10184e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101851:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  101858:	00 08 00 
  10185b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10185e:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101865:	00 
  101866:	83 e2 e0             	and    $0xffffffe0,%edx
  101869:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101870:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101873:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  10187a:	00 
  10187b:	83 e2 1f             	and    $0x1f,%edx
  10187e:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101885:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101888:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10188f:	00 
  101890:	83 e2 f0             	and    $0xfffffff0,%edx
  101893:	83 ca 0e             	or     $0xe,%edx
  101896:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10189d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018a0:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018a7:	00 
  1018a8:	83 e2 ef             	and    $0xffffffef,%edx
  1018ab:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018b5:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018bc:	00 
  1018bd:	83 e2 9f             	and    $0xffffff9f,%edx
  1018c0:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ca:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018d1:	00 
  1018d2:	83 ca 80             	or     $0xffffff80,%edx
  1018d5:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018df:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018e6:	c1 e8 10             	shr    $0x10,%eax
  1018e9:	89 c2                	mov    %eax,%edx
  1018eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ee:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  1018f5:	00 
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
	 extern uintptr_t __vectors[];
	 int i;
	 for(i = 0;  i < 256; ++i){
  1018f6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1018fa:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  101901:	0f 8e 30 ff ff ff    	jle    101837 <idt_init+0x12>
		 SETGATE(idt[i],0,GD_KTEXT,__vectors[i],DPL_KERNEL);
	 }   

	 SETGATE(idt[T_SWITCH_TOK],0,GD_KTEXT,__vectors[T_SWITCH_TOK],DPL_USER);
  101907:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  10190c:	66 a3 68 f4 10 00    	mov    %ax,0x10f468
  101912:	66 c7 05 6a f4 10 00 	movw   $0x8,0x10f46a
  101919:	08 00 
  10191b:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  101922:	83 e0 e0             	and    $0xffffffe0,%eax
  101925:	a2 6c f4 10 00       	mov    %al,0x10f46c
  10192a:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  101931:	83 e0 1f             	and    $0x1f,%eax
  101934:	a2 6c f4 10 00       	mov    %al,0x10f46c
  101939:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101940:	83 e0 f0             	and    $0xfffffff0,%eax
  101943:	83 c8 0e             	or     $0xe,%eax
  101946:	a2 6d f4 10 00       	mov    %al,0x10f46d
  10194b:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101952:	83 e0 ef             	and    $0xffffffef,%eax
  101955:	a2 6d f4 10 00       	mov    %al,0x10f46d
  10195a:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101961:	83 c8 60             	or     $0x60,%eax
  101964:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101969:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101970:	83 c8 80             	or     $0xffffff80,%eax
  101973:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101978:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  10197d:	c1 e8 10             	shr    $0x10,%eax
  101980:	66 a3 6e f4 10 00    	mov    %ax,0x10f46e
  101986:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  10198d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101990:	0f 01 18             	lidtl  (%eax)

	 lidt(&idt_pd); 
}
  101993:	90                   	nop
  101994:	c9                   	leave  
  101995:	c3                   	ret    

00101996 <trapname>:

static const char *
trapname(int trapno) {
  101996:	55                   	push   %ebp
  101997:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101999:	8b 45 08             	mov    0x8(%ebp),%eax
  10199c:	83 f8 13             	cmp    $0x13,%eax
  10199f:	77 0c                	ja     1019ad <trapname+0x17>
        return excnames[trapno];
  1019a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1019a4:	8b 04 85 40 3c 10 00 	mov    0x103c40(,%eax,4),%eax
  1019ab:	eb 18                	jmp    1019c5 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  1019ad:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1019b1:	7e 0d                	jle    1019c0 <trapname+0x2a>
  1019b3:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1019b7:	7f 07                	jg     1019c0 <trapname+0x2a>
        return "Hardware Interrupt";
  1019b9:	b8 ea 38 10 00       	mov    $0x1038ea,%eax
  1019be:	eb 05                	jmp    1019c5 <trapname+0x2f>
    }
    return "(unknown trap)";
  1019c0:	b8 fd 38 10 00       	mov    $0x1038fd,%eax
}
  1019c5:	5d                   	pop    %ebp
  1019c6:	c3                   	ret    

001019c7 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1019c7:	55                   	push   %ebp
  1019c8:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1019ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1019cd:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1019d1:	66 83 f8 08          	cmp    $0x8,%ax
  1019d5:	0f 94 c0             	sete   %al
  1019d8:	0f b6 c0             	movzbl %al,%eax
}
  1019db:	5d                   	pop    %ebp
  1019dc:	c3                   	ret    

001019dd <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  1019dd:	55                   	push   %ebp
  1019de:	89 e5                	mov    %esp,%ebp
  1019e0:	83 ec 18             	sub    $0x18,%esp
    cprintf("trapframe at %p\n", tf);
  1019e3:	83 ec 08             	sub    $0x8,%esp
  1019e6:	ff 75 08             	pushl  0x8(%ebp)
  1019e9:	68 3e 39 10 00       	push   $0x10393e
  1019ee:	e8 5a e8 ff ff       	call   10024d <cprintf>
  1019f3:	83 c4 10             	add    $0x10,%esp
    print_regs(&tf->tf_regs);
  1019f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f9:	83 ec 0c             	sub    $0xc,%esp
  1019fc:	50                   	push   %eax
  1019fd:	e8 b8 01 00 00       	call   101bba <print_regs>
  101a02:	83 c4 10             	add    $0x10,%esp
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101a05:	8b 45 08             	mov    0x8(%ebp),%eax
  101a08:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101a0c:	0f b7 c0             	movzwl %ax,%eax
  101a0f:	83 ec 08             	sub    $0x8,%esp
  101a12:	50                   	push   %eax
  101a13:	68 4f 39 10 00       	push   $0x10394f
  101a18:	e8 30 e8 ff ff       	call   10024d <cprintf>
  101a1d:	83 c4 10             	add    $0x10,%esp
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101a20:	8b 45 08             	mov    0x8(%ebp),%eax
  101a23:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101a27:	0f b7 c0             	movzwl %ax,%eax
  101a2a:	83 ec 08             	sub    $0x8,%esp
  101a2d:	50                   	push   %eax
  101a2e:	68 62 39 10 00       	push   $0x103962
  101a33:	e8 15 e8 ff ff       	call   10024d <cprintf>
  101a38:	83 c4 10             	add    $0x10,%esp
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101a3b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a3e:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101a42:	0f b7 c0             	movzwl %ax,%eax
  101a45:	83 ec 08             	sub    $0x8,%esp
  101a48:	50                   	push   %eax
  101a49:	68 75 39 10 00       	push   $0x103975
  101a4e:	e8 fa e7 ff ff       	call   10024d <cprintf>
  101a53:	83 c4 10             	add    $0x10,%esp
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a56:	8b 45 08             	mov    0x8(%ebp),%eax
  101a59:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a5d:	0f b7 c0             	movzwl %ax,%eax
  101a60:	83 ec 08             	sub    $0x8,%esp
  101a63:	50                   	push   %eax
  101a64:	68 88 39 10 00       	push   $0x103988
  101a69:	e8 df e7 ff ff       	call   10024d <cprintf>
  101a6e:	83 c4 10             	add    $0x10,%esp
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a71:	8b 45 08             	mov    0x8(%ebp),%eax
  101a74:	8b 40 30             	mov    0x30(%eax),%eax
  101a77:	83 ec 0c             	sub    $0xc,%esp
  101a7a:	50                   	push   %eax
  101a7b:	e8 16 ff ff ff       	call   101996 <trapname>
  101a80:	83 c4 10             	add    $0x10,%esp
  101a83:	89 c2                	mov    %eax,%edx
  101a85:	8b 45 08             	mov    0x8(%ebp),%eax
  101a88:	8b 40 30             	mov    0x30(%eax),%eax
  101a8b:	83 ec 04             	sub    $0x4,%esp
  101a8e:	52                   	push   %edx
  101a8f:	50                   	push   %eax
  101a90:	68 9b 39 10 00       	push   $0x10399b
  101a95:	e8 b3 e7 ff ff       	call   10024d <cprintf>
  101a9a:	83 c4 10             	add    $0x10,%esp
    cprintf("  err  0x%08x\n", tf->tf_err);
  101a9d:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa0:	8b 40 34             	mov    0x34(%eax),%eax
  101aa3:	83 ec 08             	sub    $0x8,%esp
  101aa6:	50                   	push   %eax
  101aa7:	68 ad 39 10 00       	push   $0x1039ad
  101aac:	e8 9c e7 ff ff       	call   10024d <cprintf>
  101ab1:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101ab4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ab7:	8b 40 38             	mov    0x38(%eax),%eax
  101aba:	83 ec 08             	sub    $0x8,%esp
  101abd:	50                   	push   %eax
  101abe:	68 bc 39 10 00       	push   $0x1039bc
  101ac3:	e8 85 e7 ff ff       	call   10024d <cprintf>
  101ac8:	83 c4 10             	add    $0x10,%esp
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101acb:	8b 45 08             	mov    0x8(%ebp),%eax
  101ace:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101ad2:	0f b7 c0             	movzwl %ax,%eax
  101ad5:	83 ec 08             	sub    $0x8,%esp
  101ad8:	50                   	push   %eax
  101ad9:	68 cb 39 10 00       	push   $0x1039cb
  101ade:	e8 6a e7 ff ff       	call   10024d <cprintf>
  101ae3:	83 c4 10             	add    $0x10,%esp
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101ae6:	8b 45 08             	mov    0x8(%ebp),%eax
  101ae9:	8b 40 40             	mov    0x40(%eax),%eax
  101aec:	83 ec 08             	sub    $0x8,%esp
  101aef:	50                   	push   %eax
  101af0:	68 de 39 10 00       	push   $0x1039de
  101af5:	e8 53 e7 ff ff       	call   10024d <cprintf>
  101afa:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101afd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101b04:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101b0b:	eb 3f                	jmp    101b4c <print_trapframe+0x16f>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101b0d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b10:	8b 50 40             	mov    0x40(%eax),%edx
  101b13:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b16:	21 d0                	and    %edx,%eax
  101b18:	85 c0                	test   %eax,%eax
  101b1a:	74 29                	je     101b45 <print_trapframe+0x168>
  101b1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b1f:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b26:	85 c0                	test   %eax,%eax
  101b28:	74 1b                	je     101b45 <print_trapframe+0x168>
            cprintf("%s,", IA32flags[i]);
  101b2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b2d:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b34:	83 ec 08             	sub    $0x8,%esp
  101b37:	50                   	push   %eax
  101b38:	68 ed 39 10 00       	push   $0x1039ed
  101b3d:	e8 0b e7 ff ff       	call   10024d <cprintf>
  101b42:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b45:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101b49:	d1 65 f0             	shll   -0x10(%ebp)
  101b4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b4f:	83 f8 17             	cmp    $0x17,%eax
  101b52:	76 b9                	jbe    101b0d <print_trapframe+0x130>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b54:	8b 45 08             	mov    0x8(%ebp),%eax
  101b57:	8b 40 40             	mov    0x40(%eax),%eax
  101b5a:	25 00 30 00 00       	and    $0x3000,%eax
  101b5f:	c1 e8 0c             	shr    $0xc,%eax
  101b62:	83 ec 08             	sub    $0x8,%esp
  101b65:	50                   	push   %eax
  101b66:	68 f1 39 10 00       	push   $0x1039f1
  101b6b:	e8 dd e6 ff ff       	call   10024d <cprintf>
  101b70:	83 c4 10             	add    $0x10,%esp

    if (!trap_in_kernel(tf)) {
  101b73:	83 ec 0c             	sub    $0xc,%esp
  101b76:	ff 75 08             	pushl  0x8(%ebp)
  101b79:	e8 49 fe ff ff       	call   1019c7 <trap_in_kernel>
  101b7e:	83 c4 10             	add    $0x10,%esp
  101b81:	85 c0                	test   %eax,%eax
  101b83:	75 32                	jne    101bb7 <print_trapframe+0x1da>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b85:	8b 45 08             	mov    0x8(%ebp),%eax
  101b88:	8b 40 44             	mov    0x44(%eax),%eax
  101b8b:	83 ec 08             	sub    $0x8,%esp
  101b8e:	50                   	push   %eax
  101b8f:	68 fa 39 10 00       	push   $0x1039fa
  101b94:	e8 b4 e6 ff ff       	call   10024d <cprintf>
  101b99:	83 c4 10             	add    $0x10,%esp
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101b9c:	8b 45 08             	mov    0x8(%ebp),%eax
  101b9f:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101ba3:	0f b7 c0             	movzwl %ax,%eax
  101ba6:	83 ec 08             	sub    $0x8,%esp
  101ba9:	50                   	push   %eax
  101baa:	68 09 3a 10 00       	push   $0x103a09
  101baf:	e8 99 e6 ff ff       	call   10024d <cprintf>
  101bb4:	83 c4 10             	add    $0x10,%esp
    }
}
  101bb7:	90                   	nop
  101bb8:	c9                   	leave  
  101bb9:	c3                   	ret    

00101bba <print_regs>:

void
print_regs(struct pushregs *regs) {
  101bba:	55                   	push   %ebp
  101bbb:	89 e5                	mov    %esp,%ebp
  101bbd:	83 ec 08             	sub    $0x8,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101bc0:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc3:	8b 00                	mov    (%eax),%eax
  101bc5:	83 ec 08             	sub    $0x8,%esp
  101bc8:	50                   	push   %eax
  101bc9:	68 1c 3a 10 00       	push   $0x103a1c
  101bce:	e8 7a e6 ff ff       	call   10024d <cprintf>
  101bd3:	83 c4 10             	add    $0x10,%esp
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101bd6:	8b 45 08             	mov    0x8(%ebp),%eax
  101bd9:	8b 40 04             	mov    0x4(%eax),%eax
  101bdc:	83 ec 08             	sub    $0x8,%esp
  101bdf:	50                   	push   %eax
  101be0:	68 2b 3a 10 00       	push   $0x103a2b
  101be5:	e8 63 e6 ff ff       	call   10024d <cprintf>
  101bea:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101bed:	8b 45 08             	mov    0x8(%ebp),%eax
  101bf0:	8b 40 08             	mov    0x8(%eax),%eax
  101bf3:	83 ec 08             	sub    $0x8,%esp
  101bf6:	50                   	push   %eax
  101bf7:	68 3a 3a 10 00       	push   $0x103a3a
  101bfc:	e8 4c e6 ff ff       	call   10024d <cprintf>
  101c01:	83 c4 10             	add    $0x10,%esp
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101c04:	8b 45 08             	mov    0x8(%ebp),%eax
  101c07:	8b 40 0c             	mov    0xc(%eax),%eax
  101c0a:	83 ec 08             	sub    $0x8,%esp
  101c0d:	50                   	push   %eax
  101c0e:	68 49 3a 10 00       	push   $0x103a49
  101c13:	e8 35 e6 ff ff       	call   10024d <cprintf>
  101c18:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101c1b:	8b 45 08             	mov    0x8(%ebp),%eax
  101c1e:	8b 40 10             	mov    0x10(%eax),%eax
  101c21:	83 ec 08             	sub    $0x8,%esp
  101c24:	50                   	push   %eax
  101c25:	68 58 3a 10 00       	push   $0x103a58
  101c2a:	e8 1e e6 ff ff       	call   10024d <cprintf>
  101c2f:	83 c4 10             	add    $0x10,%esp
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101c32:	8b 45 08             	mov    0x8(%ebp),%eax
  101c35:	8b 40 14             	mov    0x14(%eax),%eax
  101c38:	83 ec 08             	sub    $0x8,%esp
  101c3b:	50                   	push   %eax
  101c3c:	68 67 3a 10 00       	push   $0x103a67
  101c41:	e8 07 e6 ff ff       	call   10024d <cprintf>
  101c46:	83 c4 10             	add    $0x10,%esp
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101c49:	8b 45 08             	mov    0x8(%ebp),%eax
  101c4c:	8b 40 18             	mov    0x18(%eax),%eax
  101c4f:	83 ec 08             	sub    $0x8,%esp
  101c52:	50                   	push   %eax
  101c53:	68 76 3a 10 00       	push   $0x103a76
  101c58:	e8 f0 e5 ff ff       	call   10024d <cprintf>
  101c5d:	83 c4 10             	add    $0x10,%esp
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c60:	8b 45 08             	mov    0x8(%ebp),%eax
  101c63:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c66:	83 ec 08             	sub    $0x8,%esp
  101c69:	50                   	push   %eax
  101c6a:	68 85 3a 10 00       	push   $0x103a85
  101c6f:	e8 d9 e5 ff ff       	call   10024d <cprintf>
  101c74:	83 c4 10             	add    $0x10,%esp
}
  101c77:	90                   	nop
  101c78:	c9                   	leave  
  101c79:	c3                   	ret    

00101c7a <trap_dispatch>:

struct trapframe switchk2u, *switchu2k;

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101c7a:	55                   	push   %ebp
  101c7b:	89 e5                	mov    %esp,%ebp
  101c7d:	57                   	push   %edi
  101c7e:	56                   	push   %esi
  101c7f:	53                   	push   %ebx
  101c80:	83 ec 1c             	sub    $0x1c,%esp
    char c;

    switch (tf->tf_trapno) {
  101c83:	8b 45 08             	mov    0x8(%ebp),%eax
  101c86:	8b 40 30             	mov    0x30(%eax),%eax
  101c89:	83 f8 2f             	cmp    $0x2f,%eax
  101c8c:	77 21                	ja     101caf <trap_dispatch+0x35>
  101c8e:	83 f8 2e             	cmp    $0x2e,%eax
  101c91:	0f 83 ff 01 00 00    	jae    101e96 <trap_dispatch+0x21c>
  101c97:	83 f8 21             	cmp    $0x21,%eax
  101c9a:	0f 84 87 00 00 00    	je     101d27 <trap_dispatch+0xad>
  101ca0:	83 f8 24             	cmp    $0x24,%eax
  101ca3:	74 5b                	je     101d00 <trap_dispatch+0x86>
  101ca5:	83 f8 20             	cmp    $0x20,%eax
  101ca8:	74 1c                	je     101cc6 <trap_dispatch+0x4c>
  101caa:	e9 b1 01 00 00       	jmp    101e60 <trap_dispatch+0x1e6>
  101caf:	83 f8 78             	cmp    $0x78,%eax
  101cb2:	0f 84 96 00 00 00    	je     101d4e <trap_dispatch+0xd4>
  101cb8:	83 f8 79             	cmp    $0x79,%eax
  101cbb:	0f 84 29 01 00 00    	je     101dea <trap_dispatch+0x170>
  101cc1:	e9 9a 01 00 00       	jmp    101e60 <trap_dispatch+0x1e6>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
		++ticks;
  101cc6:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101ccb:	83 c0 01             	add    $0x1,%eax
  101cce:	a3 08 f9 10 00       	mov    %eax,0x10f908
		if ((ticks % TICK_NUM == 0)){
  101cd3:	8b 0d 08 f9 10 00    	mov    0x10f908,%ecx
  101cd9:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101cde:	89 c8                	mov    %ecx,%eax
  101ce0:	f7 e2                	mul    %edx
  101ce2:	89 d0                	mov    %edx,%eax
  101ce4:	c1 e8 05             	shr    $0x5,%eax
  101ce7:	6b c0 64             	imul   $0x64,%eax,%eax
  101cea:	29 c1                	sub    %eax,%ecx
  101cec:	89 c8                	mov    %ecx,%eax
  101cee:	85 c0                	test   %eax,%eax
  101cf0:	0f 85 a3 01 00 00    	jne    101e99 <trap_dispatch+0x21f>
			print_ticks();
  101cf6:	e8 0f fb ff ff       	call   10180a <print_ticks>
		}
        break;
  101cfb:	e9 99 01 00 00       	jmp    101e99 <trap_dispatch+0x21f>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101d00:	e8 d8 f8 ff ff       	call   1015dd <cons_getc>
  101d05:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101d08:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101d0c:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101d10:	83 ec 04             	sub    $0x4,%esp
  101d13:	52                   	push   %edx
  101d14:	50                   	push   %eax
  101d15:	68 94 3a 10 00       	push   $0x103a94
  101d1a:	e8 2e e5 ff ff       	call   10024d <cprintf>
  101d1f:	83 c4 10             	add    $0x10,%esp
        break;
  101d22:	e9 79 01 00 00       	jmp    101ea0 <trap_dispatch+0x226>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101d27:	e8 b1 f8 ff ff       	call   1015dd <cons_getc>
  101d2c:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101d2f:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101d33:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101d37:	83 ec 04             	sub    $0x4,%esp
  101d3a:	52                   	push   %edx
  101d3b:	50                   	push   %eax
  101d3c:	68 a6 3a 10 00       	push   $0x103aa6
  101d41:	e8 07 e5 ff ff       	call   10024d <cprintf>
  101d46:	83 c4 10             	add    $0x10,%esp
        break;
  101d49:	e9 52 01 00 00       	jmp    101ea0 <trap_dispatch+0x226>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
		if (tf->tf_cs != USER_CS){
  101d4e:	8b 45 08             	mov    0x8(%ebp),%eax
  101d51:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d55:	66 83 f8 1b          	cmp    $0x1b,%ax
  101d59:	0f 84 3d 01 00 00    	je     101e9c <trap_dispatch+0x222>
			switchk2u = *tf;
  101d5f:	8b 55 08             	mov    0x8(%ebp),%edx
  101d62:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  101d67:	89 d3                	mov    %edx,%ebx
  101d69:	ba 4c 00 00 00       	mov    $0x4c,%edx
  101d6e:	8b 0b                	mov    (%ebx),%ecx
  101d70:	89 08                	mov    %ecx,(%eax)
  101d72:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
  101d76:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
  101d7a:	8d 78 04             	lea    0x4(%eax),%edi
  101d7d:	83 e7 fc             	and    $0xfffffffc,%edi
  101d80:	29 f8                	sub    %edi,%eax
  101d82:	29 c3                	sub    %eax,%ebx
  101d84:	01 c2                	add    %eax,%edx
  101d86:	83 e2 fc             	and    $0xfffffffc,%edx
  101d89:	89 d0                	mov    %edx,%eax
  101d8b:	c1 e8 02             	shr    $0x2,%eax
  101d8e:	89 de                	mov    %ebx,%esi
  101d90:	89 c1                	mov    %eax,%ecx
  101d92:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
			switchk2u.tf_cs = USER_CS;
  101d94:	66 c7 05 5c f9 10 00 	movw   $0x1b,0x10f95c
  101d9b:	1b 00 
			switchk2u.tf_ds = switchk2u.tf_es = switchk2u.tf_ss = USER_DS;
  101d9d:	66 c7 05 68 f9 10 00 	movw   $0x23,0x10f968
  101da4:	23 00 
  101da6:	0f b7 05 68 f9 10 00 	movzwl 0x10f968,%eax
  101dad:	66 a3 48 f9 10 00    	mov    %ax,0x10f948
  101db3:	0f b7 05 48 f9 10 00 	movzwl 0x10f948,%eax
  101dba:	66 a3 4c f9 10 00    	mov    %ax,0x10f94c
			switchk2u.tf_esp = (uint32_t) tf + sizeof(struct trapframe) - 8;
  101dc0:	8b 45 08             	mov    0x8(%ebp),%eax
  101dc3:	83 c0 44             	add    $0x44,%eax
  101dc6:	a3 64 f9 10 00       	mov    %eax,0x10f964



			switchk2u.tf_eflags |= FL_IOPL_MASK;
  101dcb:	a1 60 f9 10 00       	mov    0x10f960,%eax
  101dd0:	80 cc 30             	or     $0x30,%ah
  101dd3:	a3 60 f9 10 00       	mov    %eax,0x10f960



			*((uint32_t *)tf - 1) = (uint32_t) &switchk2u;
  101dd8:	8b 45 08             	mov    0x8(%ebp),%eax
  101ddb:	83 e8 04             	sub    $0x4,%eax
  101dde:	ba 20 f9 10 00       	mov    $0x10f920,%edx
  101de3:	89 10                	mov    %edx,(%eax)
		}
		break;
  101de5:	e9 b2 00 00 00       	jmp    101e9c <trap_dispatch+0x222>
    case T_SWITCH_TOK:
		if (tf->tf_cs != KERNEL_CS) {
  101dea:	8b 45 08             	mov    0x8(%ebp),%eax
  101ded:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101df1:	66 83 f8 08          	cmp    $0x8,%ax
  101df5:	0f 84 a4 00 00 00    	je     101e9f <trap_dispatch+0x225>
			tf->tf_cs = KERNEL_CS;
  101dfb:	8b 45 08             	mov    0x8(%ebp),%eax
  101dfe:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
			tf->tf_ds = tf->tf_es = KERNEL_DS;
  101e04:	8b 45 08             	mov    0x8(%ebp),%eax
  101e07:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101e0d:	8b 45 08             	mov    0x8(%ebp),%eax
  101e10:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101e14:	8b 45 08             	mov    0x8(%ebp),%eax
  101e17:	66 89 50 2c          	mov    %dx,0x2c(%eax)
			tf->tf_eflags &= ~FL_IOPL_MASK;
  101e1b:	8b 45 08             	mov    0x8(%ebp),%eax
  101e1e:	8b 40 40             	mov    0x40(%eax),%eax
  101e21:	80 e4 cf             	and    $0xcf,%ah
  101e24:	89 c2                	mov    %eax,%edx
  101e26:	8b 45 08             	mov    0x8(%ebp),%eax
  101e29:	89 50 40             	mov    %edx,0x40(%eax)
			switchu2k = (struct trapframe *)(tf->tf_esp - (sizeof(struct trapframe) - 8));
  101e2c:	8b 45 08             	mov    0x8(%ebp),%eax
  101e2f:	8b 40 44             	mov    0x44(%eax),%eax
  101e32:	83 e8 44             	sub    $0x44,%eax
  101e35:	a3 6c f9 10 00       	mov    %eax,0x10f96c
			memmove(switchu2k, tf, sizeof(struct trapframe) - 8); 
  101e3a:	a1 6c f9 10 00       	mov    0x10f96c,%eax
  101e3f:	83 ec 04             	sub    $0x4,%esp
  101e42:	6a 44                	push   $0x44
  101e44:	ff 75 08             	pushl  0x8(%ebp)
  101e47:	50                   	push   %eax
  101e48:	e8 bb 0f 00 00       	call   102e08 <memmove>
  101e4d:	83 c4 10             	add    $0x10,%esp
			*((uint32_t *)tf - 1) = (uint32_t)switchu2k;
  101e50:	8b 45 08             	mov    0x8(%ebp),%eax
  101e53:	83 e8 04             	sub    $0x4,%eax
  101e56:	8b 15 6c f9 10 00    	mov    0x10f96c,%edx
  101e5c:	89 10                	mov    %edx,(%eax)
		}
        break;
  101e5e:	eb 3f                	jmp    101e9f <trap_dispatch+0x225>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101e60:	8b 45 08             	mov    0x8(%ebp),%eax
  101e63:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e67:	0f b7 c0             	movzwl %ax,%eax
  101e6a:	83 e0 03             	and    $0x3,%eax
  101e6d:	85 c0                	test   %eax,%eax
  101e6f:	75 2f                	jne    101ea0 <trap_dispatch+0x226>
            print_trapframe(tf);
  101e71:	83 ec 0c             	sub    $0xc,%esp
  101e74:	ff 75 08             	pushl  0x8(%ebp)
  101e77:	e8 61 fb ff ff       	call   1019dd <print_trapframe>
  101e7c:	83 c4 10             	add    $0x10,%esp
            panic("unexpected trap in kernel.\n");
  101e7f:	83 ec 04             	sub    $0x4,%esp
  101e82:	68 b5 3a 10 00       	push   $0x103ab5
  101e87:	68 d2 00 00 00       	push   $0xd2
  101e8c:	68 d1 3a 10 00       	push   $0x103ad1
  101e91:	e8 1d e5 ff ff       	call   1003b3 <__panic>
		}
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101e96:	90                   	nop
  101e97:	eb 07                	jmp    101ea0 <trap_dispatch+0x226>
         */
		++ticks;
		if ((ticks % TICK_NUM == 0)){
			print_ticks();
		}
        break;
  101e99:	90                   	nop
  101e9a:	eb 04                	jmp    101ea0 <trap_dispatch+0x226>



			*((uint32_t *)tf - 1) = (uint32_t) &switchk2u;
		}
		break;
  101e9c:	90                   	nop
  101e9d:	eb 01                	jmp    101ea0 <trap_dispatch+0x226>
			tf->tf_eflags &= ~FL_IOPL_MASK;
			switchu2k = (struct trapframe *)(tf->tf_esp - (sizeof(struct trapframe) - 8));
			memmove(switchu2k, tf, sizeof(struct trapframe) - 8); 
			*((uint32_t *)tf - 1) = (uint32_t)switchu2k;
		}
        break;
  101e9f:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101ea0:	90                   	nop
  101ea1:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101ea4:	5b                   	pop    %ebx
  101ea5:	5e                   	pop    %esi
  101ea6:	5f                   	pop    %edi
  101ea7:	5d                   	pop    %ebp
  101ea8:	c3                   	ret    

00101ea9 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101ea9:	55                   	push   %ebp
  101eaa:	89 e5                	mov    %esp,%ebp
  101eac:	83 ec 08             	sub    $0x8,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101eaf:	83 ec 0c             	sub    $0xc,%esp
  101eb2:	ff 75 08             	pushl  0x8(%ebp)
  101eb5:	e8 c0 fd ff ff       	call   101c7a <trap_dispatch>
  101eba:	83 c4 10             	add    $0x10,%esp
}
  101ebd:	90                   	nop
  101ebe:	c9                   	leave  
  101ebf:	c3                   	ret    

00101ec0 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101ec0:	6a 00                	push   $0x0
  pushl $0
  101ec2:	6a 00                	push   $0x0
  jmp __alltraps
  101ec4:	e9 69 0a 00 00       	jmp    102932 <__alltraps>

00101ec9 <vector1>:
.globl vector1
vector1:
  pushl $0
  101ec9:	6a 00                	push   $0x0
  pushl $1
  101ecb:	6a 01                	push   $0x1
  jmp __alltraps
  101ecd:	e9 60 0a 00 00       	jmp    102932 <__alltraps>

00101ed2 <vector2>:
.globl vector2
vector2:
  pushl $0
  101ed2:	6a 00                	push   $0x0
  pushl $2
  101ed4:	6a 02                	push   $0x2
  jmp __alltraps
  101ed6:	e9 57 0a 00 00       	jmp    102932 <__alltraps>

00101edb <vector3>:
.globl vector3
vector3:
  pushl $0
  101edb:	6a 00                	push   $0x0
  pushl $3
  101edd:	6a 03                	push   $0x3
  jmp __alltraps
  101edf:	e9 4e 0a 00 00       	jmp    102932 <__alltraps>

00101ee4 <vector4>:
.globl vector4
vector4:
  pushl $0
  101ee4:	6a 00                	push   $0x0
  pushl $4
  101ee6:	6a 04                	push   $0x4
  jmp __alltraps
  101ee8:	e9 45 0a 00 00       	jmp    102932 <__alltraps>

00101eed <vector5>:
.globl vector5
vector5:
  pushl $0
  101eed:	6a 00                	push   $0x0
  pushl $5
  101eef:	6a 05                	push   $0x5
  jmp __alltraps
  101ef1:	e9 3c 0a 00 00       	jmp    102932 <__alltraps>

00101ef6 <vector6>:
.globl vector6
vector6:
  pushl $0
  101ef6:	6a 00                	push   $0x0
  pushl $6
  101ef8:	6a 06                	push   $0x6
  jmp __alltraps
  101efa:	e9 33 0a 00 00       	jmp    102932 <__alltraps>

00101eff <vector7>:
.globl vector7
vector7:
  pushl $0
  101eff:	6a 00                	push   $0x0
  pushl $7
  101f01:	6a 07                	push   $0x7
  jmp __alltraps
  101f03:	e9 2a 0a 00 00       	jmp    102932 <__alltraps>

00101f08 <vector8>:
.globl vector8
vector8:
  pushl $8
  101f08:	6a 08                	push   $0x8
  jmp __alltraps
  101f0a:	e9 23 0a 00 00       	jmp    102932 <__alltraps>

00101f0f <vector9>:
.globl vector9
vector9:
  pushl $0
  101f0f:	6a 00                	push   $0x0
  pushl $9
  101f11:	6a 09                	push   $0x9
  jmp __alltraps
  101f13:	e9 1a 0a 00 00       	jmp    102932 <__alltraps>

00101f18 <vector10>:
.globl vector10
vector10:
  pushl $10
  101f18:	6a 0a                	push   $0xa
  jmp __alltraps
  101f1a:	e9 13 0a 00 00       	jmp    102932 <__alltraps>

00101f1f <vector11>:
.globl vector11
vector11:
  pushl $11
  101f1f:	6a 0b                	push   $0xb
  jmp __alltraps
  101f21:	e9 0c 0a 00 00       	jmp    102932 <__alltraps>

00101f26 <vector12>:
.globl vector12
vector12:
  pushl $12
  101f26:	6a 0c                	push   $0xc
  jmp __alltraps
  101f28:	e9 05 0a 00 00       	jmp    102932 <__alltraps>

00101f2d <vector13>:
.globl vector13
vector13:
  pushl $13
  101f2d:	6a 0d                	push   $0xd
  jmp __alltraps
  101f2f:	e9 fe 09 00 00       	jmp    102932 <__alltraps>

00101f34 <vector14>:
.globl vector14
vector14:
  pushl $14
  101f34:	6a 0e                	push   $0xe
  jmp __alltraps
  101f36:	e9 f7 09 00 00       	jmp    102932 <__alltraps>

00101f3b <vector15>:
.globl vector15
vector15:
  pushl $0
  101f3b:	6a 00                	push   $0x0
  pushl $15
  101f3d:	6a 0f                	push   $0xf
  jmp __alltraps
  101f3f:	e9 ee 09 00 00       	jmp    102932 <__alltraps>

00101f44 <vector16>:
.globl vector16
vector16:
  pushl $0
  101f44:	6a 00                	push   $0x0
  pushl $16
  101f46:	6a 10                	push   $0x10
  jmp __alltraps
  101f48:	e9 e5 09 00 00       	jmp    102932 <__alltraps>

00101f4d <vector17>:
.globl vector17
vector17:
  pushl $17
  101f4d:	6a 11                	push   $0x11
  jmp __alltraps
  101f4f:	e9 de 09 00 00       	jmp    102932 <__alltraps>

00101f54 <vector18>:
.globl vector18
vector18:
  pushl $0
  101f54:	6a 00                	push   $0x0
  pushl $18
  101f56:	6a 12                	push   $0x12
  jmp __alltraps
  101f58:	e9 d5 09 00 00       	jmp    102932 <__alltraps>

00101f5d <vector19>:
.globl vector19
vector19:
  pushl $0
  101f5d:	6a 00                	push   $0x0
  pushl $19
  101f5f:	6a 13                	push   $0x13
  jmp __alltraps
  101f61:	e9 cc 09 00 00       	jmp    102932 <__alltraps>

00101f66 <vector20>:
.globl vector20
vector20:
  pushl $0
  101f66:	6a 00                	push   $0x0
  pushl $20
  101f68:	6a 14                	push   $0x14
  jmp __alltraps
  101f6a:	e9 c3 09 00 00       	jmp    102932 <__alltraps>

00101f6f <vector21>:
.globl vector21
vector21:
  pushl $0
  101f6f:	6a 00                	push   $0x0
  pushl $21
  101f71:	6a 15                	push   $0x15
  jmp __alltraps
  101f73:	e9 ba 09 00 00       	jmp    102932 <__alltraps>

00101f78 <vector22>:
.globl vector22
vector22:
  pushl $0
  101f78:	6a 00                	push   $0x0
  pushl $22
  101f7a:	6a 16                	push   $0x16
  jmp __alltraps
  101f7c:	e9 b1 09 00 00       	jmp    102932 <__alltraps>

00101f81 <vector23>:
.globl vector23
vector23:
  pushl $0
  101f81:	6a 00                	push   $0x0
  pushl $23
  101f83:	6a 17                	push   $0x17
  jmp __alltraps
  101f85:	e9 a8 09 00 00       	jmp    102932 <__alltraps>

00101f8a <vector24>:
.globl vector24
vector24:
  pushl $0
  101f8a:	6a 00                	push   $0x0
  pushl $24
  101f8c:	6a 18                	push   $0x18
  jmp __alltraps
  101f8e:	e9 9f 09 00 00       	jmp    102932 <__alltraps>

00101f93 <vector25>:
.globl vector25
vector25:
  pushl $0
  101f93:	6a 00                	push   $0x0
  pushl $25
  101f95:	6a 19                	push   $0x19
  jmp __alltraps
  101f97:	e9 96 09 00 00       	jmp    102932 <__alltraps>

00101f9c <vector26>:
.globl vector26
vector26:
  pushl $0
  101f9c:	6a 00                	push   $0x0
  pushl $26
  101f9e:	6a 1a                	push   $0x1a
  jmp __alltraps
  101fa0:	e9 8d 09 00 00       	jmp    102932 <__alltraps>

00101fa5 <vector27>:
.globl vector27
vector27:
  pushl $0
  101fa5:	6a 00                	push   $0x0
  pushl $27
  101fa7:	6a 1b                	push   $0x1b
  jmp __alltraps
  101fa9:	e9 84 09 00 00       	jmp    102932 <__alltraps>

00101fae <vector28>:
.globl vector28
vector28:
  pushl $0
  101fae:	6a 00                	push   $0x0
  pushl $28
  101fb0:	6a 1c                	push   $0x1c
  jmp __alltraps
  101fb2:	e9 7b 09 00 00       	jmp    102932 <__alltraps>

00101fb7 <vector29>:
.globl vector29
vector29:
  pushl $0
  101fb7:	6a 00                	push   $0x0
  pushl $29
  101fb9:	6a 1d                	push   $0x1d
  jmp __alltraps
  101fbb:	e9 72 09 00 00       	jmp    102932 <__alltraps>

00101fc0 <vector30>:
.globl vector30
vector30:
  pushl $0
  101fc0:	6a 00                	push   $0x0
  pushl $30
  101fc2:	6a 1e                	push   $0x1e
  jmp __alltraps
  101fc4:	e9 69 09 00 00       	jmp    102932 <__alltraps>

00101fc9 <vector31>:
.globl vector31
vector31:
  pushl $0
  101fc9:	6a 00                	push   $0x0
  pushl $31
  101fcb:	6a 1f                	push   $0x1f
  jmp __alltraps
  101fcd:	e9 60 09 00 00       	jmp    102932 <__alltraps>

00101fd2 <vector32>:
.globl vector32
vector32:
  pushl $0
  101fd2:	6a 00                	push   $0x0
  pushl $32
  101fd4:	6a 20                	push   $0x20
  jmp __alltraps
  101fd6:	e9 57 09 00 00       	jmp    102932 <__alltraps>

00101fdb <vector33>:
.globl vector33
vector33:
  pushl $0
  101fdb:	6a 00                	push   $0x0
  pushl $33
  101fdd:	6a 21                	push   $0x21
  jmp __alltraps
  101fdf:	e9 4e 09 00 00       	jmp    102932 <__alltraps>

00101fe4 <vector34>:
.globl vector34
vector34:
  pushl $0
  101fe4:	6a 00                	push   $0x0
  pushl $34
  101fe6:	6a 22                	push   $0x22
  jmp __alltraps
  101fe8:	e9 45 09 00 00       	jmp    102932 <__alltraps>

00101fed <vector35>:
.globl vector35
vector35:
  pushl $0
  101fed:	6a 00                	push   $0x0
  pushl $35
  101fef:	6a 23                	push   $0x23
  jmp __alltraps
  101ff1:	e9 3c 09 00 00       	jmp    102932 <__alltraps>

00101ff6 <vector36>:
.globl vector36
vector36:
  pushl $0
  101ff6:	6a 00                	push   $0x0
  pushl $36
  101ff8:	6a 24                	push   $0x24
  jmp __alltraps
  101ffa:	e9 33 09 00 00       	jmp    102932 <__alltraps>

00101fff <vector37>:
.globl vector37
vector37:
  pushl $0
  101fff:	6a 00                	push   $0x0
  pushl $37
  102001:	6a 25                	push   $0x25
  jmp __alltraps
  102003:	e9 2a 09 00 00       	jmp    102932 <__alltraps>

00102008 <vector38>:
.globl vector38
vector38:
  pushl $0
  102008:	6a 00                	push   $0x0
  pushl $38
  10200a:	6a 26                	push   $0x26
  jmp __alltraps
  10200c:	e9 21 09 00 00       	jmp    102932 <__alltraps>

00102011 <vector39>:
.globl vector39
vector39:
  pushl $0
  102011:	6a 00                	push   $0x0
  pushl $39
  102013:	6a 27                	push   $0x27
  jmp __alltraps
  102015:	e9 18 09 00 00       	jmp    102932 <__alltraps>

0010201a <vector40>:
.globl vector40
vector40:
  pushl $0
  10201a:	6a 00                	push   $0x0
  pushl $40
  10201c:	6a 28                	push   $0x28
  jmp __alltraps
  10201e:	e9 0f 09 00 00       	jmp    102932 <__alltraps>

00102023 <vector41>:
.globl vector41
vector41:
  pushl $0
  102023:	6a 00                	push   $0x0
  pushl $41
  102025:	6a 29                	push   $0x29
  jmp __alltraps
  102027:	e9 06 09 00 00       	jmp    102932 <__alltraps>

0010202c <vector42>:
.globl vector42
vector42:
  pushl $0
  10202c:	6a 00                	push   $0x0
  pushl $42
  10202e:	6a 2a                	push   $0x2a
  jmp __alltraps
  102030:	e9 fd 08 00 00       	jmp    102932 <__alltraps>

00102035 <vector43>:
.globl vector43
vector43:
  pushl $0
  102035:	6a 00                	push   $0x0
  pushl $43
  102037:	6a 2b                	push   $0x2b
  jmp __alltraps
  102039:	e9 f4 08 00 00       	jmp    102932 <__alltraps>

0010203e <vector44>:
.globl vector44
vector44:
  pushl $0
  10203e:	6a 00                	push   $0x0
  pushl $44
  102040:	6a 2c                	push   $0x2c
  jmp __alltraps
  102042:	e9 eb 08 00 00       	jmp    102932 <__alltraps>

00102047 <vector45>:
.globl vector45
vector45:
  pushl $0
  102047:	6a 00                	push   $0x0
  pushl $45
  102049:	6a 2d                	push   $0x2d
  jmp __alltraps
  10204b:	e9 e2 08 00 00       	jmp    102932 <__alltraps>

00102050 <vector46>:
.globl vector46
vector46:
  pushl $0
  102050:	6a 00                	push   $0x0
  pushl $46
  102052:	6a 2e                	push   $0x2e
  jmp __alltraps
  102054:	e9 d9 08 00 00       	jmp    102932 <__alltraps>

00102059 <vector47>:
.globl vector47
vector47:
  pushl $0
  102059:	6a 00                	push   $0x0
  pushl $47
  10205b:	6a 2f                	push   $0x2f
  jmp __alltraps
  10205d:	e9 d0 08 00 00       	jmp    102932 <__alltraps>

00102062 <vector48>:
.globl vector48
vector48:
  pushl $0
  102062:	6a 00                	push   $0x0
  pushl $48
  102064:	6a 30                	push   $0x30
  jmp __alltraps
  102066:	e9 c7 08 00 00       	jmp    102932 <__alltraps>

0010206b <vector49>:
.globl vector49
vector49:
  pushl $0
  10206b:	6a 00                	push   $0x0
  pushl $49
  10206d:	6a 31                	push   $0x31
  jmp __alltraps
  10206f:	e9 be 08 00 00       	jmp    102932 <__alltraps>

00102074 <vector50>:
.globl vector50
vector50:
  pushl $0
  102074:	6a 00                	push   $0x0
  pushl $50
  102076:	6a 32                	push   $0x32
  jmp __alltraps
  102078:	e9 b5 08 00 00       	jmp    102932 <__alltraps>

0010207d <vector51>:
.globl vector51
vector51:
  pushl $0
  10207d:	6a 00                	push   $0x0
  pushl $51
  10207f:	6a 33                	push   $0x33
  jmp __alltraps
  102081:	e9 ac 08 00 00       	jmp    102932 <__alltraps>

00102086 <vector52>:
.globl vector52
vector52:
  pushl $0
  102086:	6a 00                	push   $0x0
  pushl $52
  102088:	6a 34                	push   $0x34
  jmp __alltraps
  10208a:	e9 a3 08 00 00       	jmp    102932 <__alltraps>

0010208f <vector53>:
.globl vector53
vector53:
  pushl $0
  10208f:	6a 00                	push   $0x0
  pushl $53
  102091:	6a 35                	push   $0x35
  jmp __alltraps
  102093:	e9 9a 08 00 00       	jmp    102932 <__alltraps>

00102098 <vector54>:
.globl vector54
vector54:
  pushl $0
  102098:	6a 00                	push   $0x0
  pushl $54
  10209a:	6a 36                	push   $0x36
  jmp __alltraps
  10209c:	e9 91 08 00 00       	jmp    102932 <__alltraps>

001020a1 <vector55>:
.globl vector55
vector55:
  pushl $0
  1020a1:	6a 00                	push   $0x0
  pushl $55
  1020a3:	6a 37                	push   $0x37
  jmp __alltraps
  1020a5:	e9 88 08 00 00       	jmp    102932 <__alltraps>

001020aa <vector56>:
.globl vector56
vector56:
  pushl $0
  1020aa:	6a 00                	push   $0x0
  pushl $56
  1020ac:	6a 38                	push   $0x38
  jmp __alltraps
  1020ae:	e9 7f 08 00 00       	jmp    102932 <__alltraps>

001020b3 <vector57>:
.globl vector57
vector57:
  pushl $0
  1020b3:	6a 00                	push   $0x0
  pushl $57
  1020b5:	6a 39                	push   $0x39
  jmp __alltraps
  1020b7:	e9 76 08 00 00       	jmp    102932 <__alltraps>

001020bc <vector58>:
.globl vector58
vector58:
  pushl $0
  1020bc:	6a 00                	push   $0x0
  pushl $58
  1020be:	6a 3a                	push   $0x3a
  jmp __alltraps
  1020c0:	e9 6d 08 00 00       	jmp    102932 <__alltraps>

001020c5 <vector59>:
.globl vector59
vector59:
  pushl $0
  1020c5:	6a 00                	push   $0x0
  pushl $59
  1020c7:	6a 3b                	push   $0x3b
  jmp __alltraps
  1020c9:	e9 64 08 00 00       	jmp    102932 <__alltraps>

001020ce <vector60>:
.globl vector60
vector60:
  pushl $0
  1020ce:	6a 00                	push   $0x0
  pushl $60
  1020d0:	6a 3c                	push   $0x3c
  jmp __alltraps
  1020d2:	e9 5b 08 00 00       	jmp    102932 <__alltraps>

001020d7 <vector61>:
.globl vector61
vector61:
  pushl $0
  1020d7:	6a 00                	push   $0x0
  pushl $61
  1020d9:	6a 3d                	push   $0x3d
  jmp __alltraps
  1020db:	e9 52 08 00 00       	jmp    102932 <__alltraps>

001020e0 <vector62>:
.globl vector62
vector62:
  pushl $0
  1020e0:	6a 00                	push   $0x0
  pushl $62
  1020e2:	6a 3e                	push   $0x3e
  jmp __alltraps
  1020e4:	e9 49 08 00 00       	jmp    102932 <__alltraps>

001020e9 <vector63>:
.globl vector63
vector63:
  pushl $0
  1020e9:	6a 00                	push   $0x0
  pushl $63
  1020eb:	6a 3f                	push   $0x3f
  jmp __alltraps
  1020ed:	e9 40 08 00 00       	jmp    102932 <__alltraps>

001020f2 <vector64>:
.globl vector64
vector64:
  pushl $0
  1020f2:	6a 00                	push   $0x0
  pushl $64
  1020f4:	6a 40                	push   $0x40
  jmp __alltraps
  1020f6:	e9 37 08 00 00       	jmp    102932 <__alltraps>

001020fb <vector65>:
.globl vector65
vector65:
  pushl $0
  1020fb:	6a 00                	push   $0x0
  pushl $65
  1020fd:	6a 41                	push   $0x41
  jmp __alltraps
  1020ff:	e9 2e 08 00 00       	jmp    102932 <__alltraps>

00102104 <vector66>:
.globl vector66
vector66:
  pushl $0
  102104:	6a 00                	push   $0x0
  pushl $66
  102106:	6a 42                	push   $0x42
  jmp __alltraps
  102108:	e9 25 08 00 00       	jmp    102932 <__alltraps>

0010210d <vector67>:
.globl vector67
vector67:
  pushl $0
  10210d:	6a 00                	push   $0x0
  pushl $67
  10210f:	6a 43                	push   $0x43
  jmp __alltraps
  102111:	e9 1c 08 00 00       	jmp    102932 <__alltraps>

00102116 <vector68>:
.globl vector68
vector68:
  pushl $0
  102116:	6a 00                	push   $0x0
  pushl $68
  102118:	6a 44                	push   $0x44
  jmp __alltraps
  10211a:	e9 13 08 00 00       	jmp    102932 <__alltraps>

0010211f <vector69>:
.globl vector69
vector69:
  pushl $0
  10211f:	6a 00                	push   $0x0
  pushl $69
  102121:	6a 45                	push   $0x45
  jmp __alltraps
  102123:	e9 0a 08 00 00       	jmp    102932 <__alltraps>

00102128 <vector70>:
.globl vector70
vector70:
  pushl $0
  102128:	6a 00                	push   $0x0
  pushl $70
  10212a:	6a 46                	push   $0x46
  jmp __alltraps
  10212c:	e9 01 08 00 00       	jmp    102932 <__alltraps>

00102131 <vector71>:
.globl vector71
vector71:
  pushl $0
  102131:	6a 00                	push   $0x0
  pushl $71
  102133:	6a 47                	push   $0x47
  jmp __alltraps
  102135:	e9 f8 07 00 00       	jmp    102932 <__alltraps>

0010213a <vector72>:
.globl vector72
vector72:
  pushl $0
  10213a:	6a 00                	push   $0x0
  pushl $72
  10213c:	6a 48                	push   $0x48
  jmp __alltraps
  10213e:	e9 ef 07 00 00       	jmp    102932 <__alltraps>

00102143 <vector73>:
.globl vector73
vector73:
  pushl $0
  102143:	6a 00                	push   $0x0
  pushl $73
  102145:	6a 49                	push   $0x49
  jmp __alltraps
  102147:	e9 e6 07 00 00       	jmp    102932 <__alltraps>

0010214c <vector74>:
.globl vector74
vector74:
  pushl $0
  10214c:	6a 00                	push   $0x0
  pushl $74
  10214e:	6a 4a                	push   $0x4a
  jmp __alltraps
  102150:	e9 dd 07 00 00       	jmp    102932 <__alltraps>

00102155 <vector75>:
.globl vector75
vector75:
  pushl $0
  102155:	6a 00                	push   $0x0
  pushl $75
  102157:	6a 4b                	push   $0x4b
  jmp __alltraps
  102159:	e9 d4 07 00 00       	jmp    102932 <__alltraps>

0010215e <vector76>:
.globl vector76
vector76:
  pushl $0
  10215e:	6a 00                	push   $0x0
  pushl $76
  102160:	6a 4c                	push   $0x4c
  jmp __alltraps
  102162:	e9 cb 07 00 00       	jmp    102932 <__alltraps>

00102167 <vector77>:
.globl vector77
vector77:
  pushl $0
  102167:	6a 00                	push   $0x0
  pushl $77
  102169:	6a 4d                	push   $0x4d
  jmp __alltraps
  10216b:	e9 c2 07 00 00       	jmp    102932 <__alltraps>

00102170 <vector78>:
.globl vector78
vector78:
  pushl $0
  102170:	6a 00                	push   $0x0
  pushl $78
  102172:	6a 4e                	push   $0x4e
  jmp __alltraps
  102174:	e9 b9 07 00 00       	jmp    102932 <__alltraps>

00102179 <vector79>:
.globl vector79
vector79:
  pushl $0
  102179:	6a 00                	push   $0x0
  pushl $79
  10217b:	6a 4f                	push   $0x4f
  jmp __alltraps
  10217d:	e9 b0 07 00 00       	jmp    102932 <__alltraps>

00102182 <vector80>:
.globl vector80
vector80:
  pushl $0
  102182:	6a 00                	push   $0x0
  pushl $80
  102184:	6a 50                	push   $0x50
  jmp __alltraps
  102186:	e9 a7 07 00 00       	jmp    102932 <__alltraps>

0010218b <vector81>:
.globl vector81
vector81:
  pushl $0
  10218b:	6a 00                	push   $0x0
  pushl $81
  10218d:	6a 51                	push   $0x51
  jmp __alltraps
  10218f:	e9 9e 07 00 00       	jmp    102932 <__alltraps>

00102194 <vector82>:
.globl vector82
vector82:
  pushl $0
  102194:	6a 00                	push   $0x0
  pushl $82
  102196:	6a 52                	push   $0x52
  jmp __alltraps
  102198:	e9 95 07 00 00       	jmp    102932 <__alltraps>

0010219d <vector83>:
.globl vector83
vector83:
  pushl $0
  10219d:	6a 00                	push   $0x0
  pushl $83
  10219f:	6a 53                	push   $0x53
  jmp __alltraps
  1021a1:	e9 8c 07 00 00       	jmp    102932 <__alltraps>

001021a6 <vector84>:
.globl vector84
vector84:
  pushl $0
  1021a6:	6a 00                	push   $0x0
  pushl $84
  1021a8:	6a 54                	push   $0x54
  jmp __alltraps
  1021aa:	e9 83 07 00 00       	jmp    102932 <__alltraps>

001021af <vector85>:
.globl vector85
vector85:
  pushl $0
  1021af:	6a 00                	push   $0x0
  pushl $85
  1021b1:	6a 55                	push   $0x55
  jmp __alltraps
  1021b3:	e9 7a 07 00 00       	jmp    102932 <__alltraps>

001021b8 <vector86>:
.globl vector86
vector86:
  pushl $0
  1021b8:	6a 00                	push   $0x0
  pushl $86
  1021ba:	6a 56                	push   $0x56
  jmp __alltraps
  1021bc:	e9 71 07 00 00       	jmp    102932 <__alltraps>

001021c1 <vector87>:
.globl vector87
vector87:
  pushl $0
  1021c1:	6a 00                	push   $0x0
  pushl $87
  1021c3:	6a 57                	push   $0x57
  jmp __alltraps
  1021c5:	e9 68 07 00 00       	jmp    102932 <__alltraps>

001021ca <vector88>:
.globl vector88
vector88:
  pushl $0
  1021ca:	6a 00                	push   $0x0
  pushl $88
  1021cc:	6a 58                	push   $0x58
  jmp __alltraps
  1021ce:	e9 5f 07 00 00       	jmp    102932 <__alltraps>

001021d3 <vector89>:
.globl vector89
vector89:
  pushl $0
  1021d3:	6a 00                	push   $0x0
  pushl $89
  1021d5:	6a 59                	push   $0x59
  jmp __alltraps
  1021d7:	e9 56 07 00 00       	jmp    102932 <__alltraps>

001021dc <vector90>:
.globl vector90
vector90:
  pushl $0
  1021dc:	6a 00                	push   $0x0
  pushl $90
  1021de:	6a 5a                	push   $0x5a
  jmp __alltraps
  1021e0:	e9 4d 07 00 00       	jmp    102932 <__alltraps>

001021e5 <vector91>:
.globl vector91
vector91:
  pushl $0
  1021e5:	6a 00                	push   $0x0
  pushl $91
  1021e7:	6a 5b                	push   $0x5b
  jmp __alltraps
  1021e9:	e9 44 07 00 00       	jmp    102932 <__alltraps>

001021ee <vector92>:
.globl vector92
vector92:
  pushl $0
  1021ee:	6a 00                	push   $0x0
  pushl $92
  1021f0:	6a 5c                	push   $0x5c
  jmp __alltraps
  1021f2:	e9 3b 07 00 00       	jmp    102932 <__alltraps>

001021f7 <vector93>:
.globl vector93
vector93:
  pushl $0
  1021f7:	6a 00                	push   $0x0
  pushl $93
  1021f9:	6a 5d                	push   $0x5d
  jmp __alltraps
  1021fb:	e9 32 07 00 00       	jmp    102932 <__alltraps>

00102200 <vector94>:
.globl vector94
vector94:
  pushl $0
  102200:	6a 00                	push   $0x0
  pushl $94
  102202:	6a 5e                	push   $0x5e
  jmp __alltraps
  102204:	e9 29 07 00 00       	jmp    102932 <__alltraps>

00102209 <vector95>:
.globl vector95
vector95:
  pushl $0
  102209:	6a 00                	push   $0x0
  pushl $95
  10220b:	6a 5f                	push   $0x5f
  jmp __alltraps
  10220d:	e9 20 07 00 00       	jmp    102932 <__alltraps>

00102212 <vector96>:
.globl vector96
vector96:
  pushl $0
  102212:	6a 00                	push   $0x0
  pushl $96
  102214:	6a 60                	push   $0x60
  jmp __alltraps
  102216:	e9 17 07 00 00       	jmp    102932 <__alltraps>

0010221b <vector97>:
.globl vector97
vector97:
  pushl $0
  10221b:	6a 00                	push   $0x0
  pushl $97
  10221d:	6a 61                	push   $0x61
  jmp __alltraps
  10221f:	e9 0e 07 00 00       	jmp    102932 <__alltraps>

00102224 <vector98>:
.globl vector98
vector98:
  pushl $0
  102224:	6a 00                	push   $0x0
  pushl $98
  102226:	6a 62                	push   $0x62
  jmp __alltraps
  102228:	e9 05 07 00 00       	jmp    102932 <__alltraps>

0010222d <vector99>:
.globl vector99
vector99:
  pushl $0
  10222d:	6a 00                	push   $0x0
  pushl $99
  10222f:	6a 63                	push   $0x63
  jmp __alltraps
  102231:	e9 fc 06 00 00       	jmp    102932 <__alltraps>

00102236 <vector100>:
.globl vector100
vector100:
  pushl $0
  102236:	6a 00                	push   $0x0
  pushl $100
  102238:	6a 64                	push   $0x64
  jmp __alltraps
  10223a:	e9 f3 06 00 00       	jmp    102932 <__alltraps>

0010223f <vector101>:
.globl vector101
vector101:
  pushl $0
  10223f:	6a 00                	push   $0x0
  pushl $101
  102241:	6a 65                	push   $0x65
  jmp __alltraps
  102243:	e9 ea 06 00 00       	jmp    102932 <__alltraps>

00102248 <vector102>:
.globl vector102
vector102:
  pushl $0
  102248:	6a 00                	push   $0x0
  pushl $102
  10224a:	6a 66                	push   $0x66
  jmp __alltraps
  10224c:	e9 e1 06 00 00       	jmp    102932 <__alltraps>

00102251 <vector103>:
.globl vector103
vector103:
  pushl $0
  102251:	6a 00                	push   $0x0
  pushl $103
  102253:	6a 67                	push   $0x67
  jmp __alltraps
  102255:	e9 d8 06 00 00       	jmp    102932 <__alltraps>

0010225a <vector104>:
.globl vector104
vector104:
  pushl $0
  10225a:	6a 00                	push   $0x0
  pushl $104
  10225c:	6a 68                	push   $0x68
  jmp __alltraps
  10225e:	e9 cf 06 00 00       	jmp    102932 <__alltraps>

00102263 <vector105>:
.globl vector105
vector105:
  pushl $0
  102263:	6a 00                	push   $0x0
  pushl $105
  102265:	6a 69                	push   $0x69
  jmp __alltraps
  102267:	e9 c6 06 00 00       	jmp    102932 <__alltraps>

0010226c <vector106>:
.globl vector106
vector106:
  pushl $0
  10226c:	6a 00                	push   $0x0
  pushl $106
  10226e:	6a 6a                	push   $0x6a
  jmp __alltraps
  102270:	e9 bd 06 00 00       	jmp    102932 <__alltraps>

00102275 <vector107>:
.globl vector107
vector107:
  pushl $0
  102275:	6a 00                	push   $0x0
  pushl $107
  102277:	6a 6b                	push   $0x6b
  jmp __alltraps
  102279:	e9 b4 06 00 00       	jmp    102932 <__alltraps>

0010227e <vector108>:
.globl vector108
vector108:
  pushl $0
  10227e:	6a 00                	push   $0x0
  pushl $108
  102280:	6a 6c                	push   $0x6c
  jmp __alltraps
  102282:	e9 ab 06 00 00       	jmp    102932 <__alltraps>

00102287 <vector109>:
.globl vector109
vector109:
  pushl $0
  102287:	6a 00                	push   $0x0
  pushl $109
  102289:	6a 6d                	push   $0x6d
  jmp __alltraps
  10228b:	e9 a2 06 00 00       	jmp    102932 <__alltraps>

00102290 <vector110>:
.globl vector110
vector110:
  pushl $0
  102290:	6a 00                	push   $0x0
  pushl $110
  102292:	6a 6e                	push   $0x6e
  jmp __alltraps
  102294:	e9 99 06 00 00       	jmp    102932 <__alltraps>

00102299 <vector111>:
.globl vector111
vector111:
  pushl $0
  102299:	6a 00                	push   $0x0
  pushl $111
  10229b:	6a 6f                	push   $0x6f
  jmp __alltraps
  10229d:	e9 90 06 00 00       	jmp    102932 <__alltraps>

001022a2 <vector112>:
.globl vector112
vector112:
  pushl $0
  1022a2:	6a 00                	push   $0x0
  pushl $112
  1022a4:	6a 70                	push   $0x70
  jmp __alltraps
  1022a6:	e9 87 06 00 00       	jmp    102932 <__alltraps>

001022ab <vector113>:
.globl vector113
vector113:
  pushl $0
  1022ab:	6a 00                	push   $0x0
  pushl $113
  1022ad:	6a 71                	push   $0x71
  jmp __alltraps
  1022af:	e9 7e 06 00 00       	jmp    102932 <__alltraps>

001022b4 <vector114>:
.globl vector114
vector114:
  pushl $0
  1022b4:	6a 00                	push   $0x0
  pushl $114
  1022b6:	6a 72                	push   $0x72
  jmp __alltraps
  1022b8:	e9 75 06 00 00       	jmp    102932 <__alltraps>

001022bd <vector115>:
.globl vector115
vector115:
  pushl $0
  1022bd:	6a 00                	push   $0x0
  pushl $115
  1022bf:	6a 73                	push   $0x73
  jmp __alltraps
  1022c1:	e9 6c 06 00 00       	jmp    102932 <__alltraps>

001022c6 <vector116>:
.globl vector116
vector116:
  pushl $0
  1022c6:	6a 00                	push   $0x0
  pushl $116
  1022c8:	6a 74                	push   $0x74
  jmp __alltraps
  1022ca:	e9 63 06 00 00       	jmp    102932 <__alltraps>

001022cf <vector117>:
.globl vector117
vector117:
  pushl $0
  1022cf:	6a 00                	push   $0x0
  pushl $117
  1022d1:	6a 75                	push   $0x75
  jmp __alltraps
  1022d3:	e9 5a 06 00 00       	jmp    102932 <__alltraps>

001022d8 <vector118>:
.globl vector118
vector118:
  pushl $0
  1022d8:	6a 00                	push   $0x0
  pushl $118
  1022da:	6a 76                	push   $0x76
  jmp __alltraps
  1022dc:	e9 51 06 00 00       	jmp    102932 <__alltraps>

001022e1 <vector119>:
.globl vector119
vector119:
  pushl $0
  1022e1:	6a 00                	push   $0x0
  pushl $119
  1022e3:	6a 77                	push   $0x77
  jmp __alltraps
  1022e5:	e9 48 06 00 00       	jmp    102932 <__alltraps>

001022ea <vector120>:
.globl vector120
vector120:
  pushl $0
  1022ea:	6a 00                	push   $0x0
  pushl $120
  1022ec:	6a 78                	push   $0x78
  jmp __alltraps
  1022ee:	e9 3f 06 00 00       	jmp    102932 <__alltraps>

001022f3 <vector121>:
.globl vector121
vector121:
  pushl $0
  1022f3:	6a 00                	push   $0x0
  pushl $121
  1022f5:	6a 79                	push   $0x79
  jmp __alltraps
  1022f7:	e9 36 06 00 00       	jmp    102932 <__alltraps>

001022fc <vector122>:
.globl vector122
vector122:
  pushl $0
  1022fc:	6a 00                	push   $0x0
  pushl $122
  1022fe:	6a 7a                	push   $0x7a
  jmp __alltraps
  102300:	e9 2d 06 00 00       	jmp    102932 <__alltraps>

00102305 <vector123>:
.globl vector123
vector123:
  pushl $0
  102305:	6a 00                	push   $0x0
  pushl $123
  102307:	6a 7b                	push   $0x7b
  jmp __alltraps
  102309:	e9 24 06 00 00       	jmp    102932 <__alltraps>

0010230e <vector124>:
.globl vector124
vector124:
  pushl $0
  10230e:	6a 00                	push   $0x0
  pushl $124
  102310:	6a 7c                	push   $0x7c
  jmp __alltraps
  102312:	e9 1b 06 00 00       	jmp    102932 <__alltraps>

00102317 <vector125>:
.globl vector125
vector125:
  pushl $0
  102317:	6a 00                	push   $0x0
  pushl $125
  102319:	6a 7d                	push   $0x7d
  jmp __alltraps
  10231b:	e9 12 06 00 00       	jmp    102932 <__alltraps>

00102320 <vector126>:
.globl vector126
vector126:
  pushl $0
  102320:	6a 00                	push   $0x0
  pushl $126
  102322:	6a 7e                	push   $0x7e
  jmp __alltraps
  102324:	e9 09 06 00 00       	jmp    102932 <__alltraps>

00102329 <vector127>:
.globl vector127
vector127:
  pushl $0
  102329:	6a 00                	push   $0x0
  pushl $127
  10232b:	6a 7f                	push   $0x7f
  jmp __alltraps
  10232d:	e9 00 06 00 00       	jmp    102932 <__alltraps>

00102332 <vector128>:
.globl vector128
vector128:
  pushl $0
  102332:	6a 00                	push   $0x0
  pushl $128
  102334:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102339:	e9 f4 05 00 00       	jmp    102932 <__alltraps>

0010233e <vector129>:
.globl vector129
vector129:
  pushl $0
  10233e:	6a 00                	push   $0x0
  pushl $129
  102340:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102345:	e9 e8 05 00 00       	jmp    102932 <__alltraps>

0010234a <vector130>:
.globl vector130
vector130:
  pushl $0
  10234a:	6a 00                	push   $0x0
  pushl $130
  10234c:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102351:	e9 dc 05 00 00       	jmp    102932 <__alltraps>

00102356 <vector131>:
.globl vector131
vector131:
  pushl $0
  102356:	6a 00                	push   $0x0
  pushl $131
  102358:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  10235d:	e9 d0 05 00 00       	jmp    102932 <__alltraps>

00102362 <vector132>:
.globl vector132
vector132:
  pushl $0
  102362:	6a 00                	push   $0x0
  pushl $132
  102364:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102369:	e9 c4 05 00 00       	jmp    102932 <__alltraps>

0010236e <vector133>:
.globl vector133
vector133:
  pushl $0
  10236e:	6a 00                	push   $0x0
  pushl $133
  102370:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102375:	e9 b8 05 00 00       	jmp    102932 <__alltraps>

0010237a <vector134>:
.globl vector134
vector134:
  pushl $0
  10237a:	6a 00                	push   $0x0
  pushl $134
  10237c:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102381:	e9 ac 05 00 00       	jmp    102932 <__alltraps>

00102386 <vector135>:
.globl vector135
vector135:
  pushl $0
  102386:	6a 00                	push   $0x0
  pushl $135
  102388:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  10238d:	e9 a0 05 00 00       	jmp    102932 <__alltraps>

00102392 <vector136>:
.globl vector136
vector136:
  pushl $0
  102392:	6a 00                	push   $0x0
  pushl $136
  102394:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102399:	e9 94 05 00 00       	jmp    102932 <__alltraps>

0010239e <vector137>:
.globl vector137
vector137:
  pushl $0
  10239e:	6a 00                	push   $0x0
  pushl $137
  1023a0:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1023a5:	e9 88 05 00 00       	jmp    102932 <__alltraps>

001023aa <vector138>:
.globl vector138
vector138:
  pushl $0
  1023aa:	6a 00                	push   $0x0
  pushl $138
  1023ac:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1023b1:	e9 7c 05 00 00       	jmp    102932 <__alltraps>

001023b6 <vector139>:
.globl vector139
vector139:
  pushl $0
  1023b6:	6a 00                	push   $0x0
  pushl $139
  1023b8:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1023bd:	e9 70 05 00 00       	jmp    102932 <__alltraps>

001023c2 <vector140>:
.globl vector140
vector140:
  pushl $0
  1023c2:	6a 00                	push   $0x0
  pushl $140
  1023c4:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1023c9:	e9 64 05 00 00       	jmp    102932 <__alltraps>

001023ce <vector141>:
.globl vector141
vector141:
  pushl $0
  1023ce:	6a 00                	push   $0x0
  pushl $141
  1023d0:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1023d5:	e9 58 05 00 00       	jmp    102932 <__alltraps>

001023da <vector142>:
.globl vector142
vector142:
  pushl $0
  1023da:	6a 00                	push   $0x0
  pushl $142
  1023dc:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1023e1:	e9 4c 05 00 00       	jmp    102932 <__alltraps>

001023e6 <vector143>:
.globl vector143
vector143:
  pushl $0
  1023e6:	6a 00                	push   $0x0
  pushl $143
  1023e8:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1023ed:	e9 40 05 00 00       	jmp    102932 <__alltraps>

001023f2 <vector144>:
.globl vector144
vector144:
  pushl $0
  1023f2:	6a 00                	push   $0x0
  pushl $144
  1023f4:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1023f9:	e9 34 05 00 00       	jmp    102932 <__alltraps>

001023fe <vector145>:
.globl vector145
vector145:
  pushl $0
  1023fe:	6a 00                	push   $0x0
  pushl $145
  102400:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102405:	e9 28 05 00 00       	jmp    102932 <__alltraps>

0010240a <vector146>:
.globl vector146
vector146:
  pushl $0
  10240a:	6a 00                	push   $0x0
  pushl $146
  10240c:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102411:	e9 1c 05 00 00       	jmp    102932 <__alltraps>

00102416 <vector147>:
.globl vector147
vector147:
  pushl $0
  102416:	6a 00                	push   $0x0
  pushl $147
  102418:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  10241d:	e9 10 05 00 00       	jmp    102932 <__alltraps>

00102422 <vector148>:
.globl vector148
vector148:
  pushl $0
  102422:	6a 00                	push   $0x0
  pushl $148
  102424:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102429:	e9 04 05 00 00       	jmp    102932 <__alltraps>

0010242e <vector149>:
.globl vector149
vector149:
  pushl $0
  10242e:	6a 00                	push   $0x0
  pushl $149
  102430:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102435:	e9 f8 04 00 00       	jmp    102932 <__alltraps>

0010243a <vector150>:
.globl vector150
vector150:
  pushl $0
  10243a:	6a 00                	push   $0x0
  pushl $150
  10243c:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102441:	e9 ec 04 00 00       	jmp    102932 <__alltraps>

00102446 <vector151>:
.globl vector151
vector151:
  pushl $0
  102446:	6a 00                	push   $0x0
  pushl $151
  102448:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  10244d:	e9 e0 04 00 00       	jmp    102932 <__alltraps>

00102452 <vector152>:
.globl vector152
vector152:
  pushl $0
  102452:	6a 00                	push   $0x0
  pushl $152
  102454:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102459:	e9 d4 04 00 00       	jmp    102932 <__alltraps>

0010245e <vector153>:
.globl vector153
vector153:
  pushl $0
  10245e:	6a 00                	push   $0x0
  pushl $153
  102460:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102465:	e9 c8 04 00 00       	jmp    102932 <__alltraps>

0010246a <vector154>:
.globl vector154
vector154:
  pushl $0
  10246a:	6a 00                	push   $0x0
  pushl $154
  10246c:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102471:	e9 bc 04 00 00       	jmp    102932 <__alltraps>

00102476 <vector155>:
.globl vector155
vector155:
  pushl $0
  102476:	6a 00                	push   $0x0
  pushl $155
  102478:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  10247d:	e9 b0 04 00 00       	jmp    102932 <__alltraps>

00102482 <vector156>:
.globl vector156
vector156:
  pushl $0
  102482:	6a 00                	push   $0x0
  pushl $156
  102484:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102489:	e9 a4 04 00 00       	jmp    102932 <__alltraps>

0010248e <vector157>:
.globl vector157
vector157:
  pushl $0
  10248e:	6a 00                	push   $0x0
  pushl $157
  102490:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102495:	e9 98 04 00 00       	jmp    102932 <__alltraps>

0010249a <vector158>:
.globl vector158
vector158:
  pushl $0
  10249a:	6a 00                	push   $0x0
  pushl $158
  10249c:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1024a1:	e9 8c 04 00 00       	jmp    102932 <__alltraps>

001024a6 <vector159>:
.globl vector159
vector159:
  pushl $0
  1024a6:	6a 00                	push   $0x0
  pushl $159
  1024a8:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1024ad:	e9 80 04 00 00       	jmp    102932 <__alltraps>

001024b2 <vector160>:
.globl vector160
vector160:
  pushl $0
  1024b2:	6a 00                	push   $0x0
  pushl $160
  1024b4:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1024b9:	e9 74 04 00 00       	jmp    102932 <__alltraps>

001024be <vector161>:
.globl vector161
vector161:
  pushl $0
  1024be:	6a 00                	push   $0x0
  pushl $161
  1024c0:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1024c5:	e9 68 04 00 00       	jmp    102932 <__alltraps>

001024ca <vector162>:
.globl vector162
vector162:
  pushl $0
  1024ca:	6a 00                	push   $0x0
  pushl $162
  1024cc:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1024d1:	e9 5c 04 00 00       	jmp    102932 <__alltraps>

001024d6 <vector163>:
.globl vector163
vector163:
  pushl $0
  1024d6:	6a 00                	push   $0x0
  pushl $163
  1024d8:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1024dd:	e9 50 04 00 00       	jmp    102932 <__alltraps>

001024e2 <vector164>:
.globl vector164
vector164:
  pushl $0
  1024e2:	6a 00                	push   $0x0
  pushl $164
  1024e4:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1024e9:	e9 44 04 00 00       	jmp    102932 <__alltraps>

001024ee <vector165>:
.globl vector165
vector165:
  pushl $0
  1024ee:	6a 00                	push   $0x0
  pushl $165
  1024f0:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1024f5:	e9 38 04 00 00       	jmp    102932 <__alltraps>

001024fa <vector166>:
.globl vector166
vector166:
  pushl $0
  1024fa:	6a 00                	push   $0x0
  pushl $166
  1024fc:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102501:	e9 2c 04 00 00       	jmp    102932 <__alltraps>

00102506 <vector167>:
.globl vector167
vector167:
  pushl $0
  102506:	6a 00                	push   $0x0
  pushl $167
  102508:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  10250d:	e9 20 04 00 00       	jmp    102932 <__alltraps>

00102512 <vector168>:
.globl vector168
vector168:
  pushl $0
  102512:	6a 00                	push   $0x0
  pushl $168
  102514:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102519:	e9 14 04 00 00       	jmp    102932 <__alltraps>

0010251e <vector169>:
.globl vector169
vector169:
  pushl $0
  10251e:	6a 00                	push   $0x0
  pushl $169
  102520:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102525:	e9 08 04 00 00       	jmp    102932 <__alltraps>

0010252a <vector170>:
.globl vector170
vector170:
  pushl $0
  10252a:	6a 00                	push   $0x0
  pushl $170
  10252c:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102531:	e9 fc 03 00 00       	jmp    102932 <__alltraps>

00102536 <vector171>:
.globl vector171
vector171:
  pushl $0
  102536:	6a 00                	push   $0x0
  pushl $171
  102538:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  10253d:	e9 f0 03 00 00       	jmp    102932 <__alltraps>

00102542 <vector172>:
.globl vector172
vector172:
  pushl $0
  102542:	6a 00                	push   $0x0
  pushl $172
  102544:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102549:	e9 e4 03 00 00       	jmp    102932 <__alltraps>

0010254e <vector173>:
.globl vector173
vector173:
  pushl $0
  10254e:	6a 00                	push   $0x0
  pushl $173
  102550:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102555:	e9 d8 03 00 00       	jmp    102932 <__alltraps>

0010255a <vector174>:
.globl vector174
vector174:
  pushl $0
  10255a:	6a 00                	push   $0x0
  pushl $174
  10255c:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102561:	e9 cc 03 00 00       	jmp    102932 <__alltraps>

00102566 <vector175>:
.globl vector175
vector175:
  pushl $0
  102566:	6a 00                	push   $0x0
  pushl $175
  102568:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  10256d:	e9 c0 03 00 00       	jmp    102932 <__alltraps>

00102572 <vector176>:
.globl vector176
vector176:
  pushl $0
  102572:	6a 00                	push   $0x0
  pushl $176
  102574:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102579:	e9 b4 03 00 00       	jmp    102932 <__alltraps>

0010257e <vector177>:
.globl vector177
vector177:
  pushl $0
  10257e:	6a 00                	push   $0x0
  pushl $177
  102580:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102585:	e9 a8 03 00 00       	jmp    102932 <__alltraps>

0010258a <vector178>:
.globl vector178
vector178:
  pushl $0
  10258a:	6a 00                	push   $0x0
  pushl $178
  10258c:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102591:	e9 9c 03 00 00       	jmp    102932 <__alltraps>

00102596 <vector179>:
.globl vector179
vector179:
  pushl $0
  102596:	6a 00                	push   $0x0
  pushl $179
  102598:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  10259d:	e9 90 03 00 00       	jmp    102932 <__alltraps>

001025a2 <vector180>:
.globl vector180
vector180:
  pushl $0
  1025a2:	6a 00                	push   $0x0
  pushl $180
  1025a4:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1025a9:	e9 84 03 00 00       	jmp    102932 <__alltraps>

001025ae <vector181>:
.globl vector181
vector181:
  pushl $0
  1025ae:	6a 00                	push   $0x0
  pushl $181
  1025b0:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1025b5:	e9 78 03 00 00       	jmp    102932 <__alltraps>

001025ba <vector182>:
.globl vector182
vector182:
  pushl $0
  1025ba:	6a 00                	push   $0x0
  pushl $182
  1025bc:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1025c1:	e9 6c 03 00 00       	jmp    102932 <__alltraps>

001025c6 <vector183>:
.globl vector183
vector183:
  pushl $0
  1025c6:	6a 00                	push   $0x0
  pushl $183
  1025c8:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1025cd:	e9 60 03 00 00       	jmp    102932 <__alltraps>

001025d2 <vector184>:
.globl vector184
vector184:
  pushl $0
  1025d2:	6a 00                	push   $0x0
  pushl $184
  1025d4:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1025d9:	e9 54 03 00 00       	jmp    102932 <__alltraps>

001025de <vector185>:
.globl vector185
vector185:
  pushl $0
  1025de:	6a 00                	push   $0x0
  pushl $185
  1025e0:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1025e5:	e9 48 03 00 00       	jmp    102932 <__alltraps>

001025ea <vector186>:
.globl vector186
vector186:
  pushl $0
  1025ea:	6a 00                	push   $0x0
  pushl $186
  1025ec:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1025f1:	e9 3c 03 00 00       	jmp    102932 <__alltraps>

001025f6 <vector187>:
.globl vector187
vector187:
  pushl $0
  1025f6:	6a 00                	push   $0x0
  pushl $187
  1025f8:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1025fd:	e9 30 03 00 00       	jmp    102932 <__alltraps>

00102602 <vector188>:
.globl vector188
vector188:
  pushl $0
  102602:	6a 00                	push   $0x0
  pushl $188
  102604:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102609:	e9 24 03 00 00       	jmp    102932 <__alltraps>

0010260e <vector189>:
.globl vector189
vector189:
  pushl $0
  10260e:	6a 00                	push   $0x0
  pushl $189
  102610:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102615:	e9 18 03 00 00       	jmp    102932 <__alltraps>

0010261a <vector190>:
.globl vector190
vector190:
  pushl $0
  10261a:	6a 00                	push   $0x0
  pushl $190
  10261c:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102621:	e9 0c 03 00 00       	jmp    102932 <__alltraps>

00102626 <vector191>:
.globl vector191
vector191:
  pushl $0
  102626:	6a 00                	push   $0x0
  pushl $191
  102628:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  10262d:	e9 00 03 00 00       	jmp    102932 <__alltraps>

00102632 <vector192>:
.globl vector192
vector192:
  pushl $0
  102632:	6a 00                	push   $0x0
  pushl $192
  102634:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102639:	e9 f4 02 00 00       	jmp    102932 <__alltraps>

0010263e <vector193>:
.globl vector193
vector193:
  pushl $0
  10263e:	6a 00                	push   $0x0
  pushl $193
  102640:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102645:	e9 e8 02 00 00       	jmp    102932 <__alltraps>

0010264a <vector194>:
.globl vector194
vector194:
  pushl $0
  10264a:	6a 00                	push   $0x0
  pushl $194
  10264c:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102651:	e9 dc 02 00 00       	jmp    102932 <__alltraps>

00102656 <vector195>:
.globl vector195
vector195:
  pushl $0
  102656:	6a 00                	push   $0x0
  pushl $195
  102658:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  10265d:	e9 d0 02 00 00       	jmp    102932 <__alltraps>

00102662 <vector196>:
.globl vector196
vector196:
  pushl $0
  102662:	6a 00                	push   $0x0
  pushl $196
  102664:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102669:	e9 c4 02 00 00       	jmp    102932 <__alltraps>

0010266e <vector197>:
.globl vector197
vector197:
  pushl $0
  10266e:	6a 00                	push   $0x0
  pushl $197
  102670:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102675:	e9 b8 02 00 00       	jmp    102932 <__alltraps>

0010267a <vector198>:
.globl vector198
vector198:
  pushl $0
  10267a:	6a 00                	push   $0x0
  pushl $198
  10267c:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102681:	e9 ac 02 00 00       	jmp    102932 <__alltraps>

00102686 <vector199>:
.globl vector199
vector199:
  pushl $0
  102686:	6a 00                	push   $0x0
  pushl $199
  102688:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  10268d:	e9 a0 02 00 00       	jmp    102932 <__alltraps>

00102692 <vector200>:
.globl vector200
vector200:
  pushl $0
  102692:	6a 00                	push   $0x0
  pushl $200
  102694:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102699:	e9 94 02 00 00       	jmp    102932 <__alltraps>

0010269e <vector201>:
.globl vector201
vector201:
  pushl $0
  10269e:	6a 00                	push   $0x0
  pushl $201
  1026a0:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1026a5:	e9 88 02 00 00       	jmp    102932 <__alltraps>

001026aa <vector202>:
.globl vector202
vector202:
  pushl $0
  1026aa:	6a 00                	push   $0x0
  pushl $202
  1026ac:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1026b1:	e9 7c 02 00 00       	jmp    102932 <__alltraps>

001026b6 <vector203>:
.globl vector203
vector203:
  pushl $0
  1026b6:	6a 00                	push   $0x0
  pushl $203
  1026b8:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1026bd:	e9 70 02 00 00       	jmp    102932 <__alltraps>

001026c2 <vector204>:
.globl vector204
vector204:
  pushl $0
  1026c2:	6a 00                	push   $0x0
  pushl $204
  1026c4:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1026c9:	e9 64 02 00 00       	jmp    102932 <__alltraps>

001026ce <vector205>:
.globl vector205
vector205:
  pushl $0
  1026ce:	6a 00                	push   $0x0
  pushl $205
  1026d0:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1026d5:	e9 58 02 00 00       	jmp    102932 <__alltraps>

001026da <vector206>:
.globl vector206
vector206:
  pushl $0
  1026da:	6a 00                	push   $0x0
  pushl $206
  1026dc:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1026e1:	e9 4c 02 00 00       	jmp    102932 <__alltraps>

001026e6 <vector207>:
.globl vector207
vector207:
  pushl $0
  1026e6:	6a 00                	push   $0x0
  pushl $207
  1026e8:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1026ed:	e9 40 02 00 00       	jmp    102932 <__alltraps>

001026f2 <vector208>:
.globl vector208
vector208:
  pushl $0
  1026f2:	6a 00                	push   $0x0
  pushl $208
  1026f4:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1026f9:	e9 34 02 00 00       	jmp    102932 <__alltraps>

001026fe <vector209>:
.globl vector209
vector209:
  pushl $0
  1026fe:	6a 00                	push   $0x0
  pushl $209
  102700:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102705:	e9 28 02 00 00       	jmp    102932 <__alltraps>

0010270a <vector210>:
.globl vector210
vector210:
  pushl $0
  10270a:	6a 00                	push   $0x0
  pushl $210
  10270c:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102711:	e9 1c 02 00 00       	jmp    102932 <__alltraps>

00102716 <vector211>:
.globl vector211
vector211:
  pushl $0
  102716:	6a 00                	push   $0x0
  pushl $211
  102718:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  10271d:	e9 10 02 00 00       	jmp    102932 <__alltraps>

00102722 <vector212>:
.globl vector212
vector212:
  pushl $0
  102722:	6a 00                	push   $0x0
  pushl $212
  102724:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102729:	e9 04 02 00 00       	jmp    102932 <__alltraps>

0010272e <vector213>:
.globl vector213
vector213:
  pushl $0
  10272e:	6a 00                	push   $0x0
  pushl $213
  102730:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102735:	e9 f8 01 00 00       	jmp    102932 <__alltraps>

0010273a <vector214>:
.globl vector214
vector214:
  pushl $0
  10273a:	6a 00                	push   $0x0
  pushl $214
  10273c:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102741:	e9 ec 01 00 00       	jmp    102932 <__alltraps>

00102746 <vector215>:
.globl vector215
vector215:
  pushl $0
  102746:	6a 00                	push   $0x0
  pushl $215
  102748:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  10274d:	e9 e0 01 00 00       	jmp    102932 <__alltraps>

00102752 <vector216>:
.globl vector216
vector216:
  pushl $0
  102752:	6a 00                	push   $0x0
  pushl $216
  102754:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102759:	e9 d4 01 00 00       	jmp    102932 <__alltraps>

0010275e <vector217>:
.globl vector217
vector217:
  pushl $0
  10275e:	6a 00                	push   $0x0
  pushl $217
  102760:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102765:	e9 c8 01 00 00       	jmp    102932 <__alltraps>

0010276a <vector218>:
.globl vector218
vector218:
  pushl $0
  10276a:	6a 00                	push   $0x0
  pushl $218
  10276c:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102771:	e9 bc 01 00 00       	jmp    102932 <__alltraps>

00102776 <vector219>:
.globl vector219
vector219:
  pushl $0
  102776:	6a 00                	push   $0x0
  pushl $219
  102778:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  10277d:	e9 b0 01 00 00       	jmp    102932 <__alltraps>

00102782 <vector220>:
.globl vector220
vector220:
  pushl $0
  102782:	6a 00                	push   $0x0
  pushl $220
  102784:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102789:	e9 a4 01 00 00       	jmp    102932 <__alltraps>

0010278e <vector221>:
.globl vector221
vector221:
  pushl $0
  10278e:	6a 00                	push   $0x0
  pushl $221
  102790:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102795:	e9 98 01 00 00       	jmp    102932 <__alltraps>

0010279a <vector222>:
.globl vector222
vector222:
  pushl $0
  10279a:	6a 00                	push   $0x0
  pushl $222
  10279c:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1027a1:	e9 8c 01 00 00       	jmp    102932 <__alltraps>

001027a6 <vector223>:
.globl vector223
vector223:
  pushl $0
  1027a6:	6a 00                	push   $0x0
  pushl $223
  1027a8:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1027ad:	e9 80 01 00 00       	jmp    102932 <__alltraps>

001027b2 <vector224>:
.globl vector224
vector224:
  pushl $0
  1027b2:	6a 00                	push   $0x0
  pushl $224
  1027b4:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1027b9:	e9 74 01 00 00       	jmp    102932 <__alltraps>

001027be <vector225>:
.globl vector225
vector225:
  pushl $0
  1027be:	6a 00                	push   $0x0
  pushl $225
  1027c0:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1027c5:	e9 68 01 00 00       	jmp    102932 <__alltraps>

001027ca <vector226>:
.globl vector226
vector226:
  pushl $0
  1027ca:	6a 00                	push   $0x0
  pushl $226
  1027cc:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1027d1:	e9 5c 01 00 00       	jmp    102932 <__alltraps>

001027d6 <vector227>:
.globl vector227
vector227:
  pushl $0
  1027d6:	6a 00                	push   $0x0
  pushl $227
  1027d8:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1027dd:	e9 50 01 00 00       	jmp    102932 <__alltraps>

001027e2 <vector228>:
.globl vector228
vector228:
  pushl $0
  1027e2:	6a 00                	push   $0x0
  pushl $228
  1027e4:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1027e9:	e9 44 01 00 00       	jmp    102932 <__alltraps>

001027ee <vector229>:
.globl vector229
vector229:
  pushl $0
  1027ee:	6a 00                	push   $0x0
  pushl $229
  1027f0:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1027f5:	e9 38 01 00 00       	jmp    102932 <__alltraps>

001027fa <vector230>:
.globl vector230
vector230:
  pushl $0
  1027fa:	6a 00                	push   $0x0
  pushl $230
  1027fc:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102801:	e9 2c 01 00 00       	jmp    102932 <__alltraps>

00102806 <vector231>:
.globl vector231
vector231:
  pushl $0
  102806:	6a 00                	push   $0x0
  pushl $231
  102808:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  10280d:	e9 20 01 00 00       	jmp    102932 <__alltraps>

00102812 <vector232>:
.globl vector232
vector232:
  pushl $0
  102812:	6a 00                	push   $0x0
  pushl $232
  102814:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102819:	e9 14 01 00 00       	jmp    102932 <__alltraps>

0010281e <vector233>:
.globl vector233
vector233:
  pushl $0
  10281e:	6a 00                	push   $0x0
  pushl $233
  102820:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102825:	e9 08 01 00 00       	jmp    102932 <__alltraps>

0010282a <vector234>:
.globl vector234
vector234:
  pushl $0
  10282a:	6a 00                	push   $0x0
  pushl $234
  10282c:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102831:	e9 fc 00 00 00       	jmp    102932 <__alltraps>

00102836 <vector235>:
.globl vector235
vector235:
  pushl $0
  102836:	6a 00                	push   $0x0
  pushl $235
  102838:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  10283d:	e9 f0 00 00 00       	jmp    102932 <__alltraps>

00102842 <vector236>:
.globl vector236
vector236:
  pushl $0
  102842:	6a 00                	push   $0x0
  pushl $236
  102844:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102849:	e9 e4 00 00 00       	jmp    102932 <__alltraps>

0010284e <vector237>:
.globl vector237
vector237:
  pushl $0
  10284e:	6a 00                	push   $0x0
  pushl $237
  102850:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102855:	e9 d8 00 00 00       	jmp    102932 <__alltraps>

0010285a <vector238>:
.globl vector238
vector238:
  pushl $0
  10285a:	6a 00                	push   $0x0
  pushl $238
  10285c:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102861:	e9 cc 00 00 00       	jmp    102932 <__alltraps>

00102866 <vector239>:
.globl vector239
vector239:
  pushl $0
  102866:	6a 00                	push   $0x0
  pushl $239
  102868:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  10286d:	e9 c0 00 00 00       	jmp    102932 <__alltraps>

00102872 <vector240>:
.globl vector240
vector240:
  pushl $0
  102872:	6a 00                	push   $0x0
  pushl $240
  102874:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102879:	e9 b4 00 00 00       	jmp    102932 <__alltraps>

0010287e <vector241>:
.globl vector241
vector241:
  pushl $0
  10287e:	6a 00                	push   $0x0
  pushl $241
  102880:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102885:	e9 a8 00 00 00       	jmp    102932 <__alltraps>

0010288a <vector242>:
.globl vector242
vector242:
  pushl $0
  10288a:	6a 00                	push   $0x0
  pushl $242
  10288c:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102891:	e9 9c 00 00 00       	jmp    102932 <__alltraps>

00102896 <vector243>:
.globl vector243
vector243:
  pushl $0
  102896:	6a 00                	push   $0x0
  pushl $243
  102898:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  10289d:	e9 90 00 00 00       	jmp    102932 <__alltraps>

001028a2 <vector244>:
.globl vector244
vector244:
  pushl $0
  1028a2:	6a 00                	push   $0x0
  pushl $244
  1028a4:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1028a9:	e9 84 00 00 00       	jmp    102932 <__alltraps>

001028ae <vector245>:
.globl vector245
vector245:
  pushl $0
  1028ae:	6a 00                	push   $0x0
  pushl $245
  1028b0:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1028b5:	e9 78 00 00 00       	jmp    102932 <__alltraps>

001028ba <vector246>:
.globl vector246
vector246:
  pushl $0
  1028ba:	6a 00                	push   $0x0
  pushl $246
  1028bc:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1028c1:	e9 6c 00 00 00       	jmp    102932 <__alltraps>

001028c6 <vector247>:
.globl vector247
vector247:
  pushl $0
  1028c6:	6a 00                	push   $0x0
  pushl $247
  1028c8:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1028cd:	e9 60 00 00 00       	jmp    102932 <__alltraps>

001028d2 <vector248>:
.globl vector248
vector248:
  pushl $0
  1028d2:	6a 00                	push   $0x0
  pushl $248
  1028d4:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1028d9:	e9 54 00 00 00       	jmp    102932 <__alltraps>

001028de <vector249>:
.globl vector249
vector249:
  pushl $0
  1028de:	6a 00                	push   $0x0
  pushl $249
  1028e0:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1028e5:	e9 48 00 00 00       	jmp    102932 <__alltraps>

001028ea <vector250>:
.globl vector250
vector250:
  pushl $0
  1028ea:	6a 00                	push   $0x0
  pushl $250
  1028ec:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1028f1:	e9 3c 00 00 00       	jmp    102932 <__alltraps>

001028f6 <vector251>:
.globl vector251
vector251:
  pushl $0
  1028f6:	6a 00                	push   $0x0
  pushl $251
  1028f8:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1028fd:	e9 30 00 00 00       	jmp    102932 <__alltraps>

00102902 <vector252>:
.globl vector252
vector252:
  pushl $0
  102902:	6a 00                	push   $0x0
  pushl $252
  102904:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102909:	e9 24 00 00 00       	jmp    102932 <__alltraps>

0010290e <vector253>:
.globl vector253
vector253:
  pushl $0
  10290e:	6a 00                	push   $0x0
  pushl $253
  102910:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102915:	e9 18 00 00 00       	jmp    102932 <__alltraps>

0010291a <vector254>:
.globl vector254
vector254:
  pushl $0
  10291a:	6a 00                	push   $0x0
  pushl $254
  10291c:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102921:	e9 0c 00 00 00       	jmp    102932 <__alltraps>

00102926 <vector255>:
.globl vector255
vector255:
  pushl $0
  102926:	6a 00                	push   $0x0
  pushl $255
  102928:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  10292d:	e9 00 00 00 00       	jmp    102932 <__alltraps>

00102932 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102932:	1e                   	push   %ds
    pushl %es
  102933:	06                   	push   %es
    pushl %fs
  102934:	0f a0                	push   %fs
    pushl %gs
  102936:	0f a8                	push   %gs
    pushal
  102938:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102939:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  10293e:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102940:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102942:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102943:	e8 61 f5 ff ff       	call   101ea9 <trap>

    # pop the pushed stack pointer
    popl %esp
  102948:	5c                   	pop    %esp

00102949 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102949:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  10294a:	0f a9                	pop    %gs
    popl %fs
  10294c:	0f a1                	pop    %fs
    popl %es
  10294e:	07                   	pop    %es
    popl %ds
  10294f:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102950:	83 c4 08             	add    $0x8,%esp
    iret
  102953:	cf                   	iret   

00102954 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102954:	55                   	push   %ebp
  102955:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102957:	8b 45 08             	mov    0x8(%ebp),%eax
  10295a:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  10295d:	b8 23 00 00 00       	mov    $0x23,%eax
  102962:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102964:	b8 23 00 00 00       	mov    $0x23,%eax
  102969:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  10296b:	b8 10 00 00 00       	mov    $0x10,%eax
  102970:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102972:	b8 10 00 00 00       	mov    $0x10,%eax
  102977:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102979:	b8 10 00 00 00       	mov    $0x10,%eax
  10297e:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102980:	ea 87 29 10 00 08 00 	ljmp   $0x8,$0x102987
}
  102987:	90                   	nop
  102988:	5d                   	pop    %ebp
  102989:	c3                   	ret    

0010298a <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  10298a:	55                   	push   %ebp
  10298b:	89 e5                	mov    %esp,%ebp
  10298d:	83 ec 10             	sub    $0x10,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102990:	b8 80 f9 10 00       	mov    $0x10f980,%eax
  102995:	05 00 04 00 00       	add    $0x400,%eax
  10299a:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  10299f:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  1029a6:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1029a8:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  1029af:	68 00 
  1029b1:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1029b6:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  1029bc:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1029c1:	c1 e8 10             	shr    $0x10,%eax
  1029c4:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  1029c9:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029d0:	83 e0 f0             	and    $0xfffffff0,%eax
  1029d3:	83 c8 09             	or     $0x9,%eax
  1029d6:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029db:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029e2:	83 c8 10             	or     $0x10,%eax
  1029e5:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029ea:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029f1:	83 e0 9f             	and    $0xffffff9f,%eax
  1029f4:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029f9:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a00:	83 c8 80             	or     $0xffffff80,%eax
  102a03:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a08:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a0f:	83 e0 f0             	and    $0xfffffff0,%eax
  102a12:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a17:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a1e:	83 e0 ef             	and    $0xffffffef,%eax
  102a21:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a26:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a2d:	83 e0 df             	and    $0xffffffdf,%eax
  102a30:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a35:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a3c:	83 c8 40             	or     $0x40,%eax
  102a3f:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a44:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a4b:	83 e0 7f             	and    $0x7f,%eax
  102a4e:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a53:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102a58:	c1 e8 18             	shr    $0x18,%eax
  102a5b:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102a60:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a67:	83 e0 ef             	and    $0xffffffef,%eax
  102a6a:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102a6f:	68 10 ea 10 00       	push   $0x10ea10
  102a74:	e8 db fe ff ff       	call   102954 <lgdt>
  102a79:	83 c4 04             	add    $0x4,%esp
  102a7c:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102a82:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102a86:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102a89:	90                   	nop
  102a8a:	c9                   	leave  
  102a8b:	c3                   	ret    

00102a8c <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102a8c:	55                   	push   %ebp
  102a8d:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102a8f:	e8 f6 fe ff ff       	call   10298a <gdt_init>
}
  102a94:	90                   	nop
  102a95:	5d                   	pop    %ebp
  102a96:	c3                   	ret    

00102a97 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102a97:	55                   	push   %ebp
  102a98:	89 e5                	mov    %esp,%ebp
  102a9a:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102a9d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102aa4:	eb 04                	jmp    102aaa <strlen+0x13>
        cnt ++;
  102aa6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102aaa:	8b 45 08             	mov    0x8(%ebp),%eax
  102aad:	8d 50 01             	lea    0x1(%eax),%edx
  102ab0:	89 55 08             	mov    %edx,0x8(%ebp)
  102ab3:	0f b6 00             	movzbl (%eax),%eax
  102ab6:	84 c0                	test   %al,%al
  102ab8:	75 ec                	jne    102aa6 <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102aba:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102abd:	c9                   	leave  
  102abe:	c3                   	ret    

00102abf <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102abf:	55                   	push   %ebp
  102ac0:	89 e5                	mov    %esp,%ebp
  102ac2:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102ac5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102acc:	eb 04                	jmp    102ad2 <strnlen+0x13>
        cnt ++;
  102ace:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  102ad2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ad5:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102ad8:	73 10                	jae    102aea <strnlen+0x2b>
  102ada:	8b 45 08             	mov    0x8(%ebp),%eax
  102add:	8d 50 01             	lea    0x1(%eax),%edx
  102ae0:	89 55 08             	mov    %edx,0x8(%ebp)
  102ae3:	0f b6 00             	movzbl (%eax),%eax
  102ae6:	84 c0                	test   %al,%al
  102ae8:	75 e4                	jne    102ace <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  102aea:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102aed:	c9                   	leave  
  102aee:	c3                   	ret    

00102aef <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102aef:	55                   	push   %ebp
  102af0:	89 e5                	mov    %esp,%ebp
  102af2:	57                   	push   %edi
  102af3:	56                   	push   %esi
  102af4:	83 ec 20             	sub    $0x20,%esp
  102af7:	8b 45 08             	mov    0x8(%ebp),%eax
  102afa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102afd:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b00:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102b03:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102b06:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b09:	89 d1                	mov    %edx,%ecx
  102b0b:	89 c2                	mov    %eax,%edx
  102b0d:	89 ce                	mov    %ecx,%esi
  102b0f:	89 d7                	mov    %edx,%edi
  102b11:	ac                   	lods   %ds:(%esi),%al
  102b12:	aa                   	stos   %al,%es:(%edi)
  102b13:	84 c0                	test   %al,%al
  102b15:	75 fa                	jne    102b11 <strcpy+0x22>
  102b17:	89 fa                	mov    %edi,%edx
  102b19:	89 f1                	mov    %esi,%ecx
  102b1b:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102b1e:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102b21:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102b24:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  102b27:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102b28:	83 c4 20             	add    $0x20,%esp
  102b2b:	5e                   	pop    %esi
  102b2c:	5f                   	pop    %edi
  102b2d:	5d                   	pop    %ebp
  102b2e:	c3                   	ret    

00102b2f <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102b2f:	55                   	push   %ebp
  102b30:	89 e5                	mov    %esp,%ebp
  102b32:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102b35:	8b 45 08             	mov    0x8(%ebp),%eax
  102b38:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102b3b:	eb 21                	jmp    102b5e <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  102b3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b40:	0f b6 10             	movzbl (%eax),%edx
  102b43:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b46:	88 10                	mov    %dl,(%eax)
  102b48:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b4b:	0f b6 00             	movzbl (%eax),%eax
  102b4e:	84 c0                	test   %al,%al
  102b50:	74 04                	je     102b56 <strncpy+0x27>
            src ++;
  102b52:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102b56:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102b5a:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  102b5e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b62:	75 d9                	jne    102b3d <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  102b64:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102b67:	c9                   	leave  
  102b68:	c3                   	ret    

00102b69 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102b69:	55                   	push   %ebp
  102b6a:	89 e5                	mov    %esp,%ebp
  102b6c:	57                   	push   %edi
  102b6d:	56                   	push   %esi
  102b6e:	83 ec 20             	sub    $0x20,%esp
  102b71:	8b 45 08             	mov    0x8(%ebp),%eax
  102b74:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b77:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  102b7d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102b80:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b83:	89 d1                	mov    %edx,%ecx
  102b85:	89 c2                	mov    %eax,%edx
  102b87:	89 ce                	mov    %ecx,%esi
  102b89:	89 d7                	mov    %edx,%edi
  102b8b:	ac                   	lods   %ds:(%esi),%al
  102b8c:	ae                   	scas   %es:(%edi),%al
  102b8d:	75 08                	jne    102b97 <strcmp+0x2e>
  102b8f:	84 c0                	test   %al,%al
  102b91:	75 f8                	jne    102b8b <strcmp+0x22>
  102b93:	31 c0                	xor    %eax,%eax
  102b95:	eb 04                	jmp    102b9b <strcmp+0x32>
  102b97:	19 c0                	sbb    %eax,%eax
  102b99:	0c 01                	or     $0x1,%al
  102b9b:	89 fa                	mov    %edi,%edx
  102b9d:	89 f1                	mov    %esi,%ecx
  102b9f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102ba2:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102ba5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  102ba8:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  102bab:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102bac:	83 c4 20             	add    $0x20,%esp
  102baf:	5e                   	pop    %esi
  102bb0:	5f                   	pop    %edi
  102bb1:	5d                   	pop    %ebp
  102bb2:	c3                   	ret    

00102bb3 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102bb3:	55                   	push   %ebp
  102bb4:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102bb6:	eb 0c                	jmp    102bc4 <strncmp+0x11>
        n --, s1 ++, s2 ++;
  102bb8:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102bbc:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102bc0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102bc4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bc8:	74 1a                	je     102be4 <strncmp+0x31>
  102bca:	8b 45 08             	mov    0x8(%ebp),%eax
  102bcd:	0f b6 00             	movzbl (%eax),%eax
  102bd0:	84 c0                	test   %al,%al
  102bd2:	74 10                	je     102be4 <strncmp+0x31>
  102bd4:	8b 45 08             	mov    0x8(%ebp),%eax
  102bd7:	0f b6 10             	movzbl (%eax),%edx
  102bda:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bdd:	0f b6 00             	movzbl (%eax),%eax
  102be0:	38 c2                	cmp    %al,%dl
  102be2:	74 d4                	je     102bb8 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102be4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102be8:	74 18                	je     102c02 <strncmp+0x4f>
  102bea:	8b 45 08             	mov    0x8(%ebp),%eax
  102bed:	0f b6 00             	movzbl (%eax),%eax
  102bf0:	0f b6 d0             	movzbl %al,%edx
  102bf3:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bf6:	0f b6 00             	movzbl (%eax),%eax
  102bf9:	0f b6 c0             	movzbl %al,%eax
  102bfc:	29 c2                	sub    %eax,%edx
  102bfe:	89 d0                	mov    %edx,%eax
  102c00:	eb 05                	jmp    102c07 <strncmp+0x54>
  102c02:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c07:	5d                   	pop    %ebp
  102c08:	c3                   	ret    

00102c09 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102c09:	55                   	push   %ebp
  102c0a:	89 e5                	mov    %esp,%ebp
  102c0c:	83 ec 04             	sub    $0x4,%esp
  102c0f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c12:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c15:	eb 14                	jmp    102c2b <strchr+0x22>
        if (*s == c) {
  102c17:	8b 45 08             	mov    0x8(%ebp),%eax
  102c1a:	0f b6 00             	movzbl (%eax),%eax
  102c1d:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102c20:	75 05                	jne    102c27 <strchr+0x1e>
            return (char *)s;
  102c22:	8b 45 08             	mov    0x8(%ebp),%eax
  102c25:	eb 13                	jmp    102c3a <strchr+0x31>
        }
        s ++;
  102c27:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  102c2b:	8b 45 08             	mov    0x8(%ebp),%eax
  102c2e:	0f b6 00             	movzbl (%eax),%eax
  102c31:	84 c0                	test   %al,%al
  102c33:	75 e2                	jne    102c17 <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  102c35:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c3a:	c9                   	leave  
  102c3b:	c3                   	ret    

00102c3c <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102c3c:	55                   	push   %ebp
  102c3d:	89 e5                	mov    %esp,%ebp
  102c3f:	83 ec 04             	sub    $0x4,%esp
  102c42:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c45:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c48:	eb 0f                	jmp    102c59 <strfind+0x1d>
        if (*s == c) {
  102c4a:	8b 45 08             	mov    0x8(%ebp),%eax
  102c4d:	0f b6 00             	movzbl (%eax),%eax
  102c50:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102c53:	74 10                	je     102c65 <strfind+0x29>
            break;
        }
        s ++;
  102c55:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  102c59:	8b 45 08             	mov    0x8(%ebp),%eax
  102c5c:	0f b6 00             	movzbl (%eax),%eax
  102c5f:	84 c0                	test   %al,%al
  102c61:	75 e7                	jne    102c4a <strfind+0xe>
  102c63:	eb 01                	jmp    102c66 <strfind+0x2a>
        if (*s == c) {
            break;
  102c65:	90                   	nop
        }
        s ++;
    }
    return (char *)s;
  102c66:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102c69:	c9                   	leave  
  102c6a:	c3                   	ret    

00102c6b <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102c6b:	55                   	push   %ebp
  102c6c:	89 e5                	mov    %esp,%ebp
  102c6e:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102c71:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102c78:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102c7f:	eb 04                	jmp    102c85 <strtol+0x1a>
        s ++;
  102c81:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102c85:	8b 45 08             	mov    0x8(%ebp),%eax
  102c88:	0f b6 00             	movzbl (%eax),%eax
  102c8b:	3c 20                	cmp    $0x20,%al
  102c8d:	74 f2                	je     102c81 <strtol+0x16>
  102c8f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c92:	0f b6 00             	movzbl (%eax),%eax
  102c95:	3c 09                	cmp    $0x9,%al
  102c97:	74 e8                	je     102c81 <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  102c99:	8b 45 08             	mov    0x8(%ebp),%eax
  102c9c:	0f b6 00             	movzbl (%eax),%eax
  102c9f:	3c 2b                	cmp    $0x2b,%al
  102ca1:	75 06                	jne    102ca9 <strtol+0x3e>
        s ++;
  102ca3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102ca7:	eb 15                	jmp    102cbe <strtol+0x53>
    }
    else if (*s == '-') {
  102ca9:	8b 45 08             	mov    0x8(%ebp),%eax
  102cac:	0f b6 00             	movzbl (%eax),%eax
  102caf:	3c 2d                	cmp    $0x2d,%al
  102cb1:	75 0b                	jne    102cbe <strtol+0x53>
        s ++, neg = 1;
  102cb3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102cb7:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102cbe:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102cc2:	74 06                	je     102cca <strtol+0x5f>
  102cc4:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102cc8:	75 24                	jne    102cee <strtol+0x83>
  102cca:	8b 45 08             	mov    0x8(%ebp),%eax
  102ccd:	0f b6 00             	movzbl (%eax),%eax
  102cd0:	3c 30                	cmp    $0x30,%al
  102cd2:	75 1a                	jne    102cee <strtol+0x83>
  102cd4:	8b 45 08             	mov    0x8(%ebp),%eax
  102cd7:	83 c0 01             	add    $0x1,%eax
  102cda:	0f b6 00             	movzbl (%eax),%eax
  102cdd:	3c 78                	cmp    $0x78,%al
  102cdf:	75 0d                	jne    102cee <strtol+0x83>
        s += 2, base = 16;
  102ce1:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102ce5:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102cec:	eb 2a                	jmp    102d18 <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  102cee:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102cf2:	75 17                	jne    102d0b <strtol+0xa0>
  102cf4:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf7:	0f b6 00             	movzbl (%eax),%eax
  102cfa:	3c 30                	cmp    $0x30,%al
  102cfc:	75 0d                	jne    102d0b <strtol+0xa0>
        s ++, base = 8;
  102cfe:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102d02:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102d09:	eb 0d                	jmp    102d18 <strtol+0xad>
    }
    else if (base == 0) {
  102d0b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d0f:	75 07                	jne    102d18 <strtol+0xad>
        base = 10;
  102d11:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102d18:	8b 45 08             	mov    0x8(%ebp),%eax
  102d1b:	0f b6 00             	movzbl (%eax),%eax
  102d1e:	3c 2f                	cmp    $0x2f,%al
  102d20:	7e 1b                	jle    102d3d <strtol+0xd2>
  102d22:	8b 45 08             	mov    0x8(%ebp),%eax
  102d25:	0f b6 00             	movzbl (%eax),%eax
  102d28:	3c 39                	cmp    $0x39,%al
  102d2a:	7f 11                	jg     102d3d <strtol+0xd2>
            dig = *s - '0';
  102d2c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d2f:	0f b6 00             	movzbl (%eax),%eax
  102d32:	0f be c0             	movsbl %al,%eax
  102d35:	83 e8 30             	sub    $0x30,%eax
  102d38:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d3b:	eb 48                	jmp    102d85 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102d3d:	8b 45 08             	mov    0x8(%ebp),%eax
  102d40:	0f b6 00             	movzbl (%eax),%eax
  102d43:	3c 60                	cmp    $0x60,%al
  102d45:	7e 1b                	jle    102d62 <strtol+0xf7>
  102d47:	8b 45 08             	mov    0x8(%ebp),%eax
  102d4a:	0f b6 00             	movzbl (%eax),%eax
  102d4d:	3c 7a                	cmp    $0x7a,%al
  102d4f:	7f 11                	jg     102d62 <strtol+0xf7>
            dig = *s - 'a' + 10;
  102d51:	8b 45 08             	mov    0x8(%ebp),%eax
  102d54:	0f b6 00             	movzbl (%eax),%eax
  102d57:	0f be c0             	movsbl %al,%eax
  102d5a:	83 e8 57             	sub    $0x57,%eax
  102d5d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d60:	eb 23                	jmp    102d85 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102d62:	8b 45 08             	mov    0x8(%ebp),%eax
  102d65:	0f b6 00             	movzbl (%eax),%eax
  102d68:	3c 40                	cmp    $0x40,%al
  102d6a:	7e 3c                	jle    102da8 <strtol+0x13d>
  102d6c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d6f:	0f b6 00             	movzbl (%eax),%eax
  102d72:	3c 5a                	cmp    $0x5a,%al
  102d74:	7f 32                	jg     102da8 <strtol+0x13d>
            dig = *s - 'A' + 10;
  102d76:	8b 45 08             	mov    0x8(%ebp),%eax
  102d79:	0f b6 00             	movzbl (%eax),%eax
  102d7c:	0f be c0             	movsbl %al,%eax
  102d7f:	83 e8 37             	sub    $0x37,%eax
  102d82:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102d85:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d88:	3b 45 10             	cmp    0x10(%ebp),%eax
  102d8b:	7d 1a                	jge    102da7 <strtol+0x13c>
            break;
        }
        s ++, val = (val * base) + dig;
  102d8d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102d91:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d94:	0f af 45 10          	imul   0x10(%ebp),%eax
  102d98:	89 c2                	mov    %eax,%edx
  102d9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d9d:	01 d0                	add    %edx,%eax
  102d9f:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  102da2:	e9 71 ff ff ff       	jmp    102d18 <strtol+0xad>
        }
        else {
            break;
        }
        if (dig >= base) {
            break;
  102da7:	90                   	nop
        }
        s ++, val = (val * base) + dig;
        // we don't properly detect overflow!
    }

    if (endptr) {
  102da8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102dac:	74 08                	je     102db6 <strtol+0x14b>
        *endptr = (char *) s;
  102dae:	8b 45 0c             	mov    0xc(%ebp),%eax
  102db1:	8b 55 08             	mov    0x8(%ebp),%edx
  102db4:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102db6:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102dba:	74 07                	je     102dc3 <strtol+0x158>
  102dbc:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102dbf:	f7 d8                	neg    %eax
  102dc1:	eb 03                	jmp    102dc6 <strtol+0x15b>
  102dc3:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102dc6:	c9                   	leave  
  102dc7:	c3                   	ret    

00102dc8 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102dc8:	55                   	push   %ebp
  102dc9:	89 e5                	mov    %esp,%ebp
  102dcb:	57                   	push   %edi
  102dcc:	83 ec 24             	sub    $0x24,%esp
  102dcf:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dd2:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102dd5:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102dd9:	8b 55 08             	mov    0x8(%ebp),%edx
  102ddc:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102ddf:	88 45 f7             	mov    %al,-0x9(%ebp)
  102de2:	8b 45 10             	mov    0x10(%ebp),%eax
  102de5:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102de8:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102deb:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102def:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102df2:	89 d7                	mov    %edx,%edi
  102df4:	f3 aa                	rep stos %al,%es:(%edi)
  102df6:	89 fa                	mov    %edi,%edx
  102df8:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102dfb:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102dfe:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102e01:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102e02:	83 c4 24             	add    $0x24,%esp
  102e05:	5f                   	pop    %edi
  102e06:	5d                   	pop    %ebp
  102e07:	c3                   	ret    

00102e08 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102e08:	55                   	push   %ebp
  102e09:	89 e5                	mov    %esp,%ebp
  102e0b:	57                   	push   %edi
  102e0c:	56                   	push   %esi
  102e0d:	53                   	push   %ebx
  102e0e:	83 ec 30             	sub    $0x30,%esp
  102e11:	8b 45 08             	mov    0x8(%ebp),%eax
  102e14:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e17:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e1a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102e1d:	8b 45 10             	mov    0x10(%ebp),%eax
  102e20:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102e23:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e26:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102e29:	73 42                	jae    102e6d <memmove+0x65>
  102e2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e2e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102e31:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e34:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102e37:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e3a:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102e3d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e40:	c1 e8 02             	shr    $0x2,%eax
  102e43:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102e45:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102e48:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e4b:	89 d7                	mov    %edx,%edi
  102e4d:	89 c6                	mov    %eax,%esi
  102e4f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102e51:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102e54:	83 e1 03             	and    $0x3,%ecx
  102e57:	74 02                	je     102e5b <memmove+0x53>
  102e59:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e5b:	89 f0                	mov    %esi,%eax
  102e5d:	89 fa                	mov    %edi,%edx
  102e5f:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102e62:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102e65:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102e68:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  102e6b:	eb 36                	jmp    102ea3 <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102e6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e70:	8d 50 ff             	lea    -0x1(%eax),%edx
  102e73:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e76:	01 c2                	add    %eax,%edx
  102e78:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e7b:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102e7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e81:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  102e84:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e87:	89 c1                	mov    %eax,%ecx
  102e89:	89 d8                	mov    %ebx,%eax
  102e8b:	89 d6                	mov    %edx,%esi
  102e8d:	89 c7                	mov    %eax,%edi
  102e8f:	fd                   	std    
  102e90:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e92:	fc                   	cld    
  102e93:	89 f8                	mov    %edi,%eax
  102e95:	89 f2                	mov    %esi,%edx
  102e97:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102e9a:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102e9d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  102ea0:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102ea3:	83 c4 30             	add    $0x30,%esp
  102ea6:	5b                   	pop    %ebx
  102ea7:	5e                   	pop    %esi
  102ea8:	5f                   	pop    %edi
  102ea9:	5d                   	pop    %ebp
  102eaa:	c3                   	ret    

00102eab <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102eab:	55                   	push   %ebp
  102eac:	89 e5                	mov    %esp,%ebp
  102eae:	57                   	push   %edi
  102eaf:	56                   	push   %esi
  102eb0:	83 ec 20             	sub    $0x20,%esp
  102eb3:	8b 45 08             	mov    0x8(%ebp),%eax
  102eb6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102eb9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ebc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ebf:	8b 45 10             	mov    0x10(%ebp),%eax
  102ec2:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102ec5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ec8:	c1 e8 02             	shr    $0x2,%eax
  102ecb:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102ecd:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ed0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ed3:	89 d7                	mov    %edx,%edi
  102ed5:	89 c6                	mov    %eax,%esi
  102ed7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102ed9:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102edc:	83 e1 03             	and    $0x3,%ecx
  102edf:	74 02                	je     102ee3 <memcpy+0x38>
  102ee1:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ee3:	89 f0                	mov    %esi,%eax
  102ee5:	89 fa                	mov    %edi,%edx
  102ee7:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102eea:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102eed:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102ef0:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  102ef3:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102ef4:	83 c4 20             	add    $0x20,%esp
  102ef7:	5e                   	pop    %esi
  102ef8:	5f                   	pop    %edi
  102ef9:	5d                   	pop    %ebp
  102efa:	c3                   	ret    

00102efb <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102efb:	55                   	push   %ebp
  102efc:	89 e5                	mov    %esp,%ebp
  102efe:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102f01:	8b 45 08             	mov    0x8(%ebp),%eax
  102f04:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102f07:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f0a:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102f0d:	eb 30                	jmp    102f3f <memcmp+0x44>
        if (*s1 != *s2) {
  102f0f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f12:	0f b6 10             	movzbl (%eax),%edx
  102f15:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f18:	0f b6 00             	movzbl (%eax),%eax
  102f1b:	38 c2                	cmp    %al,%dl
  102f1d:	74 18                	je     102f37 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102f1f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f22:	0f b6 00             	movzbl (%eax),%eax
  102f25:	0f b6 d0             	movzbl %al,%edx
  102f28:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f2b:	0f b6 00             	movzbl (%eax),%eax
  102f2e:	0f b6 c0             	movzbl %al,%eax
  102f31:	29 c2                	sub    %eax,%edx
  102f33:	89 d0                	mov    %edx,%eax
  102f35:	eb 1a                	jmp    102f51 <memcmp+0x56>
        }
        s1 ++, s2 ++;
  102f37:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102f3b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  102f3f:	8b 45 10             	mov    0x10(%ebp),%eax
  102f42:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f45:	89 55 10             	mov    %edx,0x10(%ebp)
  102f48:	85 c0                	test   %eax,%eax
  102f4a:	75 c3                	jne    102f0f <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  102f4c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f51:	c9                   	leave  
  102f52:	c3                   	ret    

00102f53 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102f53:	55                   	push   %ebp
  102f54:	89 e5                	mov    %esp,%ebp
  102f56:	83 ec 38             	sub    $0x38,%esp
  102f59:	8b 45 10             	mov    0x10(%ebp),%eax
  102f5c:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102f5f:	8b 45 14             	mov    0x14(%ebp),%eax
  102f62:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102f65:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102f68:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102f6b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f6e:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102f71:	8b 45 18             	mov    0x18(%ebp),%eax
  102f74:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102f77:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f7a:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102f7d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102f80:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102f83:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f86:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102f89:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102f8d:	74 1c                	je     102fab <printnum+0x58>
  102f8f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f92:	ba 00 00 00 00       	mov    $0x0,%edx
  102f97:	f7 75 e4             	divl   -0x1c(%ebp)
  102f9a:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102f9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fa0:	ba 00 00 00 00       	mov    $0x0,%edx
  102fa5:	f7 75 e4             	divl   -0x1c(%ebp)
  102fa8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fab:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fae:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102fb1:	f7 75 e4             	divl   -0x1c(%ebp)
  102fb4:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102fb7:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102fba:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fbd:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102fc0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102fc3:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102fc6:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102fc9:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102fcc:	8b 45 18             	mov    0x18(%ebp),%eax
  102fcf:	ba 00 00 00 00       	mov    $0x0,%edx
  102fd4:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102fd7:	77 41                	ja     10301a <printnum+0xc7>
  102fd9:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102fdc:	72 05                	jb     102fe3 <printnum+0x90>
  102fde:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102fe1:	77 37                	ja     10301a <printnum+0xc7>
        printnum(putch, putdat, result, base, width - 1, padc);
  102fe3:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102fe6:	83 e8 01             	sub    $0x1,%eax
  102fe9:	83 ec 04             	sub    $0x4,%esp
  102fec:	ff 75 20             	pushl  0x20(%ebp)
  102fef:	50                   	push   %eax
  102ff0:	ff 75 18             	pushl  0x18(%ebp)
  102ff3:	ff 75 ec             	pushl  -0x14(%ebp)
  102ff6:	ff 75 e8             	pushl  -0x18(%ebp)
  102ff9:	ff 75 0c             	pushl  0xc(%ebp)
  102ffc:	ff 75 08             	pushl  0x8(%ebp)
  102fff:	e8 4f ff ff ff       	call   102f53 <printnum>
  103004:	83 c4 20             	add    $0x20,%esp
  103007:	eb 1b                	jmp    103024 <printnum+0xd1>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  103009:	83 ec 08             	sub    $0x8,%esp
  10300c:	ff 75 0c             	pushl  0xc(%ebp)
  10300f:	ff 75 20             	pushl  0x20(%ebp)
  103012:	8b 45 08             	mov    0x8(%ebp),%eax
  103015:	ff d0                	call   *%eax
  103017:	83 c4 10             	add    $0x10,%esp
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  10301a:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  10301e:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  103022:	7f e5                	jg     103009 <printnum+0xb6>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  103024:	8b 45 d8             	mov    -0x28(%ebp),%eax
  103027:	05 10 3d 10 00       	add    $0x103d10,%eax
  10302c:	0f b6 00             	movzbl (%eax),%eax
  10302f:	0f be c0             	movsbl %al,%eax
  103032:	83 ec 08             	sub    $0x8,%esp
  103035:	ff 75 0c             	pushl  0xc(%ebp)
  103038:	50                   	push   %eax
  103039:	8b 45 08             	mov    0x8(%ebp),%eax
  10303c:	ff d0                	call   *%eax
  10303e:	83 c4 10             	add    $0x10,%esp
}
  103041:	90                   	nop
  103042:	c9                   	leave  
  103043:	c3                   	ret    

00103044 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  103044:	55                   	push   %ebp
  103045:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  103047:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  10304b:	7e 14                	jle    103061 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  10304d:	8b 45 08             	mov    0x8(%ebp),%eax
  103050:	8b 00                	mov    (%eax),%eax
  103052:	8d 48 08             	lea    0x8(%eax),%ecx
  103055:	8b 55 08             	mov    0x8(%ebp),%edx
  103058:	89 0a                	mov    %ecx,(%edx)
  10305a:	8b 50 04             	mov    0x4(%eax),%edx
  10305d:	8b 00                	mov    (%eax),%eax
  10305f:	eb 30                	jmp    103091 <getuint+0x4d>
    }
    else if (lflag) {
  103061:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103065:	74 16                	je     10307d <getuint+0x39>
        return va_arg(*ap, unsigned long);
  103067:	8b 45 08             	mov    0x8(%ebp),%eax
  10306a:	8b 00                	mov    (%eax),%eax
  10306c:	8d 48 04             	lea    0x4(%eax),%ecx
  10306f:	8b 55 08             	mov    0x8(%ebp),%edx
  103072:	89 0a                	mov    %ecx,(%edx)
  103074:	8b 00                	mov    (%eax),%eax
  103076:	ba 00 00 00 00       	mov    $0x0,%edx
  10307b:	eb 14                	jmp    103091 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  10307d:	8b 45 08             	mov    0x8(%ebp),%eax
  103080:	8b 00                	mov    (%eax),%eax
  103082:	8d 48 04             	lea    0x4(%eax),%ecx
  103085:	8b 55 08             	mov    0x8(%ebp),%edx
  103088:	89 0a                	mov    %ecx,(%edx)
  10308a:	8b 00                	mov    (%eax),%eax
  10308c:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  103091:	5d                   	pop    %ebp
  103092:	c3                   	ret    

00103093 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  103093:	55                   	push   %ebp
  103094:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  103096:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  10309a:	7e 14                	jle    1030b0 <getint+0x1d>
        return va_arg(*ap, long long);
  10309c:	8b 45 08             	mov    0x8(%ebp),%eax
  10309f:	8b 00                	mov    (%eax),%eax
  1030a1:	8d 48 08             	lea    0x8(%eax),%ecx
  1030a4:	8b 55 08             	mov    0x8(%ebp),%edx
  1030a7:	89 0a                	mov    %ecx,(%edx)
  1030a9:	8b 50 04             	mov    0x4(%eax),%edx
  1030ac:	8b 00                	mov    (%eax),%eax
  1030ae:	eb 28                	jmp    1030d8 <getint+0x45>
    }
    else if (lflag) {
  1030b0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1030b4:	74 12                	je     1030c8 <getint+0x35>
        return va_arg(*ap, long);
  1030b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1030b9:	8b 00                	mov    (%eax),%eax
  1030bb:	8d 48 04             	lea    0x4(%eax),%ecx
  1030be:	8b 55 08             	mov    0x8(%ebp),%edx
  1030c1:	89 0a                	mov    %ecx,(%edx)
  1030c3:	8b 00                	mov    (%eax),%eax
  1030c5:	99                   	cltd   
  1030c6:	eb 10                	jmp    1030d8 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  1030c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1030cb:	8b 00                	mov    (%eax),%eax
  1030cd:	8d 48 04             	lea    0x4(%eax),%ecx
  1030d0:	8b 55 08             	mov    0x8(%ebp),%edx
  1030d3:	89 0a                	mov    %ecx,(%edx)
  1030d5:	8b 00                	mov    (%eax),%eax
  1030d7:	99                   	cltd   
    }
}
  1030d8:	5d                   	pop    %ebp
  1030d9:	c3                   	ret    

001030da <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  1030da:	55                   	push   %ebp
  1030db:	89 e5                	mov    %esp,%ebp
  1030dd:	83 ec 18             	sub    $0x18,%esp
    va_list ap;

    va_start(ap, fmt);
  1030e0:	8d 45 14             	lea    0x14(%ebp),%eax
  1030e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  1030e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1030e9:	50                   	push   %eax
  1030ea:	ff 75 10             	pushl  0x10(%ebp)
  1030ed:	ff 75 0c             	pushl  0xc(%ebp)
  1030f0:	ff 75 08             	pushl  0x8(%ebp)
  1030f3:	e8 06 00 00 00       	call   1030fe <vprintfmt>
  1030f8:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  1030fb:	90                   	nop
  1030fc:	c9                   	leave  
  1030fd:	c3                   	ret    

001030fe <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  1030fe:	55                   	push   %ebp
  1030ff:	89 e5                	mov    %esp,%ebp
  103101:	56                   	push   %esi
  103102:	53                   	push   %ebx
  103103:	83 ec 20             	sub    $0x20,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103106:	eb 17                	jmp    10311f <vprintfmt+0x21>
            if (ch == '\0') {
  103108:	85 db                	test   %ebx,%ebx
  10310a:	0f 84 8e 03 00 00    	je     10349e <vprintfmt+0x3a0>
                return;
            }
            putch(ch, putdat);
  103110:	83 ec 08             	sub    $0x8,%esp
  103113:	ff 75 0c             	pushl  0xc(%ebp)
  103116:	53                   	push   %ebx
  103117:	8b 45 08             	mov    0x8(%ebp),%eax
  10311a:	ff d0                	call   *%eax
  10311c:	83 c4 10             	add    $0x10,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  10311f:	8b 45 10             	mov    0x10(%ebp),%eax
  103122:	8d 50 01             	lea    0x1(%eax),%edx
  103125:	89 55 10             	mov    %edx,0x10(%ebp)
  103128:	0f b6 00             	movzbl (%eax),%eax
  10312b:	0f b6 d8             	movzbl %al,%ebx
  10312e:	83 fb 25             	cmp    $0x25,%ebx
  103131:	75 d5                	jne    103108 <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  103133:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  103137:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  10313e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103141:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  103144:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  10314b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10314e:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  103151:	8b 45 10             	mov    0x10(%ebp),%eax
  103154:	8d 50 01             	lea    0x1(%eax),%edx
  103157:	89 55 10             	mov    %edx,0x10(%ebp)
  10315a:	0f b6 00             	movzbl (%eax),%eax
  10315d:	0f b6 d8             	movzbl %al,%ebx
  103160:	8d 43 dd             	lea    -0x23(%ebx),%eax
  103163:	83 f8 55             	cmp    $0x55,%eax
  103166:	0f 87 05 03 00 00    	ja     103471 <vprintfmt+0x373>
  10316c:	8b 04 85 34 3d 10 00 	mov    0x103d34(,%eax,4),%eax
  103173:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  103175:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  103179:	eb d6                	jmp    103151 <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  10317b:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  10317f:	eb d0                	jmp    103151 <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  103181:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  103188:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10318b:	89 d0                	mov    %edx,%eax
  10318d:	c1 e0 02             	shl    $0x2,%eax
  103190:	01 d0                	add    %edx,%eax
  103192:	01 c0                	add    %eax,%eax
  103194:	01 d8                	add    %ebx,%eax
  103196:	83 e8 30             	sub    $0x30,%eax
  103199:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  10319c:	8b 45 10             	mov    0x10(%ebp),%eax
  10319f:	0f b6 00             	movzbl (%eax),%eax
  1031a2:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  1031a5:	83 fb 2f             	cmp    $0x2f,%ebx
  1031a8:	7e 39                	jle    1031e3 <vprintfmt+0xe5>
  1031aa:	83 fb 39             	cmp    $0x39,%ebx
  1031ad:	7f 34                	jg     1031e3 <vprintfmt+0xe5>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  1031af:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  1031b3:	eb d3                	jmp    103188 <vprintfmt+0x8a>
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  1031b5:	8b 45 14             	mov    0x14(%ebp),%eax
  1031b8:	8d 50 04             	lea    0x4(%eax),%edx
  1031bb:	89 55 14             	mov    %edx,0x14(%ebp)
  1031be:	8b 00                	mov    (%eax),%eax
  1031c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  1031c3:	eb 1f                	jmp    1031e4 <vprintfmt+0xe6>

        case '.':
            if (width < 0)
  1031c5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1031c9:	79 86                	jns    103151 <vprintfmt+0x53>
                width = 0;
  1031cb:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  1031d2:	e9 7a ff ff ff       	jmp    103151 <vprintfmt+0x53>

        case '#':
            altflag = 1;
  1031d7:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  1031de:	e9 6e ff ff ff       	jmp    103151 <vprintfmt+0x53>
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
            goto process_precision;
  1031e3:	90                   	nop
        case '#':
            altflag = 1;
            goto reswitch;

        process_precision:
            if (width < 0)
  1031e4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1031e8:	0f 89 63 ff ff ff    	jns    103151 <vprintfmt+0x53>
                width = precision, precision = -1;
  1031ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1031f1:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1031f4:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  1031fb:	e9 51 ff ff ff       	jmp    103151 <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  103200:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  103204:	e9 48 ff ff ff       	jmp    103151 <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  103209:	8b 45 14             	mov    0x14(%ebp),%eax
  10320c:	8d 50 04             	lea    0x4(%eax),%edx
  10320f:	89 55 14             	mov    %edx,0x14(%ebp)
  103212:	8b 00                	mov    (%eax),%eax
  103214:	83 ec 08             	sub    $0x8,%esp
  103217:	ff 75 0c             	pushl  0xc(%ebp)
  10321a:	50                   	push   %eax
  10321b:	8b 45 08             	mov    0x8(%ebp),%eax
  10321e:	ff d0                	call   *%eax
  103220:	83 c4 10             	add    $0x10,%esp
            break;
  103223:	e9 71 02 00 00       	jmp    103499 <vprintfmt+0x39b>

        // error message
        case 'e':
            err = va_arg(ap, int);
  103228:	8b 45 14             	mov    0x14(%ebp),%eax
  10322b:	8d 50 04             	lea    0x4(%eax),%edx
  10322e:	89 55 14             	mov    %edx,0x14(%ebp)
  103231:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  103233:	85 db                	test   %ebx,%ebx
  103235:	79 02                	jns    103239 <vprintfmt+0x13b>
                err = -err;
  103237:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  103239:	83 fb 06             	cmp    $0x6,%ebx
  10323c:	7f 0b                	jg     103249 <vprintfmt+0x14b>
  10323e:	8b 34 9d f4 3c 10 00 	mov    0x103cf4(,%ebx,4),%esi
  103245:	85 f6                	test   %esi,%esi
  103247:	75 19                	jne    103262 <vprintfmt+0x164>
                printfmt(putch, putdat, "error %d", err);
  103249:	53                   	push   %ebx
  10324a:	68 21 3d 10 00       	push   $0x103d21
  10324f:	ff 75 0c             	pushl  0xc(%ebp)
  103252:	ff 75 08             	pushl  0x8(%ebp)
  103255:	e8 80 fe ff ff       	call   1030da <printfmt>
  10325a:	83 c4 10             	add    $0x10,%esp
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  10325d:	e9 37 02 00 00       	jmp    103499 <vprintfmt+0x39b>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  103262:	56                   	push   %esi
  103263:	68 2a 3d 10 00       	push   $0x103d2a
  103268:	ff 75 0c             	pushl  0xc(%ebp)
  10326b:	ff 75 08             	pushl  0x8(%ebp)
  10326e:	e8 67 fe ff ff       	call   1030da <printfmt>
  103273:	83 c4 10             	add    $0x10,%esp
            }
            break;
  103276:	e9 1e 02 00 00       	jmp    103499 <vprintfmt+0x39b>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  10327b:	8b 45 14             	mov    0x14(%ebp),%eax
  10327e:	8d 50 04             	lea    0x4(%eax),%edx
  103281:	89 55 14             	mov    %edx,0x14(%ebp)
  103284:	8b 30                	mov    (%eax),%esi
  103286:	85 f6                	test   %esi,%esi
  103288:	75 05                	jne    10328f <vprintfmt+0x191>
                p = "(null)";
  10328a:	be 2d 3d 10 00       	mov    $0x103d2d,%esi
            }
            if (width > 0 && padc != '-') {
  10328f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103293:	7e 76                	jle    10330b <vprintfmt+0x20d>
  103295:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  103299:	74 70                	je     10330b <vprintfmt+0x20d>
                for (width -= strnlen(p, precision); width > 0; width --) {
  10329b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10329e:	83 ec 08             	sub    $0x8,%esp
  1032a1:	50                   	push   %eax
  1032a2:	56                   	push   %esi
  1032a3:	e8 17 f8 ff ff       	call   102abf <strnlen>
  1032a8:	83 c4 10             	add    $0x10,%esp
  1032ab:	89 c2                	mov    %eax,%edx
  1032ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1032b0:	29 d0                	sub    %edx,%eax
  1032b2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1032b5:	eb 17                	jmp    1032ce <vprintfmt+0x1d0>
                    putch(padc, putdat);
  1032b7:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  1032bb:	83 ec 08             	sub    $0x8,%esp
  1032be:	ff 75 0c             	pushl  0xc(%ebp)
  1032c1:	50                   	push   %eax
  1032c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1032c5:	ff d0                	call   *%eax
  1032c7:	83 c4 10             	add    $0x10,%esp
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  1032ca:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  1032ce:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1032d2:	7f e3                	jg     1032b7 <vprintfmt+0x1b9>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1032d4:	eb 35                	jmp    10330b <vprintfmt+0x20d>
                if (altflag && (ch < ' ' || ch > '~')) {
  1032d6:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  1032da:	74 1c                	je     1032f8 <vprintfmt+0x1fa>
  1032dc:	83 fb 1f             	cmp    $0x1f,%ebx
  1032df:	7e 05                	jle    1032e6 <vprintfmt+0x1e8>
  1032e1:	83 fb 7e             	cmp    $0x7e,%ebx
  1032e4:	7e 12                	jle    1032f8 <vprintfmt+0x1fa>
                    putch('?', putdat);
  1032e6:	83 ec 08             	sub    $0x8,%esp
  1032e9:	ff 75 0c             	pushl  0xc(%ebp)
  1032ec:	6a 3f                	push   $0x3f
  1032ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1032f1:	ff d0                	call   *%eax
  1032f3:	83 c4 10             	add    $0x10,%esp
  1032f6:	eb 0f                	jmp    103307 <vprintfmt+0x209>
                }
                else {
                    putch(ch, putdat);
  1032f8:	83 ec 08             	sub    $0x8,%esp
  1032fb:	ff 75 0c             	pushl  0xc(%ebp)
  1032fe:	53                   	push   %ebx
  1032ff:	8b 45 08             	mov    0x8(%ebp),%eax
  103302:	ff d0                	call   *%eax
  103304:	83 c4 10             	add    $0x10,%esp
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103307:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  10330b:	89 f0                	mov    %esi,%eax
  10330d:	8d 70 01             	lea    0x1(%eax),%esi
  103310:	0f b6 00             	movzbl (%eax),%eax
  103313:	0f be d8             	movsbl %al,%ebx
  103316:	85 db                	test   %ebx,%ebx
  103318:	74 26                	je     103340 <vprintfmt+0x242>
  10331a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10331e:	78 b6                	js     1032d6 <vprintfmt+0x1d8>
  103320:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  103324:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103328:	79 ac                	jns    1032d6 <vprintfmt+0x1d8>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  10332a:	eb 14                	jmp    103340 <vprintfmt+0x242>
                putch(' ', putdat);
  10332c:	83 ec 08             	sub    $0x8,%esp
  10332f:	ff 75 0c             	pushl  0xc(%ebp)
  103332:	6a 20                	push   $0x20
  103334:	8b 45 08             	mov    0x8(%ebp),%eax
  103337:	ff d0                	call   *%eax
  103339:	83 c4 10             	add    $0x10,%esp
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  10333c:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  103340:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103344:	7f e6                	jg     10332c <vprintfmt+0x22e>
                putch(' ', putdat);
            }
            break;
  103346:	e9 4e 01 00 00       	jmp    103499 <vprintfmt+0x39b>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  10334b:	83 ec 08             	sub    $0x8,%esp
  10334e:	ff 75 e0             	pushl  -0x20(%ebp)
  103351:	8d 45 14             	lea    0x14(%ebp),%eax
  103354:	50                   	push   %eax
  103355:	e8 39 fd ff ff       	call   103093 <getint>
  10335a:	83 c4 10             	add    $0x10,%esp
  10335d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103360:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  103363:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103366:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103369:	85 d2                	test   %edx,%edx
  10336b:	79 23                	jns    103390 <vprintfmt+0x292>
                putch('-', putdat);
  10336d:	83 ec 08             	sub    $0x8,%esp
  103370:	ff 75 0c             	pushl  0xc(%ebp)
  103373:	6a 2d                	push   $0x2d
  103375:	8b 45 08             	mov    0x8(%ebp),%eax
  103378:	ff d0                	call   *%eax
  10337a:	83 c4 10             	add    $0x10,%esp
                num = -(long long)num;
  10337d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103380:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103383:	f7 d8                	neg    %eax
  103385:	83 d2 00             	adc    $0x0,%edx
  103388:	f7 da                	neg    %edx
  10338a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10338d:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  103390:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103397:	e9 9f 00 00 00       	jmp    10343b <vprintfmt+0x33d>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  10339c:	83 ec 08             	sub    $0x8,%esp
  10339f:	ff 75 e0             	pushl  -0x20(%ebp)
  1033a2:	8d 45 14             	lea    0x14(%ebp),%eax
  1033a5:	50                   	push   %eax
  1033a6:	e8 99 fc ff ff       	call   103044 <getuint>
  1033ab:	83 c4 10             	add    $0x10,%esp
  1033ae:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033b1:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  1033b4:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1033bb:	eb 7e                	jmp    10343b <vprintfmt+0x33d>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  1033bd:	83 ec 08             	sub    $0x8,%esp
  1033c0:	ff 75 e0             	pushl  -0x20(%ebp)
  1033c3:	8d 45 14             	lea    0x14(%ebp),%eax
  1033c6:	50                   	push   %eax
  1033c7:	e8 78 fc ff ff       	call   103044 <getuint>
  1033cc:	83 c4 10             	add    $0x10,%esp
  1033cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033d2:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  1033d5:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  1033dc:	eb 5d                	jmp    10343b <vprintfmt+0x33d>

        // pointer
        case 'p':
            putch('0', putdat);
  1033de:	83 ec 08             	sub    $0x8,%esp
  1033e1:	ff 75 0c             	pushl  0xc(%ebp)
  1033e4:	6a 30                	push   $0x30
  1033e6:	8b 45 08             	mov    0x8(%ebp),%eax
  1033e9:	ff d0                	call   *%eax
  1033eb:	83 c4 10             	add    $0x10,%esp
            putch('x', putdat);
  1033ee:	83 ec 08             	sub    $0x8,%esp
  1033f1:	ff 75 0c             	pushl  0xc(%ebp)
  1033f4:	6a 78                	push   $0x78
  1033f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1033f9:	ff d0                	call   *%eax
  1033fb:	83 c4 10             	add    $0x10,%esp
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  1033fe:	8b 45 14             	mov    0x14(%ebp),%eax
  103401:	8d 50 04             	lea    0x4(%eax),%edx
  103404:	89 55 14             	mov    %edx,0x14(%ebp)
  103407:	8b 00                	mov    (%eax),%eax
  103409:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10340c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  103413:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  10341a:	eb 1f                	jmp    10343b <vprintfmt+0x33d>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  10341c:	83 ec 08             	sub    $0x8,%esp
  10341f:	ff 75 e0             	pushl  -0x20(%ebp)
  103422:	8d 45 14             	lea    0x14(%ebp),%eax
  103425:	50                   	push   %eax
  103426:	e8 19 fc ff ff       	call   103044 <getuint>
  10342b:	83 c4 10             	add    $0x10,%esp
  10342e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103431:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  103434:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  10343b:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  10343f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103442:	83 ec 04             	sub    $0x4,%esp
  103445:	52                   	push   %edx
  103446:	ff 75 e8             	pushl  -0x18(%ebp)
  103449:	50                   	push   %eax
  10344a:	ff 75 f4             	pushl  -0xc(%ebp)
  10344d:	ff 75 f0             	pushl  -0x10(%ebp)
  103450:	ff 75 0c             	pushl  0xc(%ebp)
  103453:	ff 75 08             	pushl  0x8(%ebp)
  103456:	e8 f8 fa ff ff       	call   102f53 <printnum>
  10345b:	83 c4 20             	add    $0x20,%esp
            break;
  10345e:	eb 39                	jmp    103499 <vprintfmt+0x39b>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  103460:	83 ec 08             	sub    $0x8,%esp
  103463:	ff 75 0c             	pushl  0xc(%ebp)
  103466:	53                   	push   %ebx
  103467:	8b 45 08             	mov    0x8(%ebp),%eax
  10346a:	ff d0                	call   *%eax
  10346c:	83 c4 10             	add    $0x10,%esp
            break;
  10346f:	eb 28                	jmp    103499 <vprintfmt+0x39b>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  103471:	83 ec 08             	sub    $0x8,%esp
  103474:	ff 75 0c             	pushl  0xc(%ebp)
  103477:	6a 25                	push   $0x25
  103479:	8b 45 08             	mov    0x8(%ebp),%eax
  10347c:	ff d0                	call   *%eax
  10347e:	83 c4 10             	add    $0x10,%esp
            for (fmt --; fmt[-1] != '%'; fmt --)
  103481:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103485:	eb 04                	jmp    10348b <vprintfmt+0x38d>
  103487:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10348b:	8b 45 10             	mov    0x10(%ebp),%eax
  10348e:	83 e8 01             	sub    $0x1,%eax
  103491:	0f b6 00             	movzbl (%eax),%eax
  103494:	3c 25                	cmp    $0x25,%al
  103496:	75 ef                	jne    103487 <vprintfmt+0x389>
                /* do nothing */;
            break;
  103498:	90                   	nop
        }
    }
  103499:	e9 68 fc ff ff       	jmp    103106 <vprintfmt+0x8>
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
            if (ch == '\0') {
                return;
  10349e:	90                   	nop
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  10349f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1034a2:	5b                   	pop    %ebx
  1034a3:	5e                   	pop    %esi
  1034a4:	5d                   	pop    %ebp
  1034a5:	c3                   	ret    

001034a6 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  1034a6:	55                   	push   %ebp
  1034a7:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  1034a9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034ac:	8b 40 08             	mov    0x8(%eax),%eax
  1034af:	8d 50 01             	lea    0x1(%eax),%edx
  1034b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034b5:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  1034b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034bb:	8b 10                	mov    (%eax),%edx
  1034bd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034c0:	8b 40 04             	mov    0x4(%eax),%eax
  1034c3:	39 c2                	cmp    %eax,%edx
  1034c5:	73 12                	jae    1034d9 <sprintputch+0x33>
        *b->buf ++ = ch;
  1034c7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034ca:	8b 00                	mov    (%eax),%eax
  1034cc:	8d 48 01             	lea    0x1(%eax),%ecx
  1034cf:	8b 55 0c             	mov    0xc(%ebp),%edx
  1034d2:	89 0a                	mov    %ecx,(%edx)
  1034d4:	8b 55 08             	mov    0x8(%ebp),%edx
  1034d7:	88 10                	mov    %dl,(%eax)
    }
}
  1034d9:	90                   	nop
  1034da:	5d                   	pop    %ebp
  1034db:	c3                   	ret    

001034dc <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  1034dc:	55                   	push   %ebp
  1034dd:	89 e5                	mov    %esp,%ebp
  1034df:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  1034e2:	8d 45 14             	lea    0x14(%ebp),%eax
  1034e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  1034e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1034eb:	50                   	push   %eax
  1034ec:	ff 75 10             	pushl  0x10(%ebp)
  1034ef:	ff 75 0c             	pushl  0xc(%ebp)
  1034f2:	ff 75 08             	pushl  0x8(%ebp)
  1034f5:	e8 0b 00 00 00       	call   103505 <vsnprintf>
  1034fa:	83 c4 10             	add    $0x10,%esp
  1034fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103500:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103503:	c9                   	leave  
  103504:	c3                   	ret    

00103505 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  103505:	55                   	push   %ebp
  103506:	89 e5                	mov    %esp,%ebp
  103508:	83 ec 18             	sub    $0x18,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  10350b:	8b 45 08             	mov    0x8(%ebp),%eax
  10350e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103511:	8b 45 0c             	mov    0xc(%ebp),%eax
  103514:	8d 50 ff             	lea    -0x1(%eax),%edx
  103517:	8b 45 08             	mov    0x8(%ebp),%eax
  10351a:	01 d0                	add    %edx,%eax
  10351c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10351f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  103526:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10352a:	74 0a                	je     103536 <vsnprintf+0x31>
  10352c:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10352f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103532:	39 c2                	cmp    %eax,%edx
  103534:	76 07                	jbe    10353d <vsnprintf+0x38>
        return -E_INVAL;
  103536:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  10353b:	eb 20                	jmp    10355d <vsnprintf+0x58>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  10353d:	ff 75 14             	pushl  0x14(%ebp)
  103540:	ff 75 10             	pushl  0x10(%ebp)
  103543:	8d 45 ec             	lea    -0x14(%ebp),%eax
  103546:	50                   	push   %eax
  103547:	68 a6 34 10 00       	push   $0x1034a6
  10354c:	e8 ad fb ff ff       	call   1030fe <vprintfmt>
  103551:	83 c4 10             	add    $0x10,%esp
    // null terminate the buffer
    *b.buf = '\0';
  103554:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103557:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  10355a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10355d:	c9                   	leave  
  10355e:	c3                   	ret    
