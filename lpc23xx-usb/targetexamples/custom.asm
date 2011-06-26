
custom.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_startup>:
       0:	e59ff018 	ldr	pc, [pc, #24]	; 20 <Reset_Addr>
       4:	e59ff018 	ldr	pc, [pc, #24]	; 24 <Undef_Addr>
       8:	e59ff018 	ldr	pc, [pc, #24]	; 28 <SWI_Addr>
       c:	e59ff018 	ldr	pc, [pc, #24]	; 2c <PAbt_Addr>
      10:	e59ff018 	ldr	pc, [pc, #24]	; 30 <DAbt_Addr>
      14:	e1a00000 	nop			(mov r0,r0)
      18:	e51ffff0 	ldr	pc, [pc, #-4080]	; fffff030 <_stack_end+0xbfff7154>
      1c:	e59ff014 	ldr	pc, [pc, #20]	; 38 <FIQ_Addr>

00000020 <Reset_Addr>:
      20:	00000040 	.word	0x00000040

00000024 <Undef_Addr>:
      24:	000000e4 	.word	0x000000e4

00000028 <SWI_Addr>:
      28:	000000e0 	.word	0x000000e0

0000002c <PAbt_Addr>:
      2c:	000000e4 	.word	0x000000e4

00000030 <DAbt_Addr>:
      30:	000000e4 	.word	0x000000e4

00000034 <IRQ_Addr>:
      34:	000000d8 	.word	0x000000d8

00000038 <FIQ_Addr>:
      38:	000000dc 	.word	0x000000dc
      3c:	00000000 	.word	0x00000000

00000040 <Reset_Handler>:
      40:	e59f0078 	ldr	r0, [pc, #120]	; c0 <I_BIT+0x40>
      44:	e321f0db 	msr	CPSR_c, #219	; 0xdb
      48:	e1a0d000 	mov	sp, r0
      4c:	e2400040 	sub	r0, r0, #64	; 0x40
      50:	e321f0d7 	msr	CPSR_c, #215	; 0xd7
      54:	e1a0d000 	mov	sp, r0
      58:	e2400040 	sub	r0, r0, #64	; 0x40
      5c:	e321f0d1 	msr	CPSR_c, #209	; 0xd1
      60:	e1a0d000 	mov	sp, r0
      64:	e2400040 	sub	r0, r0, #64	; 0x40
      68:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
      6c:	e1a0d000 	mov	sp, r0
      70:	e2400c01 	sub	r0, r0, #256	; 0x100
      74:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
      78:	e1a0d000 	mov	sp, r0
      7c:	e2400b01 	sub	r0, r0, #1024	; 0x400
      80:	e321f0df 	msr	CPSR_c, #223	; 0xdf
      84:	e1a0d000 	mov	sp, r0
      88:	e59f1034 	ldr	r1, [pc, #52]	; c4 <I_BIT+0x44>
      8c:	e59f2034 	ldr	r2, [pc, #52]	; c8 <I_BIT+0x48>
      90:	e59f3034 	ldr	r3, [pc, #52]	; cc <I_BIT+0x4c>
      94:	e1520003 	cmp	r2, r3
      98:	34910004 	ldrcc	r0, [r1], #4
      9c:	34820004 	strcc	r0, [r2], #4
      a0:	3afffffb 	bcc	94 <I_BIT+0x14>
      a4:	e3a00000 	mov	r0, #0	; 0x0
      a8:	e59f1020 	ldr	r1, [pc, #32]	; d0 <I_BIT+0x50>
      ac:	e59f2020 	ldr	r2, [pc, #32]	; d4 <I_BIT+0x54>
      b0:	e1510002 	cmp	r1, r2
      b4:	34810004 	strcc	r0, [r1], #4
      b8:	3afffffc 	bcc	b0 <I_BIT+0x30>
      bc:	ea0001a6 	b	75c <main>
      c0:	40007edc 	.word	0x40007edc
      c4:	00001ef4 	.word	0x00001ef4
      c8:	40000200 	.word	0x40000200
      cc:	40000200 	.word	0x40000200
      d0:	40000200 	.word	0x40000200
      d4:	400002a0 	.word	0x400002a0

000000d8 <IRQ_Routine>:
      d8:	eafffffe 	b	d8 <IRQ_Routine>

000000dc <FIQ_Routine>:
      dc:	eafffffe 	b	dc <FIQ_Routine>

000000e0 <SWI_Routine>:
      e0:	eafffffe 	b	e0 <SWI_Routine>

000000e4 <UNDEF_Routine>:
      e4:	eafffffe 	b	e4 <UNDEF_Routine>

000000e8 <HalSysPinSelect>:
      e8:	e20020ff 	and	r2, r0, #255	; 0xff
      ec:	e352000f 	cmp	r2, #15	; 0xf
      f0:	e201c0ff 	and	ip, r1, #255	; 0xff
      f4:	8a000007 	bhi	118 <IRQ_STACK_SIZE+0x18>
      f8:	e59f0040 	ldr	r0, [pc, #64]	; 140 <IRQ_STACK_SIZE+0x40>
      fc:	e5903000 	ldr	r3, [r0]
     100:	e1a01082 	lsl	r1, r2, #1
     104:	e3a02003 	mov	r2, #3	; 0x3
     108:	e1c33112 	bic	r3, r3, r2, lsl r1
     10c:	e183311c 	orr	r3, r3, ip, lsl r1
     110:	e5803000 	str	r3, [r0]
     114:	e12fff1e 	bx	lr
     118:	e59f0020 	ldr	r0, [pc, #32]	; 140 <IRQ_STACK_SIZE+0x40>
     11c:	e2422010 	sub	r2, r2, #16	; 0x10
     120:	e5903004 	ldr	r3, [r0, #4]
     124:	e20220ff 	and	r2, r2, #255	; 0xff
     128:	e1a02082 	lsl	r2, r2, #1
     12c:	e3a01003 	mov	r1, #3	; 0x3
     130:	e1c33211 	bic	r3, r3, r1, lsl r2
     134:	e183321c 	orr	r3, r3, ip, lsl r2
     138:	e5803004 	str	r3, [r0, #4]
     13c:	e12fff1e 	bx	lr
     140:	e002c000 	.word	0xe002c000

00000144 <HalSysGetCCLK>:
     144:	e59f0000 	ldr	r0, [pc, #0]	; 14c <HalSysGetCCLK+0x8>
     148:	e12fff1e 	bx	lr
     14c:	03938700 	.word	0x03938700

00000150 <HalSysGetPCLK>:
     150:	e59f0000 	ldr	r0, [pc, #0]	; 158 <HalSysGetPCLK+0x8>
     154:	e12fff1e 	bx	lr
     158:	03938700 	.word	0x03938700

0000015c <HalPinSelect>:
     15c:	e20020ff 	and	r2, r0, #255	; 0xff
     160:	e352000f 	cmp	r2, #15	; 0xf
     164:	e201c0ff 	and	ip, r1, #255	; 0xff
     168:	8a000007 	bhi	18c <HalPinSelect+0x30>
     16c:	e59f0040 	ldr	r0, [pc, #64]	; 1b4 <HalPinSelect+0x58>
     170:	e5903000 	ldr	r3, [r0]
     174:	e1a01082 	lsl	r1, r2, #1
     178:	e3a02003 	mov	r2, #3	; 0x3
     17c:	e1c33112 	bic	r3, r3, r2, lsl r1
     180:	e183311c 	orr	r3, r3, ip, lsl r1
     184:	e5803000 	str	r3, [r0]
     188:	e12fff1e 	bx	lr
     18c:	e59f0020 	ldr	r0, [pc, #32]	; 1b4 <HalPinSelect+0x58>
     190:	e2422010 	sub	r2, r2, #16	; 0x10
     194:	e5903004 	ldr	r3, [r0, #4]
     198:	e20220ff 	and	r2, r2, #255	; 0xff
     19c:	e1a02082 	lsl	r2, r2, #1
     1a0:	e3a01003 	mov	r1, #3	; 0x3
     1a4:	e1c33211 	bic	r3, r3, r1, lsl r2
     1a8:	e183321c 	orr	r3, r3, ip, lsl r2
     1ac:	e5803004 	str	r3, [r0, #4]
     1b0:	e12fff1e 	bx	lr
     1b4:	e002c000 	.word	0xe002c000

000001b8 <HalSysInit>:
     1b8:	e59f3064 	ldr	r3, [pc, #100]	; 224 <HalSysInit+0x6c>
     1bc:	e3a02024 	mov	r2, #36	; 0x24
     1c0:	e5832084 	str	r2, [r3, #132]
     1c4:	e3a010aa 	mov	r1, #170	; 0xaa
     1c8:	e3a00055 	mov	r0, #85	; 0x55
     1cc:	e3a02001 	mov	r2, #1	; 0x1
     1d0:	e583108c 	str	r1, [r3, #140]
     1d4:	e583008c 	str	r0, [r3, #140]
     1d8:	e5832080 	str	r2, [r3, #128]
     1dc:	e583108c 	str	r1, [r3, #140]
     1e0:	e583008c 	str	r0, [r3, #140]
     1e4:	e1a01003 	mov	r1, r3
     1e8:	e5913088 	ldr	r3, [r1, #136]
     1ec:	e3130b01 	tst	r3, #1024	; 0x400
     1f0:	0afffffc 	beq	1e8 <HalSysInit+0x30>
     1f4:	e3a02003 	mov	r2, #3	; 0x3
     1f8:	e3a030aa 	mov	r3, #170	; 0xaa
     1fc:	e5812080 	str	r2, [r1, #128]
     200:	e581308c 	str	r3, [r1, #140]
     204:	e3a03055 	mov	r3, #85	; 0x55
     208:	e581308c 	str	r3, [r1, #140]
     20c:	e3a03002 	mov	r3, #2	; 0x2
     210:	e5812004 	str	r2, [r1, #4]
     214:	e5813000 	str	r3, [r1]
     218:	e3a03001 	mov	r3, #1	; 0x1
     21c:	e5813100 	str	r3, [r1, #256]
     220:	e12fff1e 	bx	lr
     224:	e01fc000 	.word	0xe01fc000

00000228 <printchar>:
     228:	e3500000 	cmp	r0, #0	; 0x0
     22c:	0a000005 	beq	248 <printchar+0x20>
     230:	e5903000 	ldr	r3, [r0]
     234:	e5c31000 	strb	r1, [r3]
     238:	e5903000 	ldr	r3, [r0]
     23c:	e2833001 	add	r3, r3, #1	; 0x1
     240:	e5803000 	str	r3, [r0]
     244:	e12fff1e 	bx	lr
     248:	e1a00001 	mov	r0, r1
     24c:	ea00011f 	b	6d0 <putchar>

00000250 <prints>:
     250:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
     254:	e2524000 	subs	r4, r2, #0	; 0x0
     258:	e1a07000 	mov	r7, r0
     25c:	e1a05001 	mov	r5, r1
     260:	c3a02000 	movgt	r2, #0	; 0x0
     264:	ca000001 	bgt	270 <prints+0x20>
     268:	ea000009 	b	294 <prints+0x44>
     26c:	e2822001 	add	r2, r2, #1	; 0x1
     270:	e7d21005 	ldrb	r1, [r2, r5]
     274:	e3510000 	cmp	r1, #0	; 0x0
     278:	1afffffb 	bne	26c <prints+0x1c>
     27c:	e1520004 	cmp	r2, r4
     280:	a1a04001 	movge	r4, r1
     284:	b0624004 	rsblt	r4, r2, r4
     288:	e3130002 	tst	r3, #2	; 0x2
     28c:	13a08030 	movne	r8, #48	; 0x30
     290:	1a000000 	bne	298 <prints+0x48>
     294:	e3a08020 	mov	r8, #32	; 0x20
     298:	e2130001 	ands	r0, r3, #1	; 0x1
     29c:	13a06000 	movne	r6, #0	; 0x0
     2a0:	01a06000 	moveq	r6, r0
     2a4:	0a000003 	beq	2b8 <prints+0x68>
     2a8:	ea000009 	b	2d4 <prints+0x84>
     2ac:	ebffffdd 	bl	228 <printchar>
     2b0:	e2866001 	add	r6, r6, #1	; 0x1
     2b4:	e2444001 	sub	r4, r4, #1	; 0x1
     2b8:	e3540000 	cmp	r4, #0	; 0x0
     2bc:	e1a00007 	mov	r0, r7
     2c0:	e1a01008 	mov	r1, r8
     2c4:	cafffff8 	bgt	2ac <prints+0x5c>
     2c8:	ea000001 	b	2d4 <prints+0x84>
     2cc:	ebffffd5 	bl	228 <printchar>
     2d0:	e2866001 	add	r6, r6, #1	; 0x1
     2d4:	e5d53000 	ldrb	r3, [r5]
     2d8:	e2531000 	subs	r1, r3, #0	; 0x0
     2dc:	e1a00007 	mov	r0, r7
     2e0:	e2855001 	add	r5, r5, #1	; 0x1
     2e4:	1afffff8 	bne	2cc <prints+0x7c>
     2e8:	ea000001 	b	2f4 <prints+0xa4>
     2ec:	ebffffcd 	bl	228 <printchar>
     2f0:	e2866001 	add	r6, r6, #1	; 0x1
     2f4:	e3540000 	cmp	r4, #0	; 0x0
     2f8:	e1a00007 	mov	r0, r7
     2fc:	e1a01008 	mov	r1, r8
     300:	e2444001 	sub	r4, r4, #1	; 0x1
     304:	cafffff8 	bgt	2ec <prints+0x9c>
     308:	e1a00006 	mov	r0, r6
     30c:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

00000310 <printi>:
     310:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     314:	e2514000 	subs	r4, r1, #0	; 0x0
     318:	e24dd00c 	sub	sp, sp, #12	; 0xc
     31c:	e1a06002 	mov	r6, r2
     320:	e1a0b000 	mov	fp, r0
     324:	e28d7030 	add	r7, sp, #48	; 0x30
     328:	e8970280 	ldm	r7, {r7, r9}
     32c:	1a000007 	bne	350 <printi+0x40>
     330:	e3a0c030 	mov	ip, #48	; 0x30
     334:	e1a02007 	mov	r2, r7
     338:	e1a03009 	mov	r3, r9
     33c:	e1a0100d 	mov	r1, sp
     340:	e5cdc000 	strb	ip, [sp]
     344:	e5cd4001 	strb	r4, [sp, #1]
     348:	ebffffc0 	bl	250 <prints>
     34c:	ea000037 	b	430 <SVC_STACK_SIZE+0x30>
     350:	e2533000 	subs	r3, r3, #0	; 0x0
     354:	13a03001 	movne	r3, #1	; 0x1
     358:	e352000a 	cmp	r2, #10	; 0xa
     35c:	13a03000 	movne	r3, #0	; 0x0
     360:	e3530000 	cmp	r3, #0	; 0x0
     364:	0a000003 	beq	378 <printi+0x68>
     368:	e3540000 	cmp	r4, #0	; 0x0
     36c:	b2644000 	rsblt	r4, r4, #0	; 0x0
     370:	b3a08001 	movlt	r8, #1	; 0x1
     374:	ba000000 	blt	37c <printi+0x6c>
     378:	e3a08000 	mov	r8, #0	; 0x0
     37c:	e59d3038 	ldr	r3, [sp, #56]
     380:	e28d200b 	add	r2, sp, #11	; 0xb
     384:	e243a03a 	sub	sl, r3, #58	; 0x3a
     388:	e3a03000 	mov	r3, #0	; 0x0
     38c:	e5cd300b 	strb	r3, [sp, #11]
     390:	ea00000a 	b	3c0 <printi+0xb0>
     394:	eb0005c2 	bl	1aa4 <__umodsi3>
     398:	e1a03000 	mov	r3, r0
     39c:	e3530009 	cmp	r3, #9	; 0x9
     3a0:	c083300a 	addgt	r3, r3, sl
     3a4:	e2833030 	add	r3, r3, #48	; 0x30
     3a8:	e1a00004 	mov	r0, r4
     3ac:	e5653001 	strb	r3, [r5, #-1]!
     3b0:	e1a01006 	mov	r1, r6
     3b4:	eb000576 	bl	1994 <__aeabi_uidiv>
     3b8:	e1a02005 	mov	r2, r5
     3bc:	e1a04000 	mov	r4, r0
     3c0:	e3540000 	cmp	r4, #0	; 0x0
     3c4:	e1a00004 	mov	r0, r4
     3c8:	e1a01006 	mov	r1, r6
     3cc:	e1a05002 	mov	r5, r2
     3d0:	1affffef 	bne	394 <printi+0x84>
     3d4:	e3580000 	cmp	r8, #0	; 0x0
     3d8:	01a04008 	moveq	r4, r8
     3dc:	0a00000d 	beq	418 <SVC_STACK_SIZE+0x18>
     3e0:	e3570000 	cmp	r7, #0	; 0x0
     3e4:	0a000007 	beq	408 <SVC_STACK_SIZE+0x8>
     3e8:	e3190002 	tst	r9, #2	; 0x2
     3ec:	0a000005 	beq	408 <SVC_STACK_SIZE+0x8>
     3f0:	e1a0000b 	mov	r0, fp
     3f4:	e3a0102d 	mov	r1, #45	; 0x2d
     3f8:	ebffff8a 	bl	228 <printchar>
     3fc:	e2477001 	sub	r7, r7, #1	; 0x1
     400:	e3a04001 	mov	r4, #1	; 0x1
     404:	ea000003 	b	418 <SVC_STACK_SIZE+0x18>
     408:	e3a0302d 	mov	r3, #45	; 0x2d
     40c:	e5423001 	strb	r3, [r2, #-1]
     410:	e2425001 	sub	r5, r2, #1	; 0x1
     414:	e3a04000 	mov	r4, #0	; 0x0
     418:	e1a0000b 	mov	r0, fp
     41c:	e1a01005 	mov	r1, r5
     420:	e1a02007 	mov	r2, r7
     424:	e1a03009 	mov	r3, r9
     428:	ebffff88 	bl	250 <prints>
     42c:	e0800004 	add	r0, r0, r4
     430:	e28dd00c 	add	sp, sp, #12	; 0xc
     434:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000438 <print>:
     438:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     43c:	e3a05000 	mov	r5, #0	; 0x0
     440:	e24dd014 	sub	sp, sp, #20	; 0x14
     444:	e1a06000 	mov	r6, r0
     448:	e1a04001 	mov	r4, r1
     44c:	e1a07005 	mov	r7, r5
     450:	e3a0a00a 	mov	sl, #10	; 0xa
     454:	e28db012 	add	fp, sp, #18	; 0x12
     458:	e3a08061 	mov	r8, #97	; 0x61
     45c:	e3a09041 	mov	r9, #65	; 0x41
     460:	e58d200c 	str	r2, [sp, #12]
     464:	ea000060 	b	5ec <print+0x1b4>
     468:	e3530025 	cmp	r3, #37	; 0x25
     46c:	1a000059 	bne	5d8 <print+0x1a0>
     470:	e5f43001 	ldrb	r3, [r4, #1]!
     474:	e3530000 	cmp	r3, #0	; 0x0
     478:	0a00005e 	beq	5f8 <print+0x1c0>
     47c:	e3530025 	cmp	r3, #37	; 0x25
     480:	0a000054 	beq	5d8 <print+0x1a0>
     484:	e353002d 	cmp	r3, #45	; 0x2d
     488:	11a00007 	movne	r0, r7
     48c:	02844001 	addeq	r4, r4, #1	; 0x1
     490:	03a00001 	moveq	r0, #1	; 0x1
     494:	ea000001 	b	4a0 <print+0x68>
     498:	e2844001 	add	r4, r4, #1	; 0x1
     49c:	e3800002 	orr	r0, r0, #2	; 0x2
     4a0:	e5d43000 	ldrb	r3, [r4]
     4a4:	e3530030 	cmp	r3, #48	; 0x30
     4a8:	0afffffa 	beq	498 <print+0x60>
     4ac:	e1a02007 	mov	r2, r7
     4b0:	ea000001 	b	4bc <print+0x84>
     4b4:	e022c29a 	mla	r2, sl, r2, ip
     4b8:	e2844001 	add	r4, r4, #1	; 0x1
     4bc:	e5d41000 	ldrb	r1, [r4]
     4c0:	e241c030 	sub	ip, r1, #48	; 0x30
     4c4:	e20c30ff 	and	r3, ip, #255	; 0xff
     4c8:	e3530009 	cmp	r3, #9	; 0x9
     4cc:	9afffff8 	bls	4b4 <print+0x7c>
     4d0:	e3510073 	cmp	r1, #115	; 0x73
     4d4:	1a000008 	bne	4fc <print+0xc4>
     4d8:	e59dc00c 	ldr	ip, [sp, #12]
     4dc:	e49c1004 	ldr	r1, [ip], #4
     4e0:	e59f312c 	ldr	r3, [pc, #300]	; 614 <print+0x1dc>
     4e4:	e3510000 	cmp	r1, #0	; 0x0
     4e8:	01a01003 	moveq	r1, r3
     4ec:	e1a03000 	mov	r3, r0
     4f0:	e1a00006 	mov	r0, r6
     4f4:	e58dc00c 	str	ip, [sp, #12]
     4f8:	ea000034 	b	5d0 <print+0x198>
     4fc:	e3510064 	cmp	r1, #100	; 0x64
     500:	1a00000c 	bne	538 <print+0x100>
     504:	e58d2000 	str	r2, [sp]
     508:	e58d0004 	str	r0, [sp, #4]
     50c:	e59dc00c 	ldr	ip, [sp, #12]
     510:	e58d8008 	str	r8, [sp, #8]
     514:	e1a00006 	mov	r0, r6
     518:	e59c1000 	ldr	r1, [ip]
     51c:	e1a0200a 	mov	r2, sl
     520:	e28cc004 	add	ip, ip, #4	; 0x4
     524:	e3a03001 	mov	r3, #1	; 0x1
     528:	e58dc00c 	str	ip, [sp, #12]
     52c:	ebffff77 	bl	310 <printi>
     530:	e0855000 	add	r5, r5, r0
     534:	ea00002b 	b	5e8 <print+0x1b0>
     538:	e3510078 	cmp	r1, #120	; 0x78
     53c:	058d2000 	streq	r2, [sp]
     540:	058d0004 	streq	r0, [sp, #4]
     544:	058d8008 	streq	r8, [sp, #8]
     548:	0a000003 	beq	55c <print+0x124>
     54c:	e3510058 	cmp	r1, #88	; 0x58
     550:	1a000007 	bne	574 <print+0x13c>
     554:	e58d2000 	str	r2, [sp]
     558:	e98d0201 	stmib	sp, {r0, r9}
     55c:	e59dc00c 	ldr	ip, [sp, #12]
     560:	e59c1000 	ldr	r1, [ip]
     564:	e1a00006 	mov	r0, r6
     568:	e28cc004 	add	ip, ip, #4	; 0x4
     56c:	e3a02010 	mov	r2, #16	; 0x10
     570:	ea000009 	b	59c <print+0x164>
     574:	e3510075 	cmp	r1, #117	; 0x75
     578:	1a000009 	bne	5a4 <print+0x16c>
     57c:	e58d2000 	str	r2, [sp]
     580:	e58d0004 	str	r0, [sp, #4]
     584:	e59dc00c 	ldr	ip, [sp, #12]
     588:	e58d8008 	str	r8, [sp, #8]
     58c:	e1a00006 	mov	r0, r6
     590:	e59c1000 	ldr	r1, [ip]
     594:	e1a0200a 	mov	r2, sl
     598:	e28cc004 	add	ip, ip, #4	; 0x4
     59c:	e1a03007 	mov	r3, r7
     5a0:	eaffffe0 	b	528 <print+0xf0>
     5a4:	e3510063 	cmp	r1, #99	; 0x63
     5a8:	1a00000e 	bne	5e8 <print+0x1b0>
     5ac:	e59dc00c 	ldr	ip, [sp, #12]
     5b0:	e59ce000 	ldr	lr, [ip]
     5b4:	e28cc004 	add	ip, ip, #4	; 0x4
     5b8:	e58dc00c 	str	ip, [sp, #12]
     5bc:	e5cde012 	strb	lr, [sp, #18]
     5c0:	e5cd7013 	strb	r7, [sp, #19]
     5c4:	e1a03000 	mov	r3, r0
     5c8:	e1a0100b 	mov	r1, fp
     5cc:	e1a00006 	mov	r0, r6
     5d0:	ebffff1e 	bl	250 <prints>
     5d4:	eaffffd5 	b	530 <print+0xf8>
     5d8:	e1a00006 	mov	r0, r6
     5dc:	e5d41000 	ldrb	r1, [r4]
     5e0:	ebffff10 	bl	228 <printchar>
     5e4:	e2855001 	add	r5, r5, #1	; 0x1
     5e8:	e2844001 	add	r4, r4, #1	; 0x1
     5ec:	e5d43000 	ldrb	r3, [r4]
     5f0:	e3530000 	cmp	r3, #0	; 0x0
     5f4:	1affff9b 	bne	468 <print+0x30>
     5f8:	e3560000 	cmp	r6, #0	; 0x0
     5fc:	15962000 	ldrne	r2, [r6]
     600:	13a03000 	movne	r3, #0	; 0x0
     604:	e1a00005 	mov	r0, r5
     608:	15c23000 	strbne	r3, [r2]
     60c:	e28dd014 	add	sp, sp, #20	; 0x14
     610:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
     614:	00001c64 	.word	0x00001c64

00000618 <sprintf>:
     618:	e92d000e 	push	{r1, r2, r3}
     61c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     620:	e24dd008 	sub	sp, sp, #8	; 0x8
     624:	e28d3010 	add	r3, sp, #16	; 0x10
     628:	e58d0000 	str	r0, [sp]
     62c:	e1a02003 	mov	r2, r3
     630:	e1a0000d 	mov	r0, sp
     634:	e59d100c 	ldr	r1, [sp, #12]
     638:	e58d3004 	str	r3, [sp, #4]
     63c:	ebffff7d 	bl	438 <print>
     640:	e28dd008 	add	sp, sp, #8	; 0x8
     644:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     648:	e28dd00c 	add	sp, sp, #12	; 0xc
     64c:	e12fff1e 	bx	lr

00000650 <printf>:
     650:	e92d000f 	push	{r0, r1, r2, r3}
     654:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     658:	e24dd004 	sub	sp, sp, #4	; 0x4
     65c:	e28d300c 	add	r3, sp, #12	; 0xc
     660:	e1a02003 	mov	r2, r3
     664:	e59d1008 	ldr	r1, [sp, #8]
     668:	e3a00000 	mov	r0, #0	; 0x0
     66c:	e58d3000 	str	r3, [sp]
     670:	ebffff70 	bl	438 <print>
     674:	e28dd004 	add	sp, sp, #4	; 0x4
     678:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     67c:	e28dd010 	add	sp, sp, #16	; 0x10
     680:	e12fff1e 	bx	lr

00000684 <ConsoleInit>:
     684:	e59f103c 	ldr	r1, [pc, #60]	; 6c8 <ConsoleInit+0x44>
     688:	e5913000 	ldr	r3, [r1]
     68c:	e3c3300f 	bic	r3, r3, #15	; 0xf
     690:	e59f2034 	ldr	r2, [pc, #52]	; 6cc <ConsoleInit+0x48>
     694:	e3833005 	orr	r3, r3, #5	; 0x5
     698:	e5813000 	str	r3, [r1]
     69c:	e3a03083 	mov	r3, #131	; 0x83
     6a0:	e582300c 	str	r3, [r2, #12]
     6a4:	e1a0c440 	asr	ip, r0, #8
     6a8:	e3a03003 	mov	r3, #3	; 0x3
     6ac:	e20000ff 	and	r0, r0, #255	; 0xff
     6b0:	e5820000 	str	r0, [r2]
     6b4:	e582c004 	str	ip, [r2, #4]
     6b8:	e582300c 	str	r3, [r2, #12]
     6bc:	e3a03001 	mov	r3, #1	; 0x1
     6c0:	e5823008 	str	r3, [r2, #8]
     6c4:	e12fff1e 	bx	lr
     6c8:	e002c000 	.word	0xe002c000
     6cc:	e000c000 	.word	0xe000c000

000006d0 <putchar>:
     6d0:	e350000a 	cmp	r0, #10	; 0xa
     6d4:	1a000005 	bne	6f0 <putchar+0x20>
     6d8:	e59f2028 	ldr	r2, [pc, #40]	; 708 <putchar+0x38>
     6dc:	e5923014 	ldr	r3, [r2, #20]
     6e0:	e3130020 	tst	r3, #32	; 0x20
     6e4:	0afffffc 	beq	6dc <putchar+0xc>
     6e8:	e3a0300d 	mov	r3, #13	; 0xd
     6ec:	e5823000 	str	r3, [r2]
     6f0:	e59f2010 	ldr	r2, [pc, #16]	; 708 <putchar+0x38>
     6f4:	e5923014 	ldr	r3, [r2, #20]
     6f8:	e3130020 	tst	r3, #32	; 0x20
     6fc:	0afffffc 	beq	6f4 <putchar+0x24>
     700:	e5820000 	str	r0, [r2]
     704:	e12fff1e 	bx	lr
     708:	e000c000 	.word	0xe000c000

0000070c <getchar>:
     70c:	e59f0010 	ldr	r0, [pc, #16]	; 724 <getchar+0x18>
     710:	e5903014 	ldr	r3, [r0, #20]
     714:	e3130001 	tst	r3, #1	; 0x1
     718:	0afffffc 	beq	710 <getchar+0x4>
     71c:	e5900000 	ldr	r0, [r0]
     720:	e12fff1e 	bx	lr
     724:	e000c000 	.word	0xe000c000

00000728 <puts>:
     728:	e92d4010 	push	{r4, lr}
     72c:	e1a04000 	mov	r4, r0
     730:	ea000000 	b	738 <puts+0x10>
     734:	ebffffe5 	bl	6d0 <putchar>
     738:	e5d43000 	ldrb	r3, [r4]
     73c:	e3530000 	cmp	r3, #0	; 0x0
     740:	e1a00003 	mov	r0, r3
     744:	e2844001 	add	r4, r4, #1	; 0x1
     748:	1afffff9 	bne	734 <puts+0xc>
     74c:	e3a0000a 	mov	r0, #10	; 0xa
     750:	ebffffde 	bl	6d0 <putchar>
     754:	e3a00001 	mov	r0, #1	; 0x1
     758:	e8bd8010 	pop	{r4, pc}

0000075c <main>:
     75c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     760:	ebfffe94 	bl	1b8 <HalSysInit>
     764:	e3a00020 	mov	r0, #32	; 0x20
     768:	ebffffc5 	bl	684 <ConsoleInit>
     76c:	e59f004c 	ldr	r0, [pc, #76]	; 7c0 <main+0x64>
     770:	ebffffec 	bl	728 <puts>
     774:	eb000466 	bl	1914 <USBInit>
     778:	e59f0044 	ldr	r0, [pc, #68]	; 7c4 <main+0x68>
     77c:	eb00035a 	bl	14ec <USBRegisterDescriptors>
     780:	e59f2040 	ldr	r2, [pc, #64]	; 7c8 <main+0x6c>
     784:	e3a00002 	mov	r0, #2	; 0x2
     788:	e59f103c 	ldr	r1, [pc, #60]	; 7cc <main+0x70>
     78c:	eb000282 	bl	119c <USBRegisterRequestHandler>
     790:	e3a00082 	mov	r0, #130	; 0x82
     794:	e59f1034 	ldr	r1, [pc, #52]	; 7d0 <main+0x74>
     798:	eb000257 	bl	10fc <USBHwRegisterEPIntHandler>
     79c:	e3a00005 	mov	r0, #5	; 0x5
     7a0:	e59f102c 	ldr	r1, [pc, #44]	; 7d4 <main+0x78>
     7a4:	eb000254 	bl	10fc <USBHwRegisterEPIntHandler>
     7a8:	e59f0028 	ldr	r0, [pc, #40]	; 7d8 <main+0x7c>
     7ac:	ebffffdd 	bl	728 <puts>
     7b0:	e3a00001 	mov	r0, #1	; 0x1
     7b4:	eb0000a7 	bl	a58 <USBHwConnect>
     7b8:	eb00013c 	bl	cb0 <USBHwISR>
     7bc:	eafffffd 	b	7b8 <main+0x5c>
     7c0:	00001c6c 	.word	0x00001c6c
     7c4:	00001b74 	.word	0x00001b74
     7c8:	40000208 	.word	0x40000208
     7cc:	00000888 	.word	0x00000888
     7d0:	00000820 	.word	0x00000820
     7d4:	000007dc 	.word	0x000007dc
     7d8:	00001c84 	.word	0x00001c84

000007dc <_HandleBulkOut>:
     7dc:	e3a01000 	mov	r1, #0	; 0x0
     7e0:	e1a02001 	mov	r2, r1
     7e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     7e8:	e20000ff 	and	r0, r0, #255	; 0xff
     7ec:	eb0000db 	bl	b60 <USBHwEPRead>
     7f0:	e59f2020 	ldr	r2, [pc, #32]	; 818 <_HandleBulkOut+0x3c>
     7f4:	e892000a 	ldm	r2, {r1, r3}
     7f8:	e0603003 	rsb	r3, r0, r3
     7fc:	e3530000 	cmp	r3, #0	; 0x0
     800:	e0800001 	add	r0, r0, r1
     804:	e8820009 	stm	r2, {r0, r3}
     808:	149df004 	popne	{pc}		; (ldrne pc, [sp], #4)
     80c:	e59f0008 	ldr	r0, [pc, #8]	; 81c <_HandleBulkOut+0x40>
     810:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     814:	eaffffc3 	b	728 <puts>
     818:	40000200 	.word	0x40000200
     81c:	00001ca0 	.word	0x00001ca0

00000820 <_HandleBulkIn>:
     820:	e92d4030 	push	{r4, r5, lr}
     824:	e59f5054 	ldr	r5, [pc, #84]	; 880 <_HandleBulkIn+0x60>
     828:	e5953004 	ldr	r3, [r5, #4]
     82c:	e3530040 	cmp	r3, #64	; 0x40
     830:	31a04003 	movcc	r4, r3
     834:	23a04040 	movcs	r4, #64	; 0x40
     838:	e3540000 	cmp	r4, #0	; 0x0
     83c:	e20000ff 	and	r0, r0, #255	; 0xff
     840:	1a000002 	bne	850 <_HandleBulkIn+0x30>
     844:	e59f0038 	ldr	r0, [pc, #56]	; 884 <_HandleBulkIn+0x64>
     848:	e8bd4030 	pop	{r4, r5, lr}
     84c:	eaffffb5 	b	728 <puts>
     850:	e1a02004 	mov	r2, r4
     854:	e5951000 	ldr	r1, [r5]
     858:	eb00009d 	bl	ad4 <USBHwEPWrite>
     85c:	e5953000 	ldr	r3, [r5]
     860:	e5952004 	ldr	r2, [r5, #4]
     864:	e0843003 	add	r3, r4, r3
     868:	e3c334ff 	bic	r3, r3, #-16777216	; 0xff000000
     86c:	e0642002 	rsb	r2, r4, r2
     870:	e3c3373e 	bic	r3, r3, #16252928	; 0xf80000
     874:	e5853000 	str	r3, [r5]
     878:	e5852004 	str	r2, [r5, #4]
     87c:	e8bd8030 	pop	{r4, r5, pc}
     880:	40000200 	.word	0x40000200
     884:	00001ca0 	.word	0x00001ca0

00000888 <HandleVendorRequest>:
     888:	e92d4030 	push	{r4, r5, lr}
     88c:	e5d04001 	ldrb	r4, [r0, #1]
     890:	e3540001 	cmp	r4, #1	; 0x1
     894:	e1a05001 	mov	r5, r1
     898:	e5922000 	ldr	r2, [r2]
     89c:	0a000002 	beq	8ac <HandleVendorRequest+0x24>
     8a0:	e3540002 	cmp	r4, #2	; 0x2
     8a4:	1a000017 	bne	908 <HandleVendorRequest+0x80>
     8a8:	ea00000b 	b	8dc <HandleVendorRequest+0x54>
     8ac:	e8925000 	ldm	r2, {ip, lr}
     8b0:	e59f3064 	ldr	r3, [pc, #100]	; 91c <HandleVendorRequest+0x94>
     8b4:	e1a0100c 	mov	r1, ip
     8b8:	e1a0200e 	mov	r2, lr
     8bc:	e8835000 	stm	r3, {ip, lr}
     8c0:	e59f0058 	ldr	r0, [pc, #88]	; 920 <HandleVendorRequest+0x98>
     8c4:	ebffff61 	bl	650 <printf>
     8c8:	e3a00082 	mov	r0, #130	; 0x82
     8cc:	e3a01000 	mov	r1, #0	; 0x0
     8d0:	ebffffd2 	bl	820 <_HandleBulkIn>
     8d4:	e1a00004 	mov	r0, r4
     8d8:	ea000007 	b	8fc <HandleVendorRequest+0x74>
     8dc:	e8925000 	ldm	r2, {ip, lr}
     8e0:	e59f3034 	ldr	r3, [pc, #52]	; 91c <HandleVendorRequest+0x94>
     8e4:	e1a0100c 	mov	r1, ip
     8e8:	e1a0200e 	mov	r2, lr
     8ec:	e59f0030 	ldr	r0, [pc, #48]	; 924 <HandleVendorRequest+0x9c>
     8f0:	e8835000 	stm	r3, {ip, lr}
     8f4:	ebffff55 	bl	650 <printf>
     8f8:	e3a00001 	mov	r0, #1	; 0x1
     8fc:	e3a03000 	mov	r3, #0	; 0x0
     900:	e5853000 	str	r3, [r5]
     904:	e8bd8030 	pop	{r4, r5, pc}
     908:	e1a01004 	mov	r1, r4
     90c:	e59f0014 	ldr	r0, [pc, #20]	; 928 <HandleVendorRequest+0xa0>
     910:	ebffff4e 	bl	650 <printf>
     914:	e3a00000 	mov	r0, #0	; 0x0
     918:	e8bd8030 	pop	{r4, r5, pc}
     91c:	40000200 	.word	0x40000200
     920:	00001ca8 	.word	0x00001ca8
     924:	00001cc0 	.word	0x00001cc0
     928:	00001cd8 	.word	0x00001cd8

0000092c <USBHwCmd>:
     92c:	e1a00800 	lsl	r0, r0, #16
     930:	e59f2028 	ldr	r2, [pc, #40]	; 960 <USBHwCmd+0x34>
     934:	e20008ff 	and	r0, r0, #16711680	; 0xff0000
     938:	e3800c05 	orr	r0, r0, #1280	; 0x500
     93c:	e3a03030 	mov	r3, #48	; 0x30
     940:	e5023df7 	str	r3, [r2, #-3575]
     944:	e5020def 	str	r0, [r2, #-3567]
     948:	e5123dff 	ldr	r3, [r2, #-3583]
     94c:	e2033010 	and	r3, r3, #16	; 0x10
     950:	e3530010 	cmp	r3, #16	; 0x10
     954:	1afffffb 	bne	948 <USBHwCmd+0x1c>
     958:	e5023df7 	str	r3, [r2, #-3575]
     95c:	e12fff1e 	bx	lr
     960:	ffe0cfff 	.word	0xffe0cfff

00000964 <USBHwCmdWrite>:
     964:	e92d4010 	push	{r4, lr}
     968:	e1a04801 	lsl	r4, r1, #16
     96c:	e20000ff 	and	r0, r0, #255	; 0xff
     970:	e1a04824 	lsr	r4, r4, #16
     974:	ebffffec 	bl	92c <USBHwCmd>
     978:	e1a04804 	lsl	r4, r4, #16
     97c:	e59f3020 	ldr	r3, [pc, #32]	; 9a4 <USBHwCmdWrite+0x40>
     980:	e3844c01 	orr	r4, r4, #256	; 0x100
     984:	e5034def 	str	r4, [r3, #-3567]
     988:	e1a02003 	mov	r2, r3
     98c:	e5123dff 	ldr	r3, [r2, #-3583]
     990:	e2033010 	and	r3, r3, #16	; 0x10
     994:	e3530010 	cmp	r3, #16	; 0x10
     998:	1afffffb 	bne	98c <USBHwCmdWrite+0x28>
     99c:	e5023df7 	str	r3, [r2, #-3575]
     9a0:	e8bd8010 	pop	{r4, pc}
     9a4:	ffe0cfff 	.word	0xffe0cfff

000009a8 <USBHwCmdRead>:
     9a8:	e92d4010 	push	{r4, lr}
     9ac:	e20040ff 	and	r4, r0, #255	; 0xff
     9b0:	e1a00004 	mov	r0, r4
     9b4:	ebffffdc 	bl	92c <USBHwCmd>
     9b8:	e1a04804 	lsl	r4, r4, #16
     9bc:	e59f3028 	ldr	r3, [pc, #40]	; 9ec <USBHwCmdRead+0x44>
     9c0:	e3844c02 	orr	r4, r4, #512	; 0x200
     9c4:	e5034def 	str	r4, [r3, #-3567]
     9c8:	e1a02003 	mov	r2, r3
     9cc:	e5123dff 	ldr	r3, [r2, #-3583]
     9d0:	e2033020 	and	r3, r3, #32	; 0x20
     9d4:	e3530020 	cmp	r3, #32	; 0x20
     9d8:	1afffffb 	bne	9cc <USBHwCmdRead+0x24>
     9dc:	e5023df7 	str	r3, [r2, #-3575]
     9e0:	e5120deb 	ldr	r0, [r2, #-3563]
     9e4:	e20000ff 	and	r0, r0, #255	; 0xff
     9e8:	e8bd8010 	pop	{r4, pc}
     9ec:	ffe0cfff 	.word	0xffe0cfff

000009f0 <USBHwEPConfig>:
     9f0:	e59fc04c 	ldr	ip, [pc, #76]	; a44 <USBHwEPConfig+0x54>
     9f4:	e200300f 	and	r3, r0, #15	; 0xf
     9f8:	e51c2dbb 	ldr	r2, [ip, #-3515]
     9fc:	e1a03083 	lsl	r3, r3, #1
     a00:	e2000080 	and	r0, r0, #128	; 0x80
     a04:	e18303a0 	orr	r0, r3, r0, lsr #7
     a08:	e3a03001 	mov	r3, #1	; 0x1
     a0c:	e1822013 	orr	r2, r2, r3, lsl r0
     a10:	e1a01801 	lsl	r1, r1, #16
     a14:	e1a01821 	lsr	r1, r1, #16
     a18:	e50c2dbb 	str	r2, [ip, #-3515]
     a1c:	e50c0db7 	str	r0, [ip, #-3511]
     a20:	e50c1db3 	str	r1, [ip, #-3507]
     a24:	e51c3dff 	ldr	r3, [ip, #-3583]
     a28:	e2033c01 	and	r3, r3, #256	; 0x100
     a2c:	e3530c01 	cmp	r3, #256	; 0x100
     a30:	1afffffb 	bne	a24 <USBHwEPConfig+0x34>
     a34:	e3800040 	orr	r0, r0, #64	; 0x40
     a38:	e3a01000 	mov	r1, #0	; 0x0
     a3c:	e50c3df7 	str	r3, [ip, #-3575]
     a40:	eaffffc7 	b	964 <USBHwCmdWrite>
     a44:	ffe0cfff 	.word	0xffe0cfff

00000a48 <USBHwSetAddress>:
     a48:	e200107f 	and	r1, r0, #127	; 0x7f
     a4c:	e3811080 	orr	r1, r1, #128	; 0x80
     a50:	e3a000d0 	mov	r0, #208	; 0xd0
     a54:	eaffffc2 	b	964 <USBHwCmdWrite>

00000a58 <USBHwConnect>:
     a58:	e3500000 	cmp	r0, #0	; 0x0
     a5c:	159f3020 	ldrne	r3, [pc, #32]	; a84 <USBHwConnect+0x2c>
     a60:	059f301c 	ldreq	r3, [pc, #28]	; a84 <USBHwConnect+0x2c>
     a64:	13a02c02 	movne	r2, #512	; 0x200
     a68:	03a02c02 	moveq	r2, #512	; 0x200
     a6c:	15032fa3 	strne	r2, [r3, #-4003]
     a70:	05032fa7 	streq	r2, [r3, #-4007]
     a74:	e2501000 	subs	r1, r0, #0	; 0x0
     a78:	13a01001 	movne	r1, #1	; 0x1
     a7c:	e3a000fe 	mov	r0, #254	; 0xfe
     a80:	eaffffb7 	b	964 <USBHwCmdWrite>
     a84:	3fffcfff 	.word	0x3fffcfff

00000a88 <USBHwNakIntEnable>:
     a88:	e20010ff 	and	r1, r0, #255	; 0xff
     a8c:	e3a000f3 	mov	r0, #243	; 0xf3
     a90:	eaffffb3 	b	964 <USBHwCmdWrite>

00000a94 <USBHwEPGetStatus>:
     a94:	e1a03000 	mov	r3, r0
     a98:	e200000f 	and	r0, r0, #15	; 0xf
     a9c:	e2033080 	and	r3, r3, #128	; 0x80
     aa0:	e1a00080 	lsl	r0, r0, #1
     aa4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     aa8:	e18003a3 	orr	r0, r0, r3, lsr #7
     aac:	ebffffbd 	bl	9a8 <USBHwCmdRead>
     ab0:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00000ab4 <USBHwEPStall>:
     ab4:	e200300f 	and	r3, r0, #15	; 0xf
     ab8:	e1a03083 	lsl	r3, r3, #1
     abc:	e2000080 	and	r0, r0, #128	; 0x80
     ac0:	e18333a0 	orr	r3, r3, r0, lsr #7
     ac4:	e2511000 	subs	r1, r1, #0	; 0x0
     ac8:	13a01001 	movne	r1, #1	; 0x1
     acc:	e3830040 	orr	r0, r3, #64	; 0x40
     ad0:	eaffffa3 	b	964 <USBHwCmdWrite>

00000ad4 <USBHwEPWrite>:
     ad4:	e92d40f0 	push	{r4, r5, r6, r7, lr}
     ad8:	e59fc07c 	ldr	ip, [pc, #124]	; b5c <USBHwEPWrite+0x88>
     adc:	e200500f 	and	r5, r0, #15	; 0xf
     ae0:	e1a03105 	lsl	r3, r5, #2
     ae4:	e3833002 	orr	r3, r3, #2	; 0x2
     ae8:	e1a06002 	mov	r6, r2
     aec:	e1a0e001 	mov	lr, r1
     af0:	e1a0400c 	mov	r4, ip
     af4:	e20070ff 	and	r7, r0, #255	; 0xff
     af8:	e50c3dd7 	str	r3, [ip, #-3543]
     afc:	e50c2ddb 	str	r2, [ip, #-3547]
     b00:	ea000008 	b	b28 <USBHwEPWrite+0x54>
     b04:	e55e3002 	ldrb	r3, [lr, #-2]
     b08:	e55e2001 	ldrb	r2, [lr, #-1]
     b0c:	e55e1004 	ldrb	r1, [lr, #-4]
     b10:	e1a03803 	lsl	r3, r3, #16
     b14:	e1833c02 	orr	r3, r3, r2, lsl #24
     b18:	e55e2003 	ldrb	r2, [lr, #-3]
     b1c:	e1833001 	orr	r3, r3, r1
     b20:	e1833402 	orr	r3, r3, r2, lsl #8
     b24:	e5003de3 	str	r3, [r0, #-3555]
     b28:	e5143dd7 	ldr	r3, [r4, #-3543]
     b2c:	e2133002 	ands	r3, r3, #2	; 0x2
     b30:	e28ee004 	add	lr, lr, #4	; 0x4
     b34:	e1a00004 	mov	r0, r4
     b38:	1afffff1 	bne	b04 <USBHwEPWrite+0x30>
     b3c:	e1a00085 	lsl	r0, r5, #1
     b40:	e18003a7 	orr	r0, r0, r7, lsr #7
     b44:	e5043dd7 	str	r3, [r4, #-3543]
     b48:	ebffff77 	bl	92c <USBHwCmd>
     b4c:	e3a000fa 	mov	r0, #250	; 0xfa
     b50:	ebffff75 	bl	92c <USBHwCmd>
     b54:	e1a00006 	mov	r0, r6
     b58:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
     b5c:	ffe0cfff 	.word	0xffe0cfff

00000b60 <USBHwEPRead>:
     b60:	e92d4030 	push	{r4, r5, lr}
     b64:	e200e00f 	and	lr, r0, #15	; 0xf
     b68:	e59fc088 	ldr	ip, [pc, #136]	; bf8 <USBHwEPRead+0x98>
     b6c:	e1a0310e 	lsl	r3, lr, #2
     b70:	e3833001 	orr	r3, r3, #1	; 0x1
     b74:	e50c3dd7 	str	r3, [ip, #-3543]
     b78:	e20050ff 	and	r5, r0, #255	; 0xff
     b7c:	e51c3ddf 	ldr	r3, [ip, #-3551]
     b80:	e3130b02 	tst	r3, #2048	; 0x800
     b84:	0afffffc 	beq	b7c <USBHwEPRead+0x1c>
     b88:	e3130b01 	tst	r3, #1024	; 0x400
     b8c:	03e04000 	mvneq	r4, #0	; 0x0
     b90:	0a000016 	beq	bf0 <USBHwEPRead+0x90>
     b94:	e1a03b03 	lsl	r3, r3, #22
     b98:	e3a04000 	mov	r4, #0	; 0x0
     b9c:	e59fc054 	ldr	ip, [pc, #84]	; bf8 <USBHwEPRead+0x98>
     ba0:	e1a03b23 	lsr	r3, r3, #22
     ba4:	e1a00004 	mov	r0, r4
     ba8:	ea000006 	b	bc8 <USBHwEPRead+0x68>
     bac:	e3140003 	tst	r4, #3	; 0x3
     bb0:	051c0de7 	ldreq	r0, [ip, #-3559]
     bb4:	e3510000 	cmp	r1, #0	; 0x0
     bb8:	11540002 	cmpne	r4, r2
     bbc:	b7c40001 	strblt	r0, [r4, r1]
     bc0:	e2844001 	add	r4, r4, #1	; 0x1
     bc4:	e1a00420 	lsr	r0, r0, #8
     bc8:	e1540003 	cmp	r4, r3
     bcc:	1afffff6 	bne	bac <USBHwEPRead+0x4c>
     bd0:	e59f3020 	ldr	r3, [pc, #32]	; bf8 <USBHwEPRead+0x98>
     bd4:	e1a0008e 	lsl	r0, lr, #1
     bd8:	e3a02000 	mov	r2, #0	; 0x0
     bdc:	e18003a5 	orr	r0, r0, r5, lsr #7
     be0:	e5032dd7 	str	r2, [r3, #-3543]
     be4:	ebffff50 	bl	92c <USBHwCmd>
     be8:	e3a000f2 	mov	r0, #242	; 0xf2
     bec:	ebffff4e 	bl	92c <USBHwCmd>
     bf0:	e1a00004 	mov	r0, r4
     bf4:	e8bd8030 	pop	{r4, r5, pc}
     bf8:	ffe0cfff 	.word	0xffe0cfff

00000bfc <USBHwISOCEPRead>:
     bfc:	e92d4030 	push	{r4, r5, lr}
     c00:	e200e00f 	and	lr, r0, #15	; 0xf
     c04:	e1a0310e 	lsl	r3, lr, #2
     c08:	e59fc08c 	ldr	ip, [pc, #140]	; c9c <USBHwISOCEPRead+0xa0>
     c0c:	e3833001 	orr	r3, r3, #1	; 0x1
     c10:	e50c3dd7 	str	r3, [ip, #-3543]
     c14:	e20050ff 	and	r5, r0, #255	; 0xff
     c18:	e1a00000 	nop			(mov r0,r0)
     c1c:	e51c3ddf 	ldr	r3, [ip, #-3551]
     c20:	e2130b02 	ands	r0, r3, #2048	; 0x800
     c24:	0a000001 	beq	c30 <USBHwISOCEPRead+0x34>
     c28:	e2130b01 	ands	r0, r3, #1024	; 0x400
     c2c:	1a000002 	bne	c3c <USBHwISOCEPRead+0x40>
     c30:	e3e04000 	mvn	r4, #0	; 0x0
     c34:	e50c0dd7 	str	r0, [ip, #-3543]
     c38:	ea000015 	b	c94 <USBHwISOCEPRead+0x98>
     c3c:	e1a03b03 	lsl	r3, r3, #22
     c40:	e3a04000 	mov	r4, #0	; 0x0
     c44:	e1a03b23 	lsr	r3, r3, #22
     c48:	e1a00004 	mov	r0, r4
     c4c:	ea000006 	b	c6c <USBHwISOCEPRead+0x70>
     c50:	e3140003 	tst	r4, #3	; 0x3
     c54:	051c0de7 	ldreq	r0, [ip, #-3559]
     c58:	e3510000 	cmp	r1, #0	; 0x0
     c5c:	11540002 	cmpne	r4, r2
     c60:	b7c40001 	strblt	r0, [r4, r1]
     c64:	e2844001 	add	r4, r4, #1	; 0x1
     c68:	e1a00420 	lsr	r0, r0, #8
     c6c:	e1540003 	cmp	r4, r3
     c70:	1afffff6 	bne	c50 <USBHwISOCEPRead+0x54>
     c74:	e59f3020 	ldr	r3, [pc, #32]	; c9c <USBHwISOCEPRead+0xa0>
     c78:	e1a0008e 	lsl	r0, lr, #1
     c7c:	e3a02000 	mov	r2, #0	; 0x0
     c80:	e18003a5 	orr	r0, r0, r5, lsr #7
     c84:	e5032dd7 	str	r2, [r3, #-3543]
     c88:	ebffff27 	bl	92c <USBHwCmd>
     c8c:	e3a000f2 	mov	r0, #242	; 0xf2
     c90:	ebffff25 	bl	92c <USBHwCmd>
     c94:	e1a00004 	mov	r0, r4
     c98:	e8bd8030 	pop	{r4, r5, pc}
     c9c:	ffe0cfff 	.word	0xffe0cfff

00000ca0 <USBHwConfigDevice>:
     ca0:	e2501000 	subs	r1, r0, #0	; 0x0
     ca4:	13a01001 	movne	r1, #1	; 0x1
     ca8:	e3a000d8 	mov	r0, #216	; 0xd8
     cac:	eaffff2c 	b	964 <USBHwCmdWrite>

00000cb0 <USBHwISR>:
     cb0:	e59f3144 	ldr	r3, [pc, #324]	; dfc <USBHwISR+0x14c>
     cb4:	e3a02002 	mov	r2, #2	; 0x2
     cb8:	e5032fa7 	str	r2, [r3, #-4007]
     cbc:	e59f213c 	ldr	r2, [pc, #316]	; e00 <USBHwISR+0x150>
     cc0:	e92d45f0 	push	{r4, r5, r6, r7, r8, sl, lr}
     cc4:	e5126dff 	ldr	r6, [r2, #-3583]
     cc8:	e3160001 	tst	r6, #1	; 0x1
     ccc:	0a00000b 	beq	d00 <USBHwISR+0x50>
     cd0:	e59f312c 	ldr	r3, [pc, #300]	; e04 <USBHwISR+0x154>
     cd4:	e5934000 	ldr	r4, [r3]
     cd8:	e3a03001 	mov	r3, #1	; 0x1
     cdc:	e3540000 	cmp	r4, #0	; 0x0
     ce0:	e5023df7 	str	r3, [r2, #-3575]
     ce4:	0a000005 	beq	d00 <USBHwISR+0x50>
     ce8:	e3a000f5 	mov	r0, #245	; 0xf5
     cec:	ebffff2d 	bl	9a8 <USBHwCmdRead>
     cf0:	e1a00800 	lsl	r0, r0, #16
     cf4:	e1a00820 	lsr	r0, r0, #16
     cf8:	e1a0e00f 	mov	lr, pc
     cfc:	e12fff14 	bx	r4
     d00:	e3160008 	tst	r6, #8	; 0x8
     d04:	0a000011 	beq	d50 <USBHwISR+0xa0>
     d08:	e59f30f0 	ldr	r3, [pc, #240]	; e00 <USBHwISR+0x150>
     d0c:	e3a02008 	mov	r2, #8	; 0x8
     d10:	e3a000fe 	mov	r0, #254	; 0xfe
     d14:	e5032df7 	str	r2, [r3, #-3575]
     d18:	ebffff22 	bl	9a8 <USBHwCmdRead>
     d1c:	e310001a 	tst	r0, #26	; 0x1a
     d20:	0a00000a 	beq	d50 <USBHwISR+0xa0>
     d24:	e59f30dc 	ldr	r3, [pc, #220]	; e08 <USBHwISR+0x158>
     d28:	e5933000 	ldr	r3, [r3]
     d2c:	e3530000 	cmp	r3, #0	; 0x0
     d30:	0a000006 	beq	d50 <USBHwISR+0xa0>
     d34:	e59f50c0 	ldr	r5, [pc, #192]	; dfc <USBHwISR+0x14c>
     d38:	e3a04001 	mov	r4, #1	; 0x1
     d3c:	e5054fa7 	str	r4, [r5, #-4007]
     d40:	e2000015 	and	r0, r0, #21	; 0x15
     d44:	e1a0e00f 	mov	lr, pc
     d48:	e12fff13 	bx	r3
     d4c:	e5054fa3 	str	r4, [r5, #-4003]
     d50:	e3160004 	tst	r6, #4	; 0x4
     d54:	0a000024 	beq	dec <USBHwISR+0x13c>
     d58:	e59f30a0 	ldr	r3, [pc, #160]	; e00 <USBHwISR+0x150>
     d5c:	e3a02004 	mov	r2, #4	; 0x4
     d60:	e5032df7 	str	r2, [r3, #-3575]
     d64:	e59fa0a0 	ldr	sl, [pc, #160]	; e0c <USBHwISR+0x15c>
     d68:	e59f708c 	ldr	r7, [pc, #140]	; dfc <USBHwISR+0x14c>
     d6c:	e1a05003 	mov	r5, r3
     d70:	e1a06002 	mov	r6, r2
     d74:	e3a04000 	mov	r4, #0	; 0x0
     d78:	e3a08001 	mov	r8, #1	; 0x1
     d7c:	e1a02418 	lsl	r2, r8, r4
     d80:	e5153dcf 	ldr	r3, [r5, #-3535]
     d84:	e1120003 	tst	r2, r3
     d88:	0a000014 	beq	de0 <USBHwISR+0x130>
     d8c:	e5052dc7 	str	r2, [r5, #-3527]
     d90:	e5153dff 	ldr	r3, [r5, #-3583]
     d94:	e2032020 	and	r2, r3, #32	; 0x20
     d98:	e3520020 	cmp	r2, #32	; 0x20
     d9c:	1afffffb 	bne	d90 <USBHwISR+0xe0>
     da0:	e0843fa4 	add	r3, r4, r4, lsr #31
     da4:	e1a030c3 	asr	r3, r3, #1
     da8:	e79a3103 	ldr	r3, [sl, r3, lsl #2]
     dac:	e5052df7 	str	r2, [r5, #-3575]
     db0:	e3530000 	cmp	r3, #0	; 0x0
     db4:	e5151deb 	ldr	r1, [r5, #-3563]
     db8:	0a000008 	beq	de0 <USBHwISR+0x130>
     dbc:	e1a000c4 	asr	r0, r4, #1
     dc0:	e200000f 	and	r0, r0, #15	; 0xf
     dc4:	e1800384 	orr	r0, r0, r4, lsl #7
     dc8:	e5076fa7 	str	r6, [r7, #-4007]
     dcc:	e200008f 	and	r0, r0, #143	; 0x8f
     dd0:	e201101f 	and	r1, r1, #31	; 0x1f
     dd4:	e1a0e00f 	mov	lr, pc
     dd8:	e12fff13 	bx	r3
     ddc:	e5076fa3 	str	r6, [r7, #-4003]
     de0:	e2844001 	add	r4, r4, #1	; 0x1
     de4:	e3540020 	cmp	r4, #32	; 0x20
     de8:	1affffe3 	bne	d7c <USBHwISR+0xcc>
     dec:	e59f3008 	ldr	r3, [pc, #8]	; dfc <USBHwISR+0x14c>
     df0:	e3a02002 	mov	r2, #2	; 0x2
     df4:	e5032fa3 	str	r2, [r3, #-4003]
     df8:	e8bd85f0 	pop	{r4, r5, r6, r7, r8, sl, pc}
     dfc:	3fffcfff 	.word	0x3fffcfff
     e00:	ffe0cfff 	.word	0xffe0cfff
     e04:	40000210 	.word	0x40000210
     e08:	40000214 	.word	0x40000214
     e0c:	40000218 	.word	0x40000218

00000e10 <USBHwInit>:
     e10:	e59f2120 	ldr	r2, [pc, #288]	; f38 <USBHwInit+0x128>
     e14:	e5923004 	ldr	r3, [r2, #4]
     e18:	e3c3330f 	bic	r3, r3, #1006632960	; 0x3c000000
     e1c:	e3833305 	orr	r3, r3, #335544320	; 0x14000000
     e20:	e5823004 	str	r3, [r2, #4]
     e24:	e592300c 	ldr	r3, [r2, #12]
     e28:	e3c33203 	bic	r3, r3, #805306368	; 0x30000000
     e2c:	e3c33030 	bic	r3, r3, #48	; 0x30
     e30:	e3833202 	orr	r3, r3, #536870912	; 0x20000000
     e34:	e3833010 	orr	r3, r3, #16	; 0x10
     e38:	e582300c 	str	r3, [r2, #12]
     e3c:	e5923010 	ldr	r3, [r2, #16]
     e40:	e3c33703 	bic	r3, r3, #786432	; 0xc0000
     e44:	e5823010 	str	r3, [r2, #16]
     e48:	e59f20ec 	ldr	r2, [pc, #236]	; f3c <USBHwInit+0x12c>
     e4c:	e5123fbf 	ldr	r3, [r2, #-4031]
     e50:	e3833c02 	orr	r3, r3, #512	; 0x200
     e54:	e5023fbf 	str	r3, [r2, #-4031]
     e58:	e3a03c02 	mov	r3, #512	; 0x200
     e5c:	e5023fa7 	str	r3, [r2, #-4007]
     e60:	e59f20d8 	ldr	r2, [pc, #216]	; f40 <USBHwInit+0x130>
     e64:	e59230c4 	ldr	r3, [r2, #196]
     e68:	e92d4010 	push	{r4, lr}
     e6c:	e3833102 	orr	r3, r3, #-2147483648	; 0x80000000
     e70:	e58230c4 	str	r3, [r2, #196]
     e74:	e59f10c8 	ldr	r1, [pc, #200]	; f44 <USBHwInit+0x134>
     e78:	e3a03005 	mov	r3, #5	; 0x5
     e7c:	e5823108 	str	r3, [r2, #264]
     e80:	e283300d 	add	r3, r3, #13	; 0xd
     e84:	e501300b 	str	r3, [r1, #-11]
     e88:	e5113007 	ldr	r3, [r1, #-7]
     e8c:	e3130012 	tst	r3, #18	; 0x12
     e90:	0afffffc 	beq	e88 <USBHwInit+0x78>
     e94:	e3a04000 	mov	r4, #0	; 0x0
     e98:	e3e03000 	mvn	r3, #0	; 0x0
     e9c:	e5014dfb 	str	r4, [r1, #-3579]
     ea0:	e1a00004 	mov	r0, r4
     ea4:	e5013df7 	str	r3, [r1, #-3575]
     ea8:	e5014dd3 	str	r4, [r1, #-3539]
     eac:	e5014dcb 	str	r4, [r1, #-3531]
     eb0:	e5013dc7 	str	r3, [r1, #-3527]
     eb4:	e5014dbf 	str	r4, [r1, #-3519]
     eb8:	ebfffef2 	bl	a88 <USBHwNakIntEnable>
     ebc:	e59f107c 	ldr	r1, [pc, #124]	; f40 <USBHwInit+0x130>
     ec0:	e59131a0 	ldr	r3, [r1, #416]
     ec4:	e59fc06c 	ldr	ip, [pc, #108]	; f38 <USBHwInit+0x128>
     ec8:	e3833001 	orr	r3, r3, #1	; 0x1
     ecc:	e58131a0 	str	r3, [r1, #416]
     ed0:	e59f2064 	ldr	r2, [pc, #100]	; f3c <USBHwInit+0x12c>
     ed4:	e58c4028 	str	r4, [ip, #40]
     ed8:	e5123fbf 	ldr	r3, [r2, #-4031]
     edc:	e3a00001 	mov	r0, #1	; 0x1
     ee0:	e3833001 	orr	r3, r3, #1	; 0x1
     ee4:	e5023fbf 	str	r3, [r2, #-4031]
     ee8:	e5020fa3 	str	r0, [r2, #-4003]
     eec:	e59131a0 	ldr	r3, [r1, #416]
     ef0:	e1833000 	orr	r3, r3, r0
     ef4:	e58131a0 	str	r3, [r1, #416]
     ef8:	e58c4028 	str	r4, [ip, #40]
     efc:	e5123fbf 	ldr	r3, [r2, #-4031]
     f00:	e3833002 	orr	r3, r3, #2	; 0x2
     f04:	e5023fbf 	str	r3, [r2, #-4031]
     f08:	e3a03002 	mov	r3, #2	; 0x2
     f0c:	e5023fa3 	str	r3, [r2, #-4003]
     f10:	e59131a0 	ldr	r3, [r1, #416]
     f14:	e1833000 	orr	r3, r3, r0
     f18:	e58131a0 	str	r3, [r1, #416]
     f1c:	e58c4028 	str	r4, [ip, #40]
     f20:	e5123fbf 	ldr	r3, [r2, #-4031]
     f24:	e3833004 	orr	r3, r3, #4	; 0x4
     f28:	e5023fbf 	str	r3, [r2, #-4031]
     f2c:	e3a03004 	mov	r3, #4	; 0x4
     f30:	e5023fa3 	str	r3, [r2, #-4003]
     f34:	e8bd8010 	pop	{r4, pc}
     f38:	e002c000 	.word	0xe002c000
     f3c:	3fffcfff 	.word	0x3fffcfff
     f40:	e01fc000 	.word	0xe01fc000
     f44:	ffe0cfff 	.word	0xffe0cfff

00000f48 <USBSetupDMADescriptor>:
     f48:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f4c:	e3a0e000 	mov	lr, #0	; 0x0
     f50:	e580e004 	str	lr, [r0, #4]
     f54:	e5801000 	str	r1, [r0]
     f58:	e1a0c001 	mov	ip, r1
     f5c:	e1a03b03 	lsl	r3, r3, #22
     f60:	e5901004 	ldr	r1, [r0, #4]
     f64:	e1a03b23 	lsr	r3, r3, #22
     f68:	e1811283 	orr	r1, r1, r3, lsl #5
     f6c:	e5801004 	str	r1, [r0, #4]
     f70:	e1dd10b4 	ldrh	r1, [sp, #4]
     f74:	e5903004 	ldr	r3, [r0, #4]
     f78:	e1833801 	orr	r3, r3, r1, lsl #16
     f7c:	e5803004 	str	r3, [r0, #4]
     f80:	e21220ff 	ands	r2, r2, #255	; 0xff
     f84:	15903004 	ldrne	r3, [r0, #4]
     f88:	13833010 	orrne	r3, r3, #16	; 0x10
     f8c:	15803004 	strne	r3, [r0, #4]
     f90:	e35c0000 	cmp	ip, #0	; 0x0
     f94:	15903004 	ldrne	r3, [r0, #4]
     f98:	e59d100c 	ldr	r1, [sp, #12]
     f9c:	13833004 	orrne	r3, r3, #4	; 0x4
     fa0:	15803004 	strne	r3, [r0, #4]
     fa4:	e59d3008 	ldr	r3, [sp, #8]
     fa8:	e3520000 	cmp	r2, #0	; 0x0
     fac:	13510000 	cmpne	r1, #0	; 0x0
     fb0:	e5803008 	str	r3, [r0, #8]
     fb4:	15801010 	strne	r1, [r0, #16]
     fb8:	e580e00c 	str	lr, [r0, #12]
     fbc:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00000fc0 <USBDisableDMAForEndpoint>:
     fc0:	e200200f 	and	r2, r0, #15	; 0xf
     fc4:	e1a02082 	lsl	r2, r2, #1
     fc8:	e2000080 	and	r0, r0, #128	; 0x80
     fcc:	e18223a0 	orr	r2, r2, r0, lsr #7
     fd0:	e3a03001 	mov	r3, #1	; 0x1
     fd4:	e1a03213 	lsl	r3, r3, r2
     fd8:	e59f2004 	ldr	r2, [pc, #4]	; fe4 <USBDisableDMAForEndpoint+0x24>
     fdc:	e5023d73 	str	r3, [r2, #-3443]
     fe0:	e12fff1e 	bx	lr
     fe4:	ffe0cfff 	.word	0xffe0cfff

00000fe8 <USBEnableDMAForEndpoint>:
     fe8:	e200200f 	and	r2, r0, #15	; 0xf
     fec:	e1a02082 	lsl	r2, r2, #1
     ff0:	e2000080 	and	r0, r0, #128	; 0x80
     ff4:	e18223a0 	orr	r2, r2, r0, lsr #7
     ff8:	e3a03001 	mov	r3, #1	; 0x1
     ffc:	e1a03213 	lsl	r3, r3, r2
    1000:	e59f2004 	ldr	r2, [pc, #4]	; 100c <USBEnableDMAForEndpoint+0x24>
    1004:	e5023d77 	str	r3, [r2, #-3447]
    1008:	e12fff1e 	bx	lr
    100c:	ffe0cfff 	.word	0xffe0cfff

00001010 <USBInitializeISOCFrameArray>:
    1010:	e92d4030 	push	{r4, r5, lr}
    1014:	e1a03b03 	lsl	r3, r3, #22
    1018:	e1a02802 	lsl	r2, r2, #16
    101c:	e1a03b23 	lsr	r3, r3, #22
    1020:	e1a05000 	mov	r5, r0
    1024:	e1a04001 	mov	r4, r1
    1028:	e1a0c822 	lsr	ip, r2, #16
    102c:	e3830902 	orr	r0, r3, #32768	; 0x8000
    1030:	e3a0e000 	mov	lr, #0	; 0x0
    1034:	ea000000 	b	103c <USBInitializeISOCFrameArray+0x2c>
    1038:	e7851102 	str	r1, [r5, r2, lsl #2]
    103c:	e1a0280e 	lsl	r2, lr, #16
    1040:	e28c3001 	add	r3, ip, #1	; 0x1
    1044:	e1a02822 	lsr	r2, r2, #16
    1048:	e1a03803 	lsl	r3, r3, #16
    104c:	e1520004 	cmp	r2, r4
    1050:	e180180c 	orr	r1, r0, ip, lsl #16
    1054:	e28ee001 	add	lr, lr, #1	; 0x1
    1058:	e1a0c823 	lsr	ip, r3, #16
    105c:	3afffff5 	bcc	1038 <USBInitializeISOCFrameArray+0x28>
    1060:	e8bd8030 	pop	{r4, r5, pc}

00001064 <USBSetHeadDDForDMA>:
    1064:	e200300f 	and	r3, r0, #15	; 0xf
    1068:	e1a03083 	lsl	r3, r3, #1
    106c:	e2000080 	and	r0, r0, #128	; 0x80
    1070:	e18333a0 	orr	r3, r3, r0, lsr #7
    1074:	e7812103 	str	r2, [r1, r3, lsl #2]
    1078:	e12fff1e 	bx	lr

0000107c <USBInitializeUSBDMA>:
    107c:	e3a03000 	mov	r3, #0	; 0x0
    1080:	e1a02003 	mov	r2, r3
    1084:	e7832000 	str	r2, [r3, r0]
    1088:	e2833004 	add	r3, r3, #4	; 0x4
    108c:	e3530080 	cmp	r3, #128	; 0x80
    1090:	1afffffb 	bne	1084 <USBInitializeUSBDMA+0x8>
    1094:	e59f3004 	ldr	r3, [pc, #4]	; 10a0 <USBInitializeUSBDMA+0x24>
    1098:	e5030d7f 	str	r0, [r3, #-3455]
    109c:	e12fff1e 	bx	lr
    10a0:	ffe0cfff 	.word	0xffe0cfff

000010a4 <USBHwRegisterFrameHandler>:
    10a4:	e59f1018 	ldr	r1, [pc, #24]	; 10c4 <USBHwRegisterFrameHandler+0x20>
    10a8:	e59f3018 	ldr	r3, [pc, #24]	; 10c8 <USBHwRegisterFrameHandler+0x24>
    10ac:	e5112dfb 	ldr	r2, [r1, #-3579]
    10b0:	e5830000 	str	r0, [r3]
    10b4:	e59f0010 	ldr	r0, [pc, #16]	; 10cc <USBHwRegisterFrameHandler+0x28>
    10b8:	e3822001 	orr	r2, r2, #1	; 0x1
    10bc:	e5012dfb 	str	r2, [r1, #-3579]
    10c0:	eafffd98 	b	728 <puts>
    10c4:	ffe0cfff 	.word	0xffe0cfff
    10c8:	40000210 	.word	0x40000210
    10cc:	00001cec 	.word	0x00001cec

000010d0 <USBHwRegisterDevIntHandler>:
    10d0:	e59f1018 	ldr	r1, [pc, #24]	; 10f0 <USBHwRegisterDevIntHandler+0x20>
    10d4:	e59f3018 	ldr	r3, [pc, #24]	; 10f4 <USBHwRegisterDevIntHandler+0x24>
    10d8:	e5112dfb 	ldr	r2, [r1, #-3579]
    10dc:	e5830000 	str	r0, [r3]
    10e0:	e59f0010 	ldr	r0, [pc, #16]	; 10f8 <USBHwRegisterDevIntHandler+0x28>
    10e4:	e3822008 	orr	r2, r2, #8	; 0x8
    10e8:	e5012dfb 	str	r2, [r1, #-3579]
    10ec:	eafffd8d 	b	728 <puts>
    10f0:	ffe0cfff 	.word	0xffe0cfff
    10f4:	40000214 	.word	0x40000214
    10f8:	00001d0c 	.word	0x00001d0c

000010fc <USBHwRegisterEPIntHandler>:
    10fc:	e92d4010 	push	{r4, lr}
    1100:	e200300f 	and	r3, r0, #15	; 0xf
    1104:	e1a03083 	lsl	r3, r3, #1
    1108:	e2002080 	and	r2, r0, #128	; 0x80
    110c:	e183e3a2 	orr	lr, r3, r2, lsr #7
    1110:	e35e001f 	cmp	lr, #31	; 0x1f
    1114:	e1a04001 	mov	r4, r1
    1118:	e24dd004 	sub	sp, sp, #4	; 0x4
    111c:	e20010ff 	and	r1, r0, #255	; 0xff
    1120:	da000007 	ble	1144 <USBHwRegisterEPIntHandler+0x48>
    1124:	e3a0c0d2 	mov	ip, #210	; 0xd2
    1128:	e59f0050 	ldr	r0, [pc, #80]	; 1180 <USBHwRegisterEPIntHandler+0x84>
    112c:	e59f1050 	ldr	r1, [pc, #80]	; 1184 <USBHwRegisterEPIntHandler+0x88>
    1130:	e59f2050 	ldr	r2, [pc, #80]	; 1188 <USBHwRegisterEPIntHandler+0x8c>
    1134:	e59f3050 	ldr	r3, [pc, #80]	; 118c <USBHwRegisterEPIntHandler+0x90>
    1138:	e58dc000 	str	ip, [sp]
    113c:	ebfffd43 	bl	650 <printf>
    1140:	eafffffe 	b	1140 <USBHwRegisterEPIntHandler+0x44>
    1144:	e59fc044 	ldr	ip, [pc, #68]	; 1190 <USBHwRegisterEPIntHandler+0x94>
    1148:	e51c3dcb 	ldr	r3, [ip, #-3531]
    114c:	e3a02001 	mov	r2, #1	; 0x1
    1150:	e1833e12 	orr	r3, r3, r2, lsl lr
    1154:	e50c3dcb 	str	r3, [ip, #-3531]
    1158:	e51c2dfb 	ldr	r2, [ip, #-3579]
    115c:	e59f3030 	ldr	r3, [pc, #48]	; 1194 <USBHwRegisterEPIntHandler+0x98>
    1160:	e59f0030 	ldr	r0, [pc, #48]	; 1198 <USBHwRegisterEPIntHandler+0x9c>
    1164:	e3822004 	orr	r2, r2, #4	; 0x4
    1168:	e1a0e0ae 	lsr	lr, lr, #1
    116c:	e783410e 	str	r4, [r3, lr, lsl #2]
    1170:	e50c2dfb 	str	r2, [ip, #-3579]
    1174:	e28dd004 	add	sp, sp, #4	; 0x4
    1178:	e8bd4010 	pop	{r4, lr}
    117c:	eafffd33 	b	650 <printf>
    1180:	00001d34 	.word	0x00001d34
    1184:	00001d5c 	.word	0x00001d5c
    1188:	00001d64 	.word	0x00001d64
    118c:	00001be8 	.word	0x00001be8
    1190:	ffe0cfff 	.word	0xffe0cfff
    1194:	40000218 	.word	0x40000218
    1198:	00001d70 	.word	0x00001d70

0000119c <USBRegisterRequestHandler>:
    119c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    11a0:	e3500000 	cmp	r0, #0	; 0x0
    11a4:	e24dd004 	sub	sp, sp, #4	; 0x4
    11a8:	aa000007 	bge	11cc <USBRegisterRequestHandler+0x30>
    11ac:	e3a0c0e2 	mov	ip, #226	; 0xe2
    11b0:	e59f0054 	ldr	r0, [pc, #84]	; 120c <USBRegisterRequestHandler+0x70>
    11b4:	e59f1054 	ldr	r1, [pc, #84]	; 1210 <USBRegisterRequestHandler+0x74>
    11b8:	e59f2054 	ldr	r2, [pc, #84]	; 1214 <USBRegisterRequestHandler+0x78>
    11bc:	e59f3054 	ldr	r3, [pc, #84]	; 1218 <USBRegisterRequestHandler+0x7c>
    11c0:	e58dc000 	str	ip, [sp]
    11c4:	ebfffd21 	bl	650 <printf>
    11c8:	eafffffe 	b	11c8 <USBRegisterRequestHandler+0x2c>
    11cc:	e3500003 	cmp	r0, #3	; 0x3
    11d0:	da000007 	ble	11f4 <USBRegisterRequestHandler+0x58>
    11d4:	e3a0c0e3 	mov	ip, #227	; 0xe3
    11d8:	e59f002c 	ldr	r0, [pc, #44]	; 120c <USBRegisterRequestHandler+0x70>
    11dc:	e59f1038 	ldr	r1, [pc, #56]	; 121c <USBRegisterRequestHandler+0x80>
    11e0:	e59f202c 	ldr	r2, [pc, #44]	; 1214 <USBRegisterRequestHandler+0x78>
    11e4:	e59f302c 	ldr	r3, [pc, #44]	; 1218 <USBRegisterRequestHandler+0x7c>
    11e8:	e58dc000 	str	ip, [sp]
    11ec:	ebfffd17 	bl	650 <printf>
    11f0:	eafffffe 	b	11f0 <USBRegisterRequestHandler+0x54>
    11f4:	e59f3024 	ldr	r3, [pc, #36]	; 1220 <USBRegisterRequestHandler+0x84>
    11f8:	e7832100 	str	r2, [r3, r0, lsl #2]
    11fc:	e59f3020 	ldr	r3, [pc, #32]	; 1224 <USBRegisterRequestHandler+0x88>
    1200:	e7831100 	str	r1, [r3, r0, lsl #2]
    1204:	e28dd004 	add	sp, sp, #4	; 0x4
    1208:	e8bd8000 	pop	{pc}
    120c:	00001d34 	.word	0x00001d34
    1210:	00001d90 	.word	0x00001d90
    1214:	00001d9c 	.word	0x00001d9c
    1218:	00001c04 	.word	0x00001c04
    121c:	00001dac 	.word	0x00001dac
    1220:	40000268 	.word	0x40000268
    1224:	40000258 	.word	0x40000258

00001228 <_HandleRequest>:
    1228:	e92d4010 	push	{r4, lr}
    122c:	e5d03000 	ldrb	r3, [r0]
    1230:	e1a032a3 	lsr	r3, r3, #5
    1234:	e203c003 	and	ip, r3, #3	; 0x3
    1238:	e59f3028 	ldr	r3, [pc, #40]	; 1268 <_HandleRequest+0x40>
    123c:	e793410c 	ldr	r4, [r3, ip, lsl #2]
    1240:	e3540000 	cmp	r4, #0	; 0x0
    1244:	1a000004 	bne	125c <_HandleRequest+0x34>
    1248:	e1a0100c 	mov	r1, ip
    124c:	e59f0018 	ldr	r0, [pc, #24]	; 126c <_HandleRequest+0x44>
    1250:	ebfffcfe 	bl	650 <printf>
    1254:	e1a00004 	mov	r0, r4
    1258:	e8bd8010 	pop	{r4, pc}
    125c:	e1a0e00f 	mov	lr, pc
    1260:	e12fff14 	bx	r4
    1264:	e8bd8010 	pop	{r4, pc}
    1268:	40000258 	.word	0x40000258
    126c:	00001db8 	.word	0x00001db8

00001270 <StallControlPipe>:
    1270:	e92d4070 	push	{r4, r5, r6, lr}
    1274:	e1a03000 	mov	r3, r0
    1278:	e3a01001 	mov	r1, #1	; 0x1
    127c:	e3a00080 	mov	r0, #128	; 0x80
    1280:	e20350ff 	and	r5, r3, #255	; 0xff
    1284:	ebfffe0a 	bl	ab4 <USBHwEPStall>
    1288:	e59f0030 	ldr	r0, [pc, #48]	; 12c0 <StallControlPipe+0x50>
    128c:	ebfffcef 	bl	650 <printf>
    1290:	e59f602c 	ldr	r6, [pc, #44]	; 12c4 <StallControlPipe+0x54>
    1294:	e3a04000 	mov	r4, #0	; 0x0
    1298:	e7d41006 	ldrb	r1, [r4, r6]
    129c:	e59f0024 	ldr	r0, [pc, #36]	; 12c8 <StallControlPipe+0x58>
    12a0:	e2844001 	add	r4, r4, #1	; 0x1
    12a4:	ebfffce9 	bl	650 <printf>
    12a8:	e3540008 	cmp	r4, #8	; 0x8
    12ac:	1afffff9 	bne	1298 <StallControlPipe+0x28>
    12b0:	e59f0014 	ldr	r0, [pc, #20]	; 12cc <StallControlPipe+0x5c>
    12b4:	e1a01005 	mov	r1, r5
    12b8:	e8bd4070 	pop	{r4, r5, r6, lr}
    12bc:	eafffce3 	b	650 <printf>
    12c0:	00001dd4 	.word	0x00001dd4
    12c4:	40000278 	.word	0x40000278
    12c8:	00001de0 	.word	0x00001de0
    12cc:	00001de8 	.word	0x00001de8

000012d0 <DataIn>:
    12d0:	e92d4070 	push	{r4, r5, r6, lr}
    12d4:	e59f6038 	ldr	r6, [pc, #56]	; 1314 <DataIn+0x44>
    12d8:	e5964000 	ldr	r4, [r6]
    12dc:	e59f5034 	ldr	r5, [pc, #52]	; 1318 <DataIn+0x48>
    12e0:	e3540040 	cmp	r4, #64	; 0x40
    12e4:	a3a04040 	movge	r4, #64	; 0x40
    12e8:	e1a02004 	mov	r2, r4
    12ec:	e3a00080 	mov	r0, #128	; 0x80
    12f0:	e5951000 	ldr	r1, [r5]
    12f4:	ebfffdf6 	bl	ad4 <USBHwEPWrite>
    12f8:	e5953000 	ldr	r3, [r5]
    12fc:	e5962000 	ldr	r2, [r6]
    1300:	e0833004 	add	r3, r3, r4
    1304:	e0642002 	rsb	r2, r4, r2
    1308:	e5853000 	str	r3, [r5]
    130c:	e5862000 	str	r2, [r6]
    1310:	e8bd8070 	pop	{r4, r5, r6, pc}
    1314:	40000284 	.word	0x40000284
    1318:	40000280 	.word	0x40000280

0000131c <USBHandleControlTransfer>:
    131c:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    1320:	e21000ff 	ands	r0, r0, #255	; 0xff
    1324:	e24dd004 	sub	sp, sp, #4	; 0x4
    1328:	e20170ff 	and	r7, r1, #255	; 0xff
    132c:	1a000051 	bne	1478 <USBHandleControlTransfer+0x15c>
    1330:	e3110004 	tst	r1, #4	; 0x4
    1334:	e59f6178 	ldr	r6, [pc, #376]	; 14b4 <USBHandleControlTransfer+0x198>
    1338:	0a000021 	beq	13c4 <USBHandleControlTransfer+0xa8>
    133c:	e59f5174 	ldr	r5, [pc, #372]	; 14b8 <USBHandleControlTransfer+0x19c>
    1340:	e3a02008 	mov	r2, #8	; 0x8
    1344:	e1a01005 	mov	r1, r5
    1348:	ebfffe04 	bl	b60 <USBHwEPRead>
    134c:	e5d51001 	ldrb	r1, [r5, #1]
    1350:	e59f0164 	ldr	r0, [pc, #356]	; 14bc <USBHandleControlTransfer+0x1a0>
    1354:	ebfffcbd 	bl	650 <printf>
    1358:	e5d50000 	ldrb	r0, [r5]
    135c:	e59f215c 	ldr	r2, [pc, #348]	; 14c0 <USBHandleControlTransfer+0x1a4>
    1360:	e1a032a0 	lsr	r3, r0, #5
    1364:	e1d510b6 	ldrh	r1, [r5, #6]
    1368:	e2033003 	and	r3, r3, #3	; 0x3
    136c:	e7923103 	ldr	r3, [r2, r3, lsl #2]
    1370:	e59f414c 	ldr	r4, [pc, #332]	; 14c4 <USBHandleControlTransfer+0x1a8>
    1374:	e59f214c 	ldr	r2, [pc, #332]	; 14c8 <USBHandleControlTransfer+0x1ac>
    1378:	e3510000 	cmp	r1, #0	; 0x0
    137c:	e5823000 	str	r3, [r2]
    1380:	e5861000 	str	r1, [r6]
    1384:	e5841000 	str	r1, [r4]
    1388:	0a000001 	beq	1394 <USBHandleControlTransfer+0x78>
    138c:	e1b003a0 	lsrs	r0, r0, #7
    1390:	0a000045 	beq	14ac <USBHandleControlTransfer+0x190>
    1394:	e1a00005 	mov	r0, r5
    1398:	e1a01004 	mov	r1, r4
    139c:	ebffffa1 	bl	1228 <_HandleRequest>
    13a0:	e3500000 	cmp	r0, #0	; 0x0
    13a4:	059f0120 	ldreq	r0, [pc, #288]	; 14cc <USBHandleControlTransfer+0x1b0>
    13a8:	0a000022 	beq	1438 <USBHandleControlTransfer+0x11c>
    13ac:	e1d520b6 	ldrh	r2, [r5, #6]
    13b0:	e5943000 	ldr	r3, [r4]
    13b4:	e1520003 	cmp	r2, r3
    13b8:	d5862000 	strle	r2, [r6]
    13bc:	c5863000 	strgt	r3, [r6]
    13c0:	ea00002e 	b	1480 <USBHandleControlTransfer+0x164>
    13c4:	e5962000 	ldr	r2, [r6]
    13c8:	e3520000 	cmp	r2, #0	; 0x0
    13cc:	da00001e 	ble	144c <USBHandleControlTransfer+0x130>
    13d0:	e59f40f0 	ldr	r4, [pc, #240]	; 14c8 <USBHandleControlTransfer+0x1ac>
    13d4:	e5941000 	ldr	r1, [r4]
    13d8:	ebfffde0 	bl	b60 <USBHwEPRead>
    13dc:	e3500000 	cmp	r0, #0	; 0x0
    13e0:	ba000015 	blt	143c <USBHandleControlTransfer+0x120>
    13e4:	e5962000 	ldr	r2, [r6]
    13e8:	e5943000 	ldr	r3, [r4]
    13ec:	e0602002 	rsb	r2, r0, r2
    13f0:	e0833000 	add	r3, r3, r0
    13f4:	e3520000 	cmp	r2, #0	; 0x0
    13f8:	e5843000 	str	r3, [r4]
    13fc:	e5862000 	str	r2, [r6]
    1400:	1a000029 	bne	14ac <USBHandleControlTransfer+0x190>
    1404:	e59f00ac 	ldr	r0, [pc, #172]	; 14b8 <USBHandleControlTransfer+0x19c>
    1408:	e5d03000 	ldrb	r3, [r0]
    140c:	e59f20ac 	ldr	r2, [pc, #172]	; 14c0 <USBHandleControlTransfer+0x1a4>
    1410:	e1a032a3 	lsr	r3, r3, #5
    1414:	e2033003 	and	r3, r3, #3	; 0x3
    1418:	e7923103 	ldr	r3, [r2, r3, lsl #2]
    141c:	e59f10a0 	ldr	r1, [pc, #160]	; 14c4 <USBHandleControlTransfer+0x1a8>
    1420:	e1a02004 	mov	r2, r4
    1424:	e5843000 	str	r3, [r4]
    1428:	ebffff7e 	bl	1228 <_HandleRequest>
    142c:	e3500000 	cmp	r0, #0	; 0x0
    1430:	1a000012 	bne	1480 <USBHandleControlTransfer+0x164>
    1434:	e59f0094 	ldr	r0, [pc, #148]	; 14d0 <USBHandleControlTransfer+0x1b4>
    1438:	ebfffcba 	bl	728 <puts>
    143c:	e1a00007 	mov	r0, r7
    1440:	e28dd004 	add	sp, sp, #4	; 0x4
    1444:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    1448:	eaffff88 	b	1270 <StallControlPipe>
    144c:	e1a01000 	mov	r1, r0
    1450:	e1a02000 	mov	r2, r0
    1454:	ebfffdc1 	bl	b60 <USBHwEPRead>
    1458:	e59f2074 	ldr	r2, [pc, #116]	; 14d4 <USBHandleControlTransfer+0x1b8>
    145c:	e59f3074 	ldr	r3, [pc, #116]	; 14d8 <USBHandleControlTransfer+0x1bc>
    1460:	e3500000 	cmp	r0, #0	; 0x0
    1464:	d1a00002 	movle	r0, r2
    1468:	c1a00003 	movgt	r0, r3
    146c:	e28dd004 	add	sp, sp, #4	; 0x4
    1470:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    1474:	eafffc75 	b	650 <printf>
    1478:	e3500080 	cmp	r0, #128	; 0x80
    147c:	1a000002 	bne	148c <USBHandleControlTransfer+0x170>
    1480:	e28dd004 	add	sp, sp, #4	; 0x4
    1484:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    1488:	eaffff90 	b	12d0 <DataIn>
    148c:	e3a0c0d4 	mov	ip, #212	; 0xd4
    1490:	e59f0044 	ldr	r0, [pc, #68]	; 14dc <USBHandleControlTransfer+0x1c0>
    1494:	e59f1044 	ldr	r1, [pc, #68]	; 14e0 <USBHandleControlTransfer+0x1c4>
    1498:	e59f2044 	ldr	r2, [pc, #68]	; 14e4 <USBHandleControlTransfer+0x1c8>
    149c:	e59f3044 	ldr	r3, [pc, #68]	; 14e8 <USBHandleControlTransfer+0x1cc>
    14a0:	e58dc000 	str	ip, [sp]
    14a4:	ebfffc69 	bl	650 <printf>
    14a8:	eafffffe 	b	14a8 <USBHandleControlTransfer+0x18c>
    14ac:	e28dd004 	add	sp, sp, #4	; 0x4
    14b0:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
    14b4:	40000284 	.word	0x40000284
    14b8:	40000278 	.word	0x40000278
    14bc:	00001df4 	.word	0x00001df4
    14c0:	40000268 	.word	0x40000268
    14c4:	40000288 	.word	0x40000288
    14c8:	40000280 	.word	0x40000280
    14cc:	00001df8 	.word	0x00001df8
    14d0:	00001e10 	.word	0x00001e10
    14d4:	00001d58 	.word	0x00001d58
    14d8:	00001e28 	.word	0x00001e28
    14dc:	00001d34 	.word	0x00001d34
    14e0:	00001e2c 	.word	0x00001e2c
    14e4:	00001d9c 	.word	0x00001d9c
    14e8:	00001c20 	.word	0x00001c20

000014ec <USBRegisterDescriptors>:
    14ec:	e59f3004 	ldr	r3, [pc, #4]	; 14f8 <USBRegisterDescriptors+0xc>
    14f0:	e5830000 	str	r0, [r3]
    14f4:	e12fff1e 	bx	lr
    14f8:	40000294 	.word	0x40000294

000014fc <USBRegisterCustomReqHandler>:
    14fc:	e59f3004 	ldr	r3, [pc, #4]	; 1508 <USBRegisterCustomReqHandler+0xc>
    1500:	e5830000 	str	r0, [r3]
    1504:	e12fff1e 	bx	lr
    1508:	4000028c 	.word	0x4000028c

0000150c <USBGetDescriptor>:
    150c:	e92d4070 	push	{r4, r5, r6, lr}
    1510:	e59f10ac 	ldr	r1, [pc, #172]	; 15c4 <USBGetDescriptor+0xb8>
    1514:	e5911000 	ldr	r1, [r1]
    1518:	e1a00800 	lsl	r0, r0, #16
    151c:	e3510000 	cmp	r1, #0	; 0x0
    1520:	e1a0c820 	lsr	ip, r0, #16
    1524:	e1a05002 	mov	r5, r2
    1528:	e24dd004 	sub	sp, sp, #4	; 0x4
    152c:	e1a06003 	mov	r6, r3
    1530:	11a00c20 	lsrne	r0, r0, #24
    1534:	120ce0ff 	andne	lr, ip, #255	; 0xff
    1538:	13a02000 	movne	r2, #0	; 0x0
    153c:	1a000017 	bne	15a0 <USBGetDescriptor+0x94>
    1540:	e3a0c06e 	mov	ip, #110	; 0x6e
    1544:	e59f007c 	ldr	r0, [pc, #124]	; 15c8 <USBGetDescriptor+0xbc>
    1548:	e59f107c 	ldr	r1, [pc, #124]	; 15cc <USBGetDescriptor+0xc0>
    154c:	e59f207c 	ldr	r2, [pc, #124]	; 15d0 <USBGetDescriptor+0xc4>
    1550:	e59f307c 	ldr	r3, [pc, #124]	; 15d4 <USBGetDescriptor+0xc8>
    1554:	e58dc000 	str	ip, [sp]
    1558:	ebfffc3c 	bl	650 <printf>
    155c:	eafffffe 	b	155c <USBGetDescriptor+0x50>
    1560:	e5d13001 	ldrb	r3, [r1, #1]
    1564:	e1530000 	cmp	r3, r0
    1568:	1a00000b 	bne	159c <USBGetDescriptor+0x90>
    156c:	e152000e 	cmp	r2, lr
    1570:	1a000008 	bne	1598 <USBGetDescriptor+0x8c>
    1574:	e5861000 	str	r1, [r6]
    1578:	e3500002 	cmp	r0, #2	; 0x2
    157c:	05d13002 	ldrbeq	r3, [r1, #2]
    1580:	05d12003 	ldrbeq	r2, [r1, #3]
    1584:	15d13000 	ldrbne	r3, [r1]
    1588:	01833402 	orreq	r3, r3, r2, lsl #8
    158c:	e3a00001 	mov	r0, #1	; 0x1
    1590:	e5853000 	str	r3, [r5]
    1594:	ea000008 	b	15bc <USBGetDescriptor+0xb0>
    1598:	e2822001 	add	r2, r2, #1	; 0x1
    159c:	e0811004 	add	r1, r1, r4
    15a0:	e5d14000 	ldrb	r4, [r1]
    15a4:	e3540000 	cmp	r4, #0	; 0x0
    15a8:	1affffec 	bne	1560 <USBGetDescriptor+0x54>
    15ac:	e1a0100c 	mov	r1, ip
    15b0:	e59f0020 	ldr	r0, [pc, #32]	; 15d8 <USBGetDescriptor+0xcc>
    15b4:	ebfffc25 	bl	650 <printf>
    15b8:	e1a00004 	mov	r0, r4
    15bc:	e28dd004 	add	sp, sp, #4	; 0x4
    15c0:	e8bd8070 	pop	{r4, r5, r6, pc}
    15c4:	40000294 	.word	0x40000294
    15c8:	00001d34 	.word	0x00001d34
    15cc:	00001e34 	.word	0x00001e34
    15d0:	00001e48 	.word	0x00001e48
    15d4:	00001c50 	.word	0x00001c50
    15d8:	00001e54 	.word	0x00001e54

000015dc <USBHandleStandardRequest>:
    15dc:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    15e0:	e59f32f8 	ldr	r3, [pc, #760]	; 18e0 <USBHandleStandardRequest+0x304>
    15e4:	e5933000 	ldr	r3, [r3]
    15e8:	e3530000 	cmp	r3, #0	; 0x0
    15ec:	e24dd004 	sub	sp, sp, #4	; 0x4
    15f0:	e1a05000 	mov	r5, r0
    15f4:	e1a06001 	mov	r6, r1
    15f8:	e1a04002 	mov	r4, r2
    15fc:	0a000003 	beq	1610 <USBHandleStandardRequest+0x34>
    1600:	e1a0e00f 	mov	lr, pc
    1604:	e12fff13 	bx	r3
    1608:	e3500000 	cmp	r0, #0	; 0x0
    160c:	1a0000a9 	bne	18b8 <USBHandleStandardRequest+0x2dc>
    1610:	e5d53000 	ldrb	r3, [r5]
    1614:	e203301f 	and	r3, r3, #31	; 0x1f
    1618:	e3530001 	cmp	r3, #1	; 0x1
    161c:	0a000059 	beq	1788 <USBHandleStandardRequest+0x1ac>
    1620:	e3530002 	cmp	r3, #2	; 0x2
    1624:	0a00007b 	beq	1818 <USBHandleStandardRequest+0x23c>
    1628:	e3530000 	cmp	r3, #0	; 0x0
    162c:	1a0000a7 	bne	18d0 <USBHandleStandardRequest+0x2f4>
    1630:	e5d51001 	ldrb	r1, [r5, #1]
    1634:	e5940000 	ldr	r0, [r4]
    1638:	e3510009 	cmp	r1, #9	; 0x9
    163c:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1640:	ea00004e 	b	1780 <USBHandleStandardRequest+0x1a4>
    1644:	000017cc 	.word	0x000017cc
    1648:	000018d0 	.word	0x000018d0
    164c:	00001780 	.word	0x00001780
    1650:	000018d0 	.word	0x000018d0
    1654:	00001780 	.word	0x00001780
    1658:	0000166c 	.word	0x0000166c
    165c:	00001678 	.word	0x00001678
    1660:	00001778 	.word	0x00001778
    1664:	000016a0 	.word	0x000016a0
    1668:	000016b8 	.word	0x000016b8
    166c:	e5d50002 	ldrb	r0, [r5, #2]
    1670:	ebfffcf4 	bl	a48 <USBHwSetAddress>
    1674:	ea00008f 	b	18b8 <USBHandleStandardRequest+0x2dc>
    1678:	e1d510b2 	ldrh	r1, [r5, #2]
    167c:	e59f0260 	ldr	r0, [pc, #608]	; 18e4 <USBHandleStandardRequest+0x308>
    1680:	ebfffbf2 	bl	650 <printf>
    1684:	e1d510b4 	ldrh	r1, [r5, #4]
    1688:	e1d500b2 	ldrh	r0, [r5, #2]
    168c:	e1a02006 	mov	r2, r6
    1690:	e1a03004 	mov	r3, r4
    1694:	e28dd004 	add	sp, sp, #4	; 0x4
    1698:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    169c:	eaffff9a 	b	150c <USBGetDescriptor>
    16a0:	e59f3240 	ldr	r3, [pc, #576]	; 18e8 <USBHandleStandardRequest+0x30c>
    16a4:	e5d32000 	ldrb	r2, [r3]
    16a8:	e3a03001 	mov	r3, #1	; 0x1
    16ac:	e1a01003 	mov	r1, r3
    16b0:	e5c02000 	strb	r2, [r0]
    16b4:	ea000072 	b	1884 <USBHandleStandardRequest+0x2a8>
    16b8:	e59f322c 	ldr	r3, [pc, #556]	; 18ec <USBHandleStandardRequest+0x310>
    16bc:	e5933000 	ldr	r3, [r3]
    16c0:	e3530000 	cmp	r3, #0	; 0x0
    16c4:	e1d520b2 	ldrh	r2, [r5, #2]
    16c8:	1a000007 	bne	16ec <USBHandleStandardRequest+0x110>
    16cc:	e3a0c0a5 	mov	ip, #165	; 0xa5
    16d0:	e59f0218 	ldr	r0, [pc, #536]	; 18f0 <USBHandleStandardRequest+0x314>
    16d4:	e59f1218 	ldr	r1, [pc, #536]	; 18f4 <USBHandleStandardRequest+0x318>
    16d8:	e59f2218 	ldr	r2, [pc, #536]	; 18f8 <USBHandleStandardRequest+0x31c>
    16dc:	e59f3218 	ldr	r3, [pc, #536]	; 18fc <USBHandleStandardRequest+0x320>
    16e0:	e58dc000 	str	ip, [sp]
    16e4:	ebfffbd9 	bl	650 <printf>
    16e8:	eafffffe 	b	16e8 <USBHandleStandardRequest+0x10c>
    16ec:	e21270ff 	ands	r7, r2, #255	; 0xff
    16f0:	13a060ff 	movne	r6, #255	; 0xff
    16f4:	01a00007 	moveq	r0, r7
    16f8:	11a04003 	movne	r4, r3
    16fc:	11a08006 	movne	r8, r6
    1700:	1a000012 	bne	1750 <USBHandleStandardRequest+0x174>
    1704:	ea000015 	b	1760 <USBHandleStandardRequest+0x184>
    1708:	e5d43001 	ldrb	r3, [r4, #1]
    170c:	e3530004 	cmp	r3, #4	; 0x4
    1710:	05d46003 	ldrbeq	r6, [r4, #3]
    1714:	0a00000b 	beq	1748 <USBHandleStandardRequest+0x16c>
    1718:	e3530005 	cmp	r3, #5	; 0x5
    171c:	0a000002 	beq	172c <USBHandleStandardRequest+0x150>
    1720:	e3530002 	cmp	r3, #2	; 0x2
    1724:	05d48005 	ldrbeq	r8, [r4, #5]
    1728:	ea000006 	b	1748 <USBHandleStandardRequest+0x16c>
    172c:	e1580007 	cmp	r8, r7
    1730:	03560000 	cmpeq	r6, #0	; 0x0
    1734:	05d43005 	ldrbeq	r3, [r4, #5]
    1738:	05d41004 	ldrbeq	r1, [r4, #4]
    173c:	05d40002 	ldrbeq	r0, [r4, #2]
    1740:	01811403 	orreq	r1, r1, r3, lsl #8
    1744:	0bfffca9 	bleq	9f0 <USBHwEPConfig>
    1748:	e5d43000 	ldrb	r3, [r4]
    174c:	e0844003 	add	r4, r4, r3
    1750:	e5d43000 	ldrb	r3, [r4]
    1754:	e3530000 	cmp	r3, #0	; 0x0
    1758:	1affffea 	bne	1708 <USBHandleStandardRequest+0x12c>
    175c:	e3a00001 	mov	r0, #1	; 0x1
    1760:	ebfffd4e 	bl	ca0 <USBHwConfigDevice>
    1764:	e1d520b2 	ldrh	r2, [r5, #2]
    1768:	e59f3178 	ldr	r3, [pc, #376]	; 18e8 <USBHandleStandardRequest+0x30c>
    176c:	e3a01001 	mov	r1, #1	; 0x1
    1770:	e5c32000 	strb	r2, [r3]
    1774:	ea000056 	b	18d4 <USBHandleStandardRequest+0x2f8>
    1778:	e59f0180 	ldr	r0, [pc, #384]	; 1900 <USBHandleStandardRequest+0x324>
    177c:	ea000052 	b	18cc <USBHandleStandardRequest+0x2f0>
    1780:	e59f017c 	ldr	r0, [pc, #380]	; 1904 <USBHandleStandardRequest+0x328>
    1784:	ea000050 	b	18cc <USBHandleStandardRequest+0x2f0>
    1788:	e5d51001 	ldrb	r1, [r5, #1]
    178c:	e5940000 	ldr	r0, [r4]
    1790:	e351000b 	cmp	r1, #11	; 0xb
    1794:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1798:	ea00001c 	b	1810 <USBHandleStandardRequest+0x234>
    179c:	000017cc 	.word	0x000017cc
    17a0:	000018d0 	.word	0x000018d0
    17a4:	00001810 	.word	0x00001810
    17a8:	000018d0 	.word	0x000018d0
    17ac:	00001810 	.word	0x00001810
    17b0:	00001810 	.word	0x00001810
    17b4:	00001810 	.word	0x00001810
    17b8:	00001810 	.word	0x00001810
    17bc:	00001810 	.word	0x00001810
    17c0:	00001810 	.word	0x00001810
    17c4:	000017e0 	.word	0x000017e0
    17c8:	000017f8 	.word	0x000017f8
    17cc:	e3a03000 	mov	r3, #0	; 0x0
    17d0:	e3a01001 	mov	r1, #1	; 0x1
    17d4:	e5c03001 	strb	r3, [r0, #1]
    17d8:	e5c03000 	strb	r3, [r0]
    17dc:	ea000027 	b	1880 <USBHandleStandardRequest+0x2a4>
    17e0:	e3a02001 	mov	r2, #1	; 0x1
    17e4:	e3a03000 	mov	r3, #0	; 0x0
    17e8:	e1a01002 	mov	r1, r2
    17ec:	e5c03000 	strb	r3, [r0]
    17f0:	e5862000 	str	r2, [r6]
    17f4:	ea000036 	b	18d4 <USBHandleStandardRequest+0x2f8>
    17f8:	e1d500b2 	ldrh	r0, [r5, #2]
    17fc:	e3500000 	cmp	r0, #0	; 0x0
    1800:	03a01001 	moveq	r1, #1	; 0x1
    1804:	05860000 	streq	r0, [r6]
    1808:	0a000031 	beq	18d4 <USBHandleStandardRequest+0x2f8>
    180c:	ea00002f 	b	18d0 <USBHandleStandardRequest+0x2f4>
    1810:	e59f00f0 	ldr	r0, [pc, #240]	; 1908 <USBHandleStandardRequest+0x32c>
    1814:	ea00002c 	b	18cc <USBHandleStandardRequest+0x2f0>
    1818:	e5d51001 	ldrb	r1, [r5, #1]
    181c:	e5944000 	ldr	r4, [r4]
    1820:	e351000c 	cmp	r1, #12	; 0xc
    1824:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1828:	ea000026 	b	18c8 <USBHandleStandardRequest+0x2ec>
    182c:	00001860 	.word	0x00001860
    1830:	0000188c 	.word	0x0000188c
    1834:	000018c8 	.word	0x000018c8
    1838:	000018a0 	.word	0x000018a0
    183c:	000018c8 	.word	0x000018c8
    1840:	000018c8 	.word	0x000018c8
    1844:	000018c8 	.word	0x000018c8
    1848:	000018c8 	.word	0x000018c8
    184c:	000018c8 	.word	0x000018c8
    1850:	000018c8 	.word	0x000018c8
    1854:	000018c8 	.word	0x000018c8
    1858:	000018c8 	.word	0x000018c8
    185c:	000018c0 	.word	0x000018c0
    1860:	e5d50004 	ldrb	r0, [r5, #4]
    1864:	ebfffc8a 	bl	a94 <USBHwEPGetStatus>
    1868:	e1a000a0 	lsr	r0, r0, #1
    186c:	e2000001 	and	r0, r0, #1	; 0x1
    1870:	e3a03000 	mov	r3, #0	; 0x0
    1874:	e5c43001 	strb	r3, [r4, #1]
    1878:	e5c40000 	strb	r0, [r4]
    187c:	e3a01001 	mov	r1, #1	; 0x1
    1880:	e2833002 	add	r3, r3, #2	; 0x2
    1884:	e5863000 	str	r3, [r6]
    1888:	ea000011 	b	18d4 <USBHandleStandardRequest+0x2f8>
    188c:	e1d510b2 	ldrh	r1, [r5, #2]
    1890:	e3510000 	cmp	r1, #0	; 0x0
    1894:	05d50004 	ldrbeq	r0, [r5, #4]
    1898:	0a000005 	beq	18b4 <USBHandleStandardRequest+0x2d8>
    189c:	ea00000b 	b	18d0 <USBHandleStandardRequest+0x2f4>
    18a0:	e1d530b2 	ldrh	r3, [r5, #2]
    18a4:	e3530000 	cmp	r3, #0	; 0x0
    18a8:	1a000008 	bne	18d0 <USBHandleStandardRequest+0x2f4>
    18ac:	e5d50004 	ldrb	r0, [r5, #4]
    18b0:	e3a01001 	mov	r1, #1	; 0x1
    18b4:	ebfffc7e 	bl	ab4 <USBHwEPStall>
    18b8:	e3a01001 	mov	r1, #1	; 0x1
    18bc:	ea000004 	b	18d4 <USBHandleStandardRequest+0x2f8>
    18c0:	e59f0044 	ldr	r0, [pc, #68]	; 190c <USBHandleStandardRequest+0x330>
    18c4:	ea000000 	b	18cc <USBHandleStandardRequest+0x2f0>
    18c8:	e59f0040 	ldr	r0, [pc, #64]	; 1910 <USBHandleStandardRequest+0x334>
    18cc:	ebfffb5f 	bl	650 <printf>
    18d0:	e3a01000 	mov	r1, #0	; 0x0
    18d4:	e1a00001 	mov	r0, r1
    18d8:	e28dd004 	add	sp, sp, #4	; 0x4
    18dc:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    18e0:	4000028c 	.word	0x4000028c
    18e4:	00001e68 	.word	0x00001e68
    18e8:	40000290 	.word	0x40000290
    18ec:	40000294 	.word	0x40000294
    18f0:	00001d34 	.word	0x00001d34
    18f4:	00001e34 	.word	0x00001e34
    18f8:	00001e48 	.word	0x00001e48
    18fc:	00001c3c 	.word	0x00001c3c
    1900:	00001e6c 	.word	0x00001e6c
    1904:	00001e8c 	.word	0x00001e8c
    1908:	00001ea4 	.word	0x00001ea4
    190c:	00001ec0 	.word	0x00001ec0
    1910:	00001edc 	.word	0x00001edc

00001914 <USBInit>:
    1914:	e92d4010 	push	{r4, lr}
    1918:	e59f4050 	ldr	r4, [pc, #80]	; 1970 <USBInit+0x5c>
    191c:	ebfffd3b 	bl	e10 <USBHwInit>
    1920:	e59f004c 	ldr	r0, [pc, #76]	; 1974 <USBInit+0x60>
    1924:	ebfffde9 	bl	10d0 <USBHwRegisterDevIntHandler>
    1928:	e1a01004 	mov	r1, r4
    192c:	e3a00000 	mov	r0, #0	; 0x0
    1930:	ebfffdf1 	bl	10fc <USBHwRegisterEPIntHandler>
    1934:	e1a01004 	mov	r1, r4
    1938:	e3a00080 	mov	r0, #128	; 0x80
    193c:	ebfffdee 	bl	10fc <USBHwRegisterEPIntHandler>
    1940:	e3a00000 	mov	r0, #0	; 0x0
    1944:	e3a01040 	mov	r1, #64	; 0x40
    1948:	ebfffc28 	bl	9f0 <USBHwEPConfig>
    194c:	e3a00080 	mov	r0, #128	; 0x80
    1950:	e3a01040 	mov	r1, #64	; 0x40
    1954:	ebfffc25 	bl	9f0 <USBHwEPConfig>
    1958:	e3a00000 	mov	r0, #0	; 0x0
    195c:	e59f1014 	ldr	r1, [pc, #20]	; 1978 <USBInit+0x64>
    1960:	e59f2014 	ldr	r2, [pc, #20]	; 197c <USBInit+0x68>
    1964:	ebfffe0c 	bl	119c <USBRegisterRequestHandler>
    1968:	e3a00001 	mov	r0, #1	; 0x1
    196c:	e8bd8010 	pop	{r4, pc}
    1970:	0000131c 	.word	0x0000131c
    1974:	00001980 	.word	0x00001980
    1978:	000015dc 	.word	0x000015dc
    197c:	40000298 	.word	0x40000298

00001980 <HandleUsbReset>:
    1980:	e3100010 	tst	r0, #16	; 0x10
    1984:	012fff1e 	bxeq	lr
    1988:	e59f0000 	ldr	r0, [pc, #0]	; 1990 <HandleUsbReset+0x10>
    198c:	eafffb2f 	b	650 <printf>
    1990:	00001ef0 	.word	0x00001ef0

00001994 <__aeabi_uidiv>:
    1994:	e2512001 	subs	r2, r1, #1	; 0x1
    1998:	012fff1e 	bxeq	lr
    199c:	3a000036 	bcc	1a7c <__aeabi_uidiv+0xe8>
    19a0:	e1500001 	cmp	r0, r1
    19a4:	9a000022 	bls	1a34 <__aeabi_uidiv+0xa0>
    19a8:	e1110002 	tst	r1, r2
    19ac:	0a000023 	beq	1a40 <__aeabi_uidiv+0xac>
    19b0:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    19b4:	01a01181 	lsleq	r1, r1, #3
    19b8:	03a03008 	moveq	r3, #8	; 0x8
    19bc:	13a03001 	movne	r3, #1	; 0x1
    19c0:	e3510201 	cmp	r1, #268435456	; 0x10000000
    19c4:	31510000 	cmpcc	r1, r0
    19c8:	31a01201 	lslcc	r1, r1, #4
    19cc:	31a03203 	lslcc	r3, r3, #4
    19d0:	3afffffa 	bcc	19c0 <__aeabi_uidiv+0x2c>
    19d4:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    19d8:	31510000 	cmpcc	r1, r0
    19dc:	31a01081 	lslcc	r1, r1, #1
    19e0:	31a03083 	lslcc	r3, r3, #1
    19e4:	3afffffa 	bcc	19d4 <__aeabi_uidiv+0x40>
    19e8:	e3a02000 	mov	r2, #0	; 0x0
    19ec:	e1500001 	cmp	r0, r1
    19f0:	20400001 	subcs	r0, r0, r1
    19f4:	21822003 	orrcs	r2, r2, r3
    19f8:	e15000a1 	cmp	r0, r1, lsr #1
    19fc:	204000a1 	subcs	r0, r0, r1, lsr #1
    1a00:	218220a3 	orrcs	r2, r2, r3, lsr #1
    1a04:	e1500121 	cmp	r0, r1, lsr #2
    1a08:	20400121 	subcs	r0, r0, r1, lsr #2
    1a0c:	21822123 	orrcs	r2, r2, r3, lsr #2
    1a10:	e15001a1 	cmp	r0, r1, lsr #3
    1a14:	204001a1 	subcs	r0, r0, r1, lsr #3
    1a18:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1a1c:	e3500000 	cmp	r0, #0	; 0x0
    1a20:	11b03223 	lsrsne	r3, r3, #4
    1a24:	11a01221 	lsrne	r1, r1, #4
    1a28:	1affffef 	bne	19ec <__aeabi_uidiv+0x58>
    1a2c:	e1a00002 	mov	r0, r2
    1a30:	e12fff1e 	bx	lr
    1a34:	03a00001 	moveq	r0, #1	; 0x1
    1a38:	13a00000 	movne	r0, #0	; 0x0
    1a3c:	e12fff1e 	bx	lr
    1a40:	e3510801 	cmp	r1, #65536	; 0x10000
    1a44:	21a01821 	lsrcs	r1, r1, #16
    1a48:	23a02010 	movcs	r2, #16	; 0x10
    1a4c:	33a02000 	movcc	r2, #0	; 0x0
    1a50:	e3510c01 	cmp	r1, #256	; 0x100
    1a54:	21a01421 	lsrcs	r1, r1, #8
    1a58:	22822008 	addcs	r2, r2, #8	; 0x8
    1a5c:	e3510010 	cmp	r1, #16	; 0x10
    1a60:	21a01221 	lsrcs	r1, r1, #4
    1a64:	22822004 	addcs	r2, r2, #4	; 0x4
    1a68:	e3510004 	cmp	r1, #4	; 0x4
    1a6c:	82822003 	addhi	r2, r2, #3	; 0x3
    1a70:	908220a1 	addls	r2, r2, r1, lsr #1
    1a74:	e1a00230 	lsr	r0, r0, r2
    1a78:	e12fff1e 	bx	lr
    1a7c:	e52de008 	str	lr, [sp, #-8]!
    1a80:	eb00003a 	bl	1b70 <__aeabi_idiv0>
    1a84:	e3a00000 	mov	r0, #0	; 0x0
    1a88:	e49df008 	ldr	pc, [sp], #8

00001a8c <__aeabi_uidivmod>:
    1a8c:	e92d4003 	push	{r0, r1, lr}
    1a90:	ebffffbf 	bl	1994 <__aeabi_uidiv>
    1a94:	e8bd4006 	pop	{r1, r2, lr}
    1a98:	e0030092 	mul	r3, r2, r0
    1a9c:	e0411003 	sub	r1, r1, r3
    1aa0:	e12fff1e 	bx	lr

00001aa4 <__umodsi3>:
    1aa4:	e2512001 	subs	r2, r1, #1	; 0x1
    1aa8:	3a00002c 	bcc	1b60 <__umodsi3+0xbc>
    1aac:	11500001 	cmpne	r0, r1
    1ab0:	03a00000 	moveq	r0, #0	; 0x0
    1ab4:	81110002 	tsthi	r1, r2
    1ab8:	00000002 	andeq	r0, r0, r2
    1abc:	912fff1e 	bxls	lr
    1ac0:	e3a02000 	mov	r2, #0	; 0x0
    1ac4:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1ac8:	31510000 	cmpcc	r1, r0
    1acc:	31a01201 	lslcc	r1, r1, #4
    1ad0:	32822004 	addcc	r2, r2, #4	; 0x4
    1ad4:	3afffffa 	bcc	1ac4 <__umodsi3+0x20>
    1ad8:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1adc:	31510000 	cmpcc	r1, r0
    1ae0:	31a01081 	lslcc	r1, r1, #1
    1ae4:	32822001 	addcc	r2, r2, #1	; 0x1
    1ae8:	3afffffa 	bcc	1ad8 <__umodsi3+0x34>
    1aec:	e2522003 	subs	r2, r2, #3	; 0x3
    1af0:	ba00000e 	blt	1b30 <__umodsi3+0x8c>
    1af4:	e1500001 	cmp	r0, r1
    1af8:	20400001 	subcs	r0, r0, r1
    1afc:	e15000a1 	cmp	r0, r1, lsr #1
    1b00:	204000a1 	subcs	r0, r0, r1, lsr #1
    1b04:	e1500121 	cmp	r0, r1, lsr #2
    1b08:	20400121 	subcs	r0, r0, r1, lsr #2
    1b0c:	e15001a1 	cmp	r0, r1, lsr #3
    1b10:	204001a1 	subcs	r0, r0, r1, lsr #3
    1b14:	e3500001 	cmp	r0, #1	; 0x1
    1b18:	e1a01221 	lsr	r1, r1, #4
    1b1c:	a2522004 	subsge	r2, r2, #4	; 0x4
    1b20:	aafffff3 	bge	1af4 <__umodsi3+0x50>
    1b24:	e3120003 	tst	r2, #3	; 0x3
    1b28:	13300000 	teqne	r0, #0	; 0x0
    1b2c:	0a00000a 	beq	1b5c <__umodsi3+0xb8>
    1b30:	e3720002 	cmn	r2, #2	; 0x2
    1b34:	ba000006 	blt	1b54 <__umodsi3+0xb0>
    1b38:	0a000002 	beq	1b48 <__umodsi3+0xa4>
    1b3c:	e1500001 	cmp	r0, r1
    1b40:	20400001 	subcs	r0, r0, r1
    1b44:	e1a010a1 	lsr	r1, r1, #1
    1b48:	e1500001 	cmp	r0, r1
    1b4c:	20400001 	subcs	r0, r0, r1
    1b50:	e1a010a1 	lsr	r1, r1, #1
    1b54:	e1500001 	cmp	r0, r1
    1b58:	20400001 	subcs	r0, r0, r1
    1b5c:	e12fff1e 	bx	lr
    1b60:	e52de008 	str	lr, [sp, #-8]!
    1b64:	eb000001 	bl	1b70 <__aeabi_idiv0>
    1b68:	e3a00000 	mov	r0, #0	; 0x0
    1b6c:	e49df008 	ldr	pc, [sp], #8

00001b70 <__aeabi_idiv0>:
    1b70:	e12fff1e 	bx	lr

00001b74 <abDescriptors>:
    1b74:	02000112 400000ff 0004ffff 02010100     .......@........
    1b84:	02090103 01010020 09328000 02000004     .... .....2.....
    1b94:	000000ff 02820507 07000040 40020505     ........@......@
    1ba4:	03040000 030e0409 0050004c 00550043     ........L.P.C.U.
    1bb4:	00420053 004d031a 006d0065 0072006f     S.B...M.e.m.o.r.
    1bc4:	00410079 00630063 00730065 03120073     y.A.c.c.e.s.s...
    1bd4:	00450044 00440041 00300043 00450044     D.E.A.D.C.0.D.E.
    1be4:	00000000                                ....

00001be8 <__FUNCTION__.1675>:
    1be8:	48425355 67655277 65747369 49504572     USBHwRegisterEPI
    1bf8:	6148746e 656c646e 00000072              ntHandler...

00001c04 <__FUNCTION__.1666>:
    1c04:	52425355 73696765 52726574 65757165     USBRegisterReque
    1c14:	61487473 656c646e 00000072              stHandler...

00001c20 <__FUNCTION__.1628>:
    1c20:	48425355 6c646e61 6e6f4365 6c6f7274     USBHandleControl
    1c30:	6e617254 72656673 00000000              Transfer....

00001c3c <__FUNCTION__.1642>:
    1c3c:	53425355 6f437465 6769666e 74617275     USBSetConfigurat
    1c4c:	006e6f69                                ion.

00001c50 <__FUNCTION__.1609>:
    1c50:	47425355 65447465 69726373 726f7470     USBGetDescriptor
    1c60:	00000000 6c756e28 0000296c 74696e49     ....(null)..Init
    1c70:	696c6169 676e6973 42535520 61747320     ialising USB sta
    1c80:	00006b63 72617453 676e6974 42535520     ck..Starting USB
    1c90:	6d6f6320 696e756d 69746163 00006e6f      communication..
    1ca0:	656e6f64 00000000 44414552 6461203a     done....READ: ad
    1cb0:	253d7264 6c202c58 253d6e65 00000a64     dr=%X, len=%d...
    1cc0:	54495257 61203a45 3d726464 202c5825     WRITE: addr=%X, 
    1cd0:	3d6e656c 000a6425 61686e55 656c646e     len=%d..Unhandle
    1ce0:	6c632064 20737361 000a5825 69676552     d class %X..Regi
    1cf0:	72657473 68206465 6c646e61 66207265     stered handler f
    1d00:	6620726f 656d6172 00000000 69676552     or frame....Regi
    1d10:	72657473 68206465 6c646e61 66207265     stered handler f
    1d20:	6420726f 63697665 74732065 73757461     or device status
    1d30:	00000000 7373410a 69747265 27206e6f     .....Assertion '
    1d40:	20277325 6c696166 69206465 7325206e     %s' failed in %s
    1d50:	2373253a 0a216425 00000000 3c786469     :%s#%d!.....idx<
    1d60:	00003233 68627375 706c5f77 00632e63     32..usbhw_lpc.c.
    1d70:	69676552 72657473 68206465 6c646e61     Registered handl
    1d80:	66207265 4520726f 78302050 000a7825     er for EP 0x%x..
    1d90:	70795469 3d3e2065 00003020 63627375     iType >= 0..usbc
    1da0:	72746e6f 632e6c6f 00000000 70795469     ontrol.c....iTyp
    1db0:	203c2065 00000034 68206f4e 6c646e61     e < 4...No handl
    1dc0:	66207265 7220726f 79747165 25206570     er for reqtype %
    1dd0:	00000a64 4c415453 6e6f204c 00005b20     d...STALL on [..
    1de0:	32302520 00000078 7473205d 253d7461      %02x...] stat=%
    1df0:	00000a78 00782553 6e61485f 52656c64     x...S%x._HandleR
    1e00:	65757165 20317473 6c696166 00006465     equest1 failed..
    1e10:	6e61485f 52656c64 65757165 20327473     _HandleRequest2 
    1e20:	6c696166 00006465 0000003f 534c4146     failed..?...FALS
    1e30:	00000045 44626170 72637365 21207069     E...pabDescrip !
    1e40:	554e203d 00004c4c 73627375 65726474     = NULL..usbstdre
    1e50:	00632e71 63736544 20782520 20746f6e     q.c.Desc %x not 
    1e60:	6e756f66 000a2164 00782544 69766544     found!..D%x.Devi
    1e70:	72206563 25207165 6f6e2064 6d692074     ce req %d not im
    1e80:	6d656c70 65746e65 00000a64 656c6c49     plemented...Ille
    1e90:	206c6167 69766564 72206563 25207165     gal device req %
    1ea0:	00000a64 656c6c49 206c6167 65746e69     d...Illegal inte
    1eb0:	63616672 65722065 64252071 0000000a     rface req %d....
    1ec0:	72205045 25207165 6f6e2064 6d692074     EP req %d not im
    1ed0:	6d656c70 65746e65 00000a64 656c6c49     plemented...Ille
    1ee0:	206c6167 72205045 25207165 00000a64     gal EP req %d...
    1ef0:	0000210a                                .!..
