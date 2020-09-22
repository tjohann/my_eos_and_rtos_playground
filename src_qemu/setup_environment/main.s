	/* first simple example to check environment */

	.text
	.global start

start:
	mov r0, #1          /* load 1 into r0 ... for hex #0x01*/
	mov r1, #41         /* load 41 into r1 */
	add r0, r0, r1      /* r0 = r0 + r1 -> 42 */
	ldr r2, =output     /* load address of output in r2 */
	str r0, [r2]        /* put content of r0 via address located in r2 */

stop:
	b stop

output:
	.word 0
