ENTRY(start)                      /* start is the entry point -> see main.s */

SECTIONS
{
	. = 0x10000;              /* load address -> for qemu               */
	.text : { *(.text)}
	.data : { *(.data)}
	.bss : { *(.bss)}
	. =ALIGN(4);              /* align to 4 byte -> 32bit               */
	. =. + 0x1000;            /* 4k stack                               */
	stack_top = .;            /* symbol exported by linker              */
}
