
hello_linux.gdb:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start-0x4>:
       0:	0000                	.2byte	0x0
	...

00000004 <_start>:
       4:	02c000ef          	jal	30 <.Lload_gp>
       8:	00050793          	mv	a5,a0
       c:	00007517          	auipc	a0,0x7
      10:	ff450513          	add	a0,a0,-12 # 7000 <main>
      14:	00012583          	lw	a1,0(sp)
      18:	00410613          	add	a2,sp,4
      1c:	ff017113          	and	sp,sp,-16
      20:	00000693          	li	a3,0
      24:	00000713          	li	a4,0
      28:	00010813          	mv	a6,sp
      2c:	1c90106f          	j	19f4 <__uClibc_main>

00000030 <.Lload_gp>:
      30:	00008197          	auipc	gp,0x8
      34:	8b018193          	add	gp,gp,-1872 # 78e0 <__global_pointer$>
      38:	00008067          	ret

0000003c <deregister_tm_clones>:
      3c:	00008517          	auipc	a0,0x8
      40:	3ec50513          	add	a0,a0,1004 # 8428 <__TMC_END__>
      44:	00008797          	auipc	a5,0x8
      48:	3e478793          	add	a5,a5,996 # 8428 <__TMC_END__>
      4c:	00a78a63          	beq	a5,a0,60 <.L1>
      50:	00007797          	auipc	a5,0x7
      54:	0447a783          	lw	a5,68(a5) # 7094 <_GLOBAL_OFFSET_TABLE_+0x2c>
      58:	00078463          	beqz	a5,60 <.L1>
      5c:	00078067          	jr	a5

00000060 <.L1>:
      60:	00008067          	ret

00000064 <register_tm_clones>:
      64:	00008517          	auipc	a0,0x8
      68:	3c450513          	add	a0,a0,964 # 8428 <__TMC_END__>
      6c:	00008597          	auipc	a1,0x8
      70:	3bc58593          	add	a1,a1,956 # 8428 <__TMC_END__>
      74:	40a585b3          	sub	a1,a1,a0
      78:	4025d593          	sra	a1,a1,0x2
      7c:	00200793          	li	a5,2
      80:	02f5c5b3          	div	a1,a1,a5
      84:	00058a63          	beqz	a1,98 <.L6>
      88:	00007797          	auipc	a5,0x7
      8c:	0007a783          	lw	a5,0(a5) # 7088 <_GLOBAL_OFFSET_TABLE_+0x20>
      90:	00078463          	beqz	a5,98 <.L6>
      94:	00078067          	jr	a5

00000098 <.L6>:
      98:	00008067          	ret

0000009c <__do_global_dtors_aux>:
      9c:	ff010113          	add	sp,sp,-16
      a0:	00812423          	sw	s0,8(sp)
      a4:	00009417          	auipc	s0,0x9
      a8:	d0840413          	add	s0,s0,-760 # 8dac <completed.1>
      ac:	00044783          	lbu	a5,0(s0)
      b0:	00112623          	sw	ra,12(sp)
      b4:	02079463          	bnez	a5,dc <.L14>
      b8:	f85ff0ef          	jal	3c <deregister_tm_clones>
      bc:	00007797          	auipc	a5,0x7
      c0:	fc87a783          	lw	a5,-56(a5) # 7084 <_GLOBAL_OFFSET_TABLE_+0x1c>
      c4:	00078863          	beqz	a5,d4 <.L16>
      c8:	00008517          	auipc	a0,0x8
      cc:	36050513          	add	a0,a0,864 # 8428 <__TMC_END__>
      d0:	000780e7          	jalr	a5

000000d4 <.L16>:
      d4:	00100793          	li	a5,1
      d8:	00f40023          	sb	a5,0(s0)

000000dc <.L14>:
      dc:	00c12083          	lw	ra,12(sp)
      e0:	00812403          	lw	s0,8(sp)
      e4:	01010113          	add	sp,sp,16
      e8:	00008067          	ret

000000ec <frame_dummy>:
      ec:	00007797          	auipc	a5,0x7
      f0:	fc47a783          	lw	a5,-60(a5) # 70b0 <_GLOBAL_OFFSET_TABLE_+0x48>
      f4:	02078463          	beqz	a5,11c <.L27>
      f8:	ff010113          	add	sp,sp,-16
      fc:	00112623          	sw	ra,12(sp)
     100:	00009597          	auipc	a1,0x9
     104:	cb058593          	add	a1,a1,-848 # 8db0 <object.0>
     108:	00008517          	auipc	a0,0x8
     10c:	32050513          	add	a0,a0,800 # 8428 <__TMC_END__>
     110:	000780e7          	jalr	a5
     114:	00c12083          	lw	ra,12(sp)
     118:	01010113          	add	sp,sp,16

0000011c <.L27>:
     11c:	f49ff06f          	j	64 <register_tm_clones>

00000120 <__GI_printf>:
     120:	fc010113          	add	sp,sp,-64
     124:	02b12223          	sw	a1,36(sp)
     128:	02c12423          	sw	a2,40(sp)
     12c:	02f12a23          	sw	a5,52(sp)
     130:	02d12623          	sw	a3,44(sp)
     134:	02e12823          	sw	a4,48(sp)
     138:	03012c23          	sw	a6,56(sp)
     13c:	03112e23          	sw	a7,60(sp)
     140:	00007797          	auipc	a5,0x7
     144:	f2c7a783          	lw	a5,-212(a5) # 706c <_GLOBAL_OFFSET_TABLE_+0x4>
     148:	00050593          	mv	a1,a0
     14c:	0007a503          	lw	a0,0(a5)
     150:	02410613          	add	a2,sp,36
     154:	00112e23          	sw	ra,28(sp)
     158:	00c12623          	sw	a2,12(sp)
     15c:	134000ef          	jal	290 <__GI_vfprintf>
     160:	01c12083          	lw	ra,28(sp)
     164:	04010113          	add	sp,sp,64
     168:	00008067          	ret

0000016c <_stdio_term>:
     16c:	ff010113          	add	sp,sp,-16
     170:	00007797          	auipc	a5,0x7
     174:	f107a783          	lw	a5,-240(a5) # 7080 <_GLOBAL_OFFSET_TABLE_+0x18>
     178:	00812423          	sw	s0,8(sp)
     17c:	0007a403          	lw	s0,0(a5)
     180:	00912223          	sw	s1,4(sp)
     184:	00112623          	sw	ra,12(sp)
     188:	ffe00493          	li	s1,-2

0000018c <.L2>:
     18c:	00041c63          	bnez	s0,1a4 <.L5>
     190:	00c12083          	lw	ra,12(sp)
     194:	00812403          	lw	s0,8(sp)
     198:	00412483          	lw	s1,4(sp)
     19c:	01010113          	add	sp,sp,16
     1a0:	00008067          	ret

000001a4 <.L5>:
     1a4:	00045783          	lhu	a5,0(s0)
     1a8:	0407f793          	and	a5,a5,64
     1ac:	00078663          	beqz	a5,1b8 <.L3>
     1b0:	00040513          	mv	a0,s0
     1b4:	098000ef          	jal	24c <__stdio_wcommit>

000001b8 <.L3>:
     1b8:	00442783          	lw	a5,4(s0)
     1bc:	00979a63          	bne	a5,s1,1d0 <.L4>
     1c0:	03442783          	lw	a5,52(s0)
     1c4:	00078663          	beqz	a5,1d0 <.L4>
     1c8:	02442503          	lw	a0,36(s0)
     1cc:	000780e7          	jalr	a5

000001d0 <.L4>:
     1d0:	02042403          	lw	s0,32(s0)
     1d4:	fb9ff06f          	j	18c <.L2>

000001d8 <_stdio_init>:
     1d8:	ff010113          	add	sp,sp,-16
     1dc:	00812423          	sw	s0,8(sp)
     1e0:	00000513          	li	a0,0
     1e4:	00007417          	auipc	s0,0x7
     1e8:	e9042403          	lw	s0,-368(s0) # 7074 <_GLOBAL_OFFSET_TABLE_+0xc>
     1ec:	00912223          	sw	s1,4(sp)
     1f0:	00112623          	sw	ra,12(sp)
     1f4:	00042483          	lw	s1,0(s0)
     1f8:	688010ef          	jal	1880 <__GI_isatty>
     1fc:	00051c63          	bnez	a0,214 <.L14>
     200:	00008717          	auipc	a4,0x8
     204:	18070713          	add	a4,a4,384 # 8380 <_stdio_streams>
     208:	00075783          	lhu	a5,0(a4)
     20c:	1007c793          	xor	a5,a5,256
     210:	00f71023          	sh	a5,0(a4)

00000214 <.L14>:
     214:	00100513          	li	a0,1
     218:	668010ef          	jal	1880 <__GI_isatty>
     21c:	00051c63          	bnez	a0,234 <.L15>
     220:	00008717          	auipc	a4,0x8
     224:	16070713          	add	a4,a4,352 # 8380 <_stdio_streams>
     228:	02475783          	lhu	a5,36(a4)
     22c:	1007c793          	xor	a5,a5,256
     230:	02f71223          	sh	a5,36(a4)

00000234 <.L15>:
     234:	00942023          	sw	s1,0(s0)
     238:	00c12083          	lw	ra,12(sp)
     23c:	00812403          	lw	s0,8(sp)
     240:	00412483          	lw	s1,4(sp)
     244:	01010113          	add	sp,sp,16
     248:	00008067          	ret

0000024c <__stdio_wcommit>:
     24c:	00852583          	lw	a1,8(a0)
     250:	01052783          	lw	a5,16(a0)
     254:	ff010113          	add	sp,sp,-16
     258:	00812423          	sw	s0,8(sp)
     25c:	00112623          	sw	ra,12(sp)
     260:	00050413          	mv	s0,a0
     264:	40b78633          	sub	a2,a5,a1
     268:	00b78663          	beq	a5,a1,274 <.L2>
     26c:	00b52823          	sw	a1,16(a0)
     270:	209010ef          	jal	1c78 <__stdio_WRITE>

00000274 <.L2>:
     274:	01042503          	lw	a0,16(s0)
     278:	00842783          	lw	a5,8(s0)
     27c:	00c12083          	lw	ra,12(sp)
     280:	00812403          	lw	s0,8(sp)
     284:	40f50533          	sub	a0,a0,a5
     288:	01010113          	add	sp,sp,16
     28c:	00008067          	ret

00000290 <__GI_vfprintf>:
     290:	00055783          	lhu	a5,0(a0)
     294:	fe010113          	add	sp,sp,-32
     298:	00812c23          	sw	s0,24(sp)
     29c:	00112e23          	sw	ra,28(sp)
     2a0:	0407f793          	and	a5,a5,64
     2a4:	00050413          	mv	s0,a0
     2a8:	00078c63          	beqz	a5,2c0 <.L2>

000002ac <.L3>:
     2ac:	00040513          	mv	a0,s0
     2b0:	01812403          	lw	s0,24(sp)
     2b4:	01c12083          	lw	ra,28(sp)
     2b8:	02010113          	add	sp,sp,32
     2bc:	1580006f          	j	414 <_vfprintf_internal>

000002c0 <.L2>:
     2c0:	00c12623          	sw	a2,12(sp)
     2c4:	00b12423          	sw	a1,8(sp)
     2c8:	469010ef          	jal	1f30 <__stdio_trans2w>
     2cc:	00812583          	lw	a1,8(sp)
     2d0:	00c12603          	lw	a2,12(sp)
     2d4:	fc050ce3          	beqz	a0,2ac <.L3>
     2d8:	01c12083          	lw	ra,28(sp)
     2dc:	01812403          	lw	s0,24(sp)
     2e0:	fff00513          	li	a0,-1
     2e4:	02010113          	add	sp,sp,32
     2e8:	00008067          	ret

000002ec <_charpad>:
     2ec:	fd010113          	add	sp,sp,-48
     2f0:	02812423          	sw	s0,40(sp)
     2f4:	02912223          	sw	s1,36(sp)
     2f8:	03212023          	sw	s2,32(sp)
     2fc:	01312e23          	sw	s3,28(sp)
     300:	02112623          	sw	ra,44(sp)
     304:	00050913          	mv	s2,a0
     308:	00060413          	mv	s0,a2
     30c:	00b10623          	sb	a1,12(sp)
     310:	00060493          	mv	s1,a2
     314:	00c10993          	add	s3,sp,12

00000318 <.L2>:
     318:	00048e63          	beqz	s1,334 <.L5>
     31c:	00090613          	mv	a2,s2
     320:	00100593          	li	a1,1
     324:	00098513          	mv	a0,s3
     328:	2b9010ef          	jal	1de0 <__stdio_fwrite>
     32c:	00100793          	li	a5,1
     330:	02f50263          	beq	a0,a5,354 <.L4>

00000334 <.L5>:
     334:	40940533          	sub	a0,s0,s1
     338:	02c12083          	lw	ra,44(sp)
     33c:	02812403          	lw	s0,40(sp)
     340:	02412483          	lw	s1,36(sp)
     344:	02012903          	lw	s2,32(sp)
     348:	01c12983          	lw	s3,28(sp)
     34c:	03010113          	add	sp,sp,48
     350:	00008067          	ret

00000354 <.L4>:
     354:	fff48493          	add	s1,s1,-1
     358:	fc1ff06f          	j	318 <.L2>

0000035c <_fp_out_narrow>:
     35c:	fe010113          	add	sp,sp,-32
     360:	00912a23          	sw	s1,20(sp)
     364:	01312623          	sw	s3,12(sp)
     368:	01412423          	sw	s4,8(sp)
     36c:	00112e23          	sw	ra,28(sp)
     370:	00812c23          	sw	s0,24(sp)
     374:	01212823          	sw	s2,16(sp)
     378:	01512223          	sw	s5,4(sp)
     37c:	0805f793          	and	a5,a1,128
     380:	00050a13          	mv	s4,a0
     384:	00060493          	mv	s1,a2
     388:	00068993          	mv	s3,a3
     38c:	06078e63          	beqz	a5,408 <.L12>
     390:	00068513          	mv	a0,a3
     394:	00058a93          	mv	s5,a1
     398:	26c010ef          	jal	1604 <__GI_strlen>
     39c:	40a484b3          	sub	s1,s1,a0
     3a0:	00050913          	mv	s2,a0
     3a4:	00000413          	li	s0,0
     3a8:	00905e63          	blez	s1,3c4 <.L9>
     3ac:	00048613          	mv	a2,s1
     3b0:	07faf593          	and	a1,s5,127
     3b4:	000a0513          	mv	a0,s4
     3b8:	f35ff0ef          	jal	2ec <_charpad>
     3bc:	00050413          	mv	s0,a0
     3c0:	02a49063          	bne	s1,a0,3e0 <.L8>

000003c4 <.L9>:
     3c4:	00000513          	li	a0,0
     3c8:	01205a63          	blez	s2,3dc <.L11>
     3cc:	000a0613          	mv	a2,s4
     3d0:	00090593          	mv	a1,s2
     3d4:	00098513          	mv	a0,s3
     3d8:	209010ef          	jal	1de0 <__stdio_fwrite>

000003dc <.L11>:
     3dc:	00a40433          	add	s0,s0,a0

000003e0 <.L8>:
     3e0:	01c12083          	lw	ra,28(sp)
     3e4:	00040513          	mv	a0,s0
     3e8:	01812403          	lw	s0,24(sp)
     3ec:	01412483          	lw	s1,20(sp)
     3f0:	01012903          	lw	s2,16(sp)
     3f4:	00c12983          	lw	s3,12(sp)
     3f8:	00812a03          	lw	s4,8(sp)
     3fc:	00412a83          	lw	s5,4(sp)
     400:	02010113          	add	sp,sp,32
     404:	00008067          	ret

00000408 <.L12>:
     408:	00060913          	mv	s2,a2
     40c:	00000413          	li	s0,0
     410:	fb5ff06f          	j	3c4 <.L9>

00000414 <_vfprintf_internal>:
     414:	e2010113          	add	sp,sp,-480
     418:	1d412423          	sw	s4,456(sp)
     41c:	0c010a13          	add	s4,sp,192
     420:	00a12223          	sw	a0,4(sp)
     424:	000a0513          	mv	a0,s4
     428:	1c812c23          	sw	s0,472(sp)
     42c:	1c912a23          	sw	s1,468(sp)
     430:	1c112e23          	sw	ra,476(sp)
     434:	1d212823          	sw	s2,464(sp)
     438:	1d312623          	sw	s3,460(sp)
     43c:	1d512223          	sw	s5,452(sp)
     440:	1d612023          	sw	s6,448(sp)
     444:	1b712e23          	sw	s7,444(sp)
     448:	1b812c23          	sw	s8,440(sp)
     44c:	1b912a23          	sw	s9,436(sp)
     450:	1ba12823          	sw	s10,432(sp)
     454:	1bb12623          	sw	s11,428(sp)
     458:	00058413          	mv	s0,a1
     45c:	00060493          	mv	s1,a2
     460:	5b0000ef          	jal	a10 <_ppfs_init>
     464:	06055663          	bgez	a0,4d0 <.L17>
     468:	0c012403          	lw	s0,192(sp)
     46c:	00040513          	mv	a0,s0
     470:	194010ef          	jal	1604 <__GI_strlen>
     474:	00050593          	mv	a1,a0
     478:	04051463          	bnez	a0,4c0 <.L18>

0000047c <.L60>:
     47c:	fff00493          	li	s1,-1

00000480 <.L16>:
     480:	1dc12083          	lw	ra,476(sp)
     484:	1d812403          	lw	s0,472(sp)
     488:	1d012903          	lw	s2,464(sp)
     48c:	1cc12983          	lw	s3,460(sp)
     490:	1c812a03          	lw	s4,456(sp)
     494:	1c412a83          	lw	s5,452(sp)
     498:	1c012b03          	lw	s6,448(sp)
     49c:	1bc12b83          	lw	s7,444(sp)
     4a0:	1b812c03          	lw	s8,440(sp)
     4a4:	1b412c83          	lw	s9,436(sp)
     4a8:	1b012d03          	lw	s10,432(sp)
     4ac:	1ac12d83          	lw	s11,428(sp)
     4b0:	00048513          	mv	a0,s1
     4b4:	1d412483          	lw	s1,468(sp)
     4b8:	1e010113          	add	sp,sp,480
     4bc:	00008067          	ret

000004c0 <.L18>:
     4c0:	00412603          	lw	a2,4(sp)
     4c4:	00040513          	mv	a0,s0
     4c8:	119010ef          	jal	1de0 <__stdio_fwrite>
     4cc:	fb1ff06f          	j	47c <.L60>

000004d0 <.L17>:
     4d0:	00048593          	mv	a1,s1
     4d4:	000a0513          	mv	a0,s4
     4d8:	61c000ef          	jal	af4 <_ppfs_prepargs>
     4dc:	40000ab7          	lui	s5,0x40000
     4e0:	10000b37          	lui	s6,0x10000
     4e4:	00040513          	mv	a0,s0
     4e8:	00000493          	li	s1,0
     4ec:	11010b93          	add	s7,sp,272
     4f0:	00007c17          	auipc	s8,0x7
     4f4:	bf0c0c13          	add	s8,s8,-1040 # 70e0 <prefix.0>
     4f8:	fffa8a93          	add	s5,s5,-1 # 3fffffff <_ebss+0x3fff519f>
     4fc:	fffb0b13          	add	s6,s6,-1 # fffffff <_ebss+0xfff519f>

00000500 <.L21>:
     500:	00044783          	lbu	a5,0(s0)
     504:	44078663          	beqz	a5,950 <.L22>
     508:	02500713          	li	a4,37
     50c:	00e79663          	bne	a5,a4,518 <.L23>
     510:	46a40463          	beq	s0,a0,978 <.L70>
     514:	4400006f          	j	954 <.L69>

00000518 <.L23>:
     518:	00140413          	add	s0,s0,1
     51c:	fe5ff06f          	j	500 <.L21>

00000520 <.L30>:
     520:	00a6a023          	sw	a0,0(a3)
     524:	00170713          	add	a4,a4,1
     528:	00468693          	add	a3,a3,4
     52c:	4a00006f          	j	9cc <.L29>

00000530 <.L31>:
     530:	00700713          	li	a4,7
     534:	28f76663          	bltu	a4,a5,7c0 <.L33>
     538:	00008717          	auipc	a4,0x8
     53c:	db870713          	add	a4,a4,-584 # 82f0 <spec_base.1>
     540:	00f70733          	add	a4,a4,a5
     544:	fff74683          	lbu	a3,-1(a4)
     548:	00a00613          	li	a2,10
     54c:	05700713          	li	a4,87
     550:	02c69263          	bne	a3,a2,574 <.L34>
     554:	0d012603          	lw	a2,208(sp)
     558:	02c00713          	li	a4,44
     55c:	02067513          	and	a0,a2,32
     560:	00051463          	bnez	a0,568 <.L35>
     564:	05700713          	li	a4,87

00000568 <.L35>:
     568:	04067613          	and	a2,a2,64
     56c:	00060463          	beqz	a2,574 <.L34>
     570:	08076713          	or	a4,a4,128

00000574 <.L34>:
     574:	00500613          	li	a2,5
     578:	10f66663          	bltu	a2,a5,684 <.L36>
     57c:	00300613          	li	a2,3
     580:	10c78663          	beq	a5,a2,68c <.L74>
     584:	00100613          	li	a2,1
     588:	00600d93          	li	s11,6
     58c:	00c78463          	beq	a5,a2,594 <.L37>

00000590 <.L106>:
     590:	00b00d93          	li	s11,11

00000594 <.L37>:
     594:	0c412603          	lw	a2,196(sp)
     598:	02000913          	li	s2,32
     59c:	00065463          	bgez	a2,5a4 <.L38>
     5a0:	0d414903          	lbu	s2,212(sp)

000005a4 <.L38>:
     5a4:	00100613          	li	a2,1
     5a8:	40000513          	li	a0,1024
     5ac:	02c78463          	beq	a5,a2,5d4 <.L39>
     5b0:	015585b3          	add	a1,a1,s5
     5b4:	00259593          	sll	a1,a1,0x2
     5b8:	19058793          	add	a5,a1,400
     5bc:	01010613          	add	a2,sp,16
     5c0:	00c785b3          	add	a1,a5,a2
     5c4:	f485a503          	lw	a0,-184(a1)
     5c8:	000017b7          	lui	a5,0x1
     5cc:	f0078793          	add	a5,a5,-256 # f00 <.L21+0x18>
     5d0:	00f57533          	and	a0,a0,a5

000005d4 <.L39>:
     5d4:	02c12583          	lw	a1,44(sp)
     5d8:	00068613          	mv	a2,a3
     5dc:	00e12623          	sw	a4,12(sp)
     5e0:	00d12423          	sw	a3,8(sp)
     5e4:	221010ef          	jal	2004 <_load_inttype>
     5e8:	00c12703          	lw	a4,12(sp)
     5ec:	00812683          	lw	a3,8(sp)
     5f0:	0bf10c93          	add	s9,sp,191
     5f4:	00058613          	mv	a2,a1
     5f8:	00050593          	mv	a1,a0
     5fc:	000c8513          	mv	a0,s9
     600:	2bd010ef          	jal	20bc <_uintmaxtostr>
     604:	0e012703          	lw	a4,224(sp)
     608:	00500793          	li	a5,5
     60c:	00050d13          	mv	s10,a0
     610:	02e7f263          	bgeu	a5,a4,634 <.L40>
     614:	00054603          	lbu	a2,0(a0)
     618:	02d00693          	li	a3,45
     61c:	0d012783          	lw	a5,208(sp)
     620:	06d61c63          	bne	a2,a3,698 <.L41>
     624:	0027e793          	or	a5,a5,2
     628:	0cf12823          	sw	a5,208(sp)
     62c:	00150d13          	add	s10,a0,1
     630:	00200d93          	li	s11,2

00000634 <.L40>:
     634:	0c412403          	lw	s0,196(sp)
     638:	41ac8cb3          	sub	s9,s9,s10
     63c:	00045463          	bgez	s0,644 <.L42>
     640:	00100413          	li	s0,1

00000644 <.L42>:
     644:	0d012783          	lw	a5,208(sp)
     648:	000d4683          	lbu	a3,0(s10)
     64c:	0107f793          	and	a5,a5,16
     650:	06078663          	beqz	a5,6bc <.L43>
     654:	00200793          	li	a5,2
     658:	06e7f063          	bgeu	a5,a4,6b8 <.L80>
     65c:	00300793          	li	a5,3
     660:	12f70e63          	beq	a4,a5,79c <.L81>
     664:	00400793          	li	a5,4
     668:	04f71a63          	bne	a4,a5,6bc <.L43>
     66c:	048ce863          	bltu	s9,s0,6bc <.L43>
     670:	03000793          	li	a5,48
     674:	001c8413          	add	s0,s9,1
     678:	06f69263          	bne	a3,a5,6dc <.L45>
     67c:	00100413          	li	s0,1
     680:	0440006f          	j	6c4 <.L44>

00000684 <.L36>:
     684:	40d006b3          	neg	a3,a3
     688:	f09ff06f          	j	590 <.L106>

0000068c <.L74>:
     68c:	00b00d93          	li	s11,11
     690:	03700713          	li	a4,55
     694:	f01ff06f          	j	594 <.L37>

00000698 <.L41>:
     698:	0027f693          	and	a3,a5,2
     69c:	00069a63          	bnez	a3,6b0 <.L78>
     6a0:	0017f793          	and	a5,a5,1
     6a4:	f80788e3          	beqz	a5,634 <.L40>
     6a8:	00400d93          	li	s11,4
     6ac:	f89ff06f          	j	634 <.L40>

000006b0 <.L78>:
     6b0:	00000d93          	li	s11,0
     6b4:	f81ff06f          	j	634 <.L40>

000006b8 <.L80>:
     6b8:	00600d93          	li	s11,6

000006bc <.L43>:
     6bc:	03000793          	li	a5,48
     6c0:	00f69e63          	bne	a3,a5,6dc <.L45>

000006c4 <.L44>:
     6c4:	00500793          	li	a5,5
     6c8:	01b7d463          	bge	a5,s11,6d0 <.L46>
     6cc:	00b00d93          	li	s11,11

000006d0 <.L46>:
     6d0:	00100793          	li	a5,1
     6d4:	0cf70863          	beq	a4,a5,7a4 <.L84>
     6d8:	0e040063          	beqz	s0,7b8 <.L85>

000006dc <.L45>:
     6dc:	0c8cfa63          	bgeu	s9,s0,7b0 <.L86>
     6e0:	41940433          	sub	s0,s0,s9

000006e4 <.L47>:
     6e4:	00b00713          	li	a4,11
     6e8:	019407b3          	add	a5,s0,s9
     6ec:	00ed8a63          	beq	s11,a4,700 <.L62>
     6f0:	00500713          	li	a4,5
     6f4:	01b72733          	slt	a4,a4,s11
     6f8:	00170713          	add	a4,a4,1
     6fc:	00e787b3          	add	a5,a5,a4

00000700 <.L62>:
     700:	0c812703          	lw	a4,200(sp)
     704:	00000993          	li	s3,0
     708:	00e7f463          	bgeu	a5,a4,710 <.L64>
     70c:	40f709b3          	sub	s3,a4,a5

00000710 <.L64>:
     710:	00f487b3          	add	a5,s1,a5
     714:	013784b3          	add	s1,a5,s3
     718:	03000793          	li	a5,48
     71c:	00f91663          	bne	s2,a5,728 <.L65>
     720:	01340433          	add	s0,s0,s3
     724:	00000993          	li	s3,0

00000728 <.L65>:
     728:	0d012783          	lw	a5,208(sp)
     72c:	0087f793          	and	a5,a5,8
     730:	00079e63          	bnez	a5,74c <.L66>
     734:	00412503          	lw	a0,4(sp)
     738:	00098613          	mv	a2,s3
     73c:	02000593          	li	a1,32
     740:	badff0ef          	jal	2ec <_charpad>
     744:	d2a99ce3          	bne	s3,a0,47c <.L60>
     748:	00000993          	li	s3,0

0000074c <.L66>:
     74c:	00412583          	lw	a1,4(sp)
     750:	01bc0533          	add	a0,s8,s11
     754:	269000ef          	jal	11bc <__GI_fputs>
     758:	00412503          	lw	a0,4(sp)
     75c:	00040613          	mv	a2,s0
     760:	03000593          	li	a1,48
     764:	b89ff0ef          	jal	2ec <_charpad>
     768:	d0a41ae3          	bne	s0,a0,47c <.L60>
     76c:	000c8c63          	beqz	s9,784 <.L67>
     770:	00412603          	lw	a2,4(sp)
     774:	000c8593          	mv	a1,s9
     778:	000d0513          	mv	a0,s10
     77c:	664010ef          	jal	1de0 <__stdio_fwrite>
     780:	ceac9ee3          	bne	s9,a0,47c <.L60>

00000784 <.L67>:
     784:	00412503          	lw	a0,4(sp)
     788:	00098613          	mv	a2,s3
     78c:	02000593          	li	a1,32
     790:	b5dff0ef          	jal	2ec <_charpad>
     794:	26a98863          	beq	s3,a0,a04 <.L32>
     798:	ce5ff06f          	j	47c <.L60>

0000079c <.L81>:
     79c:	00900d93          	li	s11,9
     7a0:	f1dff06f          	j	6bc <.L43>

000007a4 <.L84>:
     7a4:	00008d17          	auipc	s10,0x8
     7a8:	b3cd0d13          	add	s10,s10,-1220 # 82e0 <.LC0>
     7ac:	00500c93          	li	s9,5

000007b0 <.L86>:
     7b0:	00000413          	li	s0,0
     7b4:	f31ff06f          	j	6e4 <.L47>

000007b8 <.L85>:
     7b8:	00000c93          	li	s9,0
     7bc:	ff5ff06f          	j	7b0 <.L86>

000007c0 <.L33>:
     7c0:	00f00713          	li	a4,15
     7c4:	08f76063          	bltu	a4,a5,844 <.L48>
     7c8:	0d012703          	lw	a4,208(sp)
     7cc:	02c12783          	lw	a5,44(sp)
     7d0:	01010413          	add	s0,sp,16
     7d4:	01471693          	sll	a3,a4,0x14
     7d8:	0406d463          	bgez	a3,820 <.L49>
     7dc:	0007a603          	lw	a2,0(a5)
     7e0:	0047a683          	lw	a3,4(a5)
     7e4:	0087a703          	lw	a4,8(a5)
     7e8:	00c7a783          	lw	a5,12(a5)

000007ec <.L50>:
     7ec:	00412503          	lw	a0,4(sp)
     7f0:	00c12823          	sw	a2,16(sp)
     7f4:	00d12a23          	sw	a3,20(sp)
     7f8:	0c410613          	add	a2,sp,196
     7fc:	00000697          	auipc	a3,0x0
     800:	b6068693          	add	a3,a3,-1184 # 35c <_fp_out_narrow>
     804:	00040593          	mv	a1,s0
     808:	00e12c23          	sw	a4,24(sp)
     80c:	00f12e23          	sw	a5,28(sp)
     810:	16d010ef          	jal	217c <_fpmaxtostr>

00000814 <.L108>:
     814:	c60544e3          	bltz	a0,47c <.L60>
     818:	00a484b3          	add	s1,s1,a0
     81c:	1e80006f          	j	a04 <.L32>

00000820 <.L49>:
     820:	0047a603          	lw	a2,4(a5)
     824:	0007a583          	lw	a1,0(a5)
     828:	00040513          	mv	a0,s0
     82c:	238060ef          	jal	6a64 <__extenddftf2>
     830:	01012603          	lw	a2,16(sp)
     834:	01412683          	lw	a3,20(sp)
     838:	01812703          	lw	a4,24(sp)
     83c:	01c12783          	lw	a5,28(sp)
     840:	fadff06f          	j	7ec <.L50>

00000844 <.L48>:
     844:	01100713          	li	a4,17
     848:	c2f77ae3          	bgeu	a4,a5,47c <.L60>
     84c:	01300713          	li	a4,19
     850:	08f76463          	bltu	a4,a5,8d8 <.L52>
     854:	02c12683          	lw	a3,44(sp)
     858:	0006a403          	lw	s0,0(a3)
     85c:	04e79e63          	bne	a5,a4,8b8 <.L53>
     860:	0c412703          	lw	a4,196(sp)
     864:	02040863          	beqz	s0,894 <.L54>
     868:	00040d13          	mv	s10,s0

0000086c <.L55>:
     86c:	0c412783          	lw	a5,196(sp)
     870:	fff00593          	li	a1,-1
     874:	0007c463          	bltz	a5,87c <.L56>
     878:	00078593          	mv	a1,a5

0000087c <.L56>:
     87c:	000d0513          	mv	a0,s10
     880:	619000ef          	jal	1698 <__GI_strnlen>
     884:	00050c93          	mv	s9,a0
     888:	02000913          	li	s2,32
     88c:	00b00d93          	li	s11,11
     890:	f21ff06f          	j	7b0 <.L86>

00000894 <.L54>:
     894:	00500793          	li	a5,5
     898:	00008d17          	auipc	s10,0x8
     89c:	a50d0d13          	add	s10,s10,-1456 # 82e8 <.LC1>
     8a0:	02000913          	li	s2,32
     8a4:	00b00d93          	li	s11,11
     8a8:	00600c93          	li	s9,6
     8ac:	e2e7ece3          	bltu	a5,a4,6e4 <.L47>
     8b0:	00000c93          	li	s9,0
     8b4:	e31ff06f          	j	6e4 <.L47>

000008b8 <.L53>:
     8b8:	04810023          	sb	s0,64(sp)
     8bc:	040100a3          	sb	zero,65(sp)
     8c0:	04010d13          	add	s10,sp,64
     8c4:	02000913          	li	s2,32
     8c8:	00b00d93          	li	s11,11
     8cc:	00000413          	li	s0,0
     8d0:	00100c93          	li	s9,1
     8d4:	e11ff06f          	j	6e4 <.L47>

000008d8 <.L52>:
     8d8:	01400713          	li	a4,20
     8dc:	02e79263          	bne	a5,a4,900 <.L57>
     8e0:	00006797          	auipc	a5,0x6
     8e4:	7947a783          	lw	a5,1940(a5) # 7074 <_GLOBAL_OFFSET_TABLE_+0xc>
     8e8:	0007a503          	lw	a0,0(a5)
     8ec:	08000613          	li	a2,128
     8f0:	04010593          	add	a1,sp,64
     8f4:	661000ef          	jal	1754 <__GI___glibc_strerror_r>
     8f8:	00050d13          	mv	s10,a0
     8fc:	f71ff06f          	j	86c <.L55>

00000900 <.L57>:
     900:	0cc12583          	lw	a1,204(sp)
     904:	00008717          	auipc	a4,0x8
     908:	b0072703          	lw	a4,-1280(a4) # 8404 <_custom_printf_spec>
     90c:	00a70693          	add	a3,a4,10
     910:	00070793          	mv	a5,a4

00000914 <.L61>:
     914:	0007c503          	lbu	a0,0(a5)
     918:	02b51663          	bne	a0,a1,944 <.L58>
     91c:	40e787b3          	sub	a5,a5,a4
     920:	00279793          	sll	a5,a5,0x2
     924:	0000a717          	auipc	a4,0xa
     928:	4fc70713          	add	a4,a4,1276 # ae20 <_custom_printf_handler>
     92c:	00f707b3          	add	a5,a4,a5
     930:	0007a783          	lw	a5,0(a5)
     934:	00412503          	lw	a0,4(sp)
     938:	0c410593          	add	a1,sp,196
     93c:	000780e7          	jalr	a5
     940:	ed5ff06f          	j	814 <.L108>

00000944 <.L58>:
     944:	00178793          	add	a5,a5,1
     948:	fcd796e3          	bne	a5,a3,914 <.L61>
     94c:	b31ff06f          	j	47c <.L60>

00000950 <.L22>:
     950:	b2a408e3          	beq	s0,a0,480 <.L16>

00000954 <.L69>:
     954:	40a409b3          	sub	s3,s0,a0
     958:	b33052e3          	blez	s3,47c <.L60>
     95c:	00412603          	lw	a2,4(sp)
     960:	00098593          	mv	a1,s3
     964:	47c010ef          	jal	1de0 <__stdio_fwrite>
     968:	b0a99ae3          	bne	s3,a0,47c <.L60>
     96c:	00044783          	lbu	a5,0(s0)
     970:	013484b3          	add	s1,s1,s3
     974:	b00786e3          	beqz	a5,480 <.L16>

00000978 <.L70>:
     978:	00144703          	lbu	a4,1(s0)
     97c:	02500793          	li	a5,37
     980:	00140513          	add	a0,s0,1
     984:	00240413          	add	s0,s0,2
     988:	b6f70ce3          	beq	a4,a5,500 <.L21>
     98c:	0ca12023          	sw	a0,192(sp)
     990:	000a0513          	mv	a0,s4
     994:	360000ef          	jal	cf4 <_ppfs_parsespec>
     998:	000a0513          	mv	a0,s4
     99c:	1a4000ef          	jal	b40 <_ppfs_setargs>
     9a0:	0d812703          	lw	a4,216(sp)
     9a4:	0e614583          	lbu	a1,230(sp)
     9a8:	000b8793          	mv	a5,s7
     9ac:	00e05863          	blez	a4,9bc <.L28>
     9b0:	016587b3          	add	a5,a1,s6
     9b4:	00479793          	sll	a5,a5,0x4
     9b8:	00fb87b3          	add	a5,s7,a5

000009bc <.L28>:
     9bc:	0dc12803          	lw	a6,220(sp)
     9c0:	02c10693          	add	a3,sp,44
     9c4:	00000713          	li	a4,0
     9c8:	00068613          	mv	a2,a3

000009cc <.L29>:
     9cc:	00471513          	sll	a0,a4,0x4
     9d0:	00a78533          	add	a0,a5,a0
     9d4:	b50746e3          	blt	a4,a6,520 <.L30>
     9d8:	0e012783          	lw	a5,224(sp)
     9dc:	b4079ae3          	bnez	a5,530 <.L31>
     9e0:	0d012583          	lw	a1,208(sp)
     9e4:	000017b7          	lui	a5,0x1
     9e8:	f0078793          	add	a5,a5,-256 # f00 <.L21+0x18>
     9ec:	00f5f5b3          	and	a1,a1,a5
     9f0:	02c12783          	lw	a5,44(sp)
     9f4:	00048613          	mv	a2,s1
     9f8:	41f4d693          	sra	a3,s1,0x1f
     9fc:	0007a503          	lw	a0,0(a5)
     a00:	680010ef          	jal	2080 <_store_inttype>

00000a04 <.L32>:
     a04:	0c012403          	lw	s0,192(sp)
     a08:	00040513          	mv	a0,s0
     a0c:	af5ff06f          	j	500 <.L21>

00000a10 <_ppfs_init>:
     a10:	fe010113          	add	sp,sp,-32
     a14:	00912a23          	sw	s1,20(sp)
     a18:	0e000613          	li	a2,224
     a1c:	00058493          	mv	s1,a1
     a20:	00000593          	li	a1,0
     a24:	00812c23          	sw	s0,24(sp)
     a28:	01212823          	sw	s2,16(sp)
     a2c:	00050413          	mv	s0,a0
     a30:	00112e23          	sw	ra,28(sp)
     a34:	01312623          	sw	s3,12(sp)
     a38:	329000ef          	jal	1560 <__GI_memset>
     a3c:	01842783          	lw	a5,24(s0)
     a40:	02840913          	add	s2,s0,40
     a44:	00942023          	sw	s1,0(s0)
     a48:	fff78793          	add	a5,a5,-1
     a4c:	00f42c23          	sw	a5,24(s0)
     a50:	04c40713          	add	a4,s0,76
     a54:	00090793          	mv	a5,s2
     a58:	00800693          	li	a3,8

00000a5c <.L2>:
     a5c:	00478793          	add	a5,a5,4
     a60:	fed7ae23          	sw	a3,-4(a5)
     a64:	fef71ce3          	bne	a4,a5,a5c <.L2>
     a68:	00048793          	mv	a5,s1
     a6c:	02500993          	li	s3,37

00000a70 <.L3>:
     a70:	0007c703          	lbu	a4,0(a5)
     a74:	02071063          	bnez	a4,a94 <.L8>
     a78:	01842783          	lw	a5,24(s0)
     a7c:	00942023          	sw	s1,0(s0)
     a80:	00800713          	li	a4,8

00000a84 <.L9>:
     a84:	fff78793          	add	a5,a5,-1
     a88:	0407de63          	bgez	a5,ae4 <.L11>
     a8c:	00000513          	li	a0,0
     a90:	0280006f          	j	ab8 <.L1>

00000a94 <.L8>:
     a94:	0017c683          	lbu	a3,1(a5)
     a98:	05371263          	bne	a4,s3,adc <.L4>
     a9c:	00178793          	add	a5,a5,1
     aa0:	03368e63          	beq	a3,s3,adc <.L4>
     aa4:	00f42023          	sw	a5,0(s0)
     aa8:	00040513          	mv	a0,s0
     aac:	248000ef          	jal	cf4 <_ppfs_parsespec>
     ab0:	02055263          	bgez	a0,ad4 <.L5>

00000ab4 <.L10>:
     ab4:	fff00513          	li	a0,-1

00000ab8 <.L1>:
     ab8:	01c12083          	lw	ra,28(sp)
     abc:	01812403          	lw	s0,24(sp)
     ac0:	01412483          	lw	s1,20(sp)
     ac4:	01012903          	lw	s2,16(sp)
     ac8:	00c12983          	lw	s3,12(sp)
     acc:	02010113          	add	sp,sp,32
     ad0:	00008067          	ret

00000ad4 <.L5>:
     ad4:	00042783          	lw	a5,0(s0)
     ad8:	f99ff06f          	j	a70 <.L3>

00000adc <.L4>:
     adc:	00178793          	add	a5,a5,1
     ae0:	f91ff06f          	j	a70 <.L3>

00000ae4 <.L11>:
     ae4:	00092683          	lw	a3,0(s2)
     ae8:	fce686e3          	beq	a3,a4,ab4 <.L10>
     aec:	00490913          	add	s2,s2,4
     af0:	f95ff06f          	j	a84 <.L9>

00000af4 <_ppfs_prepargs>:
     af4:	ff010113          	add	sp,sp,-16
     af8:	00912223          	sw	s1,4(sp)
     afc:	01852483          	lw	s1,24(a0)
     b00:	00112623          	sw	ra,12(sp)
     b04:	00812423          	sw	s0,8(sp)
     b08:	04b52623          	sw	a1,76(a0)
     b0c:	02905063          	blez	s1,b2c <.L1>
     b10:	00050413          	mv	s0,a0
     b14:	00952e23          	sw	s1,28(a0)
     b18:	00052c23          	sw	zero,24(a0)
     b1c:	00052223          	sw	zero,4(a0)
     b20:	00052423          	sw	zero,8(a0)
     b24:	01c000ef          	jal	b40 <_ppfs_setargs>
     b28:	00942c23          	sw	s1,24(s0)

00000b2c <.L1>:
     b2c:	00c12083          	lw	ra,12(sp)
     b30:	00812403          	lw	s0,8(sp)
     b34:	00412483          	lw	s1,4(sp)
     b38:	01010113          	add	sp,sp,16
     b3c:	00008067          	ret

00000b40 <_ppfs_setargs>:
     b40:	01852603          	lw	a2,24(a0)
     b44:	00852783          	lw	a5,8(a0)
     b48:	00452683          	lw	a3,4(a0)
     b4c:	05050713          	add	a4,a0,80
     b50:	12061c63          	bnez	a2,c88 <.L2>
     b54:	800005b7          	lui	a1,0x80000
     b58:	00b79e63          	bne	a5,a1,b74 <.L3>
     b5c:	04c52783          	lw	a5,76(a0)
     b60:	00478593          	add	a1,a5,4
     b64:	0007a783          	lw	a5,0(a5)
     b68:	04b52623          	sw	a1,76(a0)
     b6c:	04f52823          	sw	a5,80(a0)
     b70:	00f52423          	sw	a5,8(a0)

00000b74 <.L3>:
     b74:	800007b7          	lui	a5,0x80000
     b78:	00f69e63          	bne	a3,a5,b94 <.L4>
     b7c:	04c52783          	lw	a5,76(a0)
     b80:	00478693          	add	a3,a5,4 # 80000004 <_ebss+0x7fff51a4>
     b84:	0007a783          	lw	a5,0(a5)
     b88:	04d52623          	sw	a3,76(a0)
     b8c:	04f52823          	sw	a5,80(a0)
     b90:	00f52223          	sw	a5,4(a0)

00000b94 <.L4>:
     b94:	01c52f03          	lw	t5,28(a0)
     b98:	00001837          	lui	a6,0x1
     b9c:	000018b7          	lui	a7,0x1
     ba0:	02850593          	add	a1,a0,40
     ba4:	00800e13          	li	t3,8
     ba8:	80080813          	add	a6,a6,-2048 # 800 <.L50+0x14>
     bac:	80788893          	add	a7,a7,-2041 # 807 <.L50+0x1b>
     bb0:	00200e93          	li	t4,2
     bb4:	00700f93          	li	t6,7

00000bb8 <.L5>:
     bb8:	03e64863          	blt	a2,t5,be8 <.L17>

00000bbc <.L18>:
     bbc:	00852783          	lw	a5,8(a0)
     bc0:	0207d263          	bgez	a5,be4 <.L1>
     bc4:	40f007b3          	neg	a5,a5
     bc8:	00f52423          	sw	a5,8(a0)
     bcc:	01052783          	lw	a5,16(a0)
     bd0:	ffe7f793          	and	a5,a5,-2
     bd4:	0087e793          	or	a5,a5,8
     bd8:	00f52823          	sw	a5,16(a0)
     bdc:	02000793          	li	a5,32
     be0:	00f52a23          	sw	a5,20(a0)

00000be4 <.L1>:
     be4:	00008067          	ret

00000be8 <.L17>:
     be8:	0005a683          	lw	a3,0(a1) # 80000000 <_ebss+0x7fff51a0>
     bec:	00160613          	add	a2,a2,1
     bf0:	05c68863          	beq	a3,t3,c40 <.L6>
     bf4:	04c52783          	lw	a5,76(a0)
     bf8:	04de4863          	blt	t3,a3,c48 <.L7>
     bfc:	01d68463          	beq	a3,t4,c04 <.L10>
     c00:	00decc63          	blt	t4,a3,c18 <.L9>

00000c04 <.L10>:
     c04:	00478693          	add	a3,a5,4
     c08:	04d52623          	sw	a3,76(a0)
     c0c:	0007a783          	lw	a5,0(a5)
     c10:	00f72023          	sw	a5,0(a4)
     c14:	0280006f          	j	c3c <.L16>

00000c18 <.L9>:
     c18:	fff696e3          	bne	a3,t6,c04 <.L10>

00000c1c <.L12>:
     c1c:	00778793          	add	a5,a5,7
     c20:	ff87f793          	and	a5,a5,-8
     c24:	00878693          	add	a3,a5,8
     c28:	04d52623          	sw	a3,76(a0)
     c2c:	0007a303          	lw	t1,0(a5)
     c30:	0047a383          	lw	t2,4(a5)
     c34:	00672023          	sw	t1,0(a4)
     c38:	00772223          	sw	t2,4(a4)

00000c3c <.L16>:
     c3c:	01070713          	add	a4,a4,16

00000c40 <.L6>:
     c40:	00458593          	add	a1,a1,4
     c44:	f75ff06f          	j	bb8 <.L5>

00000c48 <.L7>:
     c48:	80068313          	add	t1,a3,-2048
     c4c:	fc0308e3          	beqz	t1,c1c <.L12>
     c50:	fad85ae3          	bge	a6,a3,c04 <.L10>
     c54:	fb1698e3          	bne	a3,a7,c04 <.L10>
     c58:	00478693          	add	a3,a5,4
     c5c:	04d52623          	sw	a3,76(a0)
     c60:	0007a783          	lw	a5,0(a5)
     c64:	0007a283          	lw	t0,0(a5)
     c68:	0047a303          	lw	t1,4(a5)
     c6c:	0087a683          	lw	a3,8(a5)
     c70:	00c7a783          	lw	a5,12(a5)
     c74:	00572023          	sw	t0,0(a4)
     c78:	00672223          	sw	t1,4(a4)
     c7c:	00d72423          	sw	a3,8(a4)
     c80:	00f72623          	sw	a5,12(a4)
     c84:	fb9ff06f          	j	c3c <.L16>

00000c88 <.L2>:
     c88:	80000637          	lui	a2,0x80000
     c8c:	00c79c63          	bne	a5,a2,ca4 <.L19>
     c90:	02454783          	lbu	a5,36(a0)
     c94:	00479793          	sll	a5,a5,0x4
     c98:	00f707b3          	add	a5,a4,a5
     c9c:	ff07a783          	lw	a5,-16(a5)
     ca0:	00f52423          	sw	a5,8(a0)

00000ca4 <.L19>:
     ca4:	800007b7          	lui	a5,0x80000
     ca8:	f0f69ae3          	bne	a3,a5,bbc <.L18>
     cac:	02554783          	lbu	a5,37(a0)
     cb0:	00479793          	sll	a5,a5,0x4
     cb4:	00f70733          	add	a4,a4,a5
     cb8:	ff072783          	lw	a5,-16(a4)
     cbc:	00f52223          	sw	a5,4(a0)
     cc0:	efdff06f          	j	bbc <.L18>

00000cc4 <_promoted_size>:
     cc4:	82418793          	add	a5,gp,-2012 # 7104 <type_sizes>
     cc8:	00006717          	auipc	a4,0x6
     ccc:	42470713          	add	a4,a4,1060 # 70ec <type_codes>

00000cd0 <.L3>:
     cd0:	ffe79683          	lh	a3,-2(a5) # 7ffffffe <_ebss+0x7fff519e>
     cd4:	ffe78793          	add	a5,a5,-2
     cd8:	00a68463          	beq	a3,a0,ce0 <.L2>
     cdc:	fee79ae3          	bne	a5,a4,cd0 <.L3>

00000ce0 <.L2>:
     ce0:	40e787b3          	sub	a5,a5,a4
     ce4:	4017d793          	sra	a5,a5,0x1
     ce8:	00f70733          	add	a4,a4,a5
     cec:	01874503          	lbu	a0,24(a4)
     cf0:	00008067          	ret

00000cf4 <_ppfs_parsespec>:
     cf4:	f9010113          	add	sp,sp,-112
     cf8:	00800793          	li	a5,8
     cfc:	0cccd337          	lui	t1,0xcccd
     d00:	0cccde37          	lui	t3,0xcccd
     d04:	80000837          	lui	a6,0x80000
     d08:	00052683          	lw	a3,0(a0)
     d0c:	06812423          	sw	s0,104(sp)
     d10:	07212023          	sw	s2,96(sp)
     d14:	05312e23          	sw	s3,92(sp)
     d18:	05412c23          	sw	s4,88(sp)
     d1c:	01852983          	lw	s3,24(a0)
     d20:	05512a23          	sw	s5,84(sp)
     d24:	05612823          	sw	s6,80(sp)
     d28:	00050413          	mv	s0,a0
     d2c:	06112623          	sw	ra,108(sp)
     d30:	06912223          	sw	s1,100(sp)
     d34:	05712623          	sw	s7,76(sp)
     d38:	05812423          	sw	s8,72(sp)
     d3c:	05912223          	sw	s9,68(sp)
     d40:	05a12023          	sw	s10,64(sp)
     d44:	03b12e23          	sw	s11,60(sp)
     d48:	00012423          	sw	zero,8(sp)
     d4c:	00012623          	sw	zero,12(sp)
     d50:	00f12a23          	sw	a5,20(sp)
     d54:	00f12c23          	sw	a5,24(sp)
     d58:	00007297          	auipc	t0,0x7
     d5c:	6bc2a283          	lw	t0,1724(t0) # 8414 <__GI___ctype_b>
     d60:	00000513          	li	a0,0
     d64:	00000613          	li	a2,0
     d68:	00000893          	li	a7,0
     d6c:	02a00e93          	li	t4,42
     d70:	ccb30313          	add	t1,t1,-821 # ccccccb <_ebss+0xccc1e6b>
     d74:	00a00393          	li	t2,10
     d78:	ccce0e13          	add	t3,t3,-820 # ccccccc <_ebss+0xccc1e6c>
     d7c:	fff80813          	add	a6,a6,-1 # 7fffffff <_ebss+0x7fff519f>
     d80:	03700913          	li	s2,55
     d84:	02500f13          	li	t5,37
     d88:	02e00a13          	li	s4,46
     d8c:	02400f93          	li	t6,36
     d90:	03000a93          	li	s5,48
     d94:	06d00b13          	li	s6,109

00000d98 <.L6>:
     d98:	0006c783          	lbu	a5,0(a3)
     d9c:	00068713          	mv	a4,a3
     da0:	01d79c63          	bne	a5,t4,db8 <.L7>
     da4:	03010713          	add	a4,sp,48
     da8:	00251793          	sll	a5,a0,0x2
     dac:	40f707b3          	sub	a5,a4,a5
     db0:	fe07a223          	sw	zero,-28(a5)
     db4:	00168713          	add	a4,a3,1

00000db8 <.L7>:
     db8:	00000793          	li	a5,0

00000dbc <.L8>:
     dbc:	00074583          	lbu	a1,0(a4)
     dc0:	00159493          	sll	s1,a1,0x1
     dc4:	009284b3          	add	s1,t0,s1
     dc8:	0004d483          	lhu	s1,0(s1)
     dcc:	0084f493          	and	s1,s1,8
     dd0:	04049e63          	bnez	s1,e2c <.L11>
     dd4:	fff6c483          	lbu	s1,-1(a3)
     dd8:	0be49e63          	bne	s1,t5,e94 <.L12>
     ddc:	0bf59863          	bne	a1,t6,e8c <.L13>
     de0:	3cf05263          	blez	a5,11a4 <.L14>
     de4:	00170693          	add	a3,a4,1
     de8:	06099663          	bnez	s3,e54 <.L15>

00000dec <.L20>:
     dec:	fff00513          	li	a0,-1

00000df0 <.L5>:
     df0:	06c12083          	lw	ra,108(sp)
     df4:	06812403          	lw	s0,104(sp)
     df8:	06412483          	lw	s1,100(sp)
     dfc:	06012903          	lw	s2,96(sp)
     e00:	05c12983          	lw	s3,92(sp)
     e04:	05812a03          	lw	s4,88(sp)
     e08:	05412a83          	lw	s5,84(sp)
     e0c:	05012b03          	lw	s6,80(sp)
     e10:	04c12b83          	lw	s7,76(sp)
     e14:	04812c03          	lw	s8,72(sp)
     e18:	04412c83          	lw	s9,68(sp)
     e1c:	04012d03          	lw	s10,64(sp)
     e20:	03c12d83          	lw	s11,60(sp)
     e24:	07010113          	add	sp,sp,112
     e28:	00008067          	ret

00000e2c <.L11>:
     e2c:	00f35663          	bge	t1,a5,e38 <.L9>
     e30:	01c79e63          	bne	a5,t3,e4c <.L53>
     e34:	00b96c63          	bltu	s2,a1,e4c <.L53>

00000e38 <.L9>:
     e38:	027787b3          	mul	a5,a5,t2
     e3c:	fd058593          	add	a1,a1,-48
     e40:	00f587b3          	add	a5,a1,a5

00000e44 <.L10>:
     e44:	00170713          	add	a4,a4,1
     e48:	f75ff06f          	j	dbc <.L8>

00000e4c <.L53>:
     e4c:	00080793          	mv	a5,a6
     e50:	ff5ff06f          	j	e44 <.L10>

00000e54 <.L15>:
     e54:	00f12823          	sw	a5,16(sp)
     e58:	00f9d463          	bge	s3,a5,e60 <.L18>
     e5c:	00078993          	mv	s3,a5

00000e60 <.L18>:
     e60:	00068713          	mv	a4,a3

00000e64 <.L22>:
     e64:	00074483          	lbu	s1,0(a4)
     e68:	00100793          	li	a5,1
     e6c:	00007697          	auipc	a3,0x7
     e70:	4a468693          	add	a3,a3,1188 # 8310 <spec_flags.5>

00000e74 <.L23>:
     e74:	0006c583          	lbu	a1,0(a3)
     e78:	00168693          	add	a3,a3,1
     e7c:	06959663          	bne	a1,s1,ee8 <.L21>
     e80:	00170713          	add	a4,a4,1
     e84:	00f66633          	or	a2,a2,a5
     e88:	fddff06f          	j	e64 <.L22>

00000e8c <.L13>:
     e8c:	31305e63          	blez	s3,11a8 <.L19>
     e90:	f5659ee3          	bne	a1,s6,dec <.L20>

00000e94 <.L12>:
     e94:	0006c583          	lbu	a1,0(a3)
     e98:	00070493          	mv	s1,a4
     e9c:	03d59663          	bne	a1,t4,ec8 <.L25>
     ea0:	06098a63          	beqz	s3,f14 <.L26>
     ea4:	00170493          	add	s1,a4,1
     ea8:	00074703          	lbu	a4,0(a4)
     eac:	f5f710e3          	bne	a4,t6,dec <.L20>
     eb0:	f2f05ee3          	blez	a5,dec <.L20>
     eb4:	00251713          	sll	a4,a0,0x2
     eb8:	03010693          	add	a3,sp,48
     ebc:	40e68733          	sub	a4,a3,a4
     ec0:	fcf72c23          	sw	a5,-40(a4)

00000ec4 <.L72>:
     ec4:	800007b7          	lui	a5,0x80000

00000ec8 <.L25>:
     ec8:	0004c583          	lbu	a1,0(s1)
     ecc:	04051e63          	bnez	a0,f28 <.L27>
     ed0:	05459863          	bne	a1,s4,f20 <.L57>
     ed4:	00148713          	add	a4,s1,1
     ed8:	00078893          	mv	a7,a5
     edc:	fff00513          	li	a0,-1

00000ee0 <.L24>:
     ee0:	00070693          	mv	a3,a4
     ee4:	eb5ff06f          	j	d98 <.L6>

00000ee8 <.L21>:
     ee8:	0006c583          	lbu	a1,0(a3)
     eec:	00179793          	sll	a5,a5,0x1
     ef0:	f80592e3          	bnez	a1,e74 <.L23>
     ef4:	40165793          	sra	a5,a2,0x1
     ef8:	0057f793          	and	a5,a5,5
     efc:	fff7c793          	not	a5,a5
     f00:	00f67633          	and	a2,a2,a5
     f04:	fff74783          	lbu	a5,-1(a4)
     f08:	fde79ce3          	bne	a5,t5,ee0 <.L24>
     f0c:	00000793          	li	a5,0
     f10:	f85ff06f          	j	e94 <.L12>

00000f14 <.L26>:
     f14:	00168493          	add	s1,a3,1
     f18:	fa9706e3          	beq	a4,s1,ec4 <.L72>
     f1c:	ed1ff06f          	j	dec <.L20>

00000f20 <.L57>:
     f20:	00078893          	mv	a7,a5
     f24:	fff00793          	li	a5,-1

00000f28 <.L27>:
     f28:	83018713          	add	a4,gp,-2000 # 7110 <qual_chars.4>
     f2c:	00070693          	mv	a3,a4

00000f30 <.L30>:
     f30:	00074503          	lbu	a0,0(a4)
     f34:	1ab51863          	bne	a0,a1,10e4 <.L28>
     f38:	00148493          	add	s1,s1,1

00000f3c <.L29>:
     f3c:	40d706b3          	sub	a3,a4,a3
     f40:	00100513          	li	a0,1
     f44:	0004c583          	lbu	a1,0(s1)
     f48:	00d54a63          	blt	a0,a3,f5c <.L31>
     f4c:	00074683          	lbu	a3,0(a4)
     f50:	00b69663          	bne	a3,a1,f5c <.L31>
     f54:	00970713          	add	a4,a4,9
     f58:	00148493          	add	s1,s1,1

00000f5c <.L31>:
     f5c:	00974683          	lbu	a3,9(a4)
     f60:	0004c583          	lbu	a1,0(s1)
     f64:	00869693          	sll	a3,a3,0x8
     f68:	e80582e3          	beqz	a1,dec <.L20>
     f6c:	00007717          	auipc	a4,0x7
     f70:	38c70713          	add	a4,a4,908 # 82f8 <spec_chars.3>
     f74:	00070813          	mv	a6,a4

00000f78 <.L36>:
     f78:	00074503          	lbu	a0,0(a4)
     f7c:	16b51c63          	bne	a0,a1,10f4 <.L32>
     f80:	41070733          	sub	a4,a4,a6
     f84:	01100593          	li	a1,17
     f88:	00e5d863          	bge	a1,a4,f98 <.L33>
     f8c:	4006f593          	and	a1,a3,1024
     f90:	00058463          	beqz	a1,f98 <.L33>
     f94:	ffe70713          	add	a4,a4,-2

00000f98 <.L33>:
     f98:	84418513          	add	a0,gp,-1980 # 7124 <spec_ranges.2>
     f9c:	02e42023          	sw	a4,32(s0)
     fa0:	00050813          	mv	a6,a0

00000fa4 <.L34>:
     fa4:	00050593          	mv	a1,a0
     fa8:	0005c303          	lbu	t1,0(a1)
     fac:	00150513          	add	a0,a0,1
     fb0:	fee34ae3          	blt	t1,a4,fa4 <.L34>
     fb4:	410585b3          	sub	a1,a1,a6
     fb8:	00006717          	auipc	a4,0x6
     fbc:	13470713          	add	a4,a4,308 # 70ec <type_codes>
     fc0:	00159593          	sll	a1,a1,0x1
     fc4:	00b705b3          	add	a1,a4,a1
     fc8:	04459703          	lh	a4,68(a1)
     fcc:	05459583          	lh	a1,84(a1)
     fd0:	00d76733          	or	a4,a4,a3
     fd4:	00b77733          	and	a4,a4,a1
     fd8:	00e12e23          	sw	a4,28(sp)
     fdc:	00007717          	auipc	a4,0x7
     fe0:	31c70713          	add	a4,a4,796 # 82f8 <spec_chars.3>

00000fe4 <.L35>:
     fe4:	0004c583          	lbu	a1,0(s1)
     fe8:	00f42223          	sw	a5,4(s0)
     fec:	01142423          	sw	a7,8(s0)
     ff0:	00b42623          	sw	a1,12(s0)
     ff4:	00467793          	and	a5,a2,4
     ff8:	02000593          	li	a1,32
     ffc:	00078463          	beqz	a5,1004 <.L37>
    1000:	03000593          	li	a1,48

00001004 <.L37>:
    1004:	000017b7          	lui	a5,0x1
    1008:	f0078793          	add	a5,a5,-256 # f00 <.L21+0x18>
    100c:	00f6f6b3          	and	a3,a3,a5
    1010:	ffb67613          	and	a2,a2,-5
    1014:	00100793          	li	a5,1
    1018:	00d66633          	or	a2,a2,a3
    101c:	00b42a23          	sw	a1,20(s0)
    1020:	00c42823          	sw	a2,16(s0)
    1024:	00f42e23          	sw	a5,28(s0)
    1028:	00074783          	lbu	a5,0(a4)
    102c:	00079e63          	bnez	a5,1048 <.L40>
    1030:	0004c703          	lbu	a4,0(s1)
    1034:	06d00793          	li	a5,109
    1038:	0cf71663          	bne	a4,a5,1104 <.L39>
    103c:	01400793          	li	a5,20
    1040:	02f42023          	sw	a5,32(s0)
    1044:	00042e23          	sw	zero,28(s0)

00001048 <.L40>:
    1048:	13305e63          	blez	s3,1184 <.L43>
    104c:	01410b93          	add	s7,sp,20
    1050:	00810b13          	add	s6,sp,8
    1054:	00000a13          	li	s4,0
    1058:	00200d13          	li	s10,2
    105c:	00900d93          	li	s11,9
    1060:	00800c93          	li	s9,8

00001064 <.L49>:
    1064:	114d4863          	blt	s10,s4,1174 <.L44>
    1068:	000b2783          	lw	a5,0(s6)
    106c:	01440733          	add	a4,s0,s4
    1070:	02f70223          	sb	a5,36(a4)
    1074:	0ff7f793          	zext.b	a5,a5

00001078 <.L45>:
    1078:	00f9d663          	bge	s3,a5,1084 <.L46>
    107c:	d6fdc8e3          	blt	s11,a5,dec <.L20>
    1080:	00078993          	mv	s3,a5

00001084 <.L46>:
    1084:	000baa83          	lw	s5,0(s7)
    1088:	039a8863          	beq	s5,s9,10b8 <.L47>
    108c:	00279793          	sll	a5,a5,0x2
    1090:	00f40933          	add	s2,s0,a5
    1094:	02492503          	lw	a0,36(s2)
    1098:	01950e63          	beq	a0,s9,10b4 <.L48>
    109c:	01550c63          	beq	a0,s5,10b4 <.L48>
    10a0:	c25ff0ef          	jal	cc4 <_promoted_size>
    10a4:	00050c13          	mv	s8,a0
    10a8:	000a8513          	mv	a0,s5
    10ac:	c19ff0ef          	jal	cc4 <_promoted_size>
    10b0:	01854463          	blt	a0,s8,10b8 <.L47>

000010b4 <.L48>:
    10b4:	03592223          	sw	s5,36(s2)

000010b8 <.L47>:
    10b8:	01c42783          	lw	a5,28(s0)
    10bc:	001a0713          	add	a4,s4,1
    10c0:	004b8b93          	add	s7,s7,4
    10c4:	004b0b13          	add	s6,s6,4
    10c8:	0b47d263          	bge	a5,s4,116c <.L59>

000010cc <.L50>:
    10cc:	01c42503          	lw	a0,28(s0)
    10d0:	00148493          	add	s1,s1,1
    10d4:	01342c23          	sw	s3,24(s0)
    10d8:	00942023          	sw	s1,0(s0)
    10dc:	00250513          	add	a0,a0,2
    10e0:	d11ff06f          	j	df0 <.L5>

000010e4 <.L28>:
    10e4:	00174503          	lbu	a0,1(a4)
    10e8:	00170713          	add	a4,a4,1
    10ec:	e40512e3          	bnez	a0,f30 <.L30>
    10f0:	e4dff06f          	j	f3c <.L29>

000010f4 <.L32>:
    10f4:	00174503          	lbu	a0,1(a4)
    10f8:	00170713          	add	a4,a4,1
    10fc:	e6051ee3          	bnez	a0,f78 <.L36>
    1100:	ee5ff06f          	j	fe4 <.L35>

00001104 <.L39>:
    1104:	01500793          	li	a5,21
    1108:	02f42023          	sw	a5,32(s0)
    110c:	0004c603          	lbu	a2,0(s1)
    1110:	00007717          	auipc	a4,0x7
    1114:	2f472703          	lw	a4,756(a4) # 8404 <_custom_printf_spec>
    1118:	00a70693          	add	a3,a4,10
    111c:	00070793          	mv	a5,a4

00001120 <.L42>:
    1120:	0007c583          	lbu	a1,0(a5)
    1124:	02c59e63          	bne	a1,a2,1160 <.L41>
    1128:	40e787b3          	sub	a5,a5,a4
    112c:	00279793          	sll	a5,a5,0x2
    1130:	0000a717          	auipc	a4,0xa
    1134:	cc870713          	add	a4,a4,-824 # adf8 <_custom_printf_arginfo>
    1138:	00f707b3          	add	a5,a4,a5
    113c:	0007a783          	lw	a5,0(a5)
    1140:	01c10613          	add	a2,sp,28
    1144:	00500593          	li	a1,5
    1148:	00440513          	add	a0,s0,4
    114c:	000780e7          	jalr	a5
    1150:	00a42e23          	sw	a0,28(s0)
    1154:	00500793          	li	a5,5
    1158:	eea7d8e3          	bge	a5,a0,1048 <.L40>
    115c:	c91ff06f          	j	dec <.L20>

00001160 <.L41>:
    1160:	00178793          	add	a5,a5,1
    1164:	fad79ee3          	bne	a5,a3,1120 <.L42>
    1168:	c85ff06f          	j	dec <.L20>

0000116c <.L59>:
    116c:	00070a13          	mv	s4,a4
    1170:	ef5ff06f          	j	1064 <.L49>

00001174 <.L44>:
    1174:	01012703          	lw	a4,16(sp)
    1178:	ffea0793          	add	a5,s4,-2
    117c:	00e787b3          	add	a5,a5,a4
    1180:	ef9ff06f          	j	1078 <.L45>

00001184 <.L43>:
    1184:	01c42603          	lw	a2,28(s0)
    1188:	00100793          	li	a5,1
    118c:	02f40323          	sb	a5,38(s0)
    1190:	00261613          	sll	a2,a2,0x2
    1194:	01c10593          	add	a1,sp,28
    1198:	02840513          	add	a0,s0,40
    119c:	11c000ef          	jal	12b8 <__GI_memcpy>
    11a0:	f2dff06f          	j	10cc <.L50>

000011a4 <.L14>:
    11a4:	c53044e3          	bgtz	s3,dec <.L20>

000011a8 <.L19>:
    11a8:	0006c583          	lbu	a1,0(a3)
    11ac:	00000993          	li	s3,0
    11b0:	cae6f8e3          	bgeu	a3,a4,e60 <.L18>
    11b4:	cf5590e3          	bne	a1,s5,e94 <.L12>
    11b8:	ca9ff06f          	j	e60 <.L18>

000011bc <__GI_fputs>:
    11bc:	fe010113          	add	sp,sp,-32
    11c0:	00812c23          	sw	s0,24(sp)
    11c4:	00912a23          	sw	s1,20(sp)
    11c8:	00112e23          	sw	ra,28(sp)
    11cc:	00050493          	mv	s1,a0
    11d0:	00b12623          	sw	a1,12(sp)
    11d4:	430000ef          	jal	1604 <__GI_strlen>
    11d8:	00c12683          	lw	a3,12(sp)
    11dc:	00050413          	mv	s0,a0
    11e0:	00050613          	mv	a2,a0
    11e4:	00100593          	li	a1,1
    11e8:	00048513          	mv	a0,s1
    11ec:	020000ef          	jal	120c <__GI_fwrite>
    11f0:	00850463          	beq	a0,s0,11f8 <.L1>
    11f4:	fff00513          	li	a0,-1

000011f8 <.L1>:
    11f8:	01c12083          	lw	ra,28(sp)
    11fc:	01812403          	lw	s0,24(sp)
    1200:	01412483          	lw	s1,20(sp)
    1204:	02010113          	add	sp,sp,32
    1208:	00008067          	ret

0000120c <__GI_fwrite>:
    120c:	0006d783          	lhu	a5,0(a3)
    1210:	fe010113          	add	sp,sp,-32
    1214:	00812c23          	sw	s0,24(sp)
    1218:	00912a23          	sw	s1,20(sp)
    121c:	01212823          	sw	s2,16(sp)
    1220:	01312623          	sw	s3,12(sp)
    1224:	00112e23          	sw	ra,28(sp)
    1228:	0407f793          	and	a5,a5,64
    122c:	00050993          	mv	s3,a0
    1230:	00058493          	mv	s1,a1
    1234:	00060913          	mv	s2,a2
    1238:	00068413          	mv	s0,a3
    123c:	02078463          	beqz	a5,1264 <.L2>

00001240 <.L5>:
    1240:	02049a63          	bnez	s1,1274 <.L3>

00001244 <.L10>:
    1244:	00000513          	li	a0,0

00001248 <.L1>:
    1248:	01c12083          	lw	ra,28(sp)
    124c:	01812403          	lw	s0,24(sp)
    1250:	01412483          	lw	s1,20(sp)
    1254:	01012903          	lw	s2,16(sp)
    1258:	00c12983          	lw	s3,12(sp)
    125c:	02010113          	add	sp,sp,32
    1260:	00008067          	ret

00001264 <.L2>:
    1264:	00068513          	mv	a0,a3
    1268:	4c9000ef          	jal	1f30 <__stdio_trans2w>
    126c:	fc050ae3          	beqz	a0,1240 <.L5>
    1270:	fd5ff06f          	j	1244 <.L10>

00001274 <.L3>:
    1274:	fc0908e3          	beqz	s2,1244 <.L10>
    1278:	0324b7b3          	mulhu	a5,s1,s2
    127c:	00079e63          	bnez	a5,1298 <.L9>
    1280:	032485b3          	mul	a1,s1,s2
    1284:	00040613          	mv	a2,s0
    1288:	00098513          	mv	a0,s3
    128c:	355000ef          	jal	1de0 <__stdio_fwrite>
    1290:	02955533          	divu	a0,a0,s1
    1294:	fb5ff06f          	j	1248 <.L1>

00001298 <.L9>:
    1298:	00045783          	lhu	a5,0(s0)
    129c:	01600713          	li	a4,22
    12a0:	0087e793          	or	a5,a5,8
    12a4:	00f41023          	sh	a5,0(s0)
    12a8:	00006797          	auipc	a5,0x6
    12ac:	dcc7a783          	lw	a5,-564(a5) # 7074 <_GLOBAL_OFFSET_TABLE_+0xc>
    12b0:	00e7a023          	sw	a4,0(a5)
    12b4:	f91ff06f          	j	1244 <.L10>

000012b8 <__GI_memcpy>:
    12b8:	00f00713          	li	a4,15
    12bc:	00050693          	mv	a3,a0
    12c0:	00058793          	mv	a5,a1
    12c4:	16c77a63          	bgeu	a4,a2,1438 <.L2>
    12c8:	40a007b3          	neg	a5,a0
    12cc:	0037f793          	and	a5,a5,3
    12d0:	40f60633          	sub	a2,a2,a5
    12d4:	00000713          	li	a4,0

000012d8 <.L3>:
    12d8:	04e79463          	bne	a5,a4,1320 <.L4>
    12dc:	00f585b3          	add	a1,a1,a5
    12e0:	00f508b3          	add	a7,a0,a5
    12e4:	0035fe13          	and	t3,a1,3
    12e8:	00088793          	mv	a5,a7
    12ec:	00265713          	srl	a4,a2,0x2
    12f0:	140e1a63          	bnez	t3,1444 <.L5>
    12f4:	00777693          	and	a3,a4,7
    12f8:	fff68693          	add	a3,a3,-1
    12fc:	00600313          	li	t1,6
    1300:	0005a803          	lw	a6,0(a1)
    1304:	0ed36863          	bltu	t1,a3,13f4 <.L6>
    1308:	87018313          	add	t1,gp,-1936 # 7150 <.L8>
    130c:	00269693          	sll	a3,a3,0x2
    1310:	006686b3          	add	a3,a3,t1
    1314:	0006a683          	lw	a3,0(a3)
    1318:	006686b3          	add	a3,a3,t1
    131c:	00068067          	jr	a3

00001320 <.L4>:
    1320:	00e586b3          	add	a3,a1,a4
    1324:	0006c803          	lbu	a6,0(a3)
    1328:	00e506b3          	add	a3,a0,a4
    132c:	00170713          	add	a4,a4,1
    1330:	01068023          	sb	a6,0(a3)
    1334:	fa5ff06f          	j	12d8 <.L3>

00001338 <.L13>:
    1338:	fe858693          	add	a3,a1,-24
    133c:	fe488793          	add	a5,a7,-28
    1340:	00670713          	add	a4,a4,6

00001344 <.L15>:
    1344:	01c6a303          	lw	t1,28(a3)
    1348:	ff870713          	add	a4,a4,-8
    134c:	0107ae23          	sw	a6,28(a5)
    1350:	02078813          	add	a6,a5,32
    1354:	0c070863          	beqz	a4,1424 <.L23>
    1358:	00080793          	mv	a5,a6
    135c:	02068693          	add	a3,a3,32
    1360:	00030813          	mv	a6,t1
    1364:	0b00006f          	j	1414 <.L22>

00001368 <.L12>:
    1368:	fec58693          	add	a3,a1,-20
    136c:	fe888793          	add	a5,a7,-24
    1370:	00570713          	add	a4,a4,5

00001374 <.L16>:
    1374:	0186a303          	lw	t1,24(a3)
    1378:	0107ac23          	sw	a6,24(a5)
    137c:	00030813          	mv	a6,t1
    1380:	fc5ff06f          	j	1344 <.L15>

00001384 <.L11>:
    1384:	ff058693          	add	a3,a1,-16
    1388:	fec88793          	add	a5,a7,-20
    138c:	00470713          	add	a4,a4,4

00001390 <.L17>:
    1390:	0146a303          	lw	t1,20(a3)
    1394:	0107aa23          	sw	a6,20(a5)
    1398:	00030813          	mv	a6,t1
    139c:	fd9ff06f          	j	1374 <.L16>

000013a0 <.L10>:
    13a0:	ff458693          	add	a3,a1,-12
    13a4:	ff088793          	add	a5,a7,-16
    13a8:	00370713          	add	a4,a4,3

000013ac <.L18>:
    13ac:	0106a303          	lw	t1,16(a3)
    13b0:	0107a823          	sw	a6,16(a5)
    13b4:	00030813          	mv	a6,t1
    13b8:	fd9ff06f          	j	1390 <.L17>

000013bc <.L9>:
    13bc:	ff858693          	add	a3,a1,-8
    13c0:	ff488793          	add	a5,a7,-12
    13c4:	00270713          	add	a4,a4,2

000013c8 <.L19>:
    13c8:	00c6a303          	lw	t1,12(a3)
    13cc:	0107a623          	sw	a6,12(a5)
    13d0:	00030813          	mv	a6,t1
    13d4:	fd9ff06f          	j	13ac <.L18>

000013d8 <.L7>:
    13d8:	ffc58693          	add	a3,a1,-4
    13dc:	ff888793          	add	a5,a7,-8
    13e0:	00170713          	add	a4,a4,1

000013e4 <.L20>:
    13e4:	0086a303          	lw	t1,8(a3)
    13e8:	0107a423          	sw	a6,8(a5)
    13ec:	00030813          	mv	a6,t1
    13f0:	fd9ff06f          	j	13c8 <.L19>

000013f4 <.L6>:
    13f4:	00058693          	mv	a3,a1
    13f8:	ffc88793          	add	a5,a7,-4

000013fc <.L21>:
    13fc:	0046a303          	lw	t1,4(a3)
    1400:	0107a223          	sw	a6,4(a5)
    1404:	00030813          	mv	a6,t1
    1408:	fddff06f          	j	13e4 <.L20>

0000140c <.L14>:
    140c:	00458693          	add	a3,a1,4
    1410:	fff70713          	add	a4,a4,-1

00001414 <.L22>:
    1414:	0006a303          	lw	t1,0(a3)
    1418:	0107a023          	sw	a6,0(a5)
    141c:	00030813          	mv	a6,t1
    1420:	fddff06f          	j	13fc <.L21>

00001424 <.L23>:
    1424:	0267a023          	sw	t1,32(a5)

00001428 <.L24>:
    1428:	ffc67693          	and	a3,a2,-4
    142c:	00b687b3          	add	a5,a3,a1
    1430:	00367613          	and	a2,a2,3
    1434:	011686b3          	add	a3,a3,a7

00001438 <.L2>:
    1438:	00000713          	li	a4,0

0000143c <.L34>:
    143c:	10e61663          	bne	a2,a4,1548 <.L35>
    1440:	00008067          	ret

00001444 <.L5>:
    1444:	ffc5fe93          	and	t4,a1,-4
    1448:	003e1e13          	sll	t3,t3,0x3
    144c:	02000f93          	li	t6,32
    1450:	00377f13          	and	t5,a4,3
    1454:	00200293          	li	t0,2
    1458:	000ea683          	lw	a3,0(t4)
    145c:	004ea803          	lw	a6,4(t4)
    1460:	41cf8fb3          	sub	t6,t6,t3
    1464:	004e8313          	add	t1,t4,4
    1468:	025f0c63          	beq	t5,t0,14a0 <.L25>
    146c:	00300293          	li	t0,3
    1470:	065f0863          	beq	t5,t0,14e0 <.L26>
    1474:	00100293          	li	t0,1
    1478:	085f0a63          	beq	t5,t0,150c <.L27>
    147c:	ffc88793          	add	a5,a7,-4

00001480 <.L31>:
    1480:	00432e83          	lw	t4,4(t1)
    1484:	01f81f33          	sll	t5,a6,t6
    1488:	01c6d6b3          	srl	a3,a3,t3
    148c:	01e6e6b3          	or	a3,a3,t5
    1490:	00d7a223          	sw	a3,4(a5)
    1494:	00080693          	mv	a3,a6
    1498:	000e8813          	mv	a6,t4
    149c:	0500006f          	j	14ec <.L30>

000014a0 <.L25>:
    14a0:	ffce8313          	add	t1,t4,-4
    14a4:	ff488793          	add	a5,a7,-12
    14a8:	00270713          	add	a4,a4,2

000014ac <.L29>:
    14ac:	01c6d6b3          	srl	a3,a3,t3
    14b0:	01f81f33          	sll	t5,a6,t6
    14b4:	01e6e6b3          	or	a3,a3,t5
    14b8:	00c32e83          	lw	t4,12(t1)
    14bc:	ffc70713          	add	a4,a4,-4
    14c0:	00d7a623          	sw	a3,12(a5)
    14c4:	01078693          	add	a3,a5,16
    14c8:	06070663          	beqz	a4,1534 <.L33>
    14cc:	00068793          	mv	a5,a3
    14d0:	01030313          	add	t1,t1,16
    14d4:	00080693          	mv	a3,a6
    14d8:	000e8813          	mv	a6,t4
    14dc:	0380006f          	j	1514 <.L32>

000014e0 <.L26>:
    14e0:	000e8313          	mv	t1,t4
    14e4:	ff888793          	add	a5,a7,-8
    14e8:	00170713          	add	a4,a4,1

000014ec <.L30>:
    14ec:	00832e83          	lw	t4,8(t1)
    14f0:	01f81f33          	sll	t5,a6,t6
    14f4:	01c6d6b3          	srl	a3,a3,t3
    14f8:	01e6e6b3          	or	a3,a3,t5
    14fc:	00d7a423          	sw	a3,8(a5)
    1500:	00080693          	mv	a3,a6
    1504:	000e8813          	mv	a6,t4
    1508:	fa5ff06f          	j	14ac <.L29>

0000150c <.L27>:
    150c:	008e8313          	add	t1,t4,8
    1510:	fff70713          	add	a4,a4,-1

00001514 <.L32>:
    1514:	00032e83          	lw	t4,0(t1)
    1518:	01f81f33          	sll	t5,a6,t6
    151c:	01c6d6b3          	srl	a3,a3,t3
    1520:	01e6e6b3          	or	a3,a3,t5
    1524:	00d7a023          	sw	a3,0(a5)
    1528:	00080693          	mv	a3,a6
    152c:	000e8813          	mv	a6,t4
    1530:	f51ff06f          	j	1480 <.L31>

00001534 <.L33>:
    1534:	01c85833          	srl	a6,a6,t3
    1538:	01fe9eb3          	sll	t4,t4,t6
    153c:	01d86833          	or	a6,a6,t4
    1540:	0107a823          	sw	a6,16(a5)
    1544:	ee5ff06f          	j	1428 <.L24>

00001548 <.L35>:
    1548:	00e785b3          	add	a1,a5,a4
    154c:	0005c803          	lbu	a6,0(a1)
    1550:	00e685b3          	add	a1,a3,a4
    1554:	00170713          	add	a4,a4,1
    1558:	01058023          	sb	a6,0(a1)
    155c:	ee1ff06f          	j	143c <.L34>

00001560 <__GI_memset>:
    1560:	00700713          	li	a4,7
    1564:	00050793          	mv	a5,a0
    1568:	04c77263          	bgeu	a4,a2,15ac <.L2>
    156c:	010106b7          	lui	a3,0x1010
    1570:	0ff5f713          	zext.b	a4,a1
    1574:	10168693          	add	a3,a3,257 # 1010101 <_ebss+0x10052a1>
    1578:	02d70733          	mul	a4,a4,a3

0000157c <.L3>:
    157c:	0037f693          	and	a3,a5,3
    1580:	02069c63          	bnez	a3,15b8 <.L4>
    1584:	00c50633          	add	a2,a0,a2
    1588:	40f60633          	sub	a2,a2,a5
    158c:	fe067813          	and	a6,a2,-32
    1590:	00f80833          	add	a6,a6,a5
    1594:	00080693          	mv	a3,a6

00001598 <.L5>:
    1598:	03079663          	bne	a5,a6,15c4 <.L6>
    159c:	01c67813          	and	a6,a2,28
    15a0:	00f807b3          	add	a5,a6,a5

000015a4 <.L7>:
    15a4:	04f69463          	bne	a3,a5,15ec <.L8>
    15a8:	00367613          	and	a2,a2,3

000015ac <.L2>:
    15ac:	00c78633          	add	a2,a5,a2

000015b0 <.L9>:
    15b0:	04c79463          	bne	a5,a2,15f8 <.L10>
    15b4:	00008067          	ret

000015b8 <.L4>:
    15b8:	00b78023          	sb	a1,0(a5)
    15bc:	00178793          	add	a5,a5,1
    15c0:	fbdff06f          	j	157c <.L3>

000015c4 <.L6>:
    15c4:	00e7a023          	sw	a4,0(a5)
    15c8:	00e7a223          	sw	a4,4(a5)
    15cc:	00e7a423          	sw	a4,8(a5)
    15d0:	00e7a623          	sw	a4,12(a5)
    15d4:	00e7a823          	sw	a4,16(a5)
    15d8:	00e7aa23          	sw	a4,20(a5)
    15dc:	00e7ac23          	sw	a4,24(a5)
    15e0:	00e7ae23          	sw	a4,28(a5)
    15e4:	02078793          	add	a5,a5,32
    15e8:	fb1ff06f          	j	1598 <.L5>

000015ec <.L8>:
    15ec:	00e6a023          	sw	a4,0(a3)
    15f0:	00468693          	add	a3,a3,4
    15f4:	fb1ff06f          	j	15a4 <.L7>

000015f8 <.L10>:
    15f8:	00b78023          	sb	a1,0(a5)
    15fc:	00178793          	add	a5,a5,1
    1600:	fb1ff06f          	j	15b0 <.L9>

00001604 <__GI_strlen>:
    1604:	00050793          	mv	a5,a0

00001608 <.L2>:
    1608:	0037f713          	and	a4,a5,3
    160c:	04071263          	bnez	a4,1650 <.L5>
    1610:	feff0637          	lui	a2,0xfeff0
    1614:	808085b7          	lui	a1,0x80808
    1618:	eff60613          	add	a2,a2,-257 # fefefeff <_ebss+0xfefe509f>
    161c:	08058593          	add	a1,a1,128 # 80808080 <_ebss+0x807fd220>

00001620 <.L6>:
    1620:	0007a683          	lw	a3,0(a5)
    1624:	00478713          	add	a4,a5,4
    1628:	00c686b3          	add	a3,a3,a2
    162c:	00b6f6b3          	and	a3,a3,a1
    1630:	02068c63          	beqz	a3,1668 <.L7>
    1634:	ffc74683          	lbu	a3,-4(a4)
    1638:	02068063          	beqz	a3,1658 <.L14>
    163c:	ffd74683          	lbu	a3,-3(a4)
    1640:	02069863          	bnez	a3,1670 <.L9>
    1644:	40a787b3          	sub	a5,a5,a0
    1648:	00178513          	add	a0,a5,1
    164c:	00008067          	ret

00001650 <.L5>:
    1650:	0007c703          	lbu	a4,0(a5)
    1654:	00071663          	bnez	a4,1660 <.L3>

00001658 <.L14>:
    1658:	40a78533          	sub	a0,a5,a0
    165c:	00008067          	ret

00001660 <.L3>:
    1660:	00178793          	add	a5,a5,1
    1664:	fa5ff06f          	j	1608 <.L2>

00001668 <.L7>:
    1668:	00070793          	mv	a5,a4
    166c:	fb5ff06f          	j	1620 <.L6>

00001670 <.L9>:
    1670:	ffe74683          	lbu	a3,-2(a4)
    1674:	00069863          	bnez	a3,1684 <.L10>
    1678:	40a787b3          	sub	a5,a5,a0
    167c:	00278513          	add	a0,a5,2
    1680:	00008067          	ret

00001684 <.L10>:
    1684:	fff74683          	lbu	a3,-1(a4)
    1688:	fe0690e3          	bnez	a3,1668 <.L7>
    168c:	40a787b3          	sub	a5,a5,a0
    1690:	00378513          	add	a0,a5,3
    1694:	00008067          	ret

00001698 <__GI_strnlen>:
    1698:	00050713          	mv	a4,a0
    169c:	00058513          	mv	a0,a1
    16a0:	06058a63          	beqz	a1,1714 <.L2>
    16a4:	00b705b3          	add	a1,a4,a1
    16a8:	00e5f463          	bgeu	a1,a4,16b0 <.L3>
    16ac:	fff00593          	li	a1,-1

000016b0 <.L3>:
    16b0:	00070793          	mv	a5,a4

000016b4 <.L4>:
    16b4:	0037f693          	and	a3,a5,3
    16b8:	04069463          	bnez	a3,1700 <.L7>
    16bc:	feff0537          	lui	a0,0xfeff0
    16c0:	80808837          	lui	a6,0x80808
    16c4:	00078693          	mv	a3,a5
    16c8:	eff50513          	add	a0,a0,-257 # fefefeff <_ebss+0xfefe509f>
    16cc:	08080813          	add	a6,a6,128 # 80808080 <_ebss+0x807fd220>

000016d0 <.L8>:
    16d0:	02b6fc63          	bgeu	a3,a1,1708 <.L10>
    16d4:	0006a783          	lw	a5,0(a3)
    16d8:	00468613          	add	a2,a3,4
    16dc:	00a787b3          	add	a5,a5,a0
    16e0:	0107f7b3          	and	a5,a5,a6
    16e4:	04078e63          	beqz	a5,1740 <.L18>
    16e8:	ffc64783          	lbu	a5,-4(a2)
    16ec:	06078063          	beqz	a5,174c <.L17>
    16f0:	ffd64783          	lbu	a5,-3(a2)
    16f4:	02079663          	bnez	a5,1720 <.L11>
    16f8:	00168793          	add	a5,a3,1
    16fc:	00c0006f          	j	1708 <.L10>

00001700 <.L7>:
    1700:	0007c683          	lbu	a3,0(a5)
    1704:	00069a63          	bnez	a3,1718 <.L5>

00001708 <.L10>:
    1708:	00b7f463          	bgeu	a5,a1,1710 <.L14>
    170c:	00078593          	mv	a1,a5

00001710 <.L14>:
    1710:	40e58533          	sub	a0,a1,a4

00001714 <.L2>:
    1714:	00008067          	ret

00001718 <.L5>:
    1718:	00178793          	add	a5,a5,1
    171c:	f99ff06f          	j	16b4 <.L4>

00001720 <.L11>:
    1720:	ffe64783          	lbu	a5,-2(a2)
    1724:	00079663          	bnez	a5,1730 <.L12>
    1728:	00268793          	add	a5,a3,2
    172c:	fddff06f          	j	1708 <.L10>

00001730 <.L12>:
    1730:	fff64783          	lbu	a5,-1(a2)
    1734:	00079663          	bnez	a5,1740 <.L18>
    1738:	00368793          	add	a5,a3,3
    173c:	fcdff06f          	j	1708 <.L10>

00001740 <.L18>:
    1740:	00058793          	mv	a5,a1
    1744:	00060693          	mv	a3,a2
    1748:	f89ff06f          	j	16d0 <.L8>

0000174c <.L17>:
    174c:	00068793          	mv	a5,a3
    1750:	fb9ff06f          	j	1708 <.L10>

00001754 <__GI___glibc_strerror_r>:
    1754:	ff010113          	add	sp,sp,-16
    1758:	00812423          	sw	s0,8(sp)
    175c:	00112623          	sw	ra,12(sp)
    1760:	00058413          	mv	s0,a1
    1764:	018000ef          	jal	177c <__GI___xpg_strerror_r>
    1768:	00c12083          	lw	ra,12(sp)
    176c:	00040513          	mv	a0,s0
    1770:	00812403          	lw	s0,8(sp)
    1774:	01010113          	add	sp,sp,16
    1778:	00008067          	ret

0000177c <__GI___xpg_strerror_r>:
    177c:	fa010113          	add	sp,sp,-96
    1780:	05312623          	sw	s3,76(sp)
    1784:	05412423          	sw	s4,72(sp)
    1788:	04112e23          	sw	ra,92(sp)
    178c:	04812c23          	sw	s0,88(sp)
    1790:	04912a23          	sw	s1,84(sp)
    1794:	05212823          	sw	s2,80(sp)
    1798:	07c00793          	li	a5,124
    179c:	00058993          	mv	s3,a1
    17a0:	00060a13          	mv	s4,a2
    17a4:	08a7f463          	bgeu	a5,a0,182c <.L13>

000017a8 <.L3>:
    17a8:	00050593          	mv	a1,a0
    17ac:	41f55613          	sra	a2,a0,0x1f
    17b0:	00000713          	li	a4,0
    17b4:	ff600693          	li	a3,-10
    17b8:	03d10513          	add	a0,sp,61
    17bc:	101000ef          	jal	20bc <_uintmaxtostr>
    17c0:	ff250913          	add	s2,a0,-14
    17c4:	00e00613          	li	a2,14
    17c8:	00007597          	auipc	a1,0x7
    17cc:	b5058593          	add	a1,a1,-1200 # 8318 <unknown.0>
    17d0:	00090513          	mv	a0,s2
    17d4:	ae5ff0ef          	jal	12b8 <__GI_memcpy>
    17d8:	01600493          	li	s1,22
    17dc:	01c0006f          	j	17f8 <.L6>

000017e0 <.L5>:
    17e0:	00079463          	bnez	a5,17e8 <.L4>
    17e4:	fff48493          	add	s1,s1,-1

000017e8 <.L4>:
    17e8:	00190913          	add	s2,s2,1

000017ec <.L2>:
    17ec:	00094783          	lbu	a5,0(s2)
    17f0:	fe0498e3          	bnez	s1,17e0 <.L5>
    17f4:	fa078ae3          	beqz	a5,17a8 <.L3>

000017f8 <.L6>:
    17f8:	00099463          	bnez	s3,1800 <.L7>
    17fc:	00000a13          	li	s4,0

00001800 <.L7>:
    1800:	00090513          	mv	a0,s2
    1804:	e01ff0ef          	jal	1604 <__GI_strlen>
    1808:	00150413          	add	s0,a0,1
    180c:	028a7863          	bgeu	s4,s0,183c <.L8>
    1810:	000a0413          	mv	s0,s4
    1814:	02200493          	li	s1,34
    1818:	020a1463          	bnez	s4,1840 <.L9>

0000181c <.L10>:
    181c:	00006797          	auipc	a5,0x6
    1820:	8587a783          	lw	a5,-1960(a5) # 7074 <_GLOBAL_OFFSET_TABLE_+0xc>
    1824:	0097a023          	sw	s1,0(a5)
    1828:	0340006f          	j	185c <.L1>

0000182c <.L13>:
    182c:	00050493          	mv	s1,a0
    1830:	00006917          	auipc	s2,0x6
    1834:	df490913          	add	s2,s2,-524 # 7624 <_string_syserrmsgs>
    1838:	fb5ff06f          	j	17ec <.L2>

0000183c <.L8>:
    183c:	00040e63          	beqz	s0,1858 <.L11>

00001840 <.L9>:
    1840:	00098513          	mv	a0,s3
    1844:	00040613          	mv	a2,s0
    1848:	00090593          	mv	a1,s2
    184c:	008989b3          	add	s3,s3,s0
    1850:	a69ff0ef          	jal	12b8 <__GI_memcpy>
    1854:	fe098fa3          	sb	zero,-1(s3)

00001858 <.L11>:
    1858:	fc0492e3          	bnez	s1,181c <.L10>

0000185c <.L1>:
    185c:	05c12083          	lw	ra,92(sp)
    1860:	05812403          	lw	s0,88(sp)
    1864:	05012903          	lw	s2,80(sp)
    1868:	04c12983          	lw	s3,76(sp)
    186c:	04812a03          	lw	s4,72(sp)
    1870:	00048513          	mv	a0,s1
    1874:	05412483          	lw	s1,84(sp)
    1878:	06010113          	add	sp,sp,96
    187c:	00008067          	ret

00001880 <__GI_isatty>:
    1880:	fb010113          	add	sp,sp,-80
    1884:	00410593          	add	a1,sp,4
    1888:	04112623          	sw	ra,76(sp)
    188c:	014000ef          	jal	18a0 <__GI_tcgetattr>
    1890:	04c12083          	lw	ra,76(sp)
    1894:	00153513          	seqz	a0,a0
    1898:	05010113          	add	sp,sp,80
    189c:	00008067          	ret

000018a0 <__GI_tcgetattr>:
    18a0:	fc010113          	add	sp,sp,-64
    18a4:	02812c23          	sw	s0,56(sp)
    18a8:	00058413          	mv	s0,a1
    18ac:	000055b7          	lui	a1,0x5
    18b0:	00c10613          	add	a2,sp,12
    18b4:	40158593          	add	a1,a1,1025 # 5401 <.LBE5+0xd>
    18b8:	02912a23          	sw	s1,52(sp)
    18bc:	02112e23          	sw	ra,60(sp)
    18c0:	350000ef          	jal	1c10 <__GI_ioctl>
    18c4:	00050493          	mv	s1,a0
    18c8:	04051463          	bnez	a0,1910 <.L1>
    18cc:	00c12783          	lw	a5,12(sp)
    18d0:	01300613          	li	a2,19
    18d4:	01d10593          	add	a1,sp,29
    18d8:	00f42023          	sw	a5,0(s0)
    18dc:	01012783          	lw	a5,16(sp)
    18e0:	01140513          	add	a0,s0,17
    18e4:	00f42223          	sw	a5,4(s0)
    18e8:	01412783          	lw	a5,20(sp)
    18ec:	00f42423          	sw	a5,8(s0)
    18f0:	01812783          	lw	a5,24(sp)
    18f4:	00f42623          	sw	a5,12(s0)
    18f8:	01c14783          	lbu	a5,28(sp)
    18fc:	00f40823          	sb	a5,16(s0)
    1900:	508010ef          	jal	2e08 <__GI_mempcpy>
    1904:	00d00613          	li	a2,13
    1908:	00000593          	li	a1,0
    190c:	c55ff0ef          	jal	1560 <__GI_memset>

00001910 <.L1>:
    1910:	03c12083          	lw	ra,60(sp)
    1914:	03812403          	lw	s0,56(sp)
    1918:	00048513          	mv	a0,s1
    191c:	03412483          	lw	s1,52(sp)
    1920:	04010113          	add	sp,sp,64
    1924:	00008067          	ret

00001928 <__uClibc_init>:
    1928:	00009797          	auipc	a5,0x9
    192c:	4ac78793          	add	a5,a5,1196 # add4 <__pagesize>
    1930:	0007a703          	lw	a4,0(a5)
    1934:	02071063          	bnez	a4,1954 <.L1>
    1938:	00002737          	lui	a4,0x2
    193c:	00e7a023          	sw	a4,0(a5)
    1940:	00005717          	auipc	a4,0x5
    1944:	76c72703          	lw	a4,1900(a4) # 70ac <_GLOBAL_OFFSET_TABLE_+0x44>
    1948:	00070793          	mv	a5,a4
    194c:	00078463          	beqz	a5,1954 <.L1>
    1950:	00070067          	jr	a4

00001954 <.L1>:
    1954:	00008067          	ret

00001958 <__uClibc_fini>:
    1958:	ff010113          	add	sp,sp,-16
    195c:	00812423          	sw	s0,8(sp)
    1960:	00912223          	sw	s1,4(sp)
    1964:	00007417          	auipc	s0,0x7
    1968:	ac440413          	add	s0,s0,-1340 # 8428 <__TMC_END__>
    196c:	00007497          	auipc	s1,0x7
    1970:	ab848493          	add	s1,s1,-1352 # 8424 <__do_global_dtors_aux_fini_array_entry>
    1974:	40940433          	sub	s0,s0,s1
    1978:	40245413          	sra	s0,s0,0x2
    197c:	01212023          	sw	s2,0(sp)
    1980:	00112623          	sw	ra,12(sp)
    1984:	fff40413          	add	s0,s0,-1
    1988:	fff00913          	li	s2,-1

0000198c <.L9>:
    198c:	03241c63          	bne	s0,s2,19c4 <.L10>
    1990:	00009417          	auipc	s0,0x9
    1994:	44440413          	add	s0,s0,1092 # add4 <__pagesize>
    1998:	00442783          	lw	a5,4(s0)
    199c:	00078463          	beqz	a5,19a4 <.L11>
    19a0:	000780e7          	jalr	a5

000019a4 <.L11>:
    19a4:	00842783          	lw	a5,8(s0)
    19a8:	02078a63          	beqz	a5,19dc <.L8>
    19ac:	00812403          	lw	s0,8(sp)
    19b0:	00c12083          	lw	ra,12(sp)
    19b4:	00412483          	lw	s1,4(sp)
    19b8:	00012903          	lw	s2,0(sp)
    19bc:	01010113          	add	sp,sp,16
    19c0:	00078067          	jr	a5

000019c4 <.L10>:
    19c4:	00241793          	sll	a5,s0,0x2
    19c8:	00f487b3          	add	a5,s1,a5
    19cc:	0007a783          	lw	a5,0(a5)
    19d0:	fff40413          	add	s0,s0,-1
    19d4:	000780e7          	jalr	a5
    19d8:	fb5ff06f          	j	198c <.L9>

000019dc <.L8>:
    19dc:	00c12083          	lw	ra,12(sp)
    19e0:	00812403          	lw	s0,8(sp)
    19e4:	00412483          	lw	s1,4(sp)
    19e8:	00012903          	lw	s2,0(sp)
    19ec:	01010113          	add	sp,sp,16
    19f0:	00008067          	ret

000019f4 <__uClibc_main>:
    19f4:	f5010113          	add	sp,sp,-176
    19f8:	0a812423          	sw	s0,168(sp)
    19fc:	0b212023          	sw	s2,160(sp)
    1a00:	09312e23          	sw	s3,156(sp)
    1a04:	09412c23          	sw	s4,152(sp)
    1a08:	09512a23          	sw	s5,148(sp)
    1a0c:	09612823          	sw	s6,144(sp)
    1a10:	09712623          	sw	s7,140(sp)
    1a14:	0a112623          	sw	ra,172(sp)
    1a18:	0a912223          	sw	s1,164(sp)
    1a1c:	09812423          	sw	s8,136(sp)
    1a20:	09912223          	sw	s9,132(sp)
    1a24:	09a12023          	sw	s10,128(sp)
    1a28:	00070a93          	mv	s5,a4
    1a2c:	00009b17          	auipc	s6,0x9
    1a30:	3a8b0b13          	add	s6,s6,936 # add4 <__pagesize>
    1a34:	00005717          	auipc	a4,0x5
    1a38:	63c72703          	lw	a4,1596(a4) # 7070 <_GLOBAL_OFFSET_TABLE_+0x8>
    1a3c:	01072023          	sw	a6,0(a4)
    1a40:	00fb2423          	sw	a5,8(s6)
    1a44:	00158793          	add	a5,a1,1
    1a48:	00068993          	mv	s3,a3
    1a4c:	00279793          	sll	a5,a5,0x2
    1a50:	00062683          	lw	a3,0(a2)
    1a54:	00f60733          	add	a4,a2,a5
    1a58:	00005b97          	auipc	s7,0x5
    1a5c:	620bab83          	lw	s7,1568(s7) # 7078 <_GLOBAL_OFFSET_TABLE_+0x10>
    1a60:	00eba023          	sw	a4,0(s7)
    1a64:	00050a13          	mv	s4,a0
    1a68:	00058913          	mv	s2,a1
    1a6c:	00060413          	mv	s0,a2
    1a70:	00d71863          	bne	a4,a3,1a80 <.L18>
    1a74:	ffc78793          	add	a5,a5,-4
    1a78:	00f607b3          	add	a5,a2,a5
    1a7c:	00fba023          	sw	a5,0(s7)

00001a80 <.L18>:
    1a80:	00810c93          	add	s9,sp,8
    1a84:	07800613          	li	a2,120
    1a88:	00000593          	li	a1,0
    1a8c:	000c8513          	mv	a0,s9
    1a90:	ad1ff0ef          	jal	1560 <__GI_memset>
    1a94:	000bac03          	lw	s8,0(s7)

00001a98 <.L19>:
    1a98:	000c2783          	lw	a5,0(s8)
    1a9c:	004c0c13          	add	s8,s8,4
    1aa0:	fe079ce3          	bnez	a5,1a98 <.L19>
    1aa4:	00e00d13          	li	s10,14

00001aa8 <.L20>:
    1aa8:	000c2483          	lw	s1,0(s8)
    1aac:	0c049a63          	bnez	s1,1b80 <.L22>
    1ab0:	000c8513          	mv	a0,s9
    1ab4:	120000ef          	jal	1bd4 <_dl_aux_init>
    1ab8:	e71ff0ef          	jal	1928 <__uClibc_init>
    1abc:	00042783          	lw	a5,0(s0)
    1ac0:	00007717          	auipc	a4,0x7
    1ac4:	94f72423          	sw	a5,-1720(a4) # 8408 <__uclibc_progname>
    1ac8:	02078a63          	beqz	a5,1afc <.L23>
    1acc:	00005717          	auipc	a4,0x5
    1ad0:	5ec72703          	lw	a4,1516(a4) # 70b8 <_GLOBAL_OFFSET_TABLE_+0x50>
    1ad4:	00f72023          	sw	a5,0(a4)
    1ad8:	00042503          	lw	a0,0(s0)
    1adc:	02f00593          	li	a1,47
    1ae0:	42c010ef          	jal	2f0c <__GI_strrchr>
    1ae4:	00005797          	auipc	a5,0x5
    1ae8:	5a87a783          	lw	a5,1448(a5) # 708c <_GLOBAL_OFFSET_TABLE_+0x24>
    1aec:	00a7a023          	sw	a0,0(a5)
    1af0:	0a050863          	beqz	a0,1ba0 <.L24>
    1af4:	00150513          	add	a0,a0,1
    1af8:	00a7a023          	sw	a0,0(a5)

00001afc <.L23>:
    1afc:	015b2223          	sw	s5,4(s6)
    1b00:	00007b17          	auipc	s6,0x7
    1b04:	91cb0b13          	add	s6,s6,-1764 # 841c <__preinit_array_start>
    1b08:	00007a97          	auipc	s5,0x7
    1b0c:	918a8a93          	add	s5,s5,-1768 # 8420 <__frame_dummy_init_array_entry>
    1b10:	416a8ab3          	sub	s5,s5,s6
    1b14:	402ada93          	sra	s5,s5,0x2
    1b18:	00000c13          	li	s8,0

00001b1c <.L25>:
    1b1c:	095c1863          	bne	s8,s5,1bac <.L26>
    1b20:	00098463          	beqz	s3,1b28 <.L27>
    1b24:	000980e7          	jalr	s3

00001b28 <.L27>:
    1b28:	00007a97          	auipc	s5,0x7
    1b2c:	8f8a8a93          	add	s5,s5,-1800 # 8420 <__frame_dummy_init_array_entry>
    1b30:	00007997          	auipc	s3,0x7
    1b34:	8f498993          	add	s3,s3,-1804 # 8424 <__do_global_dtors_aux_fini_array_entry>
    1b38:	415989b3          	sub	s3,s3,s5
    1b3c:	4029d993          	sra	s3,s3,0x2

00001b40 <.L28>:
    1b40:	08999063          	bne	s3,s1,1bc0 <.L29>
    1b44:	00005797          	auipc	a5,0x5
    1b48:	5647a783          	lw	a5,1380(a5) # 70a8 <_GLOBAL_OFFSET_TABLE_+0x40>
    1b4c:	00078663          	beqz	a5,1b58 <.L30>
    1b50:	110000ef          	jal	1c60 <__errno_location>
    1b54:	00052023          	sw	zero,0(a0)

00001b58 <.L30>:
    1b58:	00005797          	auipc	a5,0x5
    1b5c:	5407a783          	lw	a5,1344(a5) # 7098 <_GLOBAL_OFFSET_TABLE_+0x30>
    1b60:	00078663          	beqz	a5,1b6c <.L31>
    1b64:	108000ef          	jal	1c6c <__h_errno_location>
    1b68:	00052023          	sw	zero,0(a0)

00001b6c <.L31>:
    1b6c:	000ba603          	lw	a2,0(s7)
    1b70:	00040593          	mv	a1,s0
    1b74:	00090513          	mv	a0,s2
    1b78:	000a00e7          	jalr	s4
    1b7c:	3fc010ef          	jal	2f78 <__GI_exit>

00001b80 <.L22>:
    1b80:	009d6c63          	bltu	s10,s1,1b98 <.L21>
    1b84:	00349513          	sll	a0,s1,0x3
    1b88:	00800613          	li	a2,8
    1b8c:	000c0593          	mv	a1,s8
    1b90:	00ac8533          	add	a0,s9,a0
    1b94:	f24ff0ef          	jal	12b8 <__GI_memcpy>

00001b98 <.L21>:
    1b98:	008c0c13          	add	s8,s8,8
    1b9c:	f0dff06f          	j	1aa8 <.L20>

00001ba0 <.L24>:
    1ba0:	00042703          	lw	a4,0(s0)
    1ba4:	00e7a023          	sw	a4,0(a5)
    1ba8:	f55ff06f          	j	1afc <.L23>

00001bac <.L26>:
    1bac:	000b2783          	lw	a5,0(s6)
    1bb0:	001c0c13          	add	s8,s8,1
    1bb4:	004b0b13          	add	s6,s6,4
    1bb8:	000780e7          	jalr	a5
    1bbc:	f61ff06f          	j	1b1c <.L25>

00001bc0 <.L29>:
    1bc0:	000aa783          	lw	a5,0(s5)
    1bc4:	00148493          	add	s1,s1,1
    1bc8:	004a8a93          	add	s5,s5,4
    1bcc:	000780e7          	jalr	a5
    1bd0:	f71ff06f          	j	1b40 <.L28>

00001bd4 <_dl_aux_init>:
    1bd4:	01c52703          	lw	a4,28(a0)
    1bd8:	00005797          	auipc	a5,0x5
    1bdc:	4b87a783          	lw	a5,1208(a5) # 7090 <_GLOBAL_OFFSET_TABLE_+0x28>
    1be0:	00e7a023          	sw	a4,0(a5)
    1be4:	02c52703          	lw	a4,44(a0)
    1be8:	00005797          	auipc	a5,0x5
    1bec:	4bc7a783          	lw	a5,1212(a5) # 70a4 <_GLOBAL_OFFSET_TABLE_+0x3c>
    1bf0:	00e7a023          	sw	a4,0(a5)
    1bf4:	03452783          	lw	a5,52(a0)
    1bf8:	00079463          	bnez	a5,1c00 <.L2>
    1bfc:	000027b7          	lui	a5,0x2

00001c00 <.L2>:
    1c00:	00005717          	auipc	a4,0x5
    1c04:	4b472703          	lw	a4,1204(a4) # 70b4 <_GLOBAL_OFFSET_TABLE_+0x4c>
    1c08:	00f72023          	sw	a5,0(a4)
    1c0c:	00008067          	ret

00001c10 <__GI_ioctl>:
    1c10:	fd010113          	add	sp,sp,-48
    1c14:	02f12223          	sw	a5,36(sp)
    1c18:	01810793          	add	a5,sp,24
    1c1c:	03112623          	sw	a7,44(sp)
    1c20:	00c12c23          	sw	a2,24(sp)
    1c24:	00d12e23          	sw	a3,28(sp)
    1c28:	02e12023          	sw	a4,32(sp)
    1c2c:	03012423          	sw	a6,40(sp)
    1c30:	00f12623          	sw	a5,12(sp)
    1c34:	01d00893          	li	a7,29
    1c38:	00000073          	ecall
    1c3c:	fffff7b7          	lui	a5,0xfffff
    1c40:	00a7fc63          	bgeu	a5,a0,1c58 <.L1>
    1c44:	40a00533          	neg	a0,a0
    1c48:	00005797          	auipc	a5,0x5
    1c4c:	42c7a783          	lw	a5,1068(a5) # 7074 <_GLOBAL_OFFSET_TABLE_+0xc>
    1c50:	00a7a023          	sw	a0,0(a5)
    1c54:	fff00513          	li	a0,-1

00001c58 <.L1>:
    1c58:	03010113          	add	sp,sp,48
    1c5c:	00008067          	ret

00001c60 <__errno_location>:
    1c60:	00005517          	auipc	a0,0x5
    1c64:	41452503          	lw	a0,1044(a0) # 7074 <_GLOBAL_OFFSET_TABLE_+0xc>
    1c68:	00008067          	ret

00001c6c <__h_errno_location>:
    1c6c:	00005517          	auipc	a0,0x5
    1c70:	41052503          	lw	a0,1040(a0) # 707c <_GLOBAL_OFFSET_TABLE_+0x14>
    1c74:	00008067          	ret

00001c78 <__stdio_WRITE>:
    1c78:	fd010113          	add	sp,sp,-48
    1c7c:	01512a23          	sw	s5,20(sp)
    1c80:	80000ab7          	lui	s5,0x80000
    1c84:	02812423          	sw	s0,40(sp)
    1c88:	02912223          	sw	s1,36(sp)
    1c8c:	03212023          	sw	s2,32(sp)
    1c90:	01312e23          	sw	s3,28(sp)
    1c94:	01612823          	sw	s6,16(sp)
    1c98:	01712623          	sw	s7,12(sp)
    1c9c:	01812423          	sw	s8,8(sp)
    1ca0:	02112623          	sw	ra,44(sp)
    1ca4:	01412c23          	sw	s4,24(sp)
    1ca8:	00050493          	mv	s1,a0
    1cac:	00058413          	mv	s0,a1
    1cb0:	00060993          	mv	s3,a2
    1cb4:	00060913          	mv	s2,a2
    1cb8:	fffa8a93          	add	s5,s5,-1 # 7fffffff <_ebss+0x7fff519f>
    1cbc:	ffe00b93          	li	s7,-2
    1cc0:	00005b17          	auipc	s6,0x5
    1cc4:	3b4b2b03          	lw	s6,948(s6) # 7074 <_GLOBAL_OFFSET_TABLE_+0xc>
    1cc8:	00b00c13          	li	s8,11

00001ccc <.L2>:
    1ccc:	04090c63          	beqz	s2,1d24 <.L10>
    1cd0:	00090a13          	mv	s4,s2
    1cd4:	00090613          	mv	a2,s2
    1cd8:	00095463          	bgez	s2,1ce0 <.L3>
    1cdc:	000a8613          	mv	a2,s5

00001ce0 <.L3>:
    1ce0:	0044a503          	lw	a0,4(s1)
    1ce4:	09751c63          	bne	a0,s7,1d7c <.L4>
    1ce8:	02c4a783          	lw	a5,44(s1)
    1cec:	06079663          	bnez	a5,1d58 <.L5>
    1cf0:	01600793          	li	a5,22
    1cf4:	00fb2023          	sw	a5,0(s6)

00001cf8 <.L6>:
    1cf8:	0004d783          	lhu	a5,0(s1)
    1cfc:	00400713          	li	a4,4
    1d00:	0087e793          	or	a5,a5,8
    1d04:	00f49023          	sh	a5,0(s1)
    1d08:	00005797          	auipc	a5,0x5
    1d0c:	36c7a783          	lw	a5,876(a5) # 7074 <_GLOBAL_OFFSET_TABLE_+0xc>
    1d10:	0007a783          	lw	a5,0(a5)
    1d14:	06e78a63          	beq	a5,a4,1d88 <.L9>
    1d18:	00b00713          	li	a4,11
    1d1c:	06e78663          	beq	a5,a4,1d88 <.L9>

00001d20 <.L11>:
    1d20:	412989b3          	sub	s3,s3,s2

00001d24 <.L10>:
    1d24:	02c12083          	lw	ra,44(sp)
    1d28:	02812403          	lw	s0,40(sp)
    1d2c:	02412483          	lw	s1,36(sp)
    1d30:	02012903          	lw	s2,32(sp)
    1d34:	01812a03          	lw	s4,24(sp)
    1d38:	01412a83          	lw	s5,20(sp)
    1d3c:	01012b03          	lw	s6,16(sp)
    1d40:	00c12b83          	lw	s7,12(sp)
    1d44:	00812c03          	lw	s8,8(sp)
    1d48:	00098513          	mv	a0,s3
    1d4c:	01c12983          	lw	s3,28(sp)
    1d50:	03010113          	add	sp,sp,48
    1d54:	00008067          	ret

00001d58 <.L5>:
    1d58:	0244a503          	lw	a0,36(s1)
    1d5c:	018b2023          	sw	s8,0(s6)
    1d60:	00040593          	mv	a1,s0
    1d64:	000780e7          	jalr	a5
    1d68:	f80508e3          	beqz	a0,1cf8 <.L6>

00001d6c <.L7>:
    1d6c:	f80546e3          	bltz	a0,1cf8 <.L6>
    1d70:	40a90933          	sub	s2,s2,a0
    1d74:	00a40433          	add	s0,s0,a0
    1d78:	f55ff06f          	j	1ccc <.L2>

00001d7c <.L4>:
    1d7c:	00040593          	mv	a1,s0
    1d80:	268010ef          	jal	2fe8 <__GI_write>
    1d84:	fe9ff06f          	j	1d6c <.L7>

00001d88 <.L9>:
    1d88:	0084a783          	lw	a5,8(s1)
    1d8c:	00c4a683          	lw	a3,12(s1)
    1d90:	40f68733          	sub	a4,a3,a5
    1d94:	f8f686e3          	beq	a3,a5,1d20 <.L11>
    1d98:	00e96463          	bltu	s2,a4,1da0 <.L12>
    1d9c:	00070a13          	mv	s4,a4

00001da0 <.L12>:
    1da0:	00a00693          	li	a3,10
    1da4:	01440a33          	add	s4,s0,s4

00001da8 <.L15>:
    1da8:	00044703          	lbu	a4,0(s0)
    1dac:	00e78023          	sb	a4,0(a5)
    1db0:	00d71863          	bne	a4,a3,1dc0 <.L13>
    1db4:	0004d703          	lhu	a4,0(s1)
    1db8:	10077713          	and	a4,a4,256
    1dbc:	00071863          	bnez	a4,1dcc <.L14>

00001dc0 <.L13>:
    1dc0:	00140413          	add	s0,s0,1
    1dc4:	00178793          	add	a5,a5,1
    1dc8:	ff4410e3          	bne	s0,s4,1da8 <.L15>

00001dcc <.L14>:
    1dcc:	0084a703          	lw	a4,8(s1)
    1dd0:	00f4a823          	sw	a5,16(s1)
    1dd4:	40e787b3          	sub	a5,a5,a4
    1dd8:	40f90933          	sub	s2,s2,a5
    1ddc:	f45ff06f          	j	1d20 <.L11>

00001de0 <__stdio_fwrite>:
    1de0:	00065783          	lhu	a5,0(a2)
    1de4:	fe010113          	add	sp,sp,-32
    1de8:	00812c23          	sw	s0,24(sp)
    1dec:	00912a23          	sw	s1,20(sp)
    1df0:	01212823          	sw	s2,16(sp)
    1df4:	00112e23          	sw	ra,28(sp)
    1df8:	01312623          	sw	s3,12(sp)
    1dfc:	2007f793          	and	a5,a5,512
    1e00:	00050913          	mv	s2,a0
    1e04:	00058413          	mv	s0,a1
    1e08:	00060493          	mv	s1,a2
    1e0c:	02078663          	beqz	a5,1e38 <.L2>

00001e10 <.L11>:
    1e10:	00040613          	mv	a2,s0
    1e14:	01812403          	lw	s0,24(sp)
    1e18:	01c12083          	lw	ra,28(sp)
    1e1c:	00c12983          	lw	s3,12(sp)
    1e20:	00090593          	mv	a1,s2
    1e24:	00048513          	mv	a0,s1
    1e28:	01012903          	lw	s2,16(sp)
    1e2c:	01412483          	lw	s1,20(sp)
    1e30:	02010113          	add	sp,sp,32
    1e34:	e45ff06f          	j	1c78 <__stdio_WRITE>

00001e38 <.L2>:
    1e38:	01062503          	lw	a0,16(a2)
    1e3c:	00c62783          	lw	a5,12(a2)
    1e40:	00462683          	lw	a3,4(a2)
    1e44:	ffd00713          	li	a4,-3
    1e48:	40a787b3          	sub	a5,a5,a0
    1e4c:	04e69463          	bne	a3,a4,1e94 <.L3>
    1e50:	00058993          	mv	s3,a1
    1e54:	00b7f463          	bgeu	a5,a1,1e5c <.L4>
    1e58:	00078993          	mv	s3,a5

00001e5c <.L4>:
    1e5c:	00098613          	mv	a2,s3
    1e60:	00090593          	mv	a1,s2
    1e64:	c54ff0ef          	jal	12b8 <__GI_memcpy>
    1e68:	0104a783          	lw	a5,16(s1)
    1e6c:	013787b3          	add	a5,a5,s3

00001e70 <.L25>:
    1e70:	00f4a823          	sw	a5,16(s1)

00001e74 <.L5>:
    1e74:	01c12083          	lw	ra,28(sp)
    1e78:	00040513          	mv	a0,s0
    1e7c:	01812403          	lw	s0,24(sp)
    1e80:	01412483          	lw	s1,20(sp)
    1e84:	01012903          	lw	s2,16(sp)
    1e88:	00c12983          	lw	s3,12(sp)
    1e8c:	02010113          	add	sp,sp,32
    1e90:	00008067          	ret

00001e94 <.L3>:
    1e94:	08b7e063          	bltu	a5,a1,1f14 <.L6>
    1e98:	00058613          	mv	a2,a1
    1e9c:	00090593          	mv	a1,s2
    1ea0:	c18ff0ef          	jal	12b8 <__GI_memcpy>
    1ea4:	0104a783          	lw	a5,16(s1)
    1ea8:	008787b3          	add	a5,a5,s0
    1eac:	00f4a823          	sw	a5,16(s1)
    1eb0:	0004d783          	lhu	a5,0(s1)
    1eb4:	1007f793          	and	a5,a5,256
    1eb8:	fa078ee3          	beqz	a5,1e74 <.L5>
    1ebc:	00040613          	mv	a2,s0
    1ec0:	00a00593          	li	a1,10
    1ec4:	00090513          	mv	a0,s2
    1ec8:	775000ef          	jal	2e3c <__GI_memrchr>
    1ecc:	fa0504e3          	beqz	a0,1e74 <.L5>
    1ed0:	00048513          	mv	a0,s1
    1ed4:	b78fe0ef          	jal	24c <__stdio_wcommit>
    1ed8:	f8050ee3          	beqz	a0,1e74 <.L5>
    1edc:	00040613          	mv	a2,s0
    1ee0:	00857463          	bgeu	a0,s0,1ee8 <.L10>
    1ee4:	00050613          	mv	a2,a0

00001ee8 <.L10>:
    1ee8:	40c40533          	sub	a0,s0,a2
    1eec:	00a00593          	li	a1,10
    1ef0:	00a90533          	add	a0,s2,a0
    1ef4:	64d000ef          	jal	2d40 <__GI_memchr>
    1ef8:	f6050ee3          	beqz	a0,1e74 <.L5>
    1efc:	0104a783          	lw	a5,16(s1)
    1f00:	00890933          	add	s2,s2,s0
    1f04:	40a90533          	sub	a0,s2,a0
    1f08:	40a40433          	sub	s0,s0,a0
    1f0c:	40a787b3          	sub	a5,a5,a0
    1f10:	f61ff06f          	j	1e70 <.L25>

00001f14 <.L6>:
    1f14:	00862783          	lw	a5,8(a2)
    1f18:	eea78ce3          	beq	a5,a0,1e10 <.L11>
    1f1c:	00060513          	mv	a0,a2
    1f20:	b2cfe0ef          	jal	24c <__stdio_wcommit>
    1f24:	ee0506e3          	beqz	a0,1e10 <.L11>
    1f28:	00000413          	li	s0,0
    1f2c:	f49ff06f          	j	1e74 <.L5>

00001f30 <__stdio_trans2w>:
    1f30:	00055603          	lhu	a2,0(a0)
    1f34:	ff010113          	add	sp,sp,-16
    1f38:	00812423          	sw	s0,8(sp)
    1f3c:	00112623          	sw	ra,12(sp)
    1f40:	02067793          	and	a5,a2,32
    1f44:	00050413          	mv	s0,a0
    1f48:	02078a63          	beqz	a5,1f7c <.L2>
    1f4c:	00005797          	auipc	a5,0x5
    1f50:	1287a783          	lw	a5,296(a5) # 7074 <_GLOBAL_OFFSET_TABLE_+0xc>
    1f54:	00900713          	li	a4,9
    1f58:	00e7a023          	sw	a4,0(a5)

00001f5c <.L3>:
    1f5c:	00045783          	lhu	a5,0(s0)
    1f60:	fff00513          	li	a0,-1
    1f64:	0087e793          	or	a5,a5,8
    1f68:	00f41023          	sh	a5,0(s0)

00001f6c <.L1>:
    1f6c:	00c12083          	lw	ra,12(sp)
    1f70:	00812403          	lw	s0,8(sp)
    1f74:	01010113          	add	sp,sp,16
    1f78:	00008067          	ret

00001f7c <.L2>:
    1f7c:	00367793          	and	a5,a2,3
    1f80:	02078463          	beqz	a5,1fa8 <.L5>
    1f84:	00467793          	and	a5,a2,4
    1f88:	02078e63          	beqz	a5,1fc4 <.L6>

00001f8c <.L8>:
    1f8c:	00045783          	lhu	a5,0(s0)
    1f90:	ffc7f793          	and	a5,a5,-4
    1f94:	00f41023          	sh	a5,0(s0)
    1f98:	00842783          	lw	a5,8(s0)
    1f9c:	00f42c23          	sw	a5,24(s0)
    1fa0:	00f42823          	sw	a5,16(s0)
    1fa4:	00f42a23          	sw	a5,20(s0)

00001fa8 <.L5>:
    1fa8:	00045783          	lhu	a5,0(s0)
    1fac:	0407e713          	or	a4,a5,64
    1fb0:	00e41023          	sh	a4,0(s0)
    1fb4:	3007f793          	and	a5,a5,768
    1fb8:	04078063          	beqz	a5,1ff8 <.L10>

00001fbc <.L11>:
    1fbc:	00000513          	li	a0,0
    1fc0:	fadff06f          	j	1f6c <.L1>

00001fc4 <.L6>:
    1fc4:	01452703          	lw	a4,20(a0)
    1fc8:	01052783          	lw	a5,16(a0)
    1fcc:	00f71663          	bne	a4,a5,1fd8 <.L7>
    1fd0:	00267793          	and	a5,a2,2
    1fd4:	fa078ce3          	beqz	a5,1f8c <.L8>

00001fd8 <.L7>:
    1fd8:	40067613          	and	a2,a2,1024
    1fdc:	00c03633          	snez	a2,a2
    1fe0:	00160613          	add	a2,a2,1
    1fe4:	00000593          	li	a1,0
    1fe8:	00040513          	mv	a0,s0
    1fec:	024010ef          	jal	3010 <__GI_fseek>
    1ff0:	f8050ee3          	beqz	a0,1f8c <.L8>
    1ff4:	f69ff06f          	j	1f5c <.L3>

00001ff8 <.L10>:
    1ff8:	00c42783          	lw	a5,12(s0)
    1ffc:	00f42e23          	sw	a5,28(s0)
    2000:	fbdff06f          	j	1fbc <.L11>

00002004 <_load_inttype>:
    2004:	00001737          	lui	a4,0x1
    2008:	80070713          	add	a4,a4,-2048 # 800 <.L50+0x14>
    200c:	00050793          	mv	a5,a0
    2010:	00e57733          	and	a4,a0,a4
    2014:	0005a503          	lw	a0,0(a1)
    2018:	02064c63          	bltz	a2,2050 <.L2>
    201c:	00070663          	beqz	a4,2028 <.L3>

00002020 <.L10>:
    2020:	0045a583          	lw	a1,4(a1)
    2024:	00008067          	ret

00002028 <.L3>:
    2028:	10000713          	li	a4,256
    202c:	00e79863          	bne	a5,a4,203c <.L5>
    2030:	0ff57513          	zext.b	a0,a0

00002034 <.L6>:
    2034:	00000593          	li	a1,0
    2038:	00008067          	ret

0000203c <.L5>:
    203c:	20000713          	li	a4,512
    2040:	fee79ae3          	bne	a5,a4,2034 <.L6>
    2044:	01051513          	sll	a0,a0,0x10
    2048:	01055513          	srl	a0,a0,0x10
    204c:	fe9ff06f          	j	2034 <.L6>

00002050 <.L2>:
    2050:	fc0718e3          	bnez	a4,2020 <.L10>
    2054:	10000713          	li	a4,256
    2058:	00e79a63          	bne	a5,a4,206c <.L8>
    205c:	01851513          	sll	a0,a0,0x18
    2060:	41855513          	sra	a0,a0,0x18

00002064 <.L9>:
    2064:	41f55593          	sra	a1,a0,0x1f
    2068:	00008067          	ret

0000206c <.L8>:
    206c:	20000713          	li	a4,512
    2070:	fee79ae3          	bne	a5,a4,2064 <.L9>
    2074:	01051513          	sll	a0,a0,0x10
    2078:	41055513          	sra	a0,a0,0x10
    207c:	fe9ff06f          	j	2064 <.L9>

00002080 <_store_inttype>:
    2080:	10000793          	li	a5,256
    2084:	00f59663          	bne	a1,a5,2090 <.L2>
    2088:	00c50023          	sb	a2,0(a0)
    208c:	00008067          	ret

00002090 <.L2>:
    2090:	80058793          	add	a5,a1,-2048
    2094:	00079863          	bnez	a5,20a4 <.L4>
    2098:	00c52023          	sw	a2,0(a0)
    209c:	00d52223          	sw	a3,4(a0)
    20a0:	00008067          	ret

000020a4 <.L4>:
    20a4:	20000793          	li	a5,512
    20a8:	00f59663          	bne	a1,a5,20b4 <.L5>
    20ac:	00c51023          	sh	a2,0(a0)
    20b0:	00008067          	ret

000020b4 <.L5>:
    20b4:	00c52023          	sw	a2,0(a0)
    20b8:	00008067          	ret

000020bc <_uintmaxtostr>:
    20bc:	00050893          	mv	a7,a0
    20c0:	00000e13          	li	t3,0
    20c4:	0206d063          	bgez	a3,20e4 <.L2>
    20c8:	40d006b3          	neg	a3,a3
    20cc:	00065c63          	bgez	a2,20e4 <.L2>
    20d0:	00b037b3          	snez	a5,a1
    20d4:	40c00633          	neg	a2,a2
    20d8:	40f60633          	sub	a2,a2,a5
    20dc:	40b005b3          	neg	a1,a1
    20e0:	00100e13          	li	t3,1

000020e4 <.L2>:
    20e4:	fff00813          	li	a6,-1
    20e8:	02d85333          	divu	t1,a6,a3
    20ec:	00088023          	sb	zero,0(a7)
    20f0:	02d87833          	remu	a6,a6,a3
    20f4:	00180813          	add	a6,a6,1
    20f8:	01069663          	bne	a3,a6,2104 <.L4>
    20fc:	00130313          	add	t1,t1,1
    2100:	00000813          	li	a6,0

00002104 <.L4>:
    2104:	00900e93          	li	t4,9

00002108 <.L8>:
    2108:	02d5f533          	remu	a0,a1,a3
    210c:	02d5d5b3          	divu	a1,a1,a3
    2110:	02060463          	beqz	a2,2138 <.L5>
    2114:	02d677b3          	remu	a5,a2,a3
    2118:	02f80f33          	mul	t5,a6,a5
    211c:	02f307b3          	mul	a5,t1,a5
    2120:	00af0533          	add	a0,t5,a0
    2124:	00b785b3          	add	a1,a5,a1
    2128:	02d557b3          	divu	a5,a0,a3
    212c:	02d65633          	divu	a2,a2,a3
    2130:	00f585b3          	add	a1,a1,a5
    2134:	02d57533          	remu	a0,a0,a3

00002138 <.L5>:
    2138:	0ff57793          	zext.b	a5,a0
    213c:	02aeec63          	bltu	t4,a0,2174 <.L6>
    2140:	03078793          	add	a5,a5,48

00002144 <.L19>:
    2144:	0ff7f793          	zext.b	a5,a5
    2148:	fef88fa3          	sb	a5,-1(a7)
    214c:	00b667b3          	or	a5,a2,a1
    2150:	fff88513          	add	a0,a7,-1
    2154:	00079c63          	bnez	a5,216c <.L12>
    2158:	000e0863          	beqz	t3,2168 <.L1>
    215c:	02d00793          	li	a5,45
    2160:	fef50fa3          	sb	a5,-1(a0)
    2164:	ffe88513          	add	a0,a7,-2

00002168 <.L1>:
    2168:	00008067          	ret

0000216c <.L12>:
    216c:	00050893          	mv	a7,a0
    2170:	f99ff06f          	j	2108 <.L8>

00002174 <.L6>:
    2174:	00e787b3          	add	a5,a5,a4
    2178:	fcdff06f          	j	2144 <.L19>

0000217c <_fpmaxtostr>:
    217c:	e7010113          	add	sp,sp,-400
    2180:	00462783          	lw	a5,4(a2)
    2184:	18812423          	sw	s0,392(sp)
    2188:	00864403          	lbu	s0,8(a2)
    218c:	02f12c23          	sw	a5,56(sp)
    2190:	06500793          	li	a5,101
    2194:	18912223          	sw	s1,388(sp)
    2198:	19212023          	sw	s2,384(sp)
    219c:	17312e23          	sw	s3,380(sp)
    21a0:	17412c23          	sw	s4,376(sp)
    21a4:	17512a23          	sw	s5,372(sp)
    21a8:	17612823          	sw	s6,368(sp)
    21ac:	17912223          	sw	s9,356(sp)
    21b0:	0af10c23          	sb	a5,184(sp)
    21b4:	18112623          	sw	ra,396(sp)
    21b8:	17712623          	sw	s7,364(sp)
    21bc:	17812423          	sw	s8,360(sp)
    21c0:	17a12023          	sw	s10,352(sp)
    21c4:	15b12e23          	sw	s11,348(sp)
    21c8:	04a12823          	sw	a0,80(sp)
    21cc:	04d12a23          	sw	a3,84(sp)
    21d0:	02046c93          	or	s9,s0,32
    21d4:	06100793          	li	a5,97
    21d8:	0005aa03          	lw	s4,0(a1)
    21dc:	0045aa83          	lw	s5,4(a1)
    21e0:	0085ab03          	lw	s6,8(a1)
    21e4:	00c5a903          	lw	s2,12(a1)
    21e8:	00062483          	lw	s1,0(a2)
    21ec:	00060993          	mv	s3,a2
    21f0:	1cfc9a63          	bne	s9,a5,23c4 <.L2>
    21f4:	07000793          	li	a5,112
    21f8:	0af10c23          	sb	a5,184(sp)
    21fc:	1c04cc63          	bltz	s1,23d4 <.L67>

00002200 <.L4>:
    2200:	02012a23          	sw	zero,52(sp)

00002204 <.L3>:
    2204:	00c9a783          	lw	a5,12(s3)
    2208:	0a010823          	sb	zero,176(sp)
    220c:	0027f713          	and	a4,a5,2
    2210:	1c070a63          	beqz	a4,23e4 <.L5>
    2214:	02b00793          	li	a5,43

00002218 <.L118>:
    2218:	0af10823          	sb	a5,176(sp)

0000221c <.L6>:
    221c:	0a010c13          	add	s8,sp,160
    2220:	09010b93          	add	s7,sp,144
    2224:	000b8593          	mv	a1,s7
    2228:	000c0513          	mv	a0,s8
    222c:	0a0108a3          	sb	zero,177(sp)
    2230:	10012223          	sw	zero,260(sp)
    2234:	0b412023          	sw	s4,160(sp)
    2238:	0b512223          	sw	s5,164(sp)
    223c:	0b612423          	sw	s6,168(sp)
    2240:	0b212623          	sw	s2,172(sp)
    2244:	09412823          	sw	s4,144(sp)
    2248:	09512a23          	sw	s5,148(sp)
    224c:	09612c23          	sw	s6,152(sp)
    2250:	09212e23          	sw	s2,156(sp)
    2254:	621010ef          	jal	4074 <__eqtf2>
    2258:	18050e63          	beqz	a0,23f4 <.L113>
    225c:	00800793          	li	a5,8
    2260:	10f12223          	sw	a5,260(sp)

00002264 <.L9>:
    2264:	02000793          	li	a5,32
    2268:	00f9a823          	sw	a5,16(s3)
    226c:	07000793          	li	a5,112
    2270:	0ef12e23          	sw	a5,252(sp)
    2274:	00300793          	li	a5,3
    2278:	10f12023          	sw	a5,256(sp)
    227c:	06000793          	li	a5,96
    2280:	0087e863          	bltu	a5,s0,2290 <.L18>
    2284:	10412783          	lw	a5,260(sp)
    2288:	00478793          	add	a5,a5,4
    228c:	10f12223          	sw	a5,260(sp)

00002290 <.L18>:
    2290:	10412783          	lw	a5,260(sp)
    2294:	d3018713          	add	a4,gp,-720 # 7610 <fmt>
    2298:	00040593          	mv	a1,s0
    229c:	00e787b3          	add	a5,a5,a4
    22a0:	10f12223          	sw	a5,260(sp)
    22a4:	10810913          	add	s2,sp,264

000022a8 <.L19>:
    22a8:	10010793          	add	a5,sp,256

000022ac <.L59>:
    22ac:	0007a703          	lw	a4,0(a5)
    22b0:	03812683          	lw	a3,56(sp)
    22b4:	00c78793          	add	a5,a5,12
    22b8:	40e68733          	sub	a4,a3,a4
    22bc:	02e12c23          	sw	a4,56(sp)
    22c0:	ff27e6e3          	bltu	a5,s2,22ac <.L59>
    22c4:	0b014703          	lbu	a4,176(sp)
    22c8:	0a000793          	li	a5,160
    22cc:	0ef12823          	sw	a5,240(sp)
    22d0:	00e03733          	snez	a4,a4
    22d4:	0b010693          	add	a3,sp,176
    22d8:	0205e793          	or	a5,a1,32
    22dc:	0ee12a23          	sw	a4,244(sp)
    22e0:	0ed12c23          	sw	a3,248(sp)
    22e4:	0ff7f793          	zext.b	a5,a5
    22e8:	06100613          	li	a2,97
    22ec:	02c79a63          	bne	a5,a2,2320 <.L60>
    22f0:	0fc12603          	lw	a2,252(sp)
    22f4:	00f00793          	li	a5,15
    22f8:	02c7d463          	bge	a5,a2,2320 <.L60>
    22fc:	00e687b3          	add	a5,a3,a4
    2300:	03000693          	li	a3,48
    2304:	00d78023          	sb	a3,0(a5)
    2308:	0b814683          	lbu	a3,184(sp)
    230c:	00270713          	add	a4,a4,2
    2310:	00078123          	sb	zero,2(a5)
    2314:	00868693          	add	a3,a3,8
    2318:	00d780a3          	sb	a3,1(a5)
    231c:	0ee12a23          	sw	a4,244(sp)

00002320 <.L60>:
    2320:	03812783          	lw	a5,56(sp)
    2324:	40e787b3          	sub	a5,a5,a4
    2328:	02f05463          	blez	a5,2350 <.L63>
    232c:	00c9a703          	lw	a4,12(s3)
    2330:	00877713          	and	a4,a4,8
    2334:	1c070ce3          	beqz	a4,2d0c <.L62>
    2338:	00f92223          	sw	a5,4(s2)
    233c:	0a000713          	li	a4,160
    2340:	d3318793          	add	a5,gp,-717 # 7613 <fmt+0x3>
    2344:	00e92023          	sw	a4,0(s2)
    2348:	00f92423          	sw	a5,8(s2)
    234c:	00c90913          	add	s2,s2,12

00002350 <.L63>:
    2350:	0f010413          	add	s0,sp,240
    2354:	00000493          	li	s1,0

00002358 <.L66>:
    2358:	00442983          	lw	s3,4(s0)
    235c:	00842683          	lw	a3,8(s0)
    2360:	00042583          	lw	a1,0(s0)
    2364:	05012503          	lw	a0,80(sp)
    2368:	05412783          	lw	a5,84(sp)
    236c:	00098613          	mv	a2,s3
    2370:	000780e7          	jalr	a5
    2374:	1d3512e3          	bne	a0,s3,2d38 <.L82>
    2378:	00c40413          	add	s0,s0,12
    237c:	00a484b3          	add	s1,s1,a0
    2380:	fd246ce3          	bltu	s0,s2,2358 <.L66>

00002384 <.L1>:
    2384:	18c12083          	lw	ra,396(sp)
    2388:	18812403          	lw	s0,392(sp)
    238c:	18012903          	lw	s2,384(sp)
    2390:	17c12983          	lw	s3,380(sp)
    2394:	17812a03          	lw	s4,376(sp)
    2398:	17412a83          	lw	s5,372(sp)
    239c:	17012b03          	lw	s6,368(sp)
    23a0:	16c12b83          	lw	s7,364(sp)
    23a4:	16812c03          	lw	s8,360(sp)
    23a8:	16412c83          	lw	s9,356(sp)
    23ac:	16012d03          	lw	s10,352(sp)
    23b0:	15c12d83          	lw	s11,348(sp)
    23b4:	00048513          	mv	a0,s1
    23b8:	18412483          	lw	s1,388(sp)
    23bc:	19010113          	add	sp,sp,400
    23c0:	00008067          	ret

000023c4 <.L2>:
    23c4:	e204dee3          	bgez	s1,2200 <.L4>
    23c8:	02012a23          	sw	zero,52(sp)
    23cc:	00600493          	li	s1,6
    23d0:	e35ff06f          	j	2204 <.L3>

000023d4 <.L67>:
    23d4:	00100793          	li	a5,1
    23d8:	02f12a23          	sw	a5,52(sp)
    23dc:	01d00493          	li	s1,29
    23e0:	e25ff06f          	j	2204 <.L3>

000023e4 <.L5>:
    23e4:	0017f793          	and	a5,a5,1
    23e8:	e2078ae3          	beqz	a5,221c <.L6>
    23ec:	02000793          	li	a5,32
    23f0:	e29ff06f          	j	2218 <.L118>

000023f4 <.L113>:
    23f4:	000b8593          	mv	a1,s7
    23f8:	000c0513          	mv	a0,s8
    23fc:	0b412023          	sw	s4,160(sp)
    2400:	0b512223          	sw	s5,164(sp)
    2404:	0b612423          	sw	s6,168(sp)
    2408:	0b212623          	sw	s2,172(sp)
    240c:	08012823          	sw	zero,144(sp)
    2410:	08012a23          	sw	zero,148(sp)
    2414:	08012c23          	sw	zero,152(sp)
    2418:	08012e23          	sw	zero,156(sp)
    241c:	459010ef          	jal	4074 <__eqtf2>
    2420:	24051e63          	bnez	a0,267c <.L114>
    2424:	000c0513          	mv	a0,s8
    2428:	049040ef          	jal	6c70 <__trunctfdf2>
    242c:	00b50663          	beq	a0,a1,2438 <.L12>
    2430:	02d00793          	li	a5,45
    2434:	0af10823          	sb	a5,176(sp)

00002438 <.L12>:
    2438:	02400793          	li	a5,36
    243c:	02f12623          	sw	a5,44(sp)
    2440:	00900793          	li	a5,9
    2444:	00006617          	auipc	a2,0x6
    2448:	f0c60613          	add	a2,a2,-244 # 8350 <.LC2>
    244c:	02f12423          	sw	a5,40(sp)
    2450:	00a00793          	li	a5,10
    2454:	00f12623          	sw	a5,12(sp)
    2458:	00062783          	lw	a5,0(a2)
    245c:	000a0c93          	mv	s9,s4
    2460:	000a8d13          	mv	s10,s5
    2464:	00f12c23          	sw	a5,24(sp)
    2468:	00462783          	lw	a5,4(a2)
    246c:	000b0d93          	mv	s11,s6
    2470:	00090b93          	mv	s7,s2
    2474:	00f12e23          	sw	a5,28(sp)
    2478:	00862783          	lw	a5,8(a2)
    247c:	fff00c13          	li	s8,-1
    2480:	02f12023          	sw	a5,32(sp)
    2484:	00c62783          	lw	a5,12(a2)
    2488:	02f12223          	sw	a5,36(sp)

0000248c <.L13>:
    248c:	0a010793          	add	a5,sp,160
    2490:	00f12823          	sw	a5,16(sp)
    2494:	09010793          	add	a5,sp,144
    2498:	00f12a23          	sw	a5,20(sp)
    249c:	08010793          	add	a5,sp,128
    24a0:	00400913          	li	s2,4
    24a4:	0ca10a13          	add	s4,sp,202
    24a8:	02f12823          	sw	a5,48(sp)
    24ac:	07010b13          	add	s6,sp,112

000024b0 <.L29>:
    24b0:	01012503          	lw	a0,16(sp)
    24b4:	0b912023          	sw	s9,160(sp)
    24b8:	0ba12223          	sw	s10,164(sp)
    24bc:	0bb12423          	sw	s11,168(sp)
    24c0:	0b712623          	sw	s7,172(sp)
    24c4:	374040ef          	jal	6838 <__fixunstfsi>
    24c8:	00050593          	mv	a1,a0
    24cc:	00050a93          	mv	s5,a0
    24d0:	01012503          	lw	a0,16(sp)
    24d4:	45c040ef          	jal	6930 <__floatunsitf>
    24d8:	0a012703          	lw	a4,160(sp)
    24dc:	03012583          	lw	a1,48(sp)
    24e0:	01412503          	lw	a0,20(sp)
    24e4:	06e12823          	sw	a4,112(sp)
    24e8:	0a412703          	lw	a4,164(sp)
    24ec:	000b0613          	mv	a2,s6
    24f0:	09912023          	sw	s9,128(sp)
    24f4:	06e12a23          	sw	a4,116(sp)
    24f8:	0a812703          	lw	a4,168(sp)
    24fc:	09a12223          	sw	s10,132(sp)
    2500:	09b12423          	sw	s11,136(sp)
    2504:	06e12c23          	sw	a4,120(sp)
    2508:	0ac12703          	lw	a4,172(sp)
    250c:	09712623          	sw	s7,140(sp)
    2510:	06e12e23          	sw	a4,124(sp)
    2514:	691020ef          	jal	53a4 <__subtf3>
    2518:	01812783          	lw	a5,24(sp)
    251c:	03012603          	lw	a2,48(sp)
    2520:	01012503          	lw	a0,16(sp)
    2524:	08f12023          	sw	a5,128(sp)
    2528:	01c12783          	lw	a5,28(sp)
    252c:	01412583          	lw	a1,20(sp)
    2530:	08f12223          	sw	a5,132(sp)
    2534:	02012783          	lw	a5,32(sp)
    2538:	08f12423          	sw	a5,136(sp)
    253c:	02412783          	lw	a5,36(sp)
    2540:	08f12623          	sw	a5,140(sp)
    2544:	65d010ef          	jal	43a0 <__multf3>
    2548:	02812783          	lw	a5,40(sp)
    254c:	0a012c83          	lw	s9,160(sp)
    2550:	0a412d03          	lw	s10,164(sp)
    2554:	0a812d83          	lw	s11,168(sp)
    2558:	0ac12b83          	lw	s7,172(sp)
    255c:	00fa0a33          	add	s4,s4,a5
    2560:	000a0613          	mv	a2,s4
    2564:	40fa0533          	sub	a0,s4,a5

00002568 <.L28>:
    2568:	00c12783          	lw	a5,12(sp)
    256c:	fff60613          	add	a2,a2,-1
    2570:	02faf5b3          	remu	a1,s5,a5
    2574:	03058593          	add	a1,a1,48
    2578:	00b60023          	sb	a1,0(a2)
    257c:	02fadab3          	divu	s5,s5,a5
    2580:	fec514e3          	bne	a0,a2,2568 <.L28>
    2584:	fff90913          	add	s2,s2,-1
    2588:	f20914e3          	bnez	s2,24b0 <.L29>
    258c:	06000713          	li	a4,96
    2590:	00876c63          	bltu	a4,s0,25a8 <.L30>
    2594:	0b814703          	lbu	a4,184(sp)
    2598:	02040413          	add	s0,s0,32
    259c:	0ff47413          	zext.b	s0,s0
    25a0:	fe070713          	add	a4,a4,-32
    25a4:	0ae10c23          	sb	a4,184(sp)

000025a8 <.L30>:
    25a8:	06700713          	li	a4,103
    25ac:	50e41263          	bne	s0,a4,2ab0 <.L31>
    25b0:	00000693          	li	a3,0
    25b4:	00048663          	beqz	s1,25c0 <.L32>
    25b8:	fff48493          	add	s1,s1,-1
    25bc:	00048693          	mv	a3,s1

000025c0 <.L32>:
    25c0:	02c12783          	lw	a5,44(sp)
    25c4:	00003737          	lui	a4,0x3
    25c8:	0ce11423          	sh	a4,200(sp)
    25cc:	0c910513          	add	a0,sp,201
    25d0:	50f6ca63          	blt	a3,a5,2ae4 <.L33>
    25d4:	00178613          	add	a2,a5,1
    25d8:	00c50633          	add	a2,a0,a2
    25dc:	00000593          	li	a1,0

000025e0 <.L34>:
    25e0:	00c12783          	lw	a5,12(sp)
    25e4:	03000813          	li	a6,48
    25e8:	02f78b93          	add	s7,a5,47

000025ec <.L35>:
    25ec:	fff64703          	lbu	a4,-1(a2)
    25f0:	fff60613          	add	a2,a2,-1
    25f4:	00b70733          	add	a4,a4,a1
    25f8:	0ff77713          	zext.b	a4,a4
    25fc:	00e60023          	sb	a4,0(a2)
    2600:	ff0706e3          	beq	a4,a6,25ec <.L35>
    2604:	feebe4e3          	bltu	s7,a4,25ec <.L35>
    2608:	02046713          	or	a4,s0,32
    260c:	06100593          	li	a1,97
    2610:	50b71c63          	bne	a4,a1,2b28 <.L37>
    2614:	0b814583          	lbu	a1,184(sp)
    2618:	00060813          	mv	a6,a2
    261c:	03900893          	li	a7,57
    2620:	fb758593          	add	a1,a1,-73
    2624:	0ff5f593          	zext.b	a1,a1

00002628 <.L38>:
    2628:	00084703          	lbu	a4,0(a6)
    262c:	4c071e63          	bnez	a4,2b08 <.L40>
    2630:	4ec56663          	bltu	a0,a2,2b1c <.L41>

00002634 <.L43>:
    2634:	001c0c13          	add	s8,s8,1
    2638:	00050613          	mv	a2,a0
    263c:	00050713          	mv	a4,a0

00002640 <.L42>:
    2640:	000600a3          	sb	zero,1(a2)
    2644:	06700593          	li	a1,103
    2648:	4eb41463          	bne	s0,a1,2b30 <.L44>
    264c:	ffc00593          	li	a1,-4
    2650:	4ebc4863          	blt	s8,a1,2b40 <.L73>
    2654:	4f86c663          	blt	a3,s8,2b40 <.L73>
    2658:	418684b3          	sub	s1,a3,s8

0000265c <.L46>:
    265c:	000c0693          	mv	a3,s8
    2660:	000c5a63          	bgez	s8,2674 <.L123>
    2664:	03000693          	li	a3,48
    2668:	fed70fa3          	sb	a3,-1(a4) # 2fff <__GI_write+0x17>
    266c:	000c0693          	mv	a3,s8
    2670:	fff70713          	add	a4,a4,-1

00002674 <.L123>:
    2674:	06600593          	li	a1,102
    2678:	4d00006f          	j	2b48 <.L45>

0000267c <.L114>:
    267c:	000b8593          	mv	a1,s7
    2680:	000c0513          	mv	a0,s8
    2684:	0b412023          	sw	s4,160(sp)
    2688:	0b512223          	sw	s5,164(sp)
    268c:	0b612423          	sw	s6,168(sp)
    2690:	0b212623          	sw	s2,172(sp)
    2694:	08012823          	sw	zero,144(sp)
    2698:	08012a23          	sw	zero,148(sp)
    269c:	08012c23          	sw	zero,152(sp)
    26a0:	08012e23          	sw	zero,156(sp)
    26a4:	3cd010ef          	jal	4270 <__letf2>
    26a8:	00055a63          	bgez	a0,26bc <.L14>
    26ac:	02d00793          	li	a5,45
    26b0:	0af10823          	sb	a5,176(sp)
    26b4:	800007b7          	lui	a5,0x80000
    26b8:	0127c933          	xor	s2,a5,s2

000026bc <.L14>:
    26bc:	00006797          	auipc	a5,0x6
    26c0:	cb478793          	add	a5,a5,-844 # 8370 <.LC4>
    26c4:	0007a603          	lw	a2,0(a5)
    26c8:	0047a683          	lw	a3,4(a5)
    26cc:	0087a703          	lw	a4,8(a5)
    26d0:	00c7a783          	lw	a5,12(a5)
    26d4:	08010d13          	add	s10,sp,128
    26d8:	08c12023          	sw	a2,128(sp)
    26dc:	000b8593          	mv	a1,s7
    26e0:	000c0513          	mv	a0,s8
    26e4:	000d0613          	mv	a2,s10
    26e8:	08f12623          	sw	a5,140(sp)
    26ec:	09412823          	sw	s4,144(sp)
    26f0:	09512a23          	sw	s5,148(sp)
    26f4:	09612c23          	sw	s6,152(sp)
    26f8:	09212e23          	sw	s2,156(sp)
    26fc:	08d12223          	sw	a3,132(sp)
    2700:	08e12423          	sw	a4,136(sp)
    2704:	49d010ef          	jal	43a0 <__multf3>
    2708:	0a012783          	lw	a5,160(sp)
    270c:	000d0593          	mv	a1,s10
    2710:	000b8513          	mv	a0,s7
    2714:	08f12823          	sw	a5,144(sp)
    2718:	0a412783          	lw	a5,164(sp)
    271c:	09412023          	sw	s4,128(sp)
    2720:	09512223          	sw	s5,132(sp)
    2724:	08f12a23          	sw	a5,148(sp)
    2728:	0a812783          	lw	a5,168(sp)
    272c:	09612423          	sw	s6,136(sp)
    2730:	09212623          	sw	s2,140(sp)
    2734:	08f12c23          	sw	a5,152(sp)
    2738:	0ac12783          	lw	a5,172(sp)
    273c:	08f12e23          	sw	a5,156(sp)
    2740:	135010ef          	jal	4074 <__eqtf2>
    2744:	b20500e3          	beqz	a0,2264 <.L9>
    2748:	06100793          	li	a5,97
    274c:	28fc9e63          	bne	s9,a5,29e8 <.L68>
    2750:	01d00793          	li	a5,29
    2754:	02f12623          	sw	a5,44(sp)
    2758:	00800793          	li	a5,8
    275c:	00006717          	auipc	a4,0x6
    2760:	bd470713          	add	a4,a4,-1068 # 8330 <.LC0>
    2764:	02f12423          	sw	a5,40(sp)
    2768:	01000793          	li	a5,16
    276c:	00f12623          	sw	a5,12(sp)
    2770:	00072783          	lw	a5,0(a4)
    2774:	00700c13          	li	s8,7
    2778:	b9018313          	add	t1,gp,-1136 # 7470 <exp16_table>
    277c:	00f12c23          	sw	a5,24(sp)
    2780:	00472783          	lw	a5,4(a4)
    2784:	00f12e23          	sw	a5,28(sp)
    2788:	00872783          	lw	a5,8(a4)
    278c:	02f12023          	sw	a5,32(sp)
    2790:	00c72783          	lw	a5,12(a4)
    2794:	00006717          	auipc	a4,0x6
    2798:	bac70713          	add	a4,a4,-1108 # 8340 <.LC1>
    279c:	02f12223          	sw	a5,36(sp)

000027a0 <.L119>:
    27a0:	00072783          	lw	a5,0(a4)
    27a4:	0c030e13          	add	t3,t1,192
    27a8:	000a0c93          	mv	s9,s4
    27ac:	02f12e23          	sw	a5,60(sp)
    27b0:	00472783          	lw	a5,4(a4)
    27b4:	000a8d13          	mv	s10,s5
    27b8:	000b0d93          	mv	s11,s6
    27bc:	04f12023          	sw	a5,64(sp)
    27c0:	00872783          	lw	a5,8(a4)
    27c4:	00090b93          	mv	s7,s2
    27c8:	04f12223          	sw	a5,68(sp)
    27cc:	00c72783          	lw	a5,12(a4)
    27d0:	04f12423          	sw	a5,72(sp)
    27d4:	000017b7          	lui	a5,0x1
    27d8:	02f12823          	sw	a5,48(sp)
    27dc:	0a010793          	add	a5,sp,160
    27e0:	00f12823          	sw	a5,16(sp)
    27e4:	09010793          	add	a5,sp,144
    27e8:	00f12a23          	sw	a5,20(sp)
    27ec:	08010793          	add	a5,sp,128
    27f0:	04f12623          	sw	a5,76(sp)

000027f4 <.L26>:
    27f4:	03c12783          	lw	a5,60(sp)
    27f8:	000e2f83          	lw	t6,0(t3)
    27fc:	004e2f03          	lw	t5,4(t3)
    2800:	008e2e83          	lw	t4,8(t3)
    2804:	00ce2603          	lw	a2,12(t3)
    2808:	08f12823          	sw	a5,144(sp)
    280c:	04012783          	lw	a5,64(sp)
    2810:	01412583          	lw	a1,20(sp)
    2814:	01012503          	lw	a0,16(sp)
    2818:	08f12a23          	sw	a5,148(sp)
    281c:	04412783          	lw	a5,68(sp)
    2820:	06612623          	sw	t1,108(sp)
    2824:	07f12423          	sw	t6,104(sp)
    2828:	08f12c23          	sw	a5,152(sp)
    282c:	04812783          	lw	a5,72(sp)
    2830:	07e12223          	sw	t5,100(sp)
    2834:	07d12023          	sw	t4,96(sp)
    2838:	05c12e23          	sw	t3,92(sp)
    283c:	04c12c23          	sw	a2,88(sp)
    2840:	0b412023          	sw	s4,160(sp)
    2844:	0b512223          	sw	s5,164(sp)
    2848:	0b612423          	sw	s6,168(sp)
    284c:	0b212623          	sw	s2,172(sp)
    2850:	08f12e23          	sw	a5,156(sp)
    2854:	21d010ef          	jal	4270 <__letf2>
    2858:	05812603          	lw	a2,88(sp)
    285c:	06812f83          	lw	t6,104(sp)
    2860:	06c12303          	lw	t1,108(sp)
    2864:	05c12e03          	lw	t3,92(sp)
    2868:	06012e83          	lw	t4,96(sp)
    286c:	06412f03          	lw	t5,100(sp)
    2870:	08c12623          	sw	a2,140(sp)
    2874:	07c12623          	sw	t3,108(sp)
    2878:	06612423          	sw	t1,104(sp)
    287c:	09912823          	sw	s9,144(sp)
    2880:	09a12a23          	sw	s10,148(sp)
    2884:	09b12c23          	sw	s11,152(sp)
    2888:	09712e23          	sw	s7,156(sp)
    288c:	09f12023          	sw	t6,128(sp)
    2890:	09e12223          	sw	t5,132(sp)
    2894:	09d12423          	sw	t4,136(sp)
    2898:	04c12603          	lw	a2,76(sp)
    289c:	01412583          	lw	a1,20(sp)
    28a0:	1a055263          	bgez	a0,2a44 <.L116>
    28a4:	01012503          	lw	a0,16(sp)
    28a8:	2f9010ef          	jal	43a0 <__multf3>
    28ac:	01812783          	lw	a5,24(sp)
    28b0:	0a012f83          	lw	t6,160(sp)
    28b4:	0a412f03          	lw	t5,164(sp)
    28b8:	08f12823          	sw	a5,144(sp)
    28bc:	01c12783          	lw	a5,28(sp)
    28c0:	0a812e83          	lw	t4,168(sp)
    28c4:	0ac12603          	lw	a2,172(sp)
    28c8:	08f12a23          	sw	a5,148(sp)
    28cc:	02012783          	lw	a5,32(sp)
    28d0:	01412583          	lw	a1,20(sp)
    28d4:	01012503          	lw	a0,16(sp)
    28d8:	08f12c23          	sw	a5,152(sp)
    28dc:	02412783          	lw	a5,36(sp)
    28e0:	07f12223          	sw	t6,100(sp)
    28e4:	07e12023          	sw	t5,96(sp)
    28e8:	05d12e23          	sw	t4,92(sp)
    28ec:	04c12c23          	sw	a2,88(sp)
    28f0:	08f12e23          	sw	a5,156(sp)
    28f4:	17d010ef          	jal	4270 <__letf2>
    28f8:	06812303          	lw	t1,104(sp)
    28fc:	06c12e03          	lw	t3,108(sp)
    2900:	02055663          	bgez	a0,292c <.L23>
    2904:	03012783          	lw	a5,48(sp)
    2908:	40fc0c33          	sub	s8,s8,a5

0000290c <.L120>:
    290c:	06412f83          	lw	t6,100(sp)
    2910:	06012f03          	lw	t5,96(sp)
    2914:	05c12e83          	lw	t4,92(sp)
    2918:	05812603          	lw	a2,88(sp)
    291c:	000f8c93          	mv	s9,t6
    2920:	000f0d13          	mv	s10,t5
    2924:	000e8d93          	mv	s11,t4
    2928:	00060b93          	mv	s7,a2

0000292c <.L23>:
    292c:	03012783          	lw	a5,48(sp)
    2930:	ff0e0613          	add	a2,t3,-16
    2934:	4017d793          	sra	a5,a5,0x1
    2938:	02f12823          	sw	a5,48(sp)
    293c:	11c31063          	bne	t1,t3,2a3c <.L69>
    2940:	01812783          	lw	a5,24(sp)
    2944:	0a010913          	add	s2,sp,160
    2948:	09010593          	add	a1,sp,144
    294c:	08f12823          	sw	a5,144(sp)
    2950:	01c12783          	lw	a5,28(sp)
    2954:	00090513          	mv	a0,s2
    2958:	00612a23          	sw	t1,20(sp)
    295c:	08f12a23          	sw	a5,148(sp)
    2960:	02012783          	lw	a5,32(sp)
    2964:	0b912023          	sw	s9,160(sp)
    2968:	0ba12223          	sw	s10,164(sp)
    296c:	08f12c23          	sw	a5,152(sp)
    2970:	02412783          	lw	a5,36(sp)
    2974:	0bb12423          	sw	s11,168(sp)
    2978:	0b712623          	sw	s7,172(sp)
    297c:	08f12e23          	sw	a5,156(sp)
    2980:	00b12823          	sw	a1,16(sp)
    2984:	7bc010ef          	jal	4140 <__getf2>
    2988:	b00542e3          	bltz	a0,248c <.L13>
    298c:	01412303          	lw	t1,20(sp)
    2990:	09912823          	sw	s9,144(sp)
    2994:	09a12a23          	sw	s10,148(sp)
    2998:	09b12c23          	sw	s11,152(sp)
    299c:	09712e23          	sw	s7,156(sp)
    29a0:	00032703          	lw	a4,0(t1)
    29a4:	01012583          	lw	a1,16(sp)
    29a8:	08010613          	add	a2,sp,128
    29ac:	08e12023          	sw	a4,128(sp)
    29b0:	00432703          	lw	a4,4(t1)
    29b4:	00090513          	mv	a0,s2
    29b8:	001c0c13          	add	s8,s8,1
    29bc:	08e12223          	sw	a4,132(sp)
    29c0:	00832703          	lw	a4,8(t1)
    29c4:	08e12423          	sw	a4,136(sp)
    29c8:	00c32703          	lw	a4,12(t1)
    29cc:	08e12623          	sw	a4,140(sp)
    29d0:	111000ef          	jal	32e0 <__divtf3>
    29d4:	0a012c83          	lw	s9,160(sp)
    29d8:	0a412d03          	lw	s10,164(sp)
    29dc:	0a812d83          	lw	s11,168(sp)
    29e0:	0ac12b83          	lw	s7,172(sp)
    29e4:	aa9ff06f          	j	248c <.L13>

000029e8 <.L68>:
    29e8:	02400793          	li	a5,36
    29ec:	02f12623          	sw	a5,44(sp)
    29f0:	00900793          	li	a5,9
    29f4:	00006717          	auipc	a4,0x6
    29f8:	95c70713          	add	a4,a4,-1700 # 8350 <.LC2>
    29fc:	02f12423          	sw	a5,40(sp)
    2a00:	00a00793          	li	a5,10
    2a04:	00f12623          	sw	a5,12(sp)
    2a08:	00072783          	lw	a5,0(a4)
    2a0c:	00800c13          	li	s8,8
    2a10:	c6018313          	add	t1,gp,-928 # 7540 <exp10_table>
    2a14:	00f12c23          	sw	a5,24(sp)
    2a18:	00472783          	lw	a5,4(a4)
    2a1c:	00f12e23          	sw	a5,28(sp)
    2a20:	00872783          	lw	a5,8(a4)
    2a24:	02f12023          	sw	a5,32(sp)
    2a28:	00c72783          	lw	a5,12(a4)
    2a2c:	00006717          	auipc	a4,0x6
    2a30:	93470713          	add	a4,a4,-1740 # 8360 <.LC3>
    2a34:	02f12223          	sw	a5,36(sp)
    2a38:	d69ff06f          	j	27a0 <.L119>

00002a3c <.L69>:
    2a3c:	00060e13          	mv	t3,a2
    2a40:	db5ff06f          	j	27f4 <.L26>

00002a44 <.L116>:
    2a44:	01012503          	lw	a0,16(sp)
    2a48:	099000ef          	jal	32e0 <__divtf3>
    2a4c:	03c12783          	lw	a5,60(sp)
    2a50:	0a012f83          	lw	t6,160(sp)
    2a54:	0a412f03          	lw	t5,164(sp)
    2a58:	08f12823          	sw	a5,144(sp)
    2a5c:	04012783          	lw	a5,64(sp)
    2a60:	0a812e83          	lw	t4,168(sp)
    2a64:	0ac12603          	lw	a2,172(sp)
    2a68:	08f12a23          	sw	a5,148(sp)
    2a6c:	04412783          	lw	a5,68(sp)
    2a70:	01412583          	lw	a1,20(sp)
    2a74:	01012503          	lw	a0,16(sp)
    2a78:	08f12c23          	sw	a5,152(sp)
    2a7c:	04812783          	lw	a5,72(sp)
    2a80:	07f12223          	sw	t6,100(sp)
    2a84:	07e12023          	sw	t5,96(sp)
    2a88:	05d12e23          	sw	t4,92(sp)
    2a8c:	04c12c23          	sw	a2,88(sp)
    2a90:	08f12e23          	sw	a5,156(sp)
    2a94:	6ac010ef          	jal	4140 <__getf2>
    2a98:	06812303          	lw	t1,104(sp)
    2a9c:	06c12e03          	lw	t3,108(sp)
    2aa0:	e80546e3          	bltz	a0,292c <.L23>
    2aa4:	03012783          	lw	a5,48(sp)
    2aa8:	00fc0c33          	add	s8,s8,a5
    2aac:	e61ff06f          	j	290c <.L120>

00002ab0 <.L31>:
    2ab0:	06600713          	li	a4,102
    2ab4:	00048693          	mv	a3,s1
    2ab8:	b0e414e3          	bne	s0,a4,25c0 <.L32>
    2abc:	009c06b3          	add	a3,s8,s1
    2ac0:	fff00713          	li	a4,-1
    2ac4:	aee6dee3          	bge	a3,a4,25c0 <.L32>
    2ac8:	02400613          	li	a2,36
    2acc:	03000593          	li	a1,48
    2ad0:	0c810513          	add	a0,sp,200
    2ad4:	a8dfe0ef          	jal	1560 <__GI_memset>
    2ad8:	fff00c13          	li	s8,-1
    2adc:	fff00693          	li	a3,-1
    2ae0:	ae1ff06f          	j	25c0 <.L32>

00002ae4 <.L33>:
    2ae4:	00c12783          	lw	a5,12(sp)
    2ae8:	00268613          	add	a2,a3,2
    2aec:	00c50633          	add	a2,a0,a2
    2af0:	00064583          	lbu	a1,0(a2)
    2af4:	0017d713          	srl	a4,a5,0x1
    2af8:	03070713          	add	a4,a4,48
    2afc:	00e5b5b3          	sltu	a1,a1,a4
    2b00:	0015b593          	seqz	a1,a1
    2b04:	addff06f          	j	25e0 <.L34>

00002b08 <.L40>:
    2b08:	00e8f663          	bgeu	a7,a4,2b14 <.L39>
    2b0c:	00b70733          	add	a4,a4,a1
    2b10:	00e80023          	sb	a4,0(a6)

00002b14 <.L39>:
    2b14:	fff80813          	add	a6,a6,-1
    2b18:	b11ff06f          	j	2628 <.L38>

00002b1c <.L41>:
    2b1c:	002c1c13          	sll	s8,s8,0x2

00002b20 <.L121>:
    2b20:	0ca10713          	add	a4,sp,202
    2b24:	b1dff06f          	j	2640 <.L42>

00002b28 <.L37>:
    2b28:	b0c576e3          	bgeu	a0,a2,2634 <.L43>
    2b2c:	ff5ff06f          	j	2b20 <.L121>

00002b30 <.L44>:
    2b30:	06600693          	li	a3,102
    2b34:	b2d404e3          	beq	s0,a3,265c <.L46>
    2b38:	00040593          	mv	a1,s0
    2b3c:	0080006f          	j	2b44 <.L122>

00002b40 <.L73>:
    2b40:	06700593          	li	a1,103

00002b44 <.L122>:
    2b44:	00000693          	li	a3,0

00002b48 <.L45>:
    2b48:	00074883          	lbu	a7,0(a4)
    2b4c:	00100513          	li	a0,1
    2b50:	0b000813          	li	a6,176
    2b54:	10a12023          	sw	a0,256(sp)
    2b58:	0b410513          	add	a0,sp,180
    2b5c:	10a12223          	sw	a0,260(sp)
    2b60:	0f012e23          	sw	a6,252(sp)
    2b64:	0b110a23          	sb	a7,180(sp)
    2b68:	0a010aa3          	sb	zero,181(sp)
    2b6c:	00170513          	add	a0,a4,1
    2b70:	10810913          	add	s2,sp,264
    2b74:	40e60733          	sub	a4,a2,a4
    2b78:	0206ce63          	bltz	a3,2bb4 <.L47>
    2b7c:	07000613          	li	a2,112
    2b80:	10c12423          	sw	a2,264(sp)
    2b84:	10a12823          	sw	a0,272(sp)
    2b88:	16e6c063          	blt	a3,a4,2ce8 <.L48>
    2b8c:	10e12623          	sw	a4,268(sp)
    2b90:	40e68733          	sub	a4,a3,a4
    2b94:	16070263          	beqz	a4,2cf8 <.L77>
    2b98:	10e12c23          	sw	a4,280(sp)
    2b9c:	d3318713          	add	a4,gp,-717 # 7613 <fmt+0x3>
    2ba0:	10e12e23          	sw	a4,284(sp)
    2ba4:	11012a23          	sw	a6,276(sp)
    2ba8:	00000713          	li	a4,0
    2bac:	12010913          	add	s2,sp,288

00002bb0 <.L78>:
    2bb0:	fff00693          	li	a3,-1

00002bb4 <.L47>:
    2bb4:	00c9a603          	lw	a2,12(s3)
    2bb8:	01067613          	and	a2,a2,16
    2bbc:	00c76833          	or	a6,a4,a2
    2bc0:	00081c63          	bnez	a6,2bd8 <.L49>
    2bc4:	06700813          	li	a6,103
    2bc8:	03040663          	beq	s0,a6,2bf4 <.L50>
    2bcc:	06100813          	li	a6,97
    2bd0:	03040263          	beq	s0,a6,2bf4 <.L50>
    2bd4:	02048063          	beqz	s1,2bf4 <.L50>

00002bd8 <.L49>:
    2bd8:	07000813          	li	a6,112
    2bdc:	01092023          	sw	a6,0(s2)
    2be0:	00100813          	li	a6,1
    2be4:	01092223          	sw	a6,4(s2)
    2be8:	d4018813          	add	a6,gp,-704 # 7620 <fmt+0x10>
    2bec:	01092423          	sw	a6,8(s2)
    2bf0:	00c90913          	add	s2,s2,12

00002bf4 <.L50>:
    2bf4:	00168813          	add	a6,a3,1
    2bf8:	02080063          	beqz	a6,2c18 <.L51>
    2bfc:	fff6c693          	not	a3,a3
    2c00:	00d92223          	sw	a3,4(s2)
    2c04:	0b000893          	li	a7,176
    2c08:	d3318693          	add	a3,gp,-717 # 7613 <fmt+0x3>
    2c0c:	01192023          	sw	a7,0(s2)
    2c10:	00d92423          	sw	a3,8(s2)
    2c14:	00c90913          	add	s2,s2,12

00002c18 <.L51>:
    2c18:	00070c63          	beqz	a4,2c30 <.L52>
    2c1c:	07000693          	li	a3,112
    2c20:	00d92023          	sw	a3,0(s2)
    2c24:	00e92223          	sw	a4,4(s2)
    2c28:	00a92423          	sw	a0,8(s2)
    2c2c:	00c90913          	add	s2,s2,12

00002c30 <.L52>:
    2c30:	06700693          	li	a3,103
    2c34:	00d41463          	bne	s0,a3,2c3c <.L53>
    2c38:	02060863          	beqz	a2,2c68 <.L54>

00002c3c <.L53>:
    2c3c:	03412783          	lw	a5,52(sp)
    2c40:	02079463          	bnez	a5,2c68 <.L54>
    2c44:	41070733          	sub	a4,a4,a6
    2c48:	02975063          	bge	a4,s1,2c68 <.L54>
    2c4c:	40e484b3          	sub	s1,s1,a4
    2c50:	0b000693          	li	a3,176
    2c54:	d3318713          	add	a4,gp,-717 # 7613 <fmt+0x3>
    2c58:	00d92023          	sw	a3,0(s2)
    2c5c:	00992223          	sw	s1,4(s2)
    2c60:	00e92423          	sw	a4,8(s2)
    2c64:	00c90913          	add	s2,s2,12

00002c68 <.L54>:
    2c68:	06600713          	li	a4,102
    2c6c:	e2e58e63          	beq	a1,a4,22a8 <.L19>
    2c70:	06100713          	li	a4,97
    2c74:	0b814e03          	lbu	t3,184(sp)
    2c78:	00300893          	li	a7,3
    2c7c:	00e40463          	beq	s0,a4,2c84 <.L55>
    2c80:	00400893          	li	a7,4

00002c84 <.L55>:
    2c84:	02b00813          	li	a6,43
    2c88:	000c5663          	bgez	s8,2c94 <.L56>
    2c8c:	41800c33          	neg	s8,s8
    2c90:	02d00813          	li	a6,45

00002c94 <.L56>:
    2c94:	0c0103a3          	sb	zero,199(sp)
    2c98:	00200693          	li	a3,2
    2c9c:	0c710713          	add	a4,sp,199
    2ca0:	00a00313          	li	t1,10

00002ca4 <.L57>:
    2ca4:	026c6533          	rem	a0,s8,t1
    2ca8:	00168693          	add	a3,a3,1
    2cac:	fff70613          	add	a2,a4,-1
    2cb0:	03050513          	add	a0,a0,48
    2cb4:	fea70fa3          	sb	a0,-1(a4)
    2cb8:	026c4c33          	div	s8,s8,t1
    2cbc:	0516c263          	blt	a3,a7,2d00 <.L81>
    2cc0:	040c1263          	bnez	s8,2d04 <.L58>
    2cc4:	07000793          	li	a5,112
    2cc8:	ffd70713          	add	a4,a4,-3
    2ccc:	00f92023          	sw	a5,0(s2)
    2cd0:	00d92223          	sw	a3,4(s2)
    2cd4:	00e92423          	sw	a4,8(s2)
    2cd8:	ff060fa3          	sb	a6,-1(a2)
    2cdc:	ffc60f23          	sb	t3,-2(a2)
    2ce0:	00c90913          	add	s2,s2,12
    2ce4:	dc4ff06f          	j	22a8 <.L19>

00002ce8 <.L48>:
    2ce8:	ec0684e3          	beqz	a3,2bb0 <.L78>
    2cec:	10d12623          	sw	a3,268(sp)
    2cf0:	00d50533          	add	a0,a0,a3
    2cf4:	40d70733          	sub	a4,a4,a3

00002cf8 <.L77>:
    2cf8:	11410913          	add	s2,sp,276
    2cfc:	eb5ff06f          	j	2bb0 <.L78>

00002d00 <.L81>:
    2d00:	00300693          	li	a3,3

00002d04 <.L58>:
    2d04:	00060713          	mv	a4,a2
    2d08:	f9dff06f          	j	2ca4 <.L57>

00002d0c <.L62>:
    2d0c:	0109a603          	lw	a2,16(s3)
    2d10:	03000693          	li	a3,48
    2d14:	0f412703          	lw	a4,244(sp)
    2d18:	00d61a63          	bne	a2,a3,2d2c <.L64>
    2d1c:	10012703          	lw	a4,256(sp)
    2d20:	00f707b3          	add	a5,a4,a5
    2d24:	10f12023          	sw	a5,256(sp)
    2d28:	e28ff06f          	j	2350 <.L63>

00002d2c <.L64>:
    2d2c:	00e787b3          	add	a5,a5,a4
    2d30:	0ef12a23          	sw	a5,244(sp)
    2d34:	e1cff06f          	j	2350 <.L63>

00002d38 <.L82>:
    2d38:	fff00493          	li	s1,-1
    2d3c:	e48ff06f          	j	2384 <.L1>

00002d40 <__GI_memchr>:
    2d40:	0ff5f793          	zext.b	a5,a1

00002d44 <.L2>:
    2d44:	00060663          	beqz	a2,2d50 <.L4>
    2d48:	00357713          	and	a4,a0,3
    2d4c:	02071c63          	bnez	a4,2d84 <.L5>

00002d50 <.L4>:
    2d50:	01010737          	lui	a4,0x1010
    2d54:	0ff5f593          	zext.b	a1,a1
    2d58:	10170713          	add	a4,a4,257 # 1010101 <_ebss+0x10052a1>
    2d5c:	02e585b3          	mul	a1,a1,a4
    2d60:	7eff0837          	lui	a6,0x7eff0
    2d64:	00300313          	li	t1,3
    2d68:	eff80813          	add	a6,a6,-257 # 7efefeff <_ebss+0x7efe509f>
    2d6c:	fff00e13          	li	t3,-1

00002d70 <.L6>:
    2d70:	02c36463          	bltu	t1,a2,2d98 <.L10>
    2d74:	00c50633          	add	a2,a0,a2

00002d78 <.L11>:
    2d78:	08c51063          	bne	a0,a2,2df8 <.L12>
    2d7c:	00000513          	li	a0,0

00002d80 <.L1>:
    2d80:	00008067          	ret

00002d84 <.L5>:
    2d84:	00054703          	lbu	a4,0(a0)
    2d88:	fef70ce3          	beq	a4,a5,2d80 <.L1>
    2d8c:	fff60613          	add	a2,a2,-1
    2d90:	00150513          	add	a0,a0,1
    2d94:	fb1ff06f          	j	2d44 <.L2>

00002d98 <.L10>:
    2d98:	00052883          	lw	a7,0(a0)
    2d9c:	00450713          	add	a4,a0,4
    2da0:	0115c8b3          	xor	a7,a1,a7
    2da4:	010886b3          	add	a3,a7,a6
    2da8:	0116c6b3          	xor	a3,a3,a7
    2dac:	0106e6b3          	or	a3,a3,a6
    2db0:	03c68e63          	beq	a3,t3,2dec <.L7>
    2db4:	ffc74683          	lbu	a3,-4(a4)
    2db8:	fcf684e3          	beq	a3,a5,2d80 <.L1>
    2dbc:	ffd74683          	lbu	a3,-3(a4)
    2dc0:	00f69663          	bne	a3,a5,2dcc <.L8>
    2dc4:	00150513          	add	a0,a0,1
    2dc8:	00008067          	ret

00002dcc <.L8>:
    2dcc:	ffe74683          	lbu	a3,-2(a4)
    2dd0:	00f69663          	bne	a3,a5,2ddc <.L9>
    2dd4:	00250513          	add	a0,a0,2
    2dd8:	00008067          	ret

00002ddc <.L9>:
    2ddc:	fff74683          	lbu	a3,-1(a4)
    2de0:	00f69663          	bne	a3,a5,2dec <.L7>
    2de4:	00350513          	add	a0,a0,3
    2de8:	00008067          	ret

00002dec <.L7>:
    2dec:	ffc60613          	add	a2,a2,-4
    2df0:	00070513          	mv	a0,a4
    2df4:	f7dff06f          	j	2d70 <.L6>

00002df8 <.L12>:
    2df8:	00054703          	lbu	a4,0(a0)
    2dfc:	f8f702e3          	beq	a4,a5,2d80 <.L1>
    2e00:	00150513          	add	a0,a0,1
    2e04:	f75ff06f          	j	2d78 <.L11>

00002e08 <__GI_mempcpy>:
    2e08:	ff010113          	add	sp,sp,-16
    2e0c:	00812423          	sw	s0,8(sp)
    2e10:	00912223          	sw	s1,4(sp)
    2e14:	00112623          	sw	ra,12(sp)
    2e18:	00050493          	mv	s1,a0
    2e1c:	00060413          	mv	s0,a2
    2e20:	c98fe0ef          	jal	12b8 <__GI_memcpy>
    2e24:	00848533          	add	a0,s1,s0
    2e28:	00c12083          	lw	ra,12(sp)
    2e2c:	00812403          	lw	s0,8(sp)
    2e30:	00412483          	lw	s1,4(sp)
    2e34:	01010113          	add	sp,sp,16
    2e38:	00008067          	ret

00002e3c <__GI_memrchr>:
    2e3c:	0ff5f793          	zext.b	a5,a1
    2e40:	00c50533          	add	a0,a0,a2

00002e44 <.L2>:
    2e44:	00060663          	beqz	a2,2e50 <.L4>
    2e48:	00357713          	and	a4,a0,3
    2e4c:	02071e63          	bnez	a4,2e88 <.L5>

00002e50 <.L4>:
    2e50:	01010737          	lui	a4,0x1010
    2e54:	0ff5f593          	zext.b	a1,a1
    2e58:	10170713          	add	a4,a4,257 # 1010101 <_ebss+0x10052a1>
    2e5c:	02e585b3          	mul	a1,a1,a4
    2e60:	7eff0837          	lui	a6,0x7eff0
    2e64:	00050693          	mv	a3,a0
    2e68:	00300313          	li	t1,3
    2e6c:	eff80813          	add	a6,a6,-257 # 7efefeff <_ebss+0x7efe509f>
    2e70:	fff00e13          	li	t3,-1

00002e74 <.L6>:
    2e74:	02c36463          	bltu	t1,a2,2e9c <.L11>
    2e78:	40c50633          	sub	a2,a0,a2

00002e7c <.L12>:
    2e7c:	08c51063          	bne	a0,a2,2efc <.L13>
    2e80:	00000513          	li	a0,0
    2e84:	00008067          	ret

00002e88 <.L5>:
    2e88:	fff54703          	lbu	a4,-1(a0)
    2e8c:	fff50513          	add	a0,a0,-1
    2e90:	06f70c63          	beq	a4,a5,2f08 <.L1>
    2e94:	fff60613          	add	a2,a2,-1
    2e98:	fadff06f          	j	2e44 <.L2>

00002e9c <.L11>:
    2e9c:	ffc52883          	lw	a7,-4(a0)
    2ea0:	ffc50513          	add	a0,a0,-4
    2ea4:	0115c8b3          	xor	a7,a1,a7
    2ea8:	01088733          	add	a4,a7,a6
    2eac:	01174733          	xor	a4,a4,a7
    2eb0:	01076733          	or	a4,a4,a6
    2eb4:	03c70e63          	beq	a4,t3,2ef0 <.L7>
    2eb8:	00354703          	lbu	a4,3(a0)
    2ebc:	00f71663          	bne	a4,a5,2ec8 <.L8>
    2ec0:	fff68513          	add	a0,a3,-1
    2ec4:	00008067          	ret

00002ec8 <.L8>:
    2ec8:	00254703          	lbu	a4,2(a0)
    2ecc:	00f71663          	bne	a4,a5,2ed8 <.L9>
    2ed0:	ffe68513          	add	a0,a3,-2
    2ed4:	00008067          	ret

00002ed8 <.L9>:
    2ed8:	00154703          	lbu	a4,1(a0)
    2edc:	00f71663          	bne	a4,a5,2ee8 <.L10>
    2ee0:	ffd68513          	add	a0,a3,-3
    2ee4:	00008067          	ret

00002ee8 <.L10>:
    2ee8:	00054703          	lbu	a4,0(a0)
    2eec:	00f70e63          	beq	a4,a5,2f08 <.L1>

00002ef0 <.L7>:
    2ef0:	ffc60613          	add	a2,a2,-4
    2ef4:	00050693          	mv	a3,a0
    2ef8:	f7dff06f          	j	2e74 <.L6>

00002efc <.L13>:
    2efc:	fff54703          	lbu	a4,-1(a0)
    2f00:	fff50513          	add	a0,a0,-1
    2f04:	f6f71ce3          	bne	a4,a5,2e7c <.L12>

00002f08 <.L1>:
    2f08:	00008067          	ret

00002f0c <__GI_strrchr>:
    2f0c:	ff010113          	add	sp,sp,-16
    2f10:	00812423          	sw	s0,8(sp)
    2f14:	00112623          	sw	ra,12(sp)
    2f18:	00912223          	sw	s1,4(sp)
    2f1c:	0ff5f413          	zext.b	s0,a1
    2f20:	04041663          	bnez	s0,2f6c <.L6>
    2f24:	00812403          	lw	s0,8(sp)
    2f28:	00c12083          	lw	ra,12(sp)
    2f2c:	00412483          	lw	s1,4(sp)
    2f30:	00000593          	li	a1,0
    2f34:	01010113          	add	sp,sp,16
    2f38:	28c0006f          	j	31c4 <__GI_strchr>

00002f3c <.L3>:
    2f3c:	00150793          	add	a5,a0,1
    2f40:	00050493          	mv	s1,a0

00002f44 <.L2>:
    2f44:	00040593          	mv	a1,s0
    2f48:	00078513          	mv	a0,a5
    2f4c:	278000ef          	jal	31c4 <__GI_strchr>
    2f50:	fe0516e3          	bnez	a0,2f3c <.L3>
    2f54:	00c12083          	lw	ra,12(sp)
    2f58:	00812403          	lw	s0,8(sp)
    2f5c:	00048513          	mv	a0,s1
    2f60:	00412483          	lw	s1,4(sp)
    2f64:	01010113          	add	sp,sp,16
    2f68:	00008067          	ret

00002f6c <.L6>:
    2f6c:	00050793          	mv	a5,a0
    2f70:	00000493          	li	s1,0
    2f74:	fd1ff06f          	j	2f44 <.L2>

00002f78 <__GI_exit>:
    2f78:	ff010113          	add	sp,sp,-16
    2f7c:	00812423          	sw	s0,8(sp)
    2f80:	00008717          	auipc	a4,0x8
    2f84:	e7072703          	lw	a4,-400(a4) # adf0 <__exit_cleanup>
    2f88:	00112623          	sw	ra,12(sp)
    2f8c:	00070793          	mv	a5,a4
    2f90:	00050413          	mv	s0,a0
    2f94:	00078463          	beqz	a5,2f9c <.L2>
    2f98:	000700e7          	jalr	a4

00002f9c <.L2>:
    2f9c:	9bdfe0ef          	jal	1958 <__uClibc_fini>
    2fa0:	00004717          	auipc	a4,0x4
    2fa4:	10072703          	lw	a4,256(a4) # 70a0 <_GLOBAL_OFFSET_TABLE_+0x38>
    2fa8:	00070793          	mv	a5,a4
    2fac:	00078463          	beqz	a5,2fb4 <.L3>
    2fb0:	000700e7          	jalr	a4

00002fb4 <.L3>:
    2fb4:	00040513          	mv	a0,s0
    2fb8:	004000ef          	jal	2fbc <__GI__exit>

00002fbc <__GI__exit>:
    2fbc:	00050713          	mv	a4,a0
    2fc0:	fffff637          	lui	a2,0xfffff
    2fc4:	00004697          	auipc	a3,0x4
    2fc8:	0b06a683          	lw	a3,176(a3) # 7074 <_GLOBAL_OFFSET_TABLE_+0xc>

00002fcc <.L2>:
    2fcc:	00070513          	mv	a0,a4
    2fd0:	05d00893          	li	a7,93
    2fd4:	00000073          	ecall
    2fd8:	fea67ae3          	bgeu	a2,a0,2fcc <.L2>
    2fdc:	40a007b3          	neg	a5,a0
    2fe0:	00f6a023          	sw	a5,0(a3)
    2fe4:	fe9ff06f          	j	2fcc <.L2>

00002fe8 <__GI_write>:
    2fe8:	04000893          	li	a7,64
    2fec:	00000073          	ecall
    2ff0:	fffff7b7          	lui	a5,0xfffff
    2ff4:	00a7fc63          	bgeu	a5,a0,300c <.L1>
    2ff8:	40a00533          	neg	a0,a0
    2ffc:	00004797          	auipc	a5,0x4
    3000:	0787a783          	lw	a5,120(a5) # 7074 <_GLOBAL_OFFSET_TABLE_+0xc>
    3004:	00a7a023          	sw	a0,0(a5)
    3008:	fff00513          	li	a0,-1

0000300c <.L1>:
    300c:	00008067          	ret

00003010 <__GI_fseek>:
    3010:	00060693          	mv	a3,a2
    3014:	41f5d613          	sra	a2,a1,0x1f
    3018:	0040006f          	j	301c <__GI_fseeko64>

0000301c <__GI_fseeko64>:
    301c:	fd010113          	add	sp,sp,-48
    3020:	02112623          	sw	ra,44(sp)
    3024:	02812423          	sw	s0,40(sp)
    3028:	00b12c23          	sw	a1,24(sp)
    302c:	00c12e23          	sw	a2,28(sp)
    3030:	00200793          	li	a5,2
    3034:	02d7f463          	bgeu	a5,a3,305c <.L2>
    3038:	00004797          	auipc	a5,0x4
    303c:	03c7a783          	lw	a5,60(a5) # 7074 <_GLOBAL_OFFSET_TABLE_+0xc>
    3040:	01600713          	li	a4,22
    3044:	00e7a023          	sw	a4,0(a5)

00003048 <.L3>:
    3048:	fff00513          	li	a0,-1

0000304c <.L1>:
    304c:	02c12083          	lw	ra,44(sp)
    3050:	02812403          	lw	s0,40(sp)
    3054:	03010113          	add	sp,sp,48
    3058:	00008067          	ret

0000305c <.L2>:
    305c:	00055783          	lhu	a5,0(a0)
    3060:	00050413          	mv	s0,a0
    3064:	00068613          	mv	a2,a3
    3068:	0407f793          	and	a5,a5,64
    306c:	06079863          	bnez	a5,30dc <.L4>

00003070 <.L7>:
    3070:	00100793          	li	a5,1
    3074:	00f61e63          	bne	a2,a5,3090 <.L5>
    3078:	01810593          	add	a1,sp,24
    307c:	00040513          	mv	a0,s0
    3080:	00c12623          	sw	a2,12(sp)
    3084:	07c000ef          	jal	3100 <__stdio_adjust_position>
    3088:	00c12603          	lw	a2,12(sp)
    308c:	fa054ee3          	bltz	a0,3048 <.L3>

00003090 <.L5>:
    3090:	00442703          	lw	a4,4(s0)
    3094:	ffe00793          	li	a5,-2
    3098:	04f71c63          	bne	a4,a5,30f0 <.L20>
    309c:	03042783          	lw	a5,48(s0)
    30a0:	fa0784e3          	beqz	a5,3048 <.L3>
    30a4:	02442503          	lw	a0,36(s0)
    30a8:	01810593          	add	a1,sp,24
    30ac:	000780e7          	jalr	a5

000030b0 <.L12>:
    30b0:	f8054ce3          	bltz	a0,3048 <.L3>
    30b4:	00045783          	lhu	a5,0(s0)
    30b8:	00000513          	li	a0,0
    30bc:	fb87f793          	and	a5,a5,-72
    30c0:	00f41023          	sh	a5,0(s0)
    30c4:	00842783          	lw	a5,8(s0)
    30c8:	00f42823          	sw	a5,16(s0)
    30cc:	00f42a23          	sw	a5,20(s0)
    30d0:	00f42c23          	sw	a5,24(s0)
    30d4:	00f42e23          	sw	a5,28(s0)
    30d8:	f75ff06f          	j	304c <.L1>

000030dc <.L4>:
    30dc:	00d12623          	sw	a3,12(sp)
    30e0:	96cfd0ef          	jal	24c <__stdio_wcommit>
    30e4:	00c12603          	lw	a2,12(sp)
    30e8:	f80504e3          	beqz	a0,3070 <.L7>
    30ec:	f5dff06f          	j	3048 <.L3>

000030f0 <.L20>:
    30f0:	01810593          	add	a1,sp,24
    30f4:	00040513          	mv	a0,s0
    30f8:	088000ef          	jal	3180 <__stdio_seek>
    30fc:	fb5ff06f          	j	30b0 <.L12>

00003100 <__stdio_adjust_position>:
    3100:	00055783          	lhu	a5,0(a0)
    3104:	00000713          	li	a4,0
    3108:	0037f693          	and	a3,a5,3
    310c:	00068463          	beqz	a3,3114 <.L2>
    3110:	fff68713          	add	a4,a3,-1

00003114 <.L2>:
    3114:	0407f793          	and	a5,a5,64
    3118:	06078063          	beqz	a5,3178 <.L3>
    311c:	00852783          	lw	a5,8(a0)

00003120 <.L4>:
    3120:	01052683          	lw	a3,16(a0)
    3124:	0045a603          	lw	a2,4(a1)
    3128:	40d78533          	sub	a0,a5,a3
    312c:	00e50533          	add	a0,a0,a4
    3130:	0005a703          	lw	a4,0(a1)
    3134:	41f55793          	sra	a5,a0,0x1f
    3138:	40f607b3          	sub	a5,a2,a5
    313c:	40a706b3          	sub	a3,a4,a0
    3140:	00d73833          	sltu	a6,a4,a3
    3144:	410787b3          	sub	a5,a5,a6
    3148:	00d5a023          	sw	a3,0(a1)
    314c:	00f5a223          	sw	a5,4(a1)
    3150:	00f64663          	blt	a2,a5,315c <.L9>
    3154:	00c79663          	bne	a5,a2,3160 <.L5>
    3158:	00d77463          	bgeu	a4,a3,3160 <.L5>

0000315c <.L9>:
    315c:	40a00533          	neg	a0,a0

00003160 <.L5>:
    3160:	00055a63          	bgez	a0,3174 <.L1>
    3164:	00004797          	auipc	a5,0x4
    3168:	f107a783          	lw	a5,-240(a5) # 7074 <_GLOBAL_OFFSET_TABLE_+0xc>
    316c:	04b00713          	li	a4,75
    3170:	00e7a023          	sw	a4,0(a5)

00003174 <.L1>:
    3174:	00008067          	ret

00003178 <.L3>:
    3178:	01452783          	lw	a5,20(a0)
    317c:	fa5ff06f          	j	3120 <.L4>

00003180 <__stdio_seek>:
    3180:	ff010113          	add	sp,sp,-16
    3184:	00812423          	sw	s0,8(sp)
    3188:	00058413          	mv	s0,a1
    318c:	00060693          	mv	a3,a2
    3190:	0005a583          	lw	a1,0(a1)
    3194:	00442603          	lw	a2,4(s0)
    3198:	00452503          	lw	a0,4(a0)
    319c:	00112623          	sw	ra,12(sp)
    31a0:	0e0000ef          	jal	3280 <__GI_lseek64>
    31a4:	0005c863          	bltz	a1,31b4 <.L1>
    31a8:	00a42023          	sw	a0,0(s0)
    31ac:	00b42223          	sw	a1,4(s0)
    31b0:	00000513          	li	a0,0

000031b4 <.L1>:
    31b4:	00c12083          	lw	ra,12(sp)
    31b8:	00812403          	lw	s0,8(sp)
    31bc:	01010113          	add	sp,sp,16
    31c0:	00008067          	ret

000031c4 <__GI_strchr>:
    31c4:	0ff5f693          	zext.b	a3,a1

000031c8 <.L2>:
    31c8:	00357793          	and	a5,a0,3
    31cc:	06079263          	bnez	a5,3230 <.L4>
    31d0:	010107b7          	lui	a5,0x1010
    31d4:	0ff5f593          	zext.b	a1,a1
    31d8:	10178793          	add	a5,a5,257 # 1010101 <_ebss+0x10052a1>
    31dc:	02f585b3          	mul	a1,a1,a5
    31e0:	7eff0637          	lui	a2,0x7eff0
    31e4:	eff60613          	add	a2,a2,-257 # 7efefeff <_ebss+0x7efe509f>
    31e8:	fff00313          	li	t1,-1

000031ec <.L5>:
    31ec:	00052803          	lw	a6,0(a0)
    31f0:	00450713          	add	a4,a0,4
    31f4:	0105c8b3          	xor	a7,a1,a6
    31f8:	00c807b3          	add	a5,a6,a2
    31fc:	0107c7b3          	xor	a5,a5,a6
    3200:	00c88833          	add	a6,a7,a2
    3204:	01184833          	xor	a6,a6,a7
    3208:	0107f7b3          	and	a5,a5,a6
    320c:	00c7e7b3          	or	a5,a5,a2
    3210:	02678a63          	beq	a5,t1,3244 <.L6>
    3214:	ffc74783          	lbu	a5,-4(a4)
    3218:	06d78263          	beq	a5,a3,327c <.L1>
    321c:	04078e63          	beqz	a5,3278 <.L13>
    3220:	ffd74783          	lbu	a5,-3(a4)
    3224:	02d79463          	bne	a5,a3,324c <.L7>
    3228:	00150513          	add	a0,a0,1
    322c:	00008067          	ret

00003230 <.L4>:
    3230:	00054783          	lbu	a5,0(a0)
    3234:	04d78463          	beq	a5,a3,327c <.L1>
    3238:	04078063          	beqz	a5,3278 <.L13>
    323c:	00150513          	add	a0,a0,1
    3240:	f89ff06f          	j	31c8 <.L2>

00003244 <.L6>:
    3244:	00070513          	mv	a0,a4
    3248:	fa5ff06f          	j	31ec <.L5>

0000324c <.L7>:
    324c:	02078663          	beqz	a5,3278 <.L13>
    3250:	ffe74783          	lbu	a5,-2(a4)
    3254:	00d79663          	bne	a5,a3,3260 <.L8>
    3258:	00250513          	add	a0,a0,2
    325c:	00008067          	ret

00003260 <.L8>:
    3260:	00078c63          	beqz	a5,3278 <.L13>
    3264:	fff74783          	lbu	a5,-1(a4)
    3268:	00d79663          	bne	a5,a3,3274 <.L9>
    326c:	00350513          	add	a0,a0,3
    3270:	00008067          	ret

00003274 <.L9>:
    3274:	fc0798e3          	bnez	a5,3244 <.L6>

00003278 <.L13>:
    3278:	00000513          	li	a0,0

0000327c <.L1>:
    327c:	00008067          	ret

00003280 <__GI_lseek64>:
    3280:	00058793          	mv	a5,a1
    3284:	ff010113          	add	sp,sp,-16
    3288:	00068713          	mv	a4,a3
    328c:	00060593          	mv	a1,a2
    3290:	00810693          	add	a3,sp,8
    3294:	00078613          	mv	a2,a5
    3298:	03e00893          	li	a7,62
    329c:	00000073          	ecall
    32a0:	fffff7b7          	lui	a5,0xfffff
    32a4:	02a7f263          	bgeu	a5,a0,32c8 <.L2>
    32a8:	40a00533          	neg	a0,a0
    32ac:	00004797          	auipc	a5,0x4
    32b0:	dc87a783          	lw	a5,-568(a5) # 7074 <_GLOBAL_OFFSET_TABLE_+0xc>
    32b4:	00a7a023          	sw	a0,0(a5)
    32b8:	fff00593          	li	a1,-1
    32bc:	fff00513          	li	a0,-1

000032c0 <.L1>:
    32c0:	01010113          	add	sp,sp,16
    32c4:	00008067          	ret

000032c8 <.L2>:
    32c8:	41f55593          	sra	a1,a0,0x1f
    32cc:	00b567b3          	or	a5,a0,a1
    32d0:	fe0798e3          	bnez	a5,32c0 <.L1>
    32d4:	00812503          	lw	a0,8(sp)
    32d8:	00c12583          	lw	a1,12(sp)
    32dc:	fe5ff06f          	j	32c0 <.L1>

000032e0 <__divtf3>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__divtf3 (TFtype a, TFtype b)
{
    32e0:	f5010113          	add	sp,sp,-176
    32e4:	09312e23          	sw	s3,156(sp)
    32e8:	00c5a983          	lw	s3,12(a1)
    32ec:	0045a783          	lw	a5,4(a1)
    32f0:	0085a803          	lw	a6,8(a1)
    32f4:	0a812423          	sw	s0,168(sp)
    32f8:	00050413          	mv	s0,a0
    32fc:	0005a503          	lw	a0,0(a1)

00003300 <.LBB3>:
  FP_DECL_Q (B);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_Q (A, a);
    3300:	01099713          	sll	a4,s3,0x10

00003304 <.LBE3>:
{
    3304:	0b212023          	sw	s2,160(sp)
    3308:	09512a23          	sw	s5,148(sp)
    330c:	00462903          	lw	s2,4(a2)
    3310:	00c62a83          	lw	s5,12(a2)
    3314:	09612823          	sw	s6,144(sp)
    3318:	09712623          	sw	s7,140(sp)
    331c:	00862b03          	lw	s6,8(a2)
    3320:	00062b83          	lw	s7,0(a2)

00003324 <.LBB4>:
  FP_UNPACK_Q (A, a);
    3324:	00008637          	lui	a2,0x8

00003328 <.LBE4>:
{
    3328:	0a912223          	sw	s1,164(sp)

0000332c <.LBB5>:
  FP_UNPACK_Q (A, a);
    332c:	01075713          	srl	a4,a4,0x10
    3330:	0109d493          	srl	s1,s3,0x10
    3334:	fff60613          	add	a2,a2,-1 # 7fff <.LLST128+0x4b>
    3338:	07312623          	sw	s3,108(sp)

0000333c <.LBE5>:
{
    333c:	0a112623          	sw	ra,172(sp)
    3340:	09412c23          	sw	s4,152(sp)
    3344:	09812423          	sw	s8,136(sp)
    3348:	09912223          	sw	s9,132(sp)
    334c:	09a12023          	sw	s10,128(sp)
    3350:	07b12e23          	sw	s11,124(sp)

00003354 <.LBB6>:
  FP_UNPACK_Q (A, a);
    3354:	06a12023          	sw	a0,96(sp)
    3358:	06f12223          	sw	a5,100(sp)
    335c:	07012423          	sw	a6,104(sp)
    3360:	02a12823          	sw	a0,48(sp)
    3364:	02f12a23          	sw	a5,52(sp)
    3368:	03012c23          	sw	a6,56(sp)
    336c:	02e12e23          	sw	a4,60(sp)
    3370:	00c4f6b3          	and	a3,s1,a2

00003374 <.LVL2>:
    3374:	01f9d993          	srl	s3,s3,0x1f

00003378 <.LBE6>:
    3378:	10068e63          	beqz	a3,3494 <.L2>
    337c:	24c68863          	beq	a3,a2,35cc <.L3>
    3380:	000107b7          	lui	a5,0x10
    3384:	00f76733          	or	a4,a4,a5
    3388:	02e12e23          	sw	a4,60(sp)

0000338c <.LBB7>:
    338c:	03010593          	add	a1,sp,48
    3390:	03c10793          	add	a5,sp,60

00003394 <.L4>:
    3394:	0007a703          	lw	a4,0(a5) # 10000 <_ebss+0x51a0>
    3398:	ffc7a603          	lw	a2,-4(a5)
    339c:	ffc78793          	add	a5,a5,-4
    33a0:	00371713          	sll	a4,a4,0x3
    33a4:	01d65613          	srl	a2,a2,0x1d
    33a8:	00c76733          	or	a4,a4,a2
    33ac:	00e7a223          	sw	a4,4(a5)
    33b0:	fef592e3          	bne	a1,a5,3394 <.L4>

000033b4 <.LBE7>:
    33b4:	ffffc7b7          	lui	a5,0xffffc

000033b8 <.LBB8>:
    33b8:	00351513          	sll	a0,a0,0x3

000033bc <.LBE8>:
    33bc:	00178793          	add	a5,a5,1 # ffffc001 <_ebss+0xffff11a1>

000033c0 <.LBB9>:
    33c0:	02a12823          	sw	a0,48(sp)

000033c4 <.LBE9>:
    33c4:	00f684b3          	add	s1,a3,a5

000033c8 <.L193>:
    33c8:	00000a13          	li	s4,0

000033cc <.L5>:
  FP_UNPACK_Q (B, b);
    33cc:	010a9513          	sll	a0,s5,0x10
    33d0:	00008737          	lui	a4,0x8
    33d4:	010ad793          	srl	a5,s5,0x10
    33d8:	01055513          	srl	a0,a0,0x10
    33dc:	fff70713          	add	a4,a4,-1 # 7fff <.LLST128+0x4b>
    33e0:	07512623          	sw	s5,108(sp)
    33e4:	07712023          	sw	s7,96(sp)
    33e8:	07212223          	sw	s2,100(sp)
    33ec:	07612423          	sw	s6,104(sp)
    33f0:	05712023          	sw	s7,64(sp)
    33f4:	05212223          	sw	s2,68(sp)
    33f8:	05612423          	sw	s6,72(sp)
    33fc:	04a12623          	sw	a0,76(sp)
    3400:	00e7f7b3          	and	a5,a5,a4

00003404 <.LVL9>:
    3404:	01fada93          	srl	s5,s5,0x1f

00003408 <.LBE13>:
    3408:	1e078863          	beqz	a5,35f8 <.L18>
    340c:	32e78263          	beq	a5,a4,3730 <.L19>
    3410:	00010737          	lui	a4,0x10
    3414:	00e56533          	or	a0,a0,a4
    3418:	04a12623          	sw	a0,76(sp)

0000341c <.LBB14>:
    341c:	04010593          	add	a1,sp,64
    3420:	04c10713          	add	a4,sp,76

00003424 <.L20>:
    3424:	00072683          	lw	a3,0(a4) # 10000 <_ebss+0x51a0>
    3428:	ffc72603          	lw	a2,-4(a4)
    342c:	ffc70713          	add	a4,a4,-4
    3430:	00369693          	sll	a3,a3,0x3
    3434:	01d65613          	srl	a2,a2,0x1d
    3438:	00c6e6b3          	or	a3,a3,a2
    343c:	00d72223          	sw	a3,4(a4)
    3440:	fee592e3          	bne	a1,a4,3424 <.L20>

00003444 <.LBE14>:
    3444:	ffffc737          	lui	a4,0xffffc

00003448 <.LBB15>:
    3448:	003b9b93          	sll	s7,s7,0x3

0000344c <.LBE15>:
    344c:	00170713          	add	a4,a4,1 # ffffc001 <_ebss+0xffff11a1>

00003450 <.LBB16>:
    3450:	05712023          	sw	s7,64(sp)

00003454 <.LBE16>:
    3454:	00e787b3          	add	a5,a5,a4

00003458 <.L194>:
    3458:	00000713          	li	a4,0

0000345c <.L21>:
  FP_DIV_Q (R, A, B);
    345c:	40f486b3          	sub	a3,s1,a5
    3460:	002a1793          	sll	a5,s4,0x2

00003464 <.LVL16>:
    3464:	00e7e7b3          	or	a5,a5,a4
    3468:	fff78793          	add	a5,a5,-1
    346c:	00e00613          	li	a2,14
    3470:	0159c933          	xor	s2,s3,s5

00003474 <.LVL17>:
    3474:	2ef66263          	bltu	a2,a5,3758 <.L34>
    3478:	00005617          	auipc	a2,0x5
    347c:	d0860613          	add	a2,a2,-760 # 8180 <.L36>
    3480:	00279793          	sll	a5,a5,0x2
    3484:	00c787b3          	add	a5,a5,a2
    3488:	0007a783          	lw	a5,0(a5)
    348c:	00c787b3          	add	a5,a5,a2
    3490:	00078067          	jr	a5

00003494 <.L2>:
  FP_UNPACK_Q (A, a);
    3494:	00a7e6b3          	or	a3,a5,a0

00003498 <.LVL19>:
    3498:	0106e6b3          	or	a3,a3,a6
    349c:	00e6e6b3          	or	a3,a3,a4
    34a0:	14068663          	beqz	a3,35ec <.L145>

000034a4 <.LBB20>:
    34a4:	0a070063          	beqz	a4,3544 <.L6>
    34a8:	00070513          	mv	a0,a4
    34ac:	309030ef          	jal	6fb4 <__clzsi2>

000034b0 <.L7>:
    34b0:	ff450713          	add	a4,a0,-12
    34b4:	40575593          	sra	a1,a4,0x5

000034b8 <.LVL21>:
    34b8:	01f77713          	and	a4,a4,31

000034bc <.LVL22>:
    34bc:	0a070e63          	beqz	a4,3578 <.L10>
    34c0:	ffc00693          	li	a3,-4
    34c4:	02d586b3          	mul	a3,a1,a3
    34c8:	02000813          	li	a6,32
    34cc:	03010313          	add	t1,sp,48
    34d0:	40e80833          	sub	a6,a6,a4

000034d4 <.LVL23>:
    34d4:	00c68793          	add	a5,a3,12
    34d8:	00f307b3          	add	a5,t1,a5
    34dc:	40d006b3          	neg	a3,a3

000034e0 <.L11>:
    34e0:	0cf31463          	bne	t1,a5,35a8 <.L14>
    34e4:	fff58793          	add	a5,a1,-1

000034e8 <.LVL24>:
    34e8:	00259593          	sll	a1,a1,0x2

000034ec <.LVL25>:
    34ec:	04058693          	add	a3,a1,64
    34f0:	03010613          	add	a2,sp,48
    34f4:	00c685b3          	add	a1,a3,a2
    34f8:	03012683          	lw	a3,48(sp)
    34fc:	00e69733          	sll	a4,a3,a4

00003500 <.LVL26>:
    3500:	fce5a023          	sw	a4,-64(a1)

00003504 <.L15>:
    3504:	00178793          	add	a5,a5,1
    3508:	00279793          	sll	a5,a5,0x2
    350c:	00800693          	li	a3,8
    3510:	03010713          	add	a4,sp,48
    3514:	00d7ea63          	bltu	a5,a3,3528 <.L16>
    3518:	02012823          	sw	zero,48(sp)
    351c:	00072223          	sw	zero,4(a4)
    3520:	ff878793          	add	a5,a5,-8
    3524:	03810713          	add	a4,sp,56

00003528 <.L16>:
    3528:	00400693          	li	a3,4
    352c:	00d7e463          	bltu	a5,a3,3534 <.L17>
    3530:	00072023          	sw	zero,0(a4)

00003534 <.L17>:
    3534:	ffffc6b7          	lui	a3,0xffffc
    3538:	01168693          	add	a3,a3,17 # ffffc011 <_ebss+0xffff11b1>
    353c:	40a684b3          	sub	s1,a3,a0

00003540 <.LVL28>:
    3540:	e89ff06f          	j	33c8 <.L193>

00003544 <.L6>:
    3544:	00080a63          	beqz	a6,3558 <.L8>
    3548:	00080513          	mv	a0,a6
    354c:	269030ef          	jal	6fb4 <__clzsi2>

00003550 <.LVL30>:
    3550:	02050513          	add	a0,a0,32
    3554:	f5dff06f          	j	34b0 <.L7>

00003558 <.L8>:
    3558:	00078a63          	beqz	a5,356c <.L9>
    355c:	00078513          	mv	a0,a5
    3560:	255030ef          	jal	6fb4 <__clzsi2>

00003564 <.LVL33>:
    3564:	04050513          	add	a0,a0,64
    3568:	f49ff06f          	j	34b0 <.L7>

0000356c <.L9>:
    356c:	249030ef          	jal	6fb4 <__clzsi2>

00003570 <.LVL36>:
    3570:	06050513          	add	a0,a0,96
    3574:	f3dff06f          	j	34b0 <.L7>

00003578 <.L10>:
    3578:	ffc00693          	li	a3,-4
    357c:	02d586b3          	mul	a3,a1,a3
    3580:	03c10793          	add	a5,sp,60

00003584 <.LBB12>:
    3584:	00300713          	li	a4,3

00003588 <.L12>:
    3588:	00d78633          	add	a2,a5,a3
    358c:	00062603          	lw	a2,0(a2)
    3590:	fff70713          	add	a4,a4,-1

00003594 <.LVL40>:
    3594:	ffc78793          	add	a5,a5,-4
    3598:	00c7a223          	sw	a2,4(a5)

0000359c <.LVL41>:
    359c:	feb756e3          	bge	a4,a1,3588 <.L12>
    35a0:	fff58793          	add	a5,a1,-1
    35a4:	f61ff06f          	j	3504 <.L15>

000035a8 <.L14>:
    35a8:	0007a603          	lw	a2,0(a5)
    35ac:	ffc7a883          	lw	a7,-4(a5)
    35b0:	00d78e33          	add	t3,a5,a3
    35b4:	00e61633          	sll	a2,a2,a4
    35b8:	0108d8b3          	srl	a7,a7,a6
    35bc:	01166633          	or	a2,a2,a7
    35c0:	00ce2023          	sw	a2,0(t3)
    35c4:	ffc78793          	add	a5,a5,-4
    35c8:	f19ff06f          	j	34e0 <.L11>

000035cc <.L3>:
    35cc:	00a7e7b3          	or	a5,a5,a0
    35d0:	0107e7b3          	or	a5,a5,a6
    35d4:	00e7e7b3          	or	a5,a5,a4

000035d8 <.LBB21>:
    35d8:	00068493          	mv	s1,a3

000035dc <.LBE21>:
    35dc:	00200a13          	li	s4,2
    35e0:	de0786e3          	beqz	a5,33cc <.L5>
    35e4:	00300a13          	li	s4,3
    35e8:	de5ff06f          	j	33cc <.L5>

000035ec <.L145>:
    35ec:	00000493          	li	s1,0

000035f0 <.LBE22>:
    35f0:	00100a13          	li	s4,1
    35f4:	dd9ff06f          	j	33cc <.L5>

000035f8 <.L18>:
  FP_UNPACK_Q (B, b);
    35f8:	017967b3          	or	a5,s2,s7

000035fc <.LVL47>:
    35fc:	0167e7b3          	or	a5,a5,s6
    3600:	00a7e7b3          	or	a5,a5,a0
    3604:	14078463          	beqz	a5,374c <.L147>

00003608 <.LBB23>:
    3608:	08050e63          	beqz	a0,36a4 <.L22>
    360c:	1a9030ef          	jal	6fb4 <__clzsi2>

00003610 <.L23>:
    3610:	ff450693          	add	a3,a0,-12
    3614:	4056d793          	sra	a5,a3,0x5

00003618 <.LVL49>:
    3618:	01f6f693          	and	a3,a3,31

0000361c <.LVL50>:
    361c:	0c068063          	beqz	a3,36dc <.L26>
    3620:	ffc00613          	li	a2,-4
    3624:	02c78633          	mul	a2,a5,a2
    3628:	02000813          	li	a6,32
    362c:	04010313          	add	t1,sp,64
    3630:	40d80833          	sub	a6,a6,a3

00003634 <.LVL51>:
    3634:	00c60713          	add	a4,a2,12
    3638:	00e30733          	add	a4,t1,a4
    363c:	40c00633          	neg	a2,a2

00003640 <.L27>:
    3640:	0ce31663          	bne	t1,a4,370c <.L30>
    3644:	fff78713          	add	a4,a5,-1

00003648 <.LVL52>:
    3648:	00279793          	sll	a5,a5,0x2

0000364c <.LVL53>:
    364c:	03010613          	add	a2,sp,48
    3650:	04078793          	add	a5,a5,64
    3654:	00c787b3          	add	a5,a5,a2
    3658:	04012603          	lw	a2,64(sp)
    365c:	00d616b3          	sll	a3,a2,a3

00003660 <.LVL54>:
    3660:	fcd7a823          	sw	a3,-48(a5)

00003664 <.L31>:
    3664:	00170793          	add	a5,a4,1
    3668:	00279793          	sll	a5,a5,0x2
    366c:	00800693          	li	a3,8
    3670:	04010713          	add	a4,sp,64
    3674:	00d7ea63          	bltu	a5,a3,3688 <.L32>
    3678:	04012023          	sw	zero,64(sp)
    367c:	00072223          	sw	zero,4(a4)
    3680:	ff878793          	add	a5,a5,-8
    3684:	04810713          	add	a4,sp,72

00003688 <.L32>:
    3688:	00400693          	li	a3,4
    368c:	00d7e463          	bltu	a5,a3,3694 <.L33>
    3690:	00072023          	sw	zero,0(a4)

00003694 <.L33>:
    3694:	ffffc7b7          	lui	a5,0xffffc
    3698:	01178793          	add	a5,a5,17 # ffffc011 <_ebss+0xffff11b1>
    369c:	40a787b3          	sub	a5,a5,a0
    36a0:	db9ff06f          	j	3458 <.L194>

000036a4 <.L22>:
    36a4:	000b0a63          	beqz	s6,36b8 <.L24>
    36a8:	000b0513          	mv	a0,s6
    36ac:	109030ef          	jal	6fb4 <__clzsi2>

000036b0 <.LVL57>:
    36b0:	02050513          	add	a0,a0,32
    36b4:	f5dff06f          	j	3610 <.L23>

000036b8 <.L24>:
    36b8:	00090a63          	beqz	s2,36cc <.L25>
    36bc:	00090513          	mv	a0,s2
    36c0:	0f5030ef          	jal	6fb4 <__clzsi2>

000036c4 <.LVL60>:
    36c4:	04050513          	add	a0,a0,64
    36c8:	f49ff06f          	j	3610 <.L23>

000036cc <.L25>:
    36cc:	000b8513          	mv	a0,s7
    36d0:	0e5030ef          	jal	6fb4 <__clzsi2>

000036d4 <.LVL63>:
    36d4:	06050513          	add	a0,a0,96
    36d8:	f39ff06f          	j	3610 <.L23>

000036dc <.L26>:
    36dc:	ffc00613          	li	a2,-4
    36e0:	02c78633          	mul	a2,a5,a2
    36e4:	04c10713          	add	a4,sp,76

000036e8 <.LBB19>:
    36e8:	00300693          	li	a3,3

000036ec <.L28>:
    36ec:	00c705b3          	add	a1,a4,a2
    36f0:	0005a583          	lw	a1,0(a1)
    36f4:	fff68693          	add	a3,a3,-1

000036f8 <.LVL67>:
    36f8:	ffc70713          	add	a4,a4,-4
    36fc:	00b72223          	sw	a1,4(a4)

00003700 <.LVL68>:
    3700:	fef6d6e3          	bge	a3,a5,36ec <.L28>
    3704:	fff78713          	add	a4,a5,-1
    3708:	f5dff06f          	j	3664 <.L31>

0000370c <.L30>:
    370c:	00072583          	lw	a1,0(a4)
    3710:	ffc72883          	lw	a7,-4(a4)
    3714:	00c70e33          	add	t3,a4,a2
    3718:	00d595b3          	sll	a1,a1,a3
    371c:	0108d8b3          	srl	a7,a7,a6
    3720:	0115e5b3          	or	a1,a1,a7
    3724:	00be2023          	sw	a1,0(t3)
    3728:	ffc70713          	add	a4,a4,-4
    372c:	f15ff06f          	j	3640 <.L27>

00003730 <.L19>:
    3730:	01796933          	or	s2,s2,s7
    3734:	01696933          	or	s2,s2,s6
    3738:	00a96933          	or	s2,s2,a0
    373c:	00200713          	li	a4,2
    3740:	d0090ee3          	beqz	s2,345c <.L21>
    3744:	00300713          	li	a4,3
    3748:	d15ff06f          	j	345c <.L21>

0000374c <.L147>:
    374c:	00000793          	li	a5,0

00003750 <.LBE24>:
    3750:	00100713          	li	a4,1

00003754 <.LVL72>:
    3754:	d09ff06f          	j	345c <.L21>

00003758 <.L34>:
  FP_DIV_Q (R, A, B);
    3758:	03c12703          	lw	a4,60(sp)

0000375c <.LVL74>:
    375c:	04c12503          	lw	a0,76(sp)
    3760:	06012623          	sw	zero,108(sp)
    3764:	06012423          	sw	zero,104(sp)
    3768:	06012223          	sw	zero,100(sp)
    376c:	06012023          	sw	zero,96(sp)
    3770:	03012783          	lw	a5,48(sp)
    3774:	03412603          	lw	a2,52(sp)
    3778:	04012803          	lw	a6,64(sp)
    377c:	04812583          	lw	a1,72(sp)
    3780:	02e56263          	bltu	a0,a4,37a4 <.L41>
    3784:	22a71263          	bne	a4,a0,39a8 <.L42>
    3788:	03812503          	lw	a0,56(sp)
    378c:	00a5ec63          	bltu	a1,a0,37a4 <.L41>
    3790:	20b51c63          	bne	a0,a1,39a8 <.L42>
    3794:	04412583          	lw	a1,68(sp)
    3798:	00c5e663          	bltu	a1,a2,37a4 <.L41>
    379c:	20c59663          	bne	a1,a2,39a8 <.L42>
    37a0:	2107e463          	bltu	a5,a6,39a8 <.L42>

000037a4 <.L41>:
    37a4:	01f79793          	sll	a5,a5,0x1f
    37a8:	06f12623          	sw	a5,108(sp)

000037ac <.LBB26>:
    37ac:	03c10513          	add	a0,sp,60
    37b0:	03010793          	add	a5,sp,48

000037b4 <.L43>:
    37b4:	0007a603          	lw	a2,0(a5)
    37b8:	0047a583          	lw	a1,4(a5)
    37bc:	00478793          	add	a5,a5,4
    37c0:	00165613          	srl	a2,a2,0x1
    37c4:	01f59593          	sll	a1,a1,0x1f
    37c8:	00b66633          	or	a2,a2,a1
    37cc:	fec7ae23          	sw	a2,-4(a5)
    37d0:	fef512e3          	bne	a0,a5,37b4 <.L43>

000037d4 <.LVL77>:
    37d4:	00175713          	srl	a4,a4,0x1
    37d8:	02e12e23          	sw	a4,60(sp)

000037dc <.L44>:
    37dc:	04010593          	add	a1,sp,64
    37e0:	04c10793          	add	a5,sp,76

000037e4 <.L45>:
    37e4:	0007a703          	lw	a4,0(a5)
    37e8:	ffc7a603          	lw	a2,-4(a5)
    37ec:	ffc78793          	add	a5,a5,-4
    37f0:	00c71713          	sll	a4,a4,0xc
    37f4:	01465613          	srl	a2,a2,0x14
    37f8:	00c76733          	or	a4,a4,a2
    37fc:	00e7a223          	sw	a4,4(a5)
    3800:	fef592e3          	bne	a1,a5,37e4 <.L45>

00003804 <.LBE27>:
    3804:	04c12503          	lw	a0,76(sp)

00003808 <.LBB28>:
    3808:	00010eb7          	lui	t4,0x10

0000380c <.LBB29>:
    380c:	04412303          	lw	t1,68(sp)

00003810 <.LBB54>:
    3810:	fffe8e93          	add	t4,t4,-1 # ffff <_ebss+0x519f>

00003814 <.LBB55>:
    3814:	00c81813          	sll	a6,a6,0xc

00003818 <.LBB56>:
    3818:	01d577b3          	and	a5,a0,t4

0000381c <.LBB31>:
    381c:	04812f83          	lw	t6,72(sp)

00003820 <.LBB58>:
    3820:	00f12e23          	sw	a5,28(sp)

00003824 <.LBB32>:
    3824:	01085793          	srl	a5,a6,0x10
    3828:	00f12423          	sw	a5,8(sp)

0000382c <.LBB33>:
    382c:	01035793          	srl	a5,t1,0x10
    3830:	00f12623          	sw	a5,12(sp)
    3834:	01d377b3          	and	a5,t1,t4
    3838:	00f12a23          	sw	a5,20(sp)

0000383c <.LBB34>:
    383c:	010fd793          	srl	a5,t6,0x10
    3840:	00f12823          	sw	a5,16(sp)
    3844:	01dff7b3          	and	a5,t6,t4
    3848:	00f12c23          	sw	a5,24(sp)
    384c:	01d877b3          	and	a5,a6,t4
    3850:	02f12023          	sw	a5,32(sp)
    3854:	03812883          	lw	a7,56(sp)

00003858 <.LBB60>:
    3858:	410307b3          	sub	a5,t1,a6
    385c:	03c12703          	lw	a4,60(sp)
    3860:	03412603          	lw	a2,52(sp)
    3864:	03012583          	lw	a1,48(sp)
    3868:	02f12223          	sw	a5,36(sp)
    386c:	406f87b3          	sub	a5,t6,t1

00003870 <.LBB61>:
    3870:	01055d13          	srl	s10,a0,0x10
    3874:	05010a13          	add	s4,sp,80

00003878 <.LVL81>:
    3878:	06010c13          	add	s8,sp,96

0000387c <.LBE61>:
    387c:	00300c93          	li	s9,3

00003880 <.LBB62>:
    3880:	00010db7          	lui	s11,0x10

00003884 <.LBB63>:
    3884:	02f12423          	sw	a5,40(sp)

00003888 <.L113>:
    3888:	12e51463          	bne	a0,a4,39b0 <.L46>
    388c:	fff00793          	li	a5,-1
    3890:	00fa2623          	sw	a5,12(s4)
    3894:	3e0c8c63          	beqz	s9,3c8c <.L114>

00003898 <.LBB64>:
    3898:	00cc2f03          	lw	t5,12(s8)

0000389c <.LVL83>:
    389c:	40b803b3          	sub	t2,a6,a1
    38a0:	00783e33          	sltu	t3,a6,t2
    38a4:	01e037b3          	snez	a5,t5

000038a8 <.LVL84>:
    38a8:	00000993          	li	s3,0
    38ac:	000f0463          	beqz	t5,38b4 <.L50>
    38b0:	0013b993          	seqz	s3,t2

000038b4 <.L50>:
    38b4:	01c9e9b3          	or	s3,s3,t3

000038b8 <.LVL85>:
    38b8:	40c302b3          	sub	t0,t1,a2

000038bc <.LVL86>:
    38bc:	00533e33          	sltu	t3,t1,t0

000038c0 <.LVL87>:
    38c0:	00000a93          	li	s5,0
    38c4:	00098463          	beqz	s3,38cc <.L53>
    38c8:	0012ba93          	seqz	s5,t0

000038cc <.L53>:
    38cc:	01caeab3          	or	s5,s5,t3

000038d0 <.LBB65>:
    38d0:	02412e03          	lw	t3,36(sp)
    38d4:	01e80f33          	add	t5,a6,t5

000038d8 <.LVL89>:
    38d8:	00be0e33          	add	t3,t3,a1
    38dc:	00fe0e33          	add	t3,t3,a5

000038e0 <.LVL90>:
    38e0:	01e835b3          	sltu	a1,a6,t5
    38e4:	01c334b3          	sltu	s1,t1,t3

000038e8 <.LVL91>:
    38e8:	40be0e33          	sub	t3,t3,a1

000038ec <.LVL92>:
    38ec:	00000593          	li	a1,0
    38f0:	01e87863          	bgeu	a6,t5,3900 <.L54>

000038f4 <.LBB66>:
    38f4:	40f383b3          	sub	t2,t2,a5

000038f8 <.LBB67>:
    38f8:	406383b3          	sub	t2,t2,t1
    38fc:	0013b593          	seqz	a1,t2

00003900 <.L54>:
    3900:	02812783          	lw	a5,40(sp)

00003904 <.LVL94>:
    3904:	0095e5b3          	or	a1,a1,s1

00003908 <.LVL95>:
    3908:	00c784b3          	add	s1,a5,a2
    390c:	013484b3          	add	s1,s1,s3

00003910 <.LVL96>:
    3910:	009fb3b3          	sltu	t2,t6,s1

00003914 <.LVL97>:
    3914:	00000613          	li	a2,0
    3918:	40b484b3          	sub	s1,s1,a1

0000391c <.LVL98>:
    391c:	00058863          	beqz	a1,392c <.L55>

00003920 <.LBB68>:
    3920:	413282b3          	sub	t0,t0,s3

00003924 <.LBB69>:
    3924:	41f282b3          	sub	t0,t0,t6
    3928:	0012b613          	seqz	a2,t0

0000392c <.L55>:
    392c:	41f707b3          	sub	a5,a4,t6
    3930:	011787b3          	add	a5,a5,a7
    3934:	015787b3          	add	a5,a5,s5
    3938:	00766633          	or	a2,a2,t2

0000393c <.LVL101>:
    393c:	40c787b3          	sub	a5,a5,a2

00003940 <.LBE69>:
    3940:	04f77463          	bgeu	a4,a5,3988 <.L56>
    3944:	006e02b3          	add	t0,t3,t1
    3948:	01e80f33          	add	t5,a6,t5

0000394c <.LVL102>:
    394c:	01c2b8b3          	sltu	a7,t0,t3

00003950 <.LBB70>:
    3950:	010f3e33          	sltu	t3,t5,a6

00003954 <.LVL103>:
    3954:	01c28e33          	add	t3,t0,t3
    3958:	005e32b3          	sltu	t0,t3,t0
    395c:	01f485b3          	add	a1,s1,t6

00003960 <.LVL104>:
    3960:	0058e8b3          	or	a7,a7,t0

00003964 <.LBE70>:
    3964:	ffe00613          	li	a2,-2

00003968 <.LVL105>:
    3968:	011588b3          	add	a7,a1,a7
    396c:	00ca2623          	sw	a2,12(s4)

00003970 <.LBB71>:
    3970:	0095b633          	sltu	a2,a1,s1

00003974 <.LVL107>:
    3974:	00b8b5b3          	sltu	a1,a7,a1
    3978:	00b66633          	or	a2,a2,a1

0000397c <.LVL108>:
    397c:	00e60633          	add	a2,a2,a4
    3980:	00088493          	mv	s1,a7

00003984 <.LVL109>:
    3984:	00c787b3          	add	a5,a5,a2

00003988 <.L56>:
    3988:	fffc8c93          	add	s9,s9,-1
    398c:	ffca0a13          	add	s4,s4,-4
    3990:	ffcc0c13          	add	s8,s8,-4
    3994:	00048893          	mv	a7,s1
    3998:	000e0613          	mv	a2,t3
    399c:	000f0593          	mv	a1,t5
    39a0:	00078713          	mv	a4,a5
    39a4:	ee5ff06f          	j	3888 <.L113>

000039a8 <.L42>:
    39a8:	fff68693          	add	a3,a3,-1
    39ac:	e31ff06f          	j	37dc <.L44>

000039b0 <.L46>:
    39b0:	03a75e33          	divu	t3,a4,s10

000039b4 <.LVL115>:
    39b4:	01c12783          	lw	a5,28(sp)
    39b8:	0108df13          	srl	t5,a7,0x10
    39bc:	03a77733          	remu	a4,a4,s10

000039c0 <.LVL116>:
    39c0:	03c787b3          	mul	a5,a5,t3

000039c4 <.LVL117>:
    39c4:	01071713          	sll	a4,a4,0x10

000039c8 <.LVL118>:
    39c8:	00ef6733          	or	a4,t5,a4

000039cc <.LVL119>:
    39cc:	000e0f13          	mv	t5,t3
    39d0:	00f77e63          	bgeu	a4,a5,39ec <.L67>
    39d4:	00e50733          	add	a4,a0,a4

000039d8 <.LVL120>:
    39d8:	fffe0f13          	add	t5,t3,-1

000039dc <.LVL121>:
    39dc:	00a76863          	bltu	a4,a0,39ec <.L67>
    39e0:	00f77663          	bgeu	a4,a5,39ec <.L67>
    39e4:	ffee0f13          	add	t5,t3,-2
    39e8:	00a70733          	add	a4,a4,a0

000039ec <.L67>:
    39ec:	40f70733          	sub	a4,a4,a5

000039f0 <.LVL124>:
    39f0:	03a75e33          	divu	t3,a4,s10

000039f4 <.LVL125>:
    39f4:	01c12783          	lw	a5,28(sp)

000039f8 <.LVL126>:
    39f8:	01d8f8b3          	and	a7,a7,t4
    39fc:	03a77733          	remu	a4,a4,s10

00003a00 <.LVL127>:
    3a00:	03c787b3          	mul	a5,a5,t3

00003a04 <.LVL128>:
    3a04:	01071713          	sll	a4,a4,0x10

00003a08 <.LVL129>:
    3a08:	00e8e8b3          	or	a7,a7,a4

00003a0c <.LVL130>:
    3a0c:	000e0713          	mv	a4,t3
    3a10:	00f8fe63          	bgeu	a7,a5,3a2c <.L70>
    3a14:	011508b3          	add	a7,a0,a7

00003a18 <.LVL131>:
    3a18:	fffe0713          	add	a4,t3,-1

00003a1c <.LVL132>:
    3a1c:	00a8e863          	bltu	a7,a0,3a2c <.L70>
    3a20:	00f8f663          	bgeu	a7,a5,3a2c <.L70>
    3a24:	ffee0713          	add	a4,t3,-2
    3a28:	00a888b3          	add	a7,a7,a0

00003a2c <.L70>:
    3a2c:	40f887b3          	sub	a5,a7,a5

00003a30 <.LVL135>:
    3a30:	010f1f13          	sll	t5,t5,0x10

00003a34 <.LBB35>:
    3a34:	02012883          	lw	a7,32(sp)

00003a38 <.LBB74>:
    3a38:	00ef6f33          	or	t5,t5,a4

00003a3c <.LBB36>:
    3a3c:	010f5293          	srl	t0,t5,0x10
    3a40:	01df7733          	and	a4,t5,t4

00003a44 <.LVL137>:
    3a44:	02e88e33          	mul	t3,a7,a4

00003a48 <.LBB76>:
    3a48:	01ea2623          	sw	t5,12(s4)

00003a4c <.LBB37>:
    3a4c:	031284b3          	mul	s1,t0,a7

00003a50 <.LVL140>:
    3a50:	00812883          	lw	a7,8(sp)
    3a54:	010e5993          	srl	s3,t3,0x10
    3a58:	031283b3          	mul	t2,t0,a7

00003a5c <.LVL141>:
    3a5c:	02e888b3          	mul	a7,a7,a4

00003a60 <.LVL142>:
    3a60:	009888b3          	add	a7,a7,s1

00003a64 <.LVL143>:
    3a64:	011988b3          	add	a7,s3,a7

00003a68 <.LVL144>:
    3a68:	0098f463          	bgeu	a7,s1,3a70 <.L73>
    3a6c:	01b383b3          	add	t2,t2,s11

00003a70 <.L73>:
    3a70:	0108d493          	srl	s1,a7,0x10

00003a74 <.LVL146>:
    3a74:	01d8f8b3          	and	a7,a7,t4

00003a78 <.LVL147>:
    3a78:	01de7e33          	and	t3,t3,t4

00003a7c <.LVL148>:
    3a7c:	01089893          	sll	a7,a7,0x10
    3a80:	01c888b3          	add	a7,a7,t3

00003a84 <.LBB38>:
    3a84:	01412e03          	lw	t3,20(sp)

00003a88 <.LBB39>:
    3a88:	007484b3          	add	s1,s1,t2

00003a8c <.LBB40>:
    3a8c:	02ee09b3          	mul	s3,t3,a4

00003a90 <.LVL150>:
    3a90:	03c283b3          	mul	t2,t0,t3

00003a94 <.LVL151>:
    3a94:	00c12e03          	lw	t3,12(sp)
    3a98:	0109db13          	srl	s6,s3,0x10
    3a9c:	03c28ab3          	mul	s5,t0,t3

00003aa0 <.LVL152>:
    3aa0:	02ee0e33          	mul	t3,t3,a4

00003aa4 <.LVL153>:
    3aa4:	007e0e33          	add	t3,t3,t2

00003aa8 <.LVL154>:
    3aa8:	01cb0e33          	add	t3,s6,t3

00003aac <.LVL155>:
    3aac:	007e7463          	bgeu	t3,t2,3ab4 <.L74>
    3ab0:	01ba8ab3          	add	s5,s5,s11

00003ab4 <.L74>:
    3ab4:	01de73b3          	and	t2,t3,t4
    3ab8:	01d9f9b3          	and	s3,s3,t4

00003abc <.LVL157>:
    3abc:	01039393          	sll	t2,t2,0x10
    3ac0:	013383b3          	add	t2,t2,s3
    3ac4:	007483b3          	add	t2,s1,t2

00003ac8 <.LBB43>:
    3ac8:	01812983          	lw	s3,24(sp)

00003acc <.LBB45>:
    3acc:	0093b4b3          	sltu	s1,t2,s1

00003ad0 <.LBB46>:
    3ad0:	010e5e13          	srl	t3,t3,0x10

00003ad4 <.LBB47>:
    3ad4:	009e0e33          	add	t3,t3,s1
    3ad8:	015e0e33          	add	t3,t3,s5

00003adc <.LBB48>:
    3adc:	03328ab3          	mul	s5,t0,s3

00003ae0 <.LVL162>:
    3ae0:	01012983          	lw	s3,16(sp)
    3ae4:	01812483          	lw	s1,24(sp)
    3ae8:	033289b3          	mul	s3,t0,s3
    3aec:	01012283          	lw	t0,16(sp)

00003af0 <.LVL163>:
    3af0:	02e484b3          	mul	s1,s1,a4

00003af4 <.LVL164>:
    3af4:	02e28733          	mul	a4,t0,a4

00003af8 <.LVL165>:
    3af8:	0104d293          	srl	t0,s1,0x10
    3afc:	01570733          	add	a4,a4,s5

00003b00 <.LVL166>:
    3b00:	00e28733          	add	a4,t0,a4

00003b04 <.LVL167>:
    3b04:	01577463          	bgeu	a4,s5,3b0c <.L77>
    3b08:	01b989b3          	add	s3,s3,s11

00003b0c <.L77>:
    3b0c:	01d772b3          	and	t0,a4,t4
    3b10:	01029293          	sll	t0,t0,0x10
    3b14:	01d4f4b3          	and	s1,s1,t4

00003b18 <.LVL169>:
    3b18:	009282b3          	add	t0,t0,s1
    3b1c:	005e02b3          	add	t0,t3,t0

00003b20 <.LBB51>:
    3b20:	01075713          	srl	a4,a4,0x10

00003b24 <.LBB53>:
    3b24:	01c2be33          	sltu	t3,t0,t3

00003b28 <.LVL172>:
    3b28:	01c70733          	add	a4,a4,t3
    3b2c:	01370733          	add	a4,a4,s3

00003b30 <.LBE53>:
    3b30:	00cc2983          	lw	s3,12(s8)

00003b34 <.LVL174>:
    3b34:	00e7ee63          	bltu	a5,a4,3b50 <.L80>
    3b38:	0ef71463          	bne	a4,a5,3c20 <.L81>
    3b3c:	00566a63          	bltu	a2,t0,3b50 <.L80>
    3b40:	0e561063          	bne	a2,t0,3c20 <.L81>
    3b44:	0075e663          	bltu	a1,t2,3b50 <.L80>
    3b48:	0c759c63          	bne	a1,t2,3c20 <.L81>
    3b4c:	0d19fa63          	bgeu	s3,a7,3c20 <.L81>

00003b50 <.L80>:
    3b50:	ffff0e13          	add	t3,t5,-1
    3b54:	01380ab3          	add	s5,a6,s3

00003b58 <.LVL175>:
    3b58:	00b30b33          	add	s6,t1,a1

00003b5c <.LVL176>:
    3b5c:	01ca2623          	sw	t3,12(s4)

00003b60 <.LBB78>:
    3b60:	010abe33          	sltu	t3,s5,a6
    3b64:	01cb04b3          	add	s1,s6,t3
    3b68:	03c12623          	sw	t3,44(sp)
    3b6c:	006b3e33          	sltu	t3,s6,t1
    3b70:	0164bb33          	sltu	s6,s1,s6
    3b74:	00cf8bb3          	add	s7,t6,a2
    3b78:	016e6e33          	or	t3,t3,s6
    3b7c:	01cb8e33          	add	t3,s7,t3
    3b80:	01fbbb33          	sltu	s6,s7,t6
    3b84:	017e3bb3          	sltu	s7,t3,s7
    3b88:	017b6b33          	or	s6,s6,s7
    3b8c:	00ab0b33          	add	s6,s6,a0
    3b90:	016787b3          	add	a5,a5,s6

00003b94 <.LVL177>:
    3b94:	000a8993          	mv	s3,s5

00003b98 <.LVL178>:
    3b98:	00048593          	mv	a1,s1
    3b9c:	000e0613          	mv	a2,t3

00003ba0 <.LBE78>:
    3ba0:	02f56063          	bltu	a0,a5,3bc0 <.L92>
    3ba4:	06f51e63          	bne	a0,a5,3c20 <.L81>
    3ba8:	01cfec63          	bltu	t6,t3,3bc0 <.L92>
    3bac:	07cf9a63          	bne	t6,t3,3c20 <.L81>
    3bb0:	00936863          	bltu	t1,s1,3bc0 <.L92>
    3bb4:	06931663          	bne	t1,s1,3c20 <.L81>
    3bb8:	010abb33          	sltu	s6,s5,a6
    3bbc:	060b1263          	bnez	s6,3c20 <.L81>

00003bc0 <.L92>:
    3bc0:	00e7ee63          	bltu	a5,a4,3bdc <.L93>
    3bc4:	04f71e63          	bne	a4,a5,3c20 <.L81>
    3bc8:	005e6a63          	bltu	t3,t0,3bdc <.L93>
    3bcc:	045e1a63          	bne	t3,t0,3c20 <.L81>
    3bd0:	0074e663          	bltu	s1,t2,3bdc <.L93>
    3bd4:	04749663          	bne	s1,t2,3c20 <.L81>
    3bd8:	051af463          	bgeu	s5,a7,3c20 <.L81>

00003bdc <.L93>:
    3bdc:	01580ab3          	add	s5,a6,s5
    3be0:	009304b3          	add	s1,t1,s1

00003be4 <.LBB79>:
    3be4:	010ab5b3          	sltu	a1,s5,a6
    3be8:	00b485b3          	add	a1,s1,a1
    3bec:	0064b633          	sltu	a2,s1,t1
    3bf0:	0095b4b3          	sltu	s1,a1,s1
    3bf4:	01cf8e33          	add	t3,t6,t3
    3bf8:	00966633          	or	a2,a2,s1

00003bfc <.LBE79>:
    3bfc:	ffef0f13          	add	t5,t5,-2

00003c00 <.LVL180>:
    3c00:	00ce0633          	add	a2,t3,a2
    3c04:	01ea2623          	sw	t5,12(s4)

00003c08 <.LBB80>:
    3c08:	01fe3f33          	sltu	t5,t3,t6

00003c0c <.LVL182>:
    3c0c:	01c63e33          	sltu	t3,a2,t3
    3c10:	01cf6f33          	or	t5,t5,t3
    3c14:	00af0f33          	add	t5,t5,a0
    3c18:	000a8993          	mv	s3,s5

00003c1c <.LVL183>:
    3c1c:	01e787b3          	add	a5,a5,t5

00003c20 <.L81>:
    3c20:	41198ab3          	sub	s5,s3,a7
    3c24:	407584b3          	sub	s1,a1,t2
    3c28:	0159be33          	sltu	t3,s3,s5
    3c2c:	0095bb33          	sltu	s6,a1,s1
    3c30:	000a8f13          	mv	t5,s5

00003c34 <.LVL185>:
    3c34:	41c48e33          	sub	t3,s1,t3

00003c38 <.LVL186>:
    3c38:	00000593          	li	a1,0

00003c3c <.LVL187>:
    3c3c:	0159f463          	bgeu	s3,s5,3c44 <.L108>
    3c40:	0014b593          	seqz	a1,s1

00003c44 <.L108>:
    3c44:	0165e5b3          	or	a1,a1,s6

00003c48 <.LVL188>:
    3c48:	40560b33          	sub	s6,a2,t0

00003c4c <.LVL189>:
    3c4c:	01663633          	sltu	a2,a2,s6

00003c50 <.LVL190>:
    3c50:	40bb04b3          	sub	s1,s6,a1

00003c54 <.LVL191>:
    3c54:	00000993          	li	s3,0

00003c58 <.LVL192>:
    3c58:	00058463          	beqz	a1,3c60 <.L111>
    3c5c:	001b3993          	seqz	s3,s6

00003c60 <.L111>:
    3c60:	40e787b3          	sub	a5,a5,a4

00003c64 <.LVL194>:
    3c64:	00c9e9b3          	or	s3,s3,a2

00003c68 <.LVL195>:
    3c68:	413787b3          	sub	a5,a5,s3

00003c6c <.LBE81>:
    3c6c:	d00c9ee3          	bnez	s9,3988 <.L56>
    3c70:	01589863          	bne	a7,s5,3c80 <.L112>
    3c74:	007e1663          	bne	t3,t2,3c80 <.L112>
    3c78:	00549463          	bne	s1,t0,3c80 <.L112>
    3c7c:	00f70863          	beq	a4,a5,3c8c <.L114>

00003c80 <.L112>:
    3c80:	05012783          	lw	a5,80(sp)
    3c84:	0017e793          	or	a5,a5,1
    3c88:	04f12823          	sw	a5,80(sp)

00003c8c <.L114>:
  FP_PACK_Q (r, R);
    3c8c:	000047b7          	lui	a5,0x4
    3c90:	fff78793          	add	a5,a5,-1 # 3fff <.L143+0xf>
    3c94:	00f687b3          	add	a5,a3,a5

00003c98 <.LVL197>:
    3c98:	1af05463          	blez	a5,3e40 <.L116>
    3c9c:	05012703          	lw	a4,80(sp)
    3ca0:	00777613          	and	a2,a4,7
    3ca4:	04060463          	beqz	a2,3cec <.L117>
    3ca8:	00f77613          	and	a2,a4,15
    3cac:	00400593          	li	a1,4
    3cb0:	02b60e63          	beq	a2,a1,3cec <.L117>

00003cb4 <.LBB83>:
    3cb4:	00470713          	add	a4,a4,4
    3cb8:	00473613          	sltiu	a2,a4,4
    3cbc:	04e12823          	sw	a4,80(sp)

00003cc0 <.LVL198>:
    3cc0:	05412703          	lw	a4,84(sp)

00003cc4 <.LVL199>:
    3cc4:	00e60733          	add	a4,a2,a4
    3cc8:	04e12a23          	sw	a4,84(sp)

00003ccc <.LVL200>:
    3ccc:	00c73733          	sltu	a4,a4,a2

00003cd0 <.LVL201>:
    3cd0:	05812603          	lw	a2,88(sp)
    3cd4:	00e60733          	add	a4,a2,a4

00003cd8 <.LVL202>:
    3cd8:	04e12c23          	sw	a4,88(sp)

00003cdc <.LVL203>:
    3cdc:	00c73733          	sltu	a4,a4,a2

00003ce0 <.LVL204>:
    3ce0:	05c12603          	lw	a2,92(sp)
    3ce4:	00c70733          	add	a4,a4,a2

00003ce8 <.LVL205>:
    3ce8:	04e12e23          	sw	a4,92(sp)

00003cec <.L117>:
    3cec:	05c12703          	lw	a4,92(sp)
    3cf0:	00b71613          	sll	a2,a4,0xb
    3cf4:	00065e63          	bgez	a2,3d10 <.L122>
    3cf8:	fff007b7          	lui	a5,0xfff00

00003cfc <.LVL207>:
    3cfc:	fff78793          	add	a5,a5,-1 # ffefffff <_ebss+0xffef519f>
    3d00:	00f77733          	and	a4,a4,a5
    3d04:	000047b7          	lui	a5,0x4

00003d08 <.LVL208>:
    3d08:	04e12e23          	sw	a4,92(sp)
    3d0c:	00f687b3          	add	a5,a3,a5

00003d10 <.L122>:
    3d10:	05010713          	add	a4,sp,80
    3d14:	05c10593          	add	a1,sp,92

00003d18 <.L123>:
    3d18:	00072683          	lw	a3,0(a4)
    3d1c:	00472603          	lw	a2,4(a4)
    3d20:	00470713          	add	a4,a4,4
    3d24:	0036d693          	srl	a3,a3,0x3
    3d28:	01d61613          	sll	a2,a2,0x1d
    3d2c:	00c6e6b3          	or	a3,a3,a2
    3d30:	fed72e23          	sw	a3,-4(a4)
    3d34:	feb712e3          	bne	a4,a1,3d18 <.L123>

00003d38 <.LBE84>:
    3d38:	000086b7          	lui	a3,0x8
    3d3c:	ffe68693          	add	a3,a3,-2 # 7ffe <.LLST128+0x4a>

00003d40 <.LBB85>:
    3d40:	05c12703          	lw	a4,92(sp)

00003d44 <.LBE85>:
    3d44:	0af6ce63          	blt	a3,a5,3e00 <.L39>

00003d48 <.LBB86>:
    3d48:	00375713          	srl	a4,a4,0x3
    3d4c:	04e12e23          	sw	a4,92(sp)

00003d50 <.L125>:
    3d50:	00f91913          	sll	s2,s2,0xf

00003d54 <.LVL213>:
    3d54:	00f96933          	or	s2,s2,a5

00003d58 <.LBE87>:
  FP_HANDLE_EXCEPTIONS;

  return r;
    3d58:	05012783          	lw	a5,80(sp)

00003d5c <.LBB88>:
  FP_PACK_Q (r, R);
    3d5c:	05c12703          	lw	a4,92(sp)
    3d60:	07211723          	sh	s2,110(sp)

00003d64 <.LBE88>:
  return r;
    3d64:	00f42023          	sw	a5,0(s0)
    3d68:	05412783          	lw	a5,84(sp)

00003d6c <.LBB89>:
  FP_PACK_Q (r, R);
    3d6c:	06e11623          	sh	a4,108(sp)

00003d70 <.LBE89>:
}
    3d70:	0ac12083          	lw	ra,172(sp)
  return r;
    3d74:	00f42223          	sw	a5,4(s0)
    3d78:	05812783          	lw	a5,88(sp)

00003d7c <.LVL216>:
}
    3d7c:	00040513          	mv	a0,s0
    3d80:	0a412483          	lw	s1,164(sp)
  return r;
    3d84:	00f42423          	sw	a5,8(s0)
    3d88:	06c12783          	lw	a5,108(sp)
}
    3d8c:	0a012903          	lw	s2,160(sp)
    3d90:	09c12983          	lw	s3,156(sp)
  return r;
    3d94:	00f42623          	sw	a5,12(s0)
}
    3d98:	0a812403          	lw	s0,168(sp)
    3d9c:	09812a03          	lw	s4,152(sp)
    3da0:	09412a83          	lw	s5,148(sp)
    3da4:	09012b03          	lw	s6,144(sp)
    3da8:	08c12b83          	lw	s7,140(sp)
    3dac:	08812c03          	lw	s8,136(sp)
    3db0:	08412c83          	lw	s9,132(sp)
    3db4:	08012d03          	lw	s10,128(sp)
    3db8:	07c12d83          	lw	s11,124(sp)
    3dbc:	0b010113          	add	sp,sp,176

00003dc0 <.LVL218>:
    3dc0:	00008067          	ret

00003dc4 <.L37>:
  FP_DIV_Q (R, A, B);
    3dc4:	03012783          	lw	a5,48(sp)

00003dc8 <.LBB90>:
  FP_UNPACK_Q (A, a);
    3dc8:	00098913          	mv	s2,s3

00003dcc <.LBE90>:
  FP_DIV_Q (R, A, B);
    3dcc:	000a0713          	mv	a4,s4

00003dd0 <.LVL221>:
    3dd0:	04f12823          	sw	a5,80(sp)
    3dd4:	03412783          	lw	a5,52(sp)
    3dd8:	04f12a23          	sw	a5,84(sp)
    3ddc:	03812783          	lw	a5,56(sp)
    3de0:	04f12c23          	sw	a5,88(sp)
    3de4:	03c12783          	lw	a5,60(sp)

00003de8 <.L115>:
    3de8:	04f12e23          	sw	a5,92(sp)

00003dec <.LVL223>:
  FP_PACK_Q (r, R);
    3dec:	00100793          	li	a5,1
    3df0:	24f70863          	beq	a4,a5,4040 <.L195>
    3df4:	e8070ce3          	beqz	a4,3c8c <.L114>
    3df8:	00200793          	li	a5,2
    3dfc:	24f71c63          	bne	a4,a5,4054 <.L35>

00003e00 <.L39>:
    3e00:	000087b7          	lui	a5,0x8
    3e04:	04012e23          	sw	zero,92(sp)
    3e08:	04012c23          	sw	zero,88(sp)
    3e0c:	04012a23          	sw	zero,84(sp)
    3e10:	04012823          	sw	zero,80(sp)
    3e14:	fff78793          	add	a5,a5,-1 # 7fff <.LLST128+0x4b>
    3e18:	f39ff06f          	j	3d50 <.L125>

00003e1c <.L38>:
  FP_DIV_Q (R, A, B);
    3e1c:	04012783          	lw	a5,64(sp)

00003e20 <.LBB91>:
  FP_UNPACK_Q (B, b);
    3e20:	000a8913          	mv	s2,s5

00003e24 <.LBE91>:
  FP_DIV_Q (R, A, B);
    3e24:	04f12823          	sw	a5,80(sp)
    3e28:	04412783          	lw	a5,68(sp)
    3e2c:	04f12a23          	sw	a5,84(sp)
    3e30:	04812783          	lw	a5,72(sp)
    3e34:	04f12c23          	sw	a5,88(sp)
    3e38:	04c12783          	lw	a5,76(sp)

00003e3c <.LVL227>:
    3e3c:	fadff06f          	j	3de8 <.L115>

00003e40 <.L116>:
  FP_PACK_Q (r, R);
    3e40:	00100693          	li	a3,1
    3e44:	40f686b3          	sub	a3,a3,a5

00003e48 <.LVL229>:
    3e48:	07400793          	li	a5,116
    3e4c:	1cd7ca63          	blt	a5,a3,4020 <.L126>

00003e50 <.LBB93>:
    3e50:	05010613          	add	a2,sp,80
    3e54:	4056d713          	sra	a4,a3,0x5

00003e58 <.LVL230>:
    3e58:	00060513          	mv	a0,a2
    3e5c:	01f6f693          	and	a3,a3,31

00003e60 <.LVL231>:
    3e60:	00000793          	li	a5,0
    3e64:	00000593          	li	a1,0

00003e68 <.L127>:
    3e68:	02e59e63          	bne	a1,a4,3ea4 <.L128>
    3e6c:	00300593          	li	a1,3

00003e70 <.LVL233>:
    3e70:	40e585b3          	sub	a1,a1,a4
    3e74:	00271513          	sll	a0,a4,0x2
    3e78:	04069063          	bnez	a3,3eb8 <.L129>
    3e7c:	00060813          	mv	a6,a2

00003e80 <.L130>:
    3e80:	00a808b3          	add	a7,a6,a0
    3e84:	0008a883          	lw	a7,0(a7)
    3e88:	00168693          	add	a3,a3,1

00003e8c <.LVL235>:
    3e8c:	00480813          	add	a6,a6,4
    3e90:	ff182e23          	sw	a7,-4(a6)

00003e94 <.LVL236>:
    3e94:	fed5d6e3          	bge	a1,a3,3e80 <.L130>
    3e98:	00400693          	li	a3,4

00003e9c <.LVL237>:
    3e9c:	40e68733          	sub	a4,a3,a4

00003ea0 <.LVL238>:
    3ea0:	06c0006f          	j	3f0c <.L134>

00003ea4 <.L128>:
    3ea4:	00052803          	lw	a6,0(a0)
    3ea8:	00158593          	add	a1,a1,1

00003eac <.LVL240>:
    3eac:	00450513          	add	a0,a0,4
    3eb0:	0107e7b3          	or	a5,a5,a6

00003eb4 <.LVL241>:
    3eb4:	fb5ff06f          	j	3e68 <.L127>

00003eb8 <.L129>:
    3eb8:	04050813          	add	a6,a0,64
    3ebc:	03010893          	add	a7,sp,48
    3ec0:	01180833          	add	a6,a6,a7
    3ec4:	fe082803          	lw	a6,-32(a6)
    3ec8:	02000313          	li	t1,32
    3ecc:	40d30333          	sub	t1,t1,a3
    3ed0:	00681833          	sll	a6,a6,t1
    3ed4:	0107e7b3          	or	a5,a5,a6

00003ed8 <.LVL243>:
    3ed8:	00000e13          	li	t3,0
    3edc:	00a60833          	add	a6,a2,a0
    3ee0:	40a00533          	neg	a0,a0

00003ee4 <.L132>:
    3ee4:	0ebe4063          	blt	t3,a1,3fc4 <.L133>
    3ee8:	00400513          	li	a0,4
    3eec:	00259593          	sll	a1,a1,0x2
    3ef0:	40e50733          	sub	a4,a0,a4

00003ef4 <.LVL245>:
    3ef4:	04058593          	add	a1,a1,64
    3ef8:	03010513          	add	a0,sp,48
    3efc:	00a585b3          	add	a1,a1,a0
    3f00:	05c12503          	lw	a0,92(sp)
    3f04:	00d556b3          	srl	a3,a0,a3

00003f08 <.LVL246>:
    3f08:	fed5a023          	sw	a3,-32(a1)

00003f0c <.L134>:
    3f0c:	00400693          	li	a3,4
    3f10:	40e686b3          	sub	a3,a3,a4
    3f14:	00269693          	sll	a3,a3,0x2
    3f18:	00271713          	sll	a4,a4,0x2
    3f1c:	00800593          	li	a1,8
    3f20:	00e60733          	add	a4,a2,a4
    3f24:	00b6ea63          	bltu	a3,a1,3f38 <.L135>
    3f28:	00072023          	sw	zero,0(a4)
    3f2c:	00072223          	sw	zero,4(a4)
    3f30:	ff868693          	add	a3,a3,-8
    3f34:	00870713          	add	a4,a4,8

00003f38 <.L135>:
    3f38:	00400593          	li	a1,4
    3f3c:	00b6e463          	bltu	a3,a1,3f44 <.L136>
    3f40:	00072023          	sw	zero,0(a4)

00003f44 <.L136>:
    3f44:	05012703          	lw	a4,80(sp)

00003f48 <.LBB95>:
    3f48:	00f037b3          	snez	a5,a5

00003f4c <.LBE95>:
    3f4c:	00e7e7b3          	or	a5,a5,a4
    3f50:	04f12823          	sw	a5,80(sp)

00003f54 <.LBE93>:
    3f54:	0077f713          	and	a4,a5,7
    3f58:	04070463          	beqz	a4,3fa0 <.L137>
    3f5c:	00f7f713          	and	a4,a5,15
    3f60:	00400693          	li	a3,4
    3f64:	02d70e63          	beq	a4,a3,3fa0 <.L137>

00003f68 <.LBB97>:
    3f68:	05412703          	lw	a4,84(sp)
    3f6c:	00478793          	add	a5,a5,4
    3f70:	04f12823          	sw	a5,80(sp)

00003f74 <.LVL249>:
    3f74:	0047b793          	sltiu	a5,a5,4

00003f78 <.LVL250>:
    3f78:	00f707b3          	add	a5,a4,a5
    3f7c:	04f12a23          	sw	a5,84(sp)

00003f80 <.LVL251>:
    3f80:	00e7b7b3          	sltu	a5,a5,a4

00003f84 <.LVL252>:
    3f84:	05812703          	lw	a4,88(sp)
    3f88:	00f707b3          	add	a5,a4,a5

00003f8c <.LVL253>:
    3f8c:	04f12c23          	sw	a5,88(sp)

00003f90 <.LVL254>:
    3f90:	00e7b7b3          	sltu	a5,a5,a4

00003f94 <.LVL255>:
    3f94:	05c12703          	lw	a4,92(sp)
    3f98:	00e787b3          	add	a5,a5,a4

00003f9c <.LVL256>:
    3f9c:	04f12e23          	sw	a5,92(sp)

00003fa0 <.L137>:
    3fa0:	05c12703          	lw	a4,92(sp)
    3fa4:	00c71793          	sll	a5,a4,0xc
    3fa8:	0407d263          	bgez	a5,3fec <.L142>

00003fac <.LVL258>:
    3fac:	04012e23          	sw	zero,92(sp)
    3fb0:	04012c23          	sw	zero,88(sp)
    3fb4:	04012a23          	sw	zero,84(sp)
    3fb8:	04012823          	sw	zero,80(sp)
    3fbc:	00100793          	li	a5,1
    3fc0:	d91ff06f          	j	3d50 <.L125>

00003fc4 <.L133>:
    3fc4:	00082883          	lw	a7,0(a6)
    3fc8:	00482e83          	lw	t4,4(a6)
    3fcc:	00a80f33          	add	t5,a6,a0
    3fd0:	00d8d8b3          	srl	a7,a7,a3
    3fd4:	006e9eb3          	sll	t4,t4,t1
    3fd8:	01d8e8b3          	or	a7,a7,t4
    3fdc:	011f2023          	sw	a7,0(t5)

00003fe0 <.LVL260>:
    3fe0:	001e0e13          	add	t3,t3,1

00003fe4 <.LVL261>:
    3fe4:	00480813          	add	a6,a6,4
    3fe8:	efdff06f          	j	3ee4 <.L132>

00003fec <.L142>:
    3fec:	00c60593          	add	a1,a2,12

00003ff0 <.L143>:
    3ff0:	00062783          	lw	a5,0(a2)
    3ff4:	00462683          	lw	a3,4(a2)
    3ff8:	00460613          	add	a2,a2,4
    3ffc:	0037d793          	srl	a5,a5,0x3
    4000:	01d69693          	sll	a3,a3,0x1d
    4004:	00d7e7b3          	or	a5,a5,a3
    4008:	fef62e23          	sw	a5,-4(a2)
    400c:	fec592e3          	bne	a1,a2,3ff0 <.L143>

00004010 <.LVL264>:
    4010:	00375713          	srl	a4,a4,0x3
    4014:	04e12e23          	sw	a4,92(sp)

00004018 <.L144>:
    4018:	00000793          	li	a5,0
    401c:	d35ff06f          	j	3d50 <.L125>

00004020 <.L126>:
    4020:	05412703          	lw	a4,84(sp)
    4024:	05012783          	lw	a5,80(sp)
    4028:	00e7e7b3          	or	a5,a5,a4
    402c:	05812703          	lw	a4,88(sp)
    4030:	00e7e7b3          	or	a5,a5,a4
    4034:	05c12703          	lw	a4,92(sp)
    4038:	00e7e7b3          	or	a5,a5,a4
    403c:	fc078ee3          	beqz	a5,4018 <.L144>

00004040 <.L195>:
    4040:	04012e23          	sw	zero,92(sp)
    4044:	04012c23          	sw	zero,88(sp)
    4048:	04012a23          	sw	zero,84(sp)

0000404c <.LBB100>:
    404c:	04012823          	sw	zero,80(sp)
    4050:	fc9ff06f          	j	4018 <.L144>

00004054 <.L35>:
    4054:	000087b7          	lui	a5,0x8
    4058:	04f12e23          	sw	a5,92(sp)
    405c:	04012c23          	sw	zero,88(sp)
    4060:	04012a23          	sw	zero,84(sp)
    4064:	04012823          	sw	zero,80(sp)

00004068 <.LVL270>:
    4068:	fff78793          	add	a5,a5,-1 # 7fff <.LLST128+0x4b>
    406c:	00000913          	li	s2,0
    4070:	ce1ff06f          	j	3d50 <.L125>

00004074 <__eqtf2>:
#include "soft-fp.h"
#include "quad.h"

CMPtype
__eqtf2 (TFtype a, TFtype b)
{
    4074:	00c52783          	lw	a5,12(a0)
    4078:	0005af03          	lw	t5,0(a1)
    407c:	0045af83          	lw	t6,4(a1)
    4080:	0085a283          	lw	t0,8(a1)
    4084:	00c5a583          	lw	a1,12(a1)

00004088 <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_Q (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    4088:	00008737          	lui	a4,0x8
    408c:	0107d693          	srl	a3,a5,0x10
    4090:	fff70713          	add	a4,a4,-1 # 7fff <.LLST128+0x4b>
    4094:	01079813          	sll	a6,a5,0x10

00004098 <.LBB4>:
  FP_UNPACK_RAW_Q (B, b);
    4098:	01059e93          	sll	t4,a1,0x10

0000409c <.LBB5>:
  FP_UNPACK_RAW_Q (A, a);
    409c:	01f7d613          	srl	a2,a5,0x1f
    40a0:	00e6f6b3          	and	a3,a3,a4

000040a4 <.LBB6>:
  FP_UNPACK_RAW_Q (B, b);
    40a4:	0105d793          	srl	a5,a1,0x10

000040a8 <.LBE6>:
{
    40a8:	00052883          	lw	a7,0(a0)

000040ac <.LBB7>:
    40ac:	00452303          	lw	t1,4(a0)

000040b0 <.LBB8>:
    40b0:	00852e03          	lw	t3,8(a0)

000040b4 <.LBB9>:
    40b4:	ff010113          	add	sp,sp,-16

000040b8 <.LBB10>:
  FP_UNPACK_RAW_Q (A, a);
    40b8:	01085813          	srl	a6,a6,0x10

000040bc <.LBB11>:
  FP_UNPACK_RAW_Q (B, b);
    40bc:	010ede93          	srl	t4,t4,0x10

000040c0 <.LVL5>:
    40c0:	00e7f7b3          	and	a5,a5,a4
    40c4:	01f5d593          	srl	a1,a1,0x1f

000040c8 <.LBE11>:
  FP_CMP_EQ_Q (r, A, B, 1);
    40c8:	02e69063          	bne	a3,a4,40e8 <.L2>
    40cc:	0068e733          	or	a4,a7,t1
    40d0:	01c76733          	or	a4,a4,t3
    40d4:	01076733          	or	a4,a4,a6
    40d8:	00100513          	li	a0,1
    40dc:	04071a63          	bnez	a4,4130 <.L1>
    40e0:	04d79863          	bne	a5,a3,4130 <.L1>
    40e4:	0080006f          	j	40ec <.L6>

000040e8 <.L2>:
    40e8:	00e79c63          	bne	a5,a4,4100 <.L5>

000040ec <.L6>:
    40ec:	01ff6733          	or	a4,t5,t6
    40f0:	00576733          	or	a4,a4,t0
    40f4:	01d76733          	or	a4,a4,t4
    40f8:	00100513          	li	a0,1
    40fc:	02071a63          	bnez	a4,4130 <.L1>

00004100 <.L5>:
    4100:	00100513          	li	a0,1
    4104:	02d79663          	bne	a5,a3,4130 <.L1>
    4108:	03e89463          	bne	a7,t5,4130 <.L1>
    410c:	03f31263          	bne	t1,t6,4130 <.L1>
    4110:	025e1063          	bne	t3,t0,4130 <.L1>
    4114:	01d81e63          	bne	a6,t4,4130 <.L1>
    4118:	02b60063          	beq	a2,a1,4138 <.L14>
    411c:	00079a63          	bnez	a5,4130 <.L1>
    4120:	0068e533          	or	a0,a7,t1
    4124:	01c56533          	or	a0,a0,t3
    4128:	01056533          	or	a0,a0,a6
    412c:	00a03533          	snez	a0,a0

00004130 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    4130:	01010113          	add	sp,sp,16
    4134:	00008067          	ret

00004138 <.L14>:
  FP_CMP_EQ_Q (r, A, B, 1);
    4138:	00000513          	li	a0,0
    413c:	ff5ff06f          	j	4130 <.L1>

00004140 <__getf2>:
#include "soft-fp.h"
#include "quad.h"

CMPtype
__getf2 (TFtype a, TFtype b)
{
    4140:	00c52783          	lw	a5,12(a0)
    4144:	00c5a683          	lw	a3,12(a1)

00004148 <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_Q (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    4148:	00008737          	lui	a4,0x8
    414c:	0107d613          	srl	a2,a5,0x10
    4150:	fff70713          	add	a4,a4,-1 # 7fff <.LLST128+0x4b>
    4154:	01079813          	sll	a6,a5,0x10

00004158 <.LBB4>:
  FP_UNPACK_RAW_Q (B, b);
    4158:	01069293          	sll	t0,a3,0x10

0000415c <.LBE4>:
{
    415c:	00052883          	lw	a7,0(a0)

00004160 <.LBB5>:
    4160:	00452303          	lw	t1,4(a0)

00004164 <.LBB6>:
    4164:	00852e03          	lw	t3,8(a0)

00004168 <.LBB7>:
  FP_UNPACK_RAW_Q (A, a);
    4168:	00e67633          	and	a2,a2,a4

0000416c <.LBB8>:
  FP_UNPACK_RAW_Q (B, b);
    416c:	0106d513          	srl	a0,a3,0x10

00004170 <.LBE8>:
{
    4170:	0005ae83          	lw	t4,0(a1)
    4174:	0045af03          	lw	t5,4(a1)
    4178:	0085af83          	lw	t6,8(a1)
    417c:	ff010113          	add	sp,sp,-16

00004180 <.LBB9>:
  FP_UNPACK_RAW_Q (A, a);
    4180:	01085813          	srl	a6,a6,0x10

00004184 <.LVL4>:
    4184:	01f7d793          	srl	a5,a5,0x1f

00004188 <.LBB10>:
  FP_UNPACK_RAW_Q (B, b);
    4188:	0102d293          	srl	t0,t0,0x10

0000418c <.LVL6>:
    418c:	00e57533          	and	a0,a0,a4

00004190 <.LVL7>:
    4190:	01f6d693          	srl	a3,a3,0x1f

00004194 <.LBE10>:
  FP_CMP_Q (r, A, B, -2, 2);
    4194:	00e61a63          	bne	a2,a4,41a8 <.L2>
    4198:	01136733          	or	a4,t1,a7
    419c:	01c76733          	or	a4,a4,t3
    41a0:	01076733          	or	a4,a4,a6
    41a4:	0a071463          	bnez	a4,424c <.L17>

000041a8 <.L2>:
    41a8:	00008737          	lui	a4,0x8
    41ac:	fff70713          	add	a4,a4,-1 # 7fff <.LLST128+0x4b>
    41b0:	00e51a63          	bne	a0,a4,41c4 <.L4>
    41b4:	01eee733          	or	a4,t4,t5
    41b8:	01f76733          	or	a4,a4,t6
    41bc:	00576733          	or	a4,a4,t0
    41c0:	08071663          	bnez	a4,424c <.L17>

000041c4 <.L4>:
    41c4:	00000713          	li	a4,0
    41c8:	00061a63          	bnez	a2,41dc <.L5>
    41cc:	01136733          	or	a4,t1,a7
    41d0:	01c76733          	or	a4,a4,t3
    41d4:	01076733          	or	a4,a4,a6
    41d8:	00173713          	seqz	a4,a4

000041dc <.L5>:
    41dc:	06051c63          	bnez	a0,4254 <.L6>
    41e0:	01eee5b3          	or	a1,t4,t5
    41e4:	01f5e5b3          	or	a1,a1,t6
    41e8:	0055e5b3          	or	a1,a1,t0

000041ec <.LVL10>:
    41ec:	00070c63          	beqz	a4,4204 <.L7>
    41f0:	02058063          	beqz	a1,4210 <.L1>

000041f4 <.L39>:
    41f4:	00100513          	li	a0,1

000041f8 <.LVL12>:
    41f8:	00069c63          	bnez	a3,4210 <.L1>

000041fc <.L35>:
    41fc:	fff00513          	li	a0,-1
    4200:	0100006f          	j	4210 <.L1>

00004204 <.L7>:
    4204:	04059a63          	bnez	a1,4258 <.L8>

00004208 <.L12>:
    4208:	fff00513          	li	a0,-1

0000420c <.LVL15>:
    420c:	04078e63          	beqz	a5,4268 <.L34>

00004210 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    4210:	01010113          	add	sp,sp,16
    4214:	00008067          	ret

00004218 <.L10>:
  FP_CMP_Q (r, A, B, -2, 2);
    4218:	fca64ee3          	blt	a2,a0,41f4 <.L39>
    421c:	ff02e6e3          	bltu	t0,a6,4208 <.L12>
    4220:	02581063          	bne	a6,t0,4240 <.L13>
    4224:	ffcfe2e3          	bltu	t6,t3,4208 <.L12>
    4228:	01fe1c63          	bne	t3,t6,4240 <.L13>
    422c:	fc6f6ee3          	bltu	t5,t1,4208 <.L12>
    4230:	01e31863          	bne	t1,t5,4240 <.L13>
    4234:	fd1eeae3          	bltu	t4,a7,4208 <.L12>
    4238:	00000513          	li	a0,0

0000423c <.LVL18>:
    423c:	fdd8fae3          	bgeu	a7,t4,4210 <.L1>

00004240 <.L13>:
    4240:	00100513          	li	a0,1
    4244:	fc0796e3          	bnez	a5,4210 <.L1>
    4248:	fb5ff06f          	j	41fc <.L35>

0000424c <.L17>:
    424c:	ffe00513          	li	a0,-2

00004250 <.LVL20>:
    4250:	fc1ff06f          	j	4210 <.L1>

00004254 <.L6>:
    4254:	fa0710e3          	bnez	a4,41f4 <.L39>

00004258 <.L8>:
    4258:	faf698e3          	bne	a3,a5,4208 <.L12>
    425c:	fac55ee3          	bge	a0,a2,4218 <.L10>
    4260:	fff00513          	li	a0,-1

00004264 <.LVL23>:
    4264:	fa0696e3          	bnez	a3,4210 <.L1>

00004268 <.L34>:
    4268:	00100513          	li	a0,1
    426c:	fa5ff06f          	j	4210 <.L1>

00004270 <__letf2>:
#include "soft-fp.h"
#include "quad.h"

CMPtype
__letf2 (TFtype a, TFtype b)
{
    4270:	00c52783          	lw	a5,12(a0)
    4274:	00c5a683          	lw	a3,12(a1)

00004278 <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_Q (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    4278:	00008737          	lui	a4,0x8
    427c:	0107d613          	srl	a2,a5,0x10
    4280:	fff70713          	add	a4,a4,-1 # 7fff <.LLST128+0x4b>
    4284:	01079813          	sll	a6,a5,0x10

00004288 <.LBB4>:
  FP_UNPACK_RAW_Q (B, b);
    4288:	01069293          	sll	t0,a3,0x10

0000428c <.LBE4>:
{
    428c:	00052883          	lw	a7,0(a0)

00004290 <.LBB5>:
    4290:	00452303          	lw	t1,4(a0)

00004294 <.LBB6>:
    4294:	00852e03          	lw	t3,8(a0)

00004298 <.LBB7>:
  FP_UNPACK_RAW_Q (A, a);
    4298:	00e67633          	and	a2,a2,a4

0000429c <.LBB8>:
  FP_UNPACK_RAW_Q (B, b);
    429c:	0106d513          	srl	a0,a3,0x10

000042a0 <.LBE8>:
{
    42a0:	0005ae83          	lw	t4,0(a1)
    42a4:	0045af03          	lw	t5,4(a1)
    42a8:	0085af83          	lw	t6,8(a1)
    42ac:	ff010113          	add	sp,sp,-16

000042b0 <.LBB9>:
  FP_UNPACK_RAW_Q (A, a);
    42b0:	01085813          	srl	a6,a6,0x10

000042b4 <.LVL4>:
    42b4:	01f7d793          	srl	a5,a5,0x1f

000042b8 <.LBB10>:
  FP_UNPACK_RAW_Q (B, b);
    42b8:	0102d293          	srl	t0,t0,0x10

000042bc <.LVL6>:
    42bc:	00e57533          	and	a0,a0,a4

000042c0 <.LVL7>:
    42c0:	01f6d693          	srl	a3,a3,0x1f

000042c4 <.LBE10>:
  FP_CMP_Q (r, A, B, 2, 2);
    42c4:	00e61a63          	bne	a2,a4,42d8 <.L2>
    42c8:	01136733          	or	a4,t1,a7
    42cc:	01c76733          	or	a4,a4,t3
    42d0:	01076733          	or	a4,a4,a6
    42d4:	0a071463          	bnez	a4,437c <.L17>

000042d8 <.L2>:
    42d8:	00008737          	lui	a4,0x8
    42dc:	fff70713          	add	a4,a4,-1 # 7fff <.LLST128+0x4b>
    42e0:	00e51a63          	bne	a0,a4,42f4 <.L4>
    42e4:	01eee733          	or	a4,t4,t5
    42e8:	01f76733          	or	a4,a4,t6
    42ec:	00576733          	or	a4,a4,t0
    42f0:	08071663          	bnez	a4,437c <.L17>

000042f4 <.L4>:
    42f4:	00000713          	li	a4,0
    42f8:	00061a63          	bnez	a2,430c <.L5>
    42fc:	01136733          	or	a4,t1,a7
    4300:	01c76733          	or	a4,a4,t3
    4304:	01076733          	or	a4,a4,a6
    4308:	00173713          	seqz	a4,a4

0000430c <.L5>:
    430c:	06051c63          	bnez	a0,4384 <.L6>
    4310:	01eee5b3          	or	a1,t4,t5
    4314:	01f5e5b3          	or	a1,a1,t6
    4318:	0055e5b3          	or	a1,a1,t0

0000431c <.LVL10>:
    431c:	00070c63          	beqz	a4,4334 <.L7>
    4320:	02058063          	beqz	a1,4340 <.L1>

00004324 <.L39>:
    4324:	00100513          	li	a0,1

00004328 <.LVL12>:
    4328:	00069c63          	bnez	a3,4340 <.L1>

0000432c <.L35>:
    432c:	fff00513          	li	a0,-1
    4330:	0100006f          	j	4340 <.L1>

00004334 <.L7>:
    4334:	04059a63          	bnez	a1,4388 <.L8>

00004338 <.L12>:
    4338:	fff00513          	li	a0,-1

0000433c <.LVL15>:
    433c:	04078e63          	beqz	a5,4398 <.L34>

00004340 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    4340:	01010113          	add	sp,sp,16
    4344:	00008067          	ret

00004348 <.L10>:
  FP_CMP_Q (r, A, B, 2, 2);
    4348:	fca64ee3          	blt	a2,a0,4324 <.L39>
    434c:	ff02e6e3          	bltu	t0,a6,4338 <.L12>
    4350:	02581063          	bne	a6,t0,4370 <.L13>
    4354:	ffcfe2e3          	bltu	t6,t3,4338 <.L12>
    4358:	01fe1c63          	bne	t3,t6,4370 <.L13>
    435c:	fc6f6ee3          	bltu	t5,t1,4338 <.L12>
    4360:	01e31863          	bne	t1,t5,4370 <.L13>
    4364:	fd1eeae3          	bltu	t4,a7,4338 <.L12>
    4368:	00000513          	li	a0,0

0000436c <.LVL18>:
    436c:	fdd8fae3          	bgeu	a7,t4,4340 <.L1>

00004370 <.L13>:
    4370:	00100513          	li	a0,1
    4374:	fc0796e3          	bnez	a5,4340 <.L1>
    4378:	fb5ff06f          	j	432c <.L35>

0000437c <.L17>:
    437c:	00200513          	li	a0,2

00004380 <.LVL20>:
    4380:	fc1ff06f          	j	4340 <.L1>

00004384 <.L6>:
    4384:	fa0710e3          	bnez	a4,4324 <.L39>

00004388 <.L8>:
    4388:	faf698e3          	bne	a3,a5,4338 <.L12>
    438c:	fac55ee3          	bge	a0,a2,4348 <.L10>
    4390:	fff00513          	li	a0,-1

00004394 <.LVL23>:
    4394:	fa0696e3          	bnez	a3,4340 <.L1>

00004398 <.L34>:
    4398:	00100513          	li	a0,1
    439c:	fa5ff06f          	j	4340 <.L1>

000043a0 <__multf3>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__multf3 (TFtype a, TFtype b)
{
    43a0:	f5010113          	add	sp,sp,-176
    43a4:	09412c23          	sw	s4,152(sp)
    43a8:	00c5aa03          	lw	s4,12(a1)
    43ac:	0005a783          	lw	a5,0(a1)
    43b0:	0085a683          	lw	a3,8(a1)
    43b4:	0a812423          	sw	s0,168(sp)
    43b8:	00050413          	mv	s0,a0
    43bc:	0045a503          	lw	a0,4(a1)

000043c0 <.LBB3>:
  FP_DECL_Q (B);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_Q (A, a);
    43c0:	010a1713          	sll	a4,s4,0x10

000043c4 <.LBE3>:
{
    43c4:	0b212023          	sw	s2,160(sp)
    43c8:	09312e23          	sw	s3,156(sp)
    43cc:	00062903          	lw	s2,0(a2)
    43d0:	00c62983          	lw	s3,12(a2)
    43d4:	09512a23          	sw	s5,148(sp)
    43d8:	09612823          	sw	s6,144(sp)
    43dc:	00862a83          	lw	s5,8(a2)
    43e0:	00462b03          	lw	s6,4(a2)

000043e4 <.LBB4>:
  FP_UNPACK_Q (A, a);
    43e4:	00008637          	lui	a2,0x8

000043e8 <.LBE4>:
{
    43e8:	0a912223          	sw	s1,164(sp)

000043ec <.LBB5>:
  FP_UNPACK_Q (A, a);
    43ec:	01075713          	srl	a4,a4,0x10
    43f0:	010a5493          	srl	s1,s4,0x10
    43f4:	fff60613          	add	a2,a2,-1 # 7fff <.LLST128+0x4b>
    43f8:	05412e23          	sw	s4,92(sp)

000043fc <.LBE5>:
{
    43fc:	0a112623          	sw	ra,172(sp)
    4400:	09712623          	sw	s7,140(sp)
    4404:	09812423          	sw	s8,136(sp)
    4408:	09912223          	sw	s9,132(sp)
    440c:	09a12023          	sw	s10,128(sp)
    4410:	07b12e23          	sw	s11,124(sp)

00004414 <.LBB6>:
  FP_UNPACK_Q (A, a);
    4414:	04f12823          	sw	a5,80(sp)
    4418:	04a12a23          	sw	a0,84(sp)
    441c:	04d12c23          	sw	a3,88(sp)
    4420:	02f12023          	sw	a5,32(sp)
    4424:	02a12223          	sw	a0,36(sp)
    4428:	02d12423          	sw	a3,40(sp)
    442c:	02e12623          	sw	a4,44(sp)
    4430:	00c4f4b3          	and	s1,s1,a2

00004434 <.LVL2>:
    4434:	01fa5a13          	srl	s4,s4,0x1f

00004438 <.LBE6>:
    4438:	080482e3          	beqz	s1,4cbc <.L2>
    443c:	1ac48ce3          	beq	s1,a2,4df4 <.L3>
    4440:	000106b7          	lui	a3,0x10
    4444:	00d76733          	or	a4,a4,a3
    4448:	02e12623          	sw	a4,44(sp)

0000444c <.LBB7>:
    444c:	02010593          	add	a1,sp,32
    4450:	02c10713          	add	a4,sp,44

00004454 <.L4>:
    4454:	00072683          	lw	a3,0(a4)
    4458:	ffc72603          	lw	a2,-4(a4)
    445c:	ffc70713          	add	a4,a4,-4
    4460:	00369693          	sll	a3,a3,0x3
    4464:	01d65613          	srl	a2,a2,0x1d
    4468:	00c6e6b3          	or	a3,a3,a2
    446c:	00d72223          	sw	a3,4(a4)
    4470:	fee592e3          	bne	a1,a4,4454 <.L4>

00004474 <.LVL6>:
    4474:	00379793          	sll	a5,a5,0x3
    4478:	02f12023          	sw	a5,32(sp)

0000447c <.LBE7>:
    447c:	ffffc7b7          	lui	a5,0xffffc
    4480:	00178793          	add	a5,a5,1 # ffffc001 <_ebss+0xffff11a1>
    4484:	00f484b3          	add	s1,s1,a5

00004488 <.L209>:
    4488:	00000b93          	li	s7,0

0000448c <.L5>:
  FP_UNPACK_Q (B, b);
    448c:	01099513          	sll	a0,s3,0x10
    4490:	00008737          	lui	a4,0x8
    4494:	0109d793          	srl	a5,s3,0x10
    4498:	01055513          	srl	a0,a0,0x10
    449c:	fff70713          	add	a4,a4,-1 # 7fff <.LLST128+0x4b>
    44a0:	05312e23          	sw	s3,92(sp)
    44a4:	05212823          	sw	s2,80(sp)
    44a8:	05612a23          	sw	s6,84(sp)
    44ac:	05512c23          	sw	s5,88(sp)
    44b0:	03212823          	sw	s2,48(sp)
    44b4:	03612a23          	sw	s6,52(sp)
    44b8:	03512c23          	sw	s5,56(sp)
    44bc:	02a12e23          	sw	a0,60(sp)
    44c0:	00e7f7b3          	and	a5,a5,a4

000044c4 <.LVL9>:
    44c4:	01f9d993          	srl	s3,s3,0x1f

000044c8 <.LBE11>:
    44c8:	14078ae3          	beqz	a5,4e1c <.L18>
    44cc:	28e784e3          	beq	a5,a4,4f54 <.L19>
    44d0:	00010737          	lui	a4,0x10
    44d4:	00e56533          	or	a0,a0,a4
    44d8:	02a12e23          	sw	a0,60(sp)

000044dc <.LBB12>:
    44dc:	03010593          	add	a1,sp,48
    44e0:	03c10713          	add	a4,sp,60

000044e4 <.L20>:
    44e4:	00072683          	lw	a3,0(a4) # 10000 <_ebss+0x51a0>
    44e8:	ffc72603          	lw	a2,-4(a4)
    44ec:	ffc70713          	add	a4,a4,-4
    44f0:	00369693          	sll	a3,a3,0x3
    44f4:	01d65613          	srl	a2,a2,0x1d
    44f8:	00c6e6b3          	or	a3,a3,a2
    44fc:	00d72223          	sw	a3,4(a4)
    4500:	fee592e3          	bne	a1,a4,44e4 <.L20>

00004504 <.LBE12>:
    4504:	ffffc737          	lui	a4,0xffffc

00004508 <.LBB13>:
    4508:	00391913          	sll	s2,s2,0x3

0000450c <.LBE13>:
    450c:	00170713          	add	a4,a4,1 # ffffc001 <_ebss+0xffff11a1>

00004510 <.LBB14>:
    4510:	03212823          	sw	s2,48(sp)

00004514 <.LBE14>:
    4514:	00e787b3          	add	a5,a5,a4

00004518 <.L210>:
    4518:	00000693          	li	a3,0

0000451c <.L21>:
  FP_MUL_Q (R, A, B);
    451c:	009787b3          	add	a5,a5,s1

00004520 <.LVL16>:
    4520:	00f12623          	sw	a5,12(sp)
    4524:	00178793          	add	a5,a5,1
    4528:	00f12423          	sw	a5,8(sp)

0000452c <.LVL17>:
    452c:	002b9793          	sll	a5,s7,0x2

00004530 <.LVL18>:
    4530:	00d7e7b3          	or	a5,a5,a3
    4534:	00a00713          	li	a4,10
    4538:	28f742e3          	blt	a4,a5,4fbc <.L34>
    453c:	013a4733          	xor	a4,s4,s3
    4540:	00e12223          	sw	a4,4(sp)
    4544:	00200713          	li	a4,2
    4548:	22f74ae3          	blt	a4,a5,4f7c <.L35>
    454c:	fff78793          	add	a5,a5,-1
    4550:	00100713          	li	a4,1
    4554:	28f770e3          	bgeu	a4,a5,4fd4 <.L37>

00004558 <.L36>:
    4558:	02012883          	lw	a7,32(sp)

0000455c <.LVL20>:
    455c:	03012f03          	lw	t5,48(sp)
    4560:	000105b7          	lui	a1,0x10
    4564:	fff58713          	add	a4,a1,-1 # ffff <_ebss+0x519f>
    4568:	0108d913          	srl	s2,a7,0x10

0000456c <.LVL21>:
    456c:	010f5493          	srl	s1,t5,0x10

00004570 <.LVL22>:
    4570:	00e8f8b3          	and	a7,a7,a4

00004574 <.LVL23>:
    4574:	00ef7f33          	and	t5,t5,a4

00004578 <.LVL24>:
    4578:	031f0633          	mul	a2,t5,a7

0000457c <.LVL25>:
    457c:	03e90533          	mul	a0,s2,t5

00004580 <.LVL26>:
    4580:	01065793          	srl	a5,a2,0x10
    4584:	031486b3          	mul	a3,s1,a7

00004588 <.LVL27>:
    4588:	00a686b3          	add	a3,a3,a0

0000458c <.LVL28>:
    458c:	00d787b3          	add	a5,a5,a3
    4590:	02990bb3          	mul	s7,s2,s1

00004594 <.LVL29>:
    4594:	00a7f463          	bgeu	a5,a0,459c <.L42>
    4598:	00bb8bb3          	add	s7,s7,a1

0000459c <.L42>:
    459c:	03412e83          	lw	t4,52(sp)

000045a0 <.LBB22>:
    45a0:	0107d693          	srl	a3,a5,0x10
    45a4:	00e7f7b3          	and	a5,a5,a4

000045a8 <.LVL31>:
    45a8:	00e67633          	and	a2,a2,a4

000045ac <.LVL32>:
    45ac:	01079793          	sll	a5,a5,0x10
    45b0:	00c787b3          	add	a5,a5,a2

000045b4 <.LBB23>:
    45b4:	010ed293          	srl	t0,t4,0x10
    45b8:	00eefeb3          	and	t4,t4,a4
    45bc:	03d90633          	mul	a2,s2,t4

000045c0 <.LBB24>:
    45c0:	00f12823          	sw	a5,16(sp)
    45c4:	04f12823          	sw	a5,80(sp)

000045c8 <.LBB25>:
    45c8:	03128733          	mul	a4,t0,a7
    45cc:	031e87b3          	mul	a5,t4,a7

000045d0 <.LVL34>:
    45d0:	00c70733          	add	a4,a4,a2

000045d4 <.LVL35>:
    45d4:	0107d313          	srl	t1,a5,0x10
    45d8:	00e30333          	add	t1,t1,a4
    45dc:	02590b33          	mul	s6,s2,t0

000045e0 <.LVL36>:
    45e0:	00c37663          	bgeu	t1,a2,45ec <.L43>
    45e4:	00010737          	lui	a4,0x10
    45e8:	00eb0b33          	add	s6,s6,a4

000045ec <.L43>:
    45ec:	02412803          	lw	a6,36(sp)

000045f0 <.LBB27>:
    45f0:	00010737          	lui	a4,0x10
    45f4:	fff70613          	add	a2,a4,-1 # ffff <_ebss+0x519f>

000045f8 <.LVL38>:
    45f8:	01035513          	srl	a0,t1,0x10

000045fc <.LVL39>:
    45fc:	00c37333          	and	t1,t1,a2

00004600 <.LVL40>:
    4600:	00c7f7b3          	and	a5,a5,a2

00004604 <.LBB28>:
    4604:	01085393          	srl	t2,a6,0x10

00004608 <.LBB29>:
    4608:	01031313          	sll	t1,t1,0x10
    460c:	00c87833          	and	a6,a6,a2
    4610:	00f30333          	add	t1,t1,a5

00004614 <.LBB30>:
    4614:	03e38fb3          	mul	t6,t2,t5
    4618:	006686b3          	add	a3,a3,t1

0000461c <.LBB31>:
    461c:	03e807b3          	mul	a5,a6,t5

00004620 <.LVL43>:
    4620:	03048e33          	mul	t3,s1,a6

00004624 <.LVL44>:
    4624:	0107d613          	srl	a2,a5,0x10
    4628:	01fe0e33          	add	t3,t3,t6

0000462c <.LVL45>:
    462c:	01c60633          	add	a2,a2,t3
    4630:	027485b3          	mul	a1,s1,t2

00004634 <.LVL46>:
    4634:	01f67463          	bgeu	a2,t6,463c <.L44>
    4638:	00e585b3          	add	a1,a1,a4

0000463c <.L44>:
    463c:	01065a93          	srl	s5,a2,0x10
    4640:	00010737          	lui	a4,0x10
    4644:	00ba8ab3          	add	s5,s5,a1

00004648 <.LVL48>:
    4648:	fff70593          	add	a1,a4,-1 # ffff <_ebss+0x519f>

0000464c <.LVL49>:
    464c:	00b7f7b3          	and	a5,a5,a1

00004650 <.LVL50>:
    4650:	00b67633          	and	a2,a2,a1

00004654 <.LVL51>:
    4654:	01061613          	sll	a2,a2,0x10

00004658 <.LBB32>:
    4658:	030e85b3          	mul	a1,t4,a6

0000465c <.LBB33>:
    465c:	00f60633          	add	a2,a2,a5

00004660 <.LBB34>:
    4660:	03d38fb3          	mul	t6,t2,t4

00004664 <.LVL53>:
    4664:	0105d793          	srl	a5,a1,0x10
    4668:	03028e33          	mul	t3,t0,a6

0000466c <.LVL54>:
    466c:	01fe0e33          	add	t3,t3,t6

00004670 <.LVL55>:
    4670:	01c787b3          	add	a5,a5,t3
    4674:	027289b3          	mul	s3,t0,t2

00004678 <.LVL56>:
    4678:	01f7f463          	bgeu	a5,t6,4680 <.L45>
    467c:	00e989b3          	add	s3,s3,a4

00004680 <.L45>:
    4680:	0107d713          	srl	a4,a5,0x10
    4684:	01370733          	add	a4,a4,s3
    4688:	00010a37          	lui	s4,0x10

0000468c <.LVL58>:
    468c:	00e12a23          	sw	a4,20(sp)

00004690 <.LVL59>:
    4690:	fffa0713          	add	a4,s4,-1 # ffff <_ebss+0x519f>

00004694 <.LBB35>:
    4694:	03812e03          	lw	t3,56(sp)

00004698 <.LBB36>:
    4698:	00e7f7b3          	and	a5,a5,a4

0000469c <.LVL61>:
    469c:	00e5f5b3          	and	a1,a1,a4

000046a0 <.LVL62>:
    46a0:	01079793          	sll	a5,a5,0x10
    46a4:	00b787b3          	add	a5,a5,a1
    46a8:	00f12c23          	sw	a5,24(sp)

000046ac <.LBB37>:
    46ac:	010e5793          	srl	a5,t3,0x10

000046b0 <.LVL64>:
    46b0:	00ee7e33          	and	t3,t3,a4

000046b4 <.LVL65>:
    46b4:	031e05b3          	mul	a1,t3,a7

000046b8 <.LVL66>:
    46b8:	03c90c33          	mul	s8,s2,t3

000046bc <.LVL67>:
    46bc:	0105d713          	srl	a4,a1,0x10
    46c0:	031789b3          	mul	s3,a5,a7

000046c4 <.LVL68>:
    46c4:	018989b3          	add	s3,s3,s8

000046c8 <.LVL69>:
    46c8:	01370733          	add	a4,a4,s3
    46cc:	02f90fb3          	mul	t6,s2,a5

000046d0 <.LVL70>:
    46d0:	01877463          	bgeu	a4,s8,46d8 <.L46>
    46d4:	014f8fb3          	add	t6,t6,s4

000046d8 <.L46>:
    46d8:	01075993          	srl	s3,a4,0x10
    46dc:	00010cb7          	lui	s9,0x10
    46e0:	01f98fb3          	add	t6,s3,t6

000046e4 <.LVL72>:
    46e4:	fffc8993          	add	s3,s9,-1 # ffff <_ebss+0x519f>
    46e8:	01377733          	and	a4,a4,s3

000046ec <.LVL73>:
    46ec:	0135f5b3          	and	a1,a1,s3

000046f0 <.LVL74>:
    46f0:	01071713          	sll	a4,a4,0x10
    46f4:	00b70733          	add	a4,a4,a1

000046f8 <.LBB38>:
    46f8:	02812583          	lw	a1,40(sp)

000046fc <.LBB39>:
    46fc:	01f12e23          	sw	t6,28(sp)

00004700 <.LBB40>:
    4700:	0105df93          	srl	t6,a1,0x10

00004704 <.LVL76>:
    4704:	0135f5b3          	and	a1,a1,s3

00004708 <.LVL77>:
    4708:	03e58a33          	mul	s4,a1,t5

0000470c <.LVL78>:
    470c:	03ef8d33          	mul	s10,t6,t5

00004710 <.LVL79>:
    4710:	010a5d93          	srl	s11,s4,0x10
    4714:	02b489b3          	mul	s3,s1,a1

00004718 <.LVL80>:
    4718:	01a989b3          	add	s3,s3,s10

0000471c <.LVL81>:
    471c:	013d89b3          	add	s3,s11,s3
    4720:	03f48c33          	mul	s8,s1,t6

00004724 <.LVL82>:
    4724:	01a9f463          	bgeu	s3,s10,472c <.L47>
    4728:	019c0c33          	add	s8,s8,s9

0000472c <.L47>:
    472c:	00db86b3          	add	a3,s7,a3
    4730:	0066b333          	sltu	t1,a3,t1

00004734 <.LBB42>:
    4734:	0109dd13          	srl	s10,s3,0x10

00004738 <.LBB43>:
    4738:	00650533          	add	a0,a0,t1

0000473c <.LBB44>:
    473c:	00010cb7          	lui	s9,0x10

00004740 <.LBB45>:
    4740:	01650533          	add	a0,a0,s6

00004744 <.LBB46>:
    4744:	018d0d33          	add	s10,s10,s8

00004748 <.LVL87>:
    4748:	00c68633          	add	a2,a3,a2

0000474c <.LVL88>:
    474c:	fffc8c13          	add	s8,s9,-1 # ffff <_ebss+0x519f>

00004750 <.LVL89>:
    4750:	01550ab3          	add	s5,a0,s5

00004754 <.LVL90>:
    4754:	0189f9b3          	and	s3,s3,s8

00004758 <.LBB47>:
    4758:	00d636b3          	sltu	a3,a2,a3
    475c:	00da86b3          	add	a3,s5,a3

00004760 <.LBB48>:
    4760:	01099993          	sll	s3,s3,0x10
    4764:	018a7a33          	and	s4,s4,s8

00004768 <.LVL92>:
    4768:	01498a33          	add	s4,s3,s4

0000476c <.LBB49>:
    476c:	00aab9b3          	sltu	s3,s5,a0
    4770:	0156bab3          	sltu	s5,a3,s5
    4774:	0159e9b3          	or	s3,s3,s5

00004778 <.LBB51>:
    4778:	00653533          	sltu	a0,a0,t1

0000477c <.LBB52>:
    477c:	00a98533          	add	a0,s3,a0
    4780:	01812303          	lw	t1,24(sp)

00004784 <.LVL95>:
    4784:	01412983          	lw	s3,20(sp)
    4788:	04c12a23          	sw	a2,84(sp)

0000478c <.LBB53>:
    478c:	00668333          	add	t1,a3,t1

00004790 <.LVL97>:
    4790:	01350ab3          	add	s5,a0,s3

00004794 <.LVL98>:
    4794:	01c12983          	lw	s3,28(sp)
    4798:	00d336b3          	sltu	a3,t1,a3

0000479c <.LVL99>:
    479c:	00da86b3          	add	a3,s5,a3

000047a0 <.LBB54>:
    47a0:	00e30733          	add	a4,t1,a4

000047a4 <.LVL101>:
    47a4:	01368b33          	add	s6,a3,s3

000047a8 <.LVL102>:
    47a8:	00673333          	sltu	t1,a4,t1

000047ac <.LVL103>:
    47ac:	006b0333          	add	t1,s6,t1

000047b0 <.LVL104>:
    47b0:	01470a33          	add	s4,a4,s4

000047b4 <.LVL105>:
    47b4:	01a30d33          	add	s10,t1,s10

000047b8 <.LBB55>:
    47b8:	00ea3733          	sltu	a4,s4,a4

000047bc <.LBB56>:
    47bc:	00aab533          	sltu	a0,s5,a0

000047c0 <.LVL107>:
    47c0:	00ed0733          	add	a4,s10,a4
    47c4:	0156bab3          	sltu	s5,a3,s5

000047c8 <.LBB57>:
    47c8:	00db36b3          	sltu	a3,s6,a3

000047cc <.LVL109>:
    47cc:	01633b33          	sltu	s6,t1,s6

000047d0 <.LVL110>:
    47d0:	0166e6b3          	or	a3,a3,s6

000047d4 <.LBB58>:
    47d4:	006d39b3          	sltu	s3,s10,t1

000047d8 <.LBB59>:
    47d8:	01556ab3          	or	s5,a0,s5

000047dc <.LBB60>:
    47dc:	01a73d33          	sltu	s10,a4,s10

000047e0 <.LBB61>:
    47e0:	00da8ab3          	add	s5,s5,a3

000047e4 <.LBB62>:
    47e4:	01a9e9b3          	or	s3,s3,s10
    47e8:	015989b3          	add	s3,s3,s5

000047ec <.LBB63>:
    47ec:	03c12a83          	lw	s5,60(sp)

000047f0 <.LBB64>:
    47f0:	05412c23          	sw	s4,88(sp)

000047f4 <.LBB65>:
    47f4:	010adb13          	srl	s6,s5,0x10

000047f8 <.LVL114>:
    47f8:	018afab3          	and	s5,s5,s8

000047fc <.LVL115>:
    47fc:	031a86b3          	mul	a3,s5,a7

00004800 <.LVL116>:
    4800:	03590533          	mul	a0,s2,s5

00004804 <.LVL117>:
    4804:	031b08b3          	mul	a7,s6,a7

00004808 <.LVL118>:
    4808:	00a88333          	add	t1,a7,a0
    480c:	0106d893          	srl	a7,a3,0x10

00004810 <.LVL119>:
    4810:	006888b3          	add	a7,a7,t1
    4814:	03690933          	mul	s2,s2,s6

00004818 <.LVL120>:
    4818:	00a8f463          	bgeu	a7,a0,4820 <.L72>
    481c:	01990933          	add	s2,s2,s9

00004820 <.L72>:
    4820:	02c12b83          	lw	s7,44(sp)

00004824 <.LBB67>:
    4824:	0108d513          	srl	a0,a7,0x10

00004828 <.LVL123>:
    4828:	01250533          	add	a0,a0,s2
    482c:	00010c37          	lui	s8,0x10
    4830:	00a12a23          	sw	a0,20(sp)

00004834 <.LVL124>:
    4834:	fffc0513          	add	a0,s8,-1 # ffff <_ebss+0x519f>

00004838 <.LBB68>:
    4838:	010bd913          	srl	s2,s7,0x10

0000483c <.LVL126>:
    483c:	00abfbb3          	and	s7,s7,a0

00004840 <.LBB69>:
    4840:	00a6f6b3          	and	a3,a3,a0

00004844 <.LVL127>:
    4844:	00a8f8b3          	and	a7,a7,a0

00004848 <.LBB70>:
    4848:	03248333          	mul	t1,s1,s2

0000484c <.LBB71>:
    484c:	01089893          	sll	a7,a7,0x10
    4850:	00d888b3          	add	a7,a7,a3

00004854 <.LBB72>:
    4854:	03eb8533          	mul	a0,s7,t5

00004858 <.LVL131>:
    4858:	037484b3          	mul	s1,s1,s7

0000485c <.LVL132>:
    485c:	01055693          	srl	a3,a0,0x10
    4860:	03e90f33          	mul	t5,s2,t5

00004864 <.LVL133>:
    4864:	01e484b3          	add	s1,s1,t5

00004868 <.LVL134>:
    4868:	009686b3          	add	a3,a3,s1

0000486c <.LVL135>:
    486c:	01e6f463          	bgeu	a3,t5,4874 <.L73>
    4870:	01830333          	add	t1,t1,s8

00004874 <.L73>:
    4874:	0106df13          	srl	t5,a3,0x10

00004878 <.LVL137>:
    4878:	006f0333          	add	t1,t5,t1

0000487c <.LVL138>:
    487c:	00010cb7          	lui	s9,0x10

00004880 <.LVL139>:
    4880:	00612c23          	sw	t1,24(sp)

00004884 <.LVL140>:
    4884:	fffc8313          	add	t1,s9,-1 # ffff <_ebss+0x519f>

00004888 <.LVL141>:
    4888:	00657533          	and	a0,a0,t1

0000488c <.LVL142>:
    488c:	0066f6b3          	and	a3,a3,t1

00004890 <.LBB73>:
    4890:	03c38f33          	mul	t5,t2,t3

00004894 <.LBB74>:
    4894:	01069693          	sll	a3,a3,0x10
    4898:	00a686b3          	add	a3,a3,a0

0000489c <.LBB75>:
    489c:	03c80333          	mul	t1,a6,t3

000048a0 <.LVL145>:
    48a0:	030784b3          	mul	s1,a5,a6

000048a4 <.LVL146>:
    48a4:	01035513          	srl	a0,t1,0x10
    48a8:	01e484b3          	add	s1,s1,t5

000048ac <.LVL147>:
    48ac:	00950533          	add	a0,a0,s1
    48b0:	02f38c33          	mul	s8,t2,a5

000048b4 <.LVL148>:
    48b4:	01e57463          	bgeu	a0,t5,48bc <.L74>
    48b8:	019c0c33          	add	s8,s8,s9

000048bc <.L74>:
    48bc:	00010d37          	lui	s10,0x10
    48c0:	fffd0f13          	add	t5,s10,-1 # ffff <_ebss+0x519f>
    48c4:	01055493          	srl	s1,a0,0x10
    48c8:	01e57533          	and	a0,a0,t5

000048cc <.LVL150>:
    48cc:	01e37333          	and	t1,t1,t5

000048d0 <.LVL151>:
    48d0:	01051513          	sll	a0,a0,0x10
    48d4:	018484b3          	add	s1,s1,s8

000048d8 <.LBB76>:
    48d8:	02b28f33          	mul	t5,t0,a1

000048dc <.LBB77>:
    48dc:	00650533          	add	a0,a0,t1

000048e0 <.LBB78>:
    48e0:	03df8c33          	mul	s8,t6,t4

000048e4 <.LVL154>:
    48e4:	02be8333          	mul	t1,t4,a1

000048e8 <.LVL155>:
    48e8:	018f0f33          	add	t5,t5,s8

000048ec <.LVL156>:
    48ec:	01035d93          	srl	s11,t1,0x10

000048f0 <.LVL157>:
    48f0:	01ed8f33          	add	t5,s11,t5
    48f4:	03f28cb3          	mul	s9,t0,t6

000048f8 <.LVL158>:
    48f8:	018f7463          	bgeu	t5,s8,4900 <.L75>
    48fc:	01ac8cb3          	add	s9,s9,s10

00004900 <.L75>:
    4900:	010f5c13          	srl	s8,t5,0x10
    4904:	019c0c33          	add	s8,s8,s9

00004908 <.LVL160>:
    4908:	00010cb7          	lui	s9,0x10

0000490c <.LVL161>:
    490c:	fffc8d13          	add	s10,s9,-1 # ffff <_ebss+0x519f>

00004910 <.LVL162>:
    4910:	01af7f33          	and	t5,t5,s10

00004914 <.LVL163>:
    4914:	010f1f13          	sll	t5,t5,0x10
    4918:	01a37333          	and	t1,t1,s10

0000491c <.LVL164>:
    491c:	006f0333          	add	t1,t5,t1

00004920 <.LBB79>:
    4920:	01412f03          	lw	t5,20(sp)
    4924:	011708b3          	add	a7,a4,a7

00004928 <.LVL166>:
    4928:	01812d03          	lw	s10,24(sp)

0000492c <.LVL167>:
    492c:	01e98f33          	add	t5,s3,t5

00004930 <.LVL168>:
    4930:	00e8b733          	sltu	a4,a7,a4

00004934 <.LVL169>:
    4934:	00ef0733          	add	a4,t5,a4

00004938 <.LBB80>:
    4938:	00d886b3          	add	a3,a7,a3

0000493c <.LVL171>:
    493c:	01a70d33          	add	s10,a4,s10

00004940 <.LVL172>:
    4940:	0116b8b3          	sltu	a7,a3,a7

00004944 <.LVL173>:
    4944:	011d08b3          	add	a7,s10,a7

00004948 <.LVL174>:
    4948:	00a68533          	add	a0,a3,a0

0000494c <.LVL175>:
    494c:	009884b3          	add	s1,a7,s1

00004950 <.LBB81>:
    4950:	00d536b3          	sltu	a3,a0,a3
    4954:	00d486b3          	add	a3,s1,a3

00004958 <.LBB82>:
    4958:	013f39b3          	sltu	s3,t5,s3

0000495c <.LVL177>:
    495c:	01e73f33          	sltu	t5,a4,t5

00004960 <.LBB83>:
    4960:	00ed3733          	sltu	a4,s10,a4

00004964 <.LVL179>:
    4964:	01a8bd33          	sltu	s10,a7,s10

00004968 <.LBB84>:
    4968:	01e9ef33          	or	t5,s3,t5

0000496c <.LBB85>:
    496c:	0114b8b3          	sltu	a7,s1,a7

00004970 <.LBB86>:
    4970:	01a76733          	or	a4,a4,s10

00004974 <.LBB87>:
    4974:	0096b4b3          	sltu	s1,a3,s1
    4978:	01868c33          	add	s8,a3,s8

0000497c <.LBB88>:
    497c:	00ef0733          	add	a4,t5,a4

00004980 <.LBB89>:
    4980:	0098e8b3          	or	a7,a7,s1
    4984:	00e884b3          	add	s1,a7,a4

00004988 <.LBB90>:
    4988:	03cf8f33          	mul	t5,t6,t3

0000498c <.LBB92>:
    498c:	00dc38b3          	sltu	a7,s8,a3
    4990:	00650333          	add	t1,a0,t1

00004994 <.LVL185>:
    4994:	00a33533          	sltu	a0,t1,a0
    4998:	00ac0533          	add	a0,s8,a0
    499c:	01853c33          	sltu	s8,a0,s8
    49a0:	0188e8b3          	or	a7,a7,s8
    49a4:	04612e23          	sw	t1,92(sp)
    49a8:	009888b3          	add	a7,a7,s1

000049ac <.LBB93>:
    49ac:	02be06b3          	mul	a3,t3,a1

000049b0 <.LVL188>:
    49b0:	02b789b3          	mul	s3,a5,a1

000049b4 <.LVL189>:
    49b4:	0106d713          	srl	a4,a3,0x10
    49b8:	01e989b3          	add	s3,s3,t5

000049bc <.LVL190>:
    49bc:	01370733          	add	a4,a4,s3
    49c0:	03f784b3          	mul	s1,a5,t6

000049c4 <.LVL191>:
    49c4:	01e77463          	bgeu	a4,t5,49cc <.L100>
    49c8:	019484b3          	add	s1,s1,s9

000049cc <.L100>:
    49cc:	01075f13          	srl	t5,a4,0x10
    49d0:	009f0f33          	add	t5,t5,s1

000049d4 <.LVL193>:
    49d4:	000104b7          	lui	s1,0x10

000049d8 <.LVL194>:
    49d8:	fff48993          	add	s3,s1,-1 # ffff <_ebss+0x519f>
    49dc:	01377733          	and	a4,a4,s3

000049e0 <.LVL195>:
    49e0:	0136f6b3          	and	a3,a3,s3

000049e4 <.LVL196>:
    49e4:	01071713          	sll	a4,a4,0x10

000049e8 <.LBB94>:
    49e8:	035389b3          	mul	s3,t2,s5

000049ec <.LBB95>:
    49ec:	00d70733          	add	a4,a4,a3

000049f0 <.LBB96>:
    49f0:	030a86b3          	mul	a3,s5,a6

000049f4 <.LVL198>:
    49f4:	030b0833          	mul	a6,s6,a6

000049f8 <.LVL199>:
    49f8:	01380c33          	add	s8,a6,s3
    49fc:	0106d813          	srl	a6,a3,0x10

00004a00 <.LVL200>:
    4a00:	01880833          	add	a6,a6,s8
    4a04:	036383b3          	mul	t2,t2,s6

00004a08 <.LVL201>:
    4a08:	01387463          	bgeu	a6,s3,4a10 <.L101>
    4a0c:	009383b3          	add	t2,t2,s1

00004a10 <.L101>:
    4a10:	01085493          	srl	s1,a6,0x10
    4a14:	00010c37          	lui	s8,0x10
    4a18:	007483b3          	add	t2,s1,t2

00004a1c <.LVL203>:
    4a1c:	fffc0493          	add	s1,s8,-1 # ffff <_ebss+0x519f>
    4a20:	0096f6b3          	and	a3,a3,s1

00004a24 <.LVL204>:
    4a24:	00987833          	and	a6,a6,s1

00004a28 <.LVL205>:
    4a28:	01081813          	sll	a6,a6,0x10

00004a2c <.LBB97>:
    4a2c:	03db89b3          	mul	s3,s7,t4

00004a30 <.LBB98>:
    4a30:	00d80833          	add	a6,a6,a3

00004a34 <.LBB99>:
    4a34:	03d90eb3          	mul	t4,s2,t4

00004a38 <.LVL208>:
    4a38:	0109d693          	srl	a3,s3,0x10
    4a3c:	032284b3          	mul	s1,t0,s2

00004a40 <.LVL209>:
    4a40:	037282b3          	mul	t0,t0,s7

00004a44 <.LVL210>:
    4a44:	01d282b3          	add	t0,t0,t4

00004a48 <.LVL211>:
    4a48:	005686b3          	add	a3,a3,t0

00004a4c <.LVL212>:
    4a4c:	01d6f463          	bgeu	a3,t4,4a54 <.L102>
    4a50:	018484b3          	add	s1,s1,s8

00004a54 <.L102>:
    4a54:	0106de93          	srl	t4,a3,0x10

00004a58 <.LVL214>:
    4a58:	009e8eb3          	add	t4,t4,s1

00004a5c <.LVL215>:
    4a5c:	000104b7          	lui	s1,0x10

00004a60 <.LVL216>:
    4a60:	fff48293          	add	t0,s1,-1 # ffff <_ebss+0x519f>
    4a64:	0056f6b3          	and	a3,a3,t0

00004a68 <.LVL217>:
    4a68:	0059f9b3          	and	s3,s3,t0

00004a6c <.LVL218>:
    4a6c:	01069693          	sll	a3,a3,0x10

00004a70 <.LBB100>:
    4a70:	02ba82b3          	mul	t0,s5,a1

00004a74 <.LBB101>:
    4a74:	013686b3          	add	a3,a3,s3

00004a78 <.LBB102>:
    4a78:	02bb05b3          	mul	a1,s6,a1

00004a7c <.LVL220>:
    4a7c:	035f89b3          	mul	s3,t6,s5

00004a80 <.LVL221>:
    4a80:	01358c33          	add	s8,a1,s3
    4a84:	0102d593          	srl	a1,t0,0x10

00004a88 <.LVL222>:
    4a88:	018585b3          	add	a1,a1,s8
    4a8c:	036f8fb3          	mul	t6,t6,s6

00004a90 <.LVL223>:
    4a90:	0135f463          	bgeu	a1,s3,4a98 <.L103>
    4a94:	009f8fb3          	add	t6,t6,s1

00004a98 <.L103>:
    4a98:	0105d493          	srl	s1,a1,0x10
    4a9c:	01f48fb3          	add	t6,s1,t6

00004aa0 <.LVL225>:
    4aa0:	000104b7          	lui	s1,0x10
    4aa4:	fff48993          	add	s3,s1,-1 # ffff <_ebss+0x519f>

00004aa8 <.LVL226>:
    4aa8:	0135f5b3          	and	a1,a1,s3

00004aac <.LVL227>:
    4aac:	0132f2b3          	and	t0,t0,s3

00004ab0 <.LVL228>:
    4ab0:	01059593          	sll	a1,a1,0x10

00004ab4 <.LBB103>:
    4ab4:	032789b3          	mul	s3,a5,s2

00004ab8 <.LBB104>:
    4ab8:	005585b3          	add	a1,a1,t0

00004abc <.LBB105>:
    4abc:	037787b3          	mul	a5,a5,s7

00004ac0 <.LVL230>:
    4ac0:	03cb82b3          	mul	t0,s7,t3

00004ac4 <.LVL231>:
    4ac4:	03c90e33          	mul	t3,s2,t3

00004ac8 <.LVL232>:
    4ac8:	0102dc13          	srl	s8,t0,0x10

00004acc <.LVL233>:
    4acc:	01c787b3          	add	a5,a5,t3
    4ad0:	00fc07b3          	add	a5,s8,a5

00004ad4 <.LVL235>:
    4ad4:	01c7f463          	bgeu	a5,t3,4adc <.L104>
    4ad8:	009989b3          	add	s3,s3,s1

00004adc <.L104>:
    4adc:	00e50733          	add	a4,a0,a4

00004ae0 <.LVL237>:
    4ae0:	01070833          	add	a6,a4,a6

00004ae4 <.LVL238>:
    4ae4:	01e88f33          	add	t5,a7,t5

00004ae8 <.LBB106>:
    4ae8:	00a73533          	sltu	a0,a4,a0
    4aec:	00af0533          	add	a0,t5,a0
    4af0:	00d806b3          	add	a3,a6,a3

00004af4 <.LVL240>:
    4af4:	007503b3          	add	t2,a0,t2

00004af8 <.LBB107>:
    4af8:	00e83733          	sltu	a4,a6,a4

00004afc <.LBB108>:
    4afc:	06d12023          	sw	a3,96(sp)
    4b00:	0106b6b3          	sltu	a3,a3,a6

00004b04 <.LBB109>:
    4b04:	037a8833          	mul	a6,s5,s7
    4b08:	00e38733          	add	a4,t2,a4
    4b0c:	01d70eb3          	add	t4,a4,t4

00004b10 <.LVL242>:
    4b10:	00de86b3          	add	a3,t4,a3

00004b14 <.LBB110>:
    4b14:	0107de13          	srl	t3,a5,0x10

00004b18 <.LBB111>:
    4b18:	011f38b3          	sltu	a7,t5,a7

00004b1c <.LBB112>:
    4b1c:	000104b7          	lui	s1,0x10

00004b20 <.LBB113>:
    4b20:	01e53f33          	sltu	t5,a0,t5

00004b24 <.LBB114>:
    4b24:	00a3b533          	sltu	a0,t2,a0
    4b28:	007733b3          	sltu	t2,a4,t2

00004b2c <.LBB115>:
    4b2c:	03590ab3          	mul	s5,s2,s5

00004b30 <.LBB116>:
    4b30:	013e0e33          	add	t3,t3,s3

00004b34 <.LBB117>:
    4b34:	00756533          	or	a0,a0,t2

00004b38 <.LBB118>:
    4b38:	fff48993          	add	s3,s1,-1 # ffff <_ebss+0x519f>

00004b3c <.LBB119>:
    4b3c:	00eeb733          	sltu	a4,t4,a4

00004b40 <.LBB120>:
    4b40:	01e8e8b3          	or	a7,a7,t5

00004b44 <.LBB121>:
    4b44:	01d6beb3          	sltu	t4,a3,t4

00004b48 <.LBB122>:
    4b48:	00a888b3          	add	a7,a7,a0

00004b4c <.LBB123>:
    4b4c:	0137f7b3          	and	a5,a5,s3

00004b50 <.LBB124>:
    4b50:	01d76733          	or	a4,a4,t4

00004b54 <.LBB125>:
    4b54:	032b0933          	mul	s2,s6,s2

00004b58 <.LVL248>:
    4b58:	00b685b3          	add	a1,a3,a1

00004b5c <.LBB126>:
    4b5c:	01170733          	add	a4,a4,a7

00004b60 <.LBB127>:
    4b60:	01079793          	sll	a5,a5,0x10
    4b64:	0132f2b3          	and	t0,t0,s3

00004b68 <.LVL250>:
    4b68:	01f70fb3          	add	t6,a4,t6

00004b6c <.LVL251>:
    4b6c:	005787b3          	add	a5,a5,t0

00004b70 <.LBB128>:
    4b70:	00d5b6b3          	sltu	a3,a1,a3

00004b74 <.LVL253>:
    4b74:	00df86b3          	add	a3,t6,a3

00004b78 <.LVL254>:
    4b78:	00f587b3          	add	a5,a1,a5

00004b7c <.LBB132>:
    4b7c:	037b0b33          	mul	s6,s6,s7

00004b80 <.LBB133>:
    4b80:	00efb733          	sltu	a4,t6,a4

00004b84 <.LVL257>:
    4b84:	01c68e33          	add	t3,a3,t3

00004b88 <.LVL258>:
    4b88:	01f6bfb3          	sltu	t6,a3,t6

00004b8c <.LBB134>:
    4b8c:	06f12223          	sw	a5,100(sp)
    4b90:	00b7b7b3          	sltu	a5,a5,a1

00004b94 <.LBB135>:
    4b94:	01f76533          	or	a0,a4,t6

00004b98 <.LBB136>:
    4b98:	00fe07b3          	add	a5,t3,a5

00004b9c <.LBB137>:
    4b9c:	01085713          	srl	a4,a6,0x10

00004ba0 <.LBB138>:
    4ba0:	00de36b3          	sltu	a3,t3,a3

00004ba4 <.LVL260>:
    4ba4:	015b0b33          	add	s6,s6,s5
    4ba8:	01c7be33          	sltu	t3,a5,t3

00004bac <.LBB139>:
    4bac:	01670733          	add	a4,a4,s6

00004bb0 <.LBB140>:
    4bb0:	01c6e6b3          	or	a3,a3,t3

00004bb4 <.LBB141>:
    4bb4:	01577463          	bgeu	a4,s5,4bbc <.L135>
    4bb8:	00990933          	add	s2,s2,s1

00004bbc <.L135>:
    4bbc:	01075593          	srl	a1,a4,0x10
    4bc0:	00a585b3          	add	a1,a1,a0

00004bc4 <.LBB142>:
    4bc4:	00010537          	lui	a0,0x10

00004bc8 <.LVL264>:
    4bc8:	fff50513          	add	a0,a0,-1 # ffff <_ebss+0x519f>
    4bcc:	00a77733          	and	a4,a4,a0

00004bd0 <.LVL265>:
    4bd0:	01071713          	sll	a4,a4,0x10
    4bd4:	00a87833          	and	a6,a6,a0

00004bd8 <.LVL266>:
    4bd8:	01070733          	add	a4,a4,a6
    4bdc:	00e78733          	add	a4,a5,a4

00004be0 <.LBB144>:
    4be0:	00d586b3          	add	a3,a1,a3

00004be4 <.LVL268>:
    4be4:	00f737b3          	sltu	a5,a4,a5
    4be8:	00f687b3          	add	a5,a3,a5
    4bec:	012787b3          	add	a5,a5,s2
    4bf0:	06f12623          	sw	a5,108(sp)

00004bf4 <.LBB146>:
    4bf4:	01012783          	lw	a5,16(sp)
    4bf8:	00d31313          	sll	t1,t1,0xd

00004bfc <.LBB145>:
    4bfc:	06e12423          	sw	a4,104(sp)

00004c00 <.LBB148>:
    4c00:	00c7e7b3          	or	a5,a5,a2

00004c04 <.LVL270>:
    4c04:	0147e7b3          	or	a5,a5,s4

00004c08 <.LVL271>:
    4c08:	00f36333          	or	t1,t1,a5

00004c0c <.LVL272>:
    4c0c:	06010613          	add	a2,sp,96
    4c10:	05010793          	add	a5,sp,80

00004c14 <.L138>:
    4c14:	00c7a703          	lw	a4,12(a5)
    4c18:	0107a683          	lw	a3,16(a5)
    4c1c:	00478793          	add	a5,a5,4
    4c20:	01375713          	srl	a4,a4,0x13
    4c24:	00d69693          	sll	a3,a3,0xd
    4c28:	00d76733          	or	a4,a4,a3
    4c2c:	fee7ae23          	sw	a4,-4(a5)
    4c30:	fef612e3          	bne	a2,a5,4c14 <.L138>
    4c34:	05012783          	lw	a5,80(sp)
    4c38:	00603333          	snez	t1,t1

00004c3c <.LBE148>:
    4c3c:	05c12703          	lw	a4,92(sp)

00004c40 <.LBB149>:
    4c40:	00f36333          	or	t1,t1,a5

00004c44 <.LBE149>:
    4c44:	05812783          	lw	a5,88(sp)
    4c48:	04e12623          	sw	a4,76(sp)
    4c4c:	04612023          	sw	t1,64(sp)

00004c50 <.LBB150>:
    4c50:	04f12423          	sw	a5,72(sp)
    4c54:	05412783          	lw	a5,84(sp)
    4c58:	04f12223          	sw	a5,68(sp)

00004c5c <.LBE150>:
    4c5c:	00b71793          	sll	a5,a4,0xb
    4c60:	0407d863          	bgez	a5,4cb0 <.L139>

00004c64 <.LBB151>:
    4c64:	01f31313          	sll	t1,t1,0x1f

00004c68 <.LVL276>:
    4c68:	04010793          	add	a5,sp,64
    4c6c:	04c10593          	add	a1,sp,76

00004c70 <.L140>:
    4c70:	0007a683          	lw	a3,0(a5)
    4c74:	0047a603          	lw	a2,4(a5)
    4c78:	00478793          	add	a5,a5,4
    4c7c:	0016d693          	srl	a3,a3,0x1
    4c80:	01f61613          	sll	a2,a2,0x1f
    4c84:	00c6e6b3          	or	a3,a3,a2
    4c88:	fed7ae23          	sw	a3,-4(a5)
    4c8c:	fef592e3          	bne	a1,a5,4c70 <.L140>

00004c90 <.LBE152>:
    4c90:	04012783          	lw	a5,64(sp)

00004c94 <.LBB153>:
    4c94:	00603333          	snez	t1,t1

00004c98 <.LVL279>:
    4c98:	00175713          	srl	a4,a4,0x1

00004c9c <.LBE153>:
    4c9c:	0067e7b3          	or	a5,a5,t1
    4ca0:	04f12023          	sw	a5,64(sp)

00004ca4 <.LBE151>:
    4ca4:	00812783          	lw	a5,8(sp)

00004ca8 <.LBB154>:
    4ca8:	04e12623          	sw	a4,76(sp)

00004cac <.LBE154>:
    4cac:	00f12623          	sw	a5,12(sp)

00004cb0 <.L139>:
    4cb0:	00c12783          	lw	a5,12(sp)
    4cb4:	00f12423          	sw	a5,8(sp)
    4cb8:	3780006f          	j	5030 <.L173>

00004cbc <.L2>:
  FP_UNPACK_Q (A, a);
    4cbc:	00a7e633          	or	a2,a5,a0
    4cc0:	00d66633          	or	a2,a2,a3
    4cc4:	00e66633          	or	a2,a2,a4
    4cc8:	14060463          	beqz	a2,4e10 <.L174>

00004ccc <.LBB156>:
    4ccc:	0a070063          	beqz	a4,4d6c <.L6>
    4cd0:	00070513          	mv	a0,a4
    4cd4:	2e0020ef          	jal	6fb4 <__clzsi2>

00004cd8 <.L7>:
    4cd8:	ff450713          	add	a4,a0,-12
    4cdc:	40575593          	sra	a1,a4,0x5

00004ce0 <.LVL284>:
    4ce0:	01f77713          	and	a4,a4,31

00004ce4 <.LVL285>:
    4ce4:	0a070e63          	beqz	a4,4da0 <.L10>
    4ce8:	ffc00693          	li	a3,-4
    4cec:	02d586b3          	mul	a3,a1,a3
    4cf0:	02000813          	li	a6,32
    4cf4:	02010313          	add	t1,sp,32
    4cf8:	40e80833          	sub	a6,a6,a4

00004cfc <.LVL286>:
    4cfc:	00c68793          	add	a5,a3,12 # 1000c <_ebss+0x51ac>
    4d00:	00f307b3          	add	a5,t1,a5
    4d04:	40d006b3          	neg	a3,a3

00004d08 <.L11>:
    4d08:	0cf31463          	bne	t1,a5,4dd0 <.L14>
    4d0c:	fff58793          	add	a5,a1,-1

00004d10 <.LVL287>:
    4d10:	00259593          	sll	a1,a1,0x2

00004d14 <.LVL288>:
    4d14:	05058693          	add	a3,a1,80
    4d18:	02010613          	add	a2,sp,32
    4d1c:	00c685b3          	add	a1,a3,a2
    4d20:	02012683          	lw	a3,32(sp)
    4d24:	00e69733          	sll	a4,a3,a4

00004d28 <.LVL289>:
    4d28:	fae5a823          	sw	a4,-80(a1)

00004d2c <.L15>:
    4d2c:	00178793          	add	a5,a5,1
    4d30:	00279793          	sll	a5,a5,0x2
    4d34:	00800693          	li	a3,8
    4d38:	02010713          	add	a4,sp,32
    4d3c:	00d7ea63          	bltu	a5,a3,4d50 <.L16>
    4d40:	02012023          	sw	zero,32(sp)
    4d44:	00072223          	sw	zero,4(a4)
    4d48:	ff878793          	add	a5,a5,-8
    4d4c:	02810713          	add	a4,sp,40

00004d50 <.L16>:
    4d50:	00400693          	li	a3,4
    4d54:	00d7e463          	bltu	a5,a3,4d5c <.L17>
    4d58:	00072023          	sw	zero,0(a4)

00004d5c <.L17>:
    4d5c:	ffffc4b7          	lui	s1,0xffffc

00004d60 <.LVL291>:
    4d60:	01148493          	add	s1,s1,17 # ffffc011 <_ebss+0xffff11b1>
    4d64:	40a484b3          	sub	s1,s1,a0
    4d68:	f20ff06f          	j	4488 <.L209>

00004d6c <.L6>:
    4d6c:	00068a63          	beqz	a3,4d80 <.L8>
    4d70:	00068513          	mv	a0,a3
    4d74:	240020ef          	jal	6fb4 <__clzsi2>

00004d78 <.LVL293>:
    4d78:	02050513          	add	a0,a0,32
    4d7c:	f5dff06f          	j	4cd8 <.L7>

00004d80 <.L8>:
    4d80:	00050863          	beqz	a0,4d90 <.L9>
    4d84:	230020ef          	jal	6fb4 <__clzsi2>

00004d88 <.LVL296>:
    4d88:	04050513          	add	a0,a0,64
    4d8c:	f4dff06f          	j	4cd8 <.L7>

00004d90 <.L9>:
    4d90:	00078513          	mv	a0,a5
    4d94:	220020ef          	jal	6fb4 <__clzsi2>

00004d98 <.LVL299>:
    4d98:	06050513          	add	a0,a0,96
    4d9c:	f3dff06f          	j	4cd8 <.L7>

00004da0 <.L10>:
    4da0:	ffc00693          	li	a3,-4
    4da4:	02d586b3          	mul	a3,a1,a3
    4da8:	02c10793          	add	a5,sp,44

00004dac <.LBB10>:
    4dac:	00300713          	li	a4,3

00004db0 <.L12>:
    4db0:	00d78633          	add	a2,a5,a3
    4db4:	00062603          	lw	a2,0(a2)
    4db8:	fff70713          	add	a4,a4,-1

00004dbc <.LVL303>:
    4dbc:	ffc78793          	add	a5,a5,-4
    4dc0:	00c7a223          	sw	a2,4(a5)

00004dc4 <.LVL304>:
    4dc4:	feb756e3          	bge	a4,a1,4db0 <.L12>
    4dc8:	fff58793          	add	a5,a1,-1
    4dcc:	f61ff06f          	j	4d2c <.L15>

00004dd0 <.L14>:
    4dd0:	0007a603          	lw	a2,0(a5)
    4dd4:	ffc7a883          	lw	a7,-4(a5)
    4dd8:	00d78e33          	add	t3,a5,a3
    4ddc:	00e61633          	sll	a2,a2,a4
    4de0:	0108d8b3          	srl	a7,a7,a6
    4de4:	01166633          	or	a2,a2,a7
    4de8:	00ce2023          	sw	a2,0(t3)
    4dec:	ffc78793          	add	a5,a5,-4
    4df0:	f19ff06f          	j	4d08 <.L11>

00004df4 <.L3>:
    4df4:	00a7e7b3          	or	a5,a5,a0
    4df8:	00d7e7b3          	or	a5,a5,a3
    4dfc:	00e7e7b3          	or	a5,a5,a4
    4e00:	00200b93          	li	s7,2
    4e04:	e8078463          	beqz	a5,448c <.L5>
    4e08:	00300b93          	li	s7,3
    4e0c:	e80ff06f          	j	448c <.L5>

00004e10 <.L174>:
    4e10:	00000493          	li	s1,0

00004e14 <.LBE157>:
    4e14:	00100b93          	li	s7,1
    4e18:	e74ff06f          	j	448c <.L5>

00004e1c <.L18>:
  FP_UNPACK_Q (B, b);
    4e1c:	016967b3          	or	a5,s2,s6

00004e20 <.LVL309>:
    4e20:	0157e7b3          	or	a5,a5,s5
    4e24:	00a7e7b3          	or	a5,a5,a0
    4e28:	14078463          	beqz	a5,4f70 <.L176>

00004e2c <.LBB158>:
    4e2c:	08050e63          	beqz	a0,4ec8 <.L22>
    4e30:	184020ef          	jal	6fb4 <__clzsi2>

00004e34 <.L23>:
    4e34:	ff450693          	add	a3,a0,-12
    4e38:	4056d793          	sra	a5,a3,0x5

00004e3c <.LVL311>:
    4e3c:	01f6f693          	and	a3,a3,31

00004e40 <.LVL312>:
    4e40:	0c068063          	beqz	a3,4f00 <.L26>
    4e44:	ffc00613          	li	a2,-4
    4e48:	02c78633          	mul	a2,a5,a2
    4e4c:	02000813          	li	a6,32
    4e50:	03010313          	add	t1,sp,48
    4e54:	40d80833          	sub	a6,a6,a3

00004e58 <.LVL313>:
    4e58:	00c60713          	add	a4,a2,12
    4e5c:	00e30733          	add	a4,t1,a4
    4e60:	40c00633          	neg	a2,a2

00004e64 <.L27>:
    4e64:	0ce31663          	bne	t1,a4,4f30 <.L30>
    4e68:	fff78713          	add	a4,a5,-1

00004e6c <.LVL314>:
    4e6c:	00279793          	sll	a5,a5,0x2

00004e70 <.LVL315>:
    4e70:	02010613          	add	a2,sp,32
    4e74:	05078793          	add	a5,a5,80
    4e78:	00c787b3          	add	a5,a5,a2
    4e7c:	03012603          	lw	a2,48(sp)
    4e80:	00d616b3          	sll	a3,a2,a3

00004e84 <.LVL316>:
    4e84:	fcd7a023          	sw	a3,-64(a5)

00004e88 <.L31>:
    4e88:	00170793          	add	a5,a4,1
    4e8c:	00279793          	sll	a5,a5,0x2
    4e90:	00800693          	li	a3,8
    4e94:	03010713          	add	a4,sp,48
    4e98:	00d7ea63          	bltu	a5,a3,4eac <.L32>
    4e9c:	02012823          	sw	zero,48(sp)
    4ea0:	00072223          	sw	zero,4(a4)
    4ea4:	ff878793          	add	a5,a5,-8
    4ea8:	03810713          	add	a4,sp,56

00004eac <.L32>:
    4eac:	00400693          	li	a3,4
    4eb0:	00d7e463          	bltu	a5,a3,4eb8 <.L33>
    4eb4:	00072023          	sw	zero,0(a4)

00004eb8 <.L33>:
    4eb8:	ffffc7b7          	lui	a5,0xffffc
    4ebc:	01178793          	add	a5,a5,17 # ffffc011 <_ebss+0xffff11b1>
    4ec0:	40a787b3          	sub	a5,a5,a0
    4ec4:	e54ff06f          	j	4518 <.L210>

00004ec8 <.L22>:
    4ec8:	000a8a63          	beqz	s5,4edc <.L24>
    4ecc:	000a8513          	mv	a0,s5
    4ed0:	0e4020ef          	jal	6fb4 <__clzsi2>

00004ed4 <.LVL319>:
    4ed4:	02050513          	add	a0,a0,32
    4ed8:	f5dff06f          	j	4e34 <.L23>

00004edc <.L24>:
    4edc:	000b0a63          	beqz	s6,4ef0 <.L25>
    4ee0:	000b0513          	mv	a0,s6
    4ee4:	0d0020ef          	jal	6fb4 <__clzsi2>

00004ee8 <.LVL322>:
    4ee8:	04050513          	add	a0,a0,64
    4eec:	f49ff06f          	j	4e34 <.L23>

00004ef0 <.L25>:
    4ef0:	00090513          	mv	a0,s2
    4ef4:	0c0020ef          	jal	6fb4 <__clzsi2>

00004ef8 <.LVL325>:
    4ef8:	06050513          	add	a0,a0,96
    4efc:	f39ff06f          	j	4e34 <.L23>

00004f00 <.L26>:
    4f00:	ffc00613          	li	a2,-4
    4f04:	02c78633          	mul	a2,a5,a2
    4f08:	03c10713          	add	a4,sp,60

00004f0c <.LBB17>:
    4f0c:	00300693          	li	a3,3

00004f10 <.L28>:
    4f10:	00c705b3          	add	a1,a4,a2
    4f14:	0005a583          	lw	a1,0(a1)
    4f18:	fff68693          	add	a3,a3,-1

00004f1c <.LVL329>:
    4f1c:	ffc70713          	add	a4,a4,-4
    4f20:	00b72223          	sw	a1,4(a4)

00004f24 <.LVL330>:
    4f24:	fef6d6e3          	bge	a3,a5,4f10 <.L28>
    4f28:	fff78713          	add	a4,a5,-1
    4f2c:	f5dff06f          	j	4e88 <.L31>

00004f30 <.L30>:
    4f30:	00072583          	lw	a1,0(a4)
    4f34:	ffc72883          	lw	a7,-4(a4)
    4f38:	00c70e33          	add	t3,a4,a2
    4f3c:	00d595b3          	sll	a1,a1,a3
    4f40:	0108d8b3          	srl	a7,a7,a6
    4f44:	0115e5b3          	or	a1,a1,a7
    4f48:	00be2023          	sw	a1,0(t3)
    4f4c:	ffc70713          	add	a4,a4,-4
    4f50:	f15ff06f          	j	4e64 <.L27>

00004f54 <.L19>:
    4f54:	01696933          	or	s2,s2,s6
    4f58:	01596933          	or	s2,s2,s5
    4f5c:	00a96933          	or	s2,s2,a0
    4f60:	00200693          	li	a3,2
    4f64:	da090c63          	beqz	s2,451c <.L21>
    4f68:	00300693          	li	a3,3
    4f6c:	db0ff06f          	j	451c <.L21>

00004f70 <.L176>:
    4f70:	00000793          	li	a5,0

00004f74 <.LBE159>:
    4f74:	00100693          	li	a3,1
    4f78:	da4ff06f          	j	451c <.L21>

00004f7c <.L35>:
    4f7c:	00100713          	li	a4,1
    4f80:	00f717b3          	sll	a5,a4,a5
  FP_MUL_Q (R, A, B);
    4f84:	5307f713          	and	a4,a5,1328
    4f88:	06071863          	bnez	a4,4ff8 <.L38>
    4f8c:	0887f713          	and	a4,a5,136
    4f90:	04071063          	bnez	a4,4fd0 <.L39>
    4f94:	2407f793          	and	a5,a5,576
    4f98:	dc078063          	beqz	a5,4558 <.L36>

00004f9c <.L40>:
  FP_PACK_Q (r, R);
    4f9c:	000087b7          	lui	a5,0x8
    4fa0:	04f12623          	sw	a5,76(sp)
    4fa4:	04012423          	sw	zero,72(sp)
    4fa8:	04012223          	sw	zero,68(sp)
    4fac:	04012023          	sw	zero,64(sp)

00004fb0 <.LVL336>:
    4fb0:	fff78793          	add	a5,a5,-1 # 7fff <.LLST128+0x4b>
    4fb4:	00012223          	sw	zero,4(sp)
    4fb8:	1440006f          	j	50fc <.L153>

00004fbc <.L34>:
  FP_MUL_Q (R, A, B);
    4fbc:	00f00713          	li	a4,15
    4fc0:	fce78ee3          	beq	a5,a4,4f9c <.L40>
    4fc4:	00b00713          	li	a4,11

00004fc8 <.LBB160>:
  FP_UNPACK_Q (A, a);
    4fc8:	01412223          	sw	s4,4(sp)

00004fcc <.LBE160>:
  FP_MUL_Q (R, A, B);
    4fcc:	02e79663          	bne	a5,a4,4ff8 <.L38>

00004fd0 <.L39>:
  FP_UNPACK_Q (B, b);
    4fd0:	01312223          	sw	s3,4(sp)

00004fd4 <.L37>:
  FP_MUL_Q (R, A, B);
    4fd4:	03012783          	lw	a5,48(sp)
    4fd8:	00068b93          	mv	s7,a3

00004fdc <.LVL339>:
    4fdc:	04f12023          	sw	a5,64(sp)
    4fe0:	03412783          	lw	a5,52(sp)
    4fe4:	04f12223          	sw	a5,68(sp)
    4fe8:	03812783          	lw	a5,56(sp)
    4fec:	04f12423          	sw	a5,72(sp)
    4ff0:	03c12783          	lw	a5,60(sp)

00004ff4 <.LVL340>:
    4ff4:	0200006f          	j	5014 <.L141>

00004ff8 <.L38>:
    4ff8:	02012783          	lw	a5,32(sp)
    4ffc:	04f12023          	sw	a5,64(sp)
    5000:	02412783          	lw	a5,36(sp)
    5004:	04f12223          	sw	a5,68(sp)
    5008:	02812783          	lw	a5,40(sp)
    500c:	04f12423          	sw	a5,72(sp)
    5010:	02c12783          	lw	a5,44(sp)

00005014 <.L141>:
    5014:	04f12623          	sw	a5,76(sp)
  FP_PACK_Q (r, R);
    5018:	00200793          	li	a5,2
    501c:	36fb8663          	beq	s7,a5,5388 <.L142>
    5020:	00300793          	li	a5,3
    5024:	f6fb8ce3          	beq	s7,a5,4f9c <.L40>
    5028:	00100793          	li	a5,1
    502c:	34fb8463          	beq	s7,a5,5374 <.L211>

00005030 <.L173>:
    5030:	00812703          	lw	a4,8(sp)
    5034:	000047b7          	lui	a5,0x4
    5038:	fff78793          	add	a5,a5,-1 # 3fff <.L143+0xf>
    503c:	00f707b3          	add	a5,a4,a5

00005040 <.LVL344>:
    5040:	12f05a63          	blez	a5,5174 <.L144>
    5044:	04012703          	lw	a4,64(sp)
    5048:	00777693          	and	a3,a4,7
    504c:	04068463          	beqz	a3,5094 <.L145>
    5050:	00f77693          	and	a3,a4,15
    5054:	00400613          	li	a2,4
    5058:	02c68e63          	beq	a3,a2,5094 <.L145>

0000505c <.LBB162>:
    505c:	00470713          	add	a4,a4,4
    5060:	00473693          	sltiu	a3,a4,4
    5064:	04e12023          	sw	a4,64(sp)

00005068 <.LVL345>:
    5068:	04412703          	lw	a4,68(sp)

0000506c <.LVL346>:
    506c:	00e68733          	add	a4,a3,a4
    5070:	04e12223          	sw	a4,68(sp)

00005074 <.LVL347>:
    5074:	00d73733          	sltu	a4,a4,a3

00005078 <.LVL348>:
    5078:	04812683          	lw	a3,72(sp)
    507c:	00e68733          	add	a4,a3,a4

00005080 <.LVL349>:
    5080:	04e12423          	sw	a4,72(sp)

00005084 <.LVL350>:
    5084:	00d73733          	sltu	a4,a4,a3

00005088 <.LVL351>:
    5088:	04c12683          	lw	a3,76(sp)
    508c:	00d70733          	add	a4,a4,a3

00005090 <.LVL352>:
    5090:	04e12623          	sw	a4,76(sp)

00005094 <.L145>:
    5094:	04c12703          	lw	a4,76(sp)
    5098:	00b71693          	sll	a3,a4,0xb
    509c:	0206d063          	bgez	a3,50bc <.L150>
    50a0:	fff007b7          	lui	a5,0xfff00

000050a4 <.LVL354>:
    50a4:	fff78793          	add	a5,a5,-1 # ffefffff <_ebss+0xffef519f>
    50a8:	00f77733          	and	a4,a4,a5
    50ac:	04e12623          	sw	a4,76(sp)
    50b0:	00812703          	lw	a4,8(sp)
    50b4:	000047b7          	lui	a5,0x4

000050b8 <.LVL355>:
    50b8:	00f707b3          	add	a5,a4,a5

000050bc <.L150>:
    50bc:	04010713          	add	a4,sp,64
    50c0:	04c10593          	add	a1,sp,76

000050c4 <.L151>:
    50c4:	00072683          	lw	a3,0(a4)
    50c8:	00472603          	lw	a2,4(a4)
    50cc:	00470713          	add	a4,a4,4
    50d0:	0036d693          	srl	a3,a3,0x3
    50d4:	01d61613          	sll	a2,a2,0x1d
    50d8:	00c6e6b3          	or	a3,a3,a2
    50dc:	fed72e23          	sw	a3,-4(a4)
    50e0:	fee592e3          	bne	a1,a4,50c4 <.L151>

000050e4 <.LBE163>:
    50e4:	000086b7          	lui	a3,0x8
    50e8:	ffe68693          	add	a3,a3,-2 # 7ffe <.LLST128+0x4a>

000050ec <.LBB164>:
    50ec:	04c12703          	lw	a4,76(sp)

000050f0 <.LBE164>:
    50f0:	28f6cc63          	blt	a3,a5,5388 <.L142>

000050f4 <.LBB165>:
    50f4:	00375713          	srl	a4,a4,0x3
    50f8:	04e12623          	sw	a4,76(sp)

000050fc <.L153>:
    50fc:	04c12703          	lw	a4,76(sp)

00005100 <.LBE166>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    5100:	0ac12083          	lw	ra,172(sp)
    5104:	00040513          	mv	a0,s0

00005108 <.LBB167>:
  FP_PACK_Q (r, R);
    5108:	04e11e23          	sh	a4,92(sp)
    510c:	00412703          	lw	a4,4(sp)

00005110 <.LBE167>:
}
    5110:	0a412483          	lw	s1,164(sp)
    5114:	0a012903          	lw	s2,160(sp)

00005118 <.LBB168>:
  FP_PACK_Q (r, R);
    5118:	00f71713          	sll	a4,a4,0xf
    511c:	00f767b3          	or	a5,a4,a5

00005120 <.LVL360>:
    5120:	04f11f23          	sh	a5,94(sp)

00005124 <.LBE168>:
  return r;
    5124:	04012783          	lw	a5,64(sp)
}
    5128:	09c12983          	lw	s3,156(sp)
    512c:	09812a03          	lw	s4,152(sp)
  return r;
    5130:	00f42023          	sw	a5,0(s0)
    5134:	04412783          	lw	a5,68(sp)
}
    5138:	09412a83          	lw	s5,148(sp)
    513c:	09012b03          	lw	s6,144(sp)
  return r;
    5140:	00f42223          	sw	a5,4(s0)
    5144:	04812783          	lw	a5,72(sp)
}
    5148:	08c12b83          	lw	s7,140(sp)
    514c:	08812c03          	lw	s8,136(sp)
  return r;
    5150:	00f42423          	sw	a5,8(s0)
    5154:	05c12783          	lw	a5,92(sp)
}
    5158:	08412c83          	lw	s9,132(sp)
    515c:	08012d03          	lw	s10,128(sp)
  return r;
    5160:	00f42623          	sw	a5,12(s0)
}
    5164:	0a812403          	lw	s0,168(sp)
    5168:	07c12d83          	lw	s11,124(sp)
    516c:	0b010113          	add	sp,sp,176

00005170 <.LVL363>:
    5170:	00008067          	ret

00005174 <.L144>:
  FP_PACK_Q (r, R);
    5174:	00100693          	li	a3,1
    5178:	40f686b3          	sub	a3,a3,a5

0000517c <.LVL365>:
    517c:	07400793          	li	a5,116
    5180:	1cd7ca63          	blt	a5,a3,5354 <.L154>

00005184 <.LBB170>:
    5184:	04010613          	add	a2,sp,64
    5188:	4056d713          	sra	a4,a3,0x5

0000518c <.LVL367>:
    518c:	00060513          	mv	a0,a2
    5190:	01f6f693          	and	a3,a3,31

00005194 <.LVL368>:
    5194:	00000793          	li	a5,0
    5198:	00000593          	li	a1,0

0000519c <.L155>:
    519c:	02e59e63          	bne	a1,a4,51d8 <.L156>
    51a0:	00300593          	li	a1,3

000051a4 <.LVL370>:
    51a4:	40e585b3          	sub	a1,a1,a4
    51a8:	00271513          	sll	a0,a4,0x2
    51ac:	04069063          	bnez	a3,51ec <.L157>
    51b0:	00060813          	mv	a6,a2

000051b4 <.L158>:
    51b4:	00a808b3          	add	a7,a6,a0
    51b8:	0008a883          	lw	a7,0(a7)
    51bc:	00168693          	add	a3,a3,1

000051c0 <.LVL372>:
    51c0:	00480813          	add	a6,a6,4
    51c4:	ff182e23          	sw	a7,-4(a6)

000051c8 <.LVL373>:
    51c8:	fed5d6e3          	bge	a1,a3,51b4 <.L158>
    51cc:	00400693          	li	a3,4

000051d0 <.LVL374>:
    51d0:	40e68733          	sub	a4,a3,a4

000051d4 <.LVL375>:
    51d4:	06c0006f          	j	5240 <.L162>

000051d8 <.L156>:
    51d8:	00052803          	lw	a6,0(a0)
    51dc:	00158593          	add	a1,a1,1

000051e0 <.LVL377>:
    51e0:	00450513          	add	a0,a0,4
    51e4:	0107e7b3          	or	a5,a5,a6

000051e8 <.LVL378>:
    51e8:	fb5ff06f          	j	519c <.L155>

000051ec <.L157>:
    51ec:	05050813          	add	a6,a0,80
    51f0:	02010893          	add	a7,sp,32
    51f4:	01180833          	add	a6,a6,a7
    51f8:	fd082803          	lw	a6,-48(a6)
    51fc:	02000313          	li	t1,32
    5200:	40d30333          	sub	t1,t1,a3
    5204:	00681833          	sll	a6,a6,t1
    5208:	0107e7b3          	or	a5,a5,a6

0000520c <.LVL380>:
    520c:	00000e13          	li	t3,0
    5210:	00a60833          	add	a6,a2,a0
    5214:	40a00533          	neg	a0,a0

00005218 <.L160>:
    5218:	0ebe4063          	blt	t3,a1,52f8 <.L161>
    521c:	00400513          	li	a0,4
    5220:	00259593          	sll	a1,a1,0x2
    5224:	40e50733          	sub	a4,a0,a4

00005228 <.LVL382>:
    5228:	05058593          	add	a1,a1,80
    522c:	02010513          	add	a0,sp,32
    5230:	00a585b3          	add	a1,a1,a0
    5234:	04c12503          	lw	a0,76(sp)
    5238:	00d556b3          	srl	a3,a0,a3

0000523c <.LVL383>:
    523c:	fcd5a823          	sw	a3,-48(a1)

00005240 <.L162>:
    5240:	00400693          	li	a3,4
    5244:	40e686b3          	sub	a3,a3,a4
    5248:	00269693          	sll	a3,a3,0x2
    524c:	00271713          	sll	a4,a4,0x2
    5250:	00800593          	li	a1,8
    5254:	00e60733          	add	a4,a2,a4
    5258:	00b6ea63          	bltu	a3,a1,526c <.L163>
    525c:	00072023          	sw	zero,0(a4)
    5260:	00072223          	sw	zero,4(a4)
    5264:	ff868693          	add	a3,a3,-8
    5268:	00870713          	add	a4,a4,8

0000526c <.L163>:
    526c:	00400593          	li	a1,4
    5270:	00b6e463          	bltu	a3,a1,5278 <.L164>
    5274:	00072023          	sw	zero,0(a4)

00005278 <.L164>:
    5278:	04012703          	lw	a4,64(sp)

0000527c <.LBB172>:
    527c:	00f037b3          	snez	a5,a5

00005280 <.LBE172>:
    5280:	00e7e7b3          	or	a5,a5,a4
    5284:	04f12023          	sw	a5,64(sp)

00005288 <.LBE170>:
    5288:	0077f713          	and	a4,a5,7
    528c:	04070463          	beqz	a4,52d4 <.L165>
    5290:	00f7f713          	and	a4,a5,15
    5294:	00400693          	li	a3,4
    5298:	02d70e63          	beq	a4,a3,52d4 <.L165>

0000529c <.LBB174>:
    529c:	04412703          	lw	a4,68(sp)
    52a0:	00478793          	add	a5,a5,4 # 4004 <.L143+0x14>
    52a4:	04f12023          	sw	a5,64(sp)

000052a8 <.LVL386>:
    52a8:	0047b793          	sltiu	a5,a5,4

000052ac <.LVL387>:
    52ac:	00f707b3          	add	a5,a4,a5
    52b0:	04f12223          	sw	a5,68(sp)

000052b4 <.LVL388>:
    52b4:	00e7b7b3          	sltu	a5,a5,a4

000052b8 <.LVL389>:
    52b8:	04812703          	lw	a4,72(sp)
    52bc:	00f707b3          	add	a5,a4,a5

000052c0 <.LVL390>:
    52c0:	04f12423          	sw	a5,72(sp)

000052c4 <.LVL391>:
    52c4:	00e7b7b3          	sltu	a5,a5,a4

000052c8 <.LVL392>:
    52c8:	04c12703          	lw	a4,76(sp)
    52cc:	00e787b3          	add	a5,a5,a4

000052d0 <.LVL393>:
    52d0:	04f12623          	sw	a5,76(sp)

000052d4 <.L165>:
    52d4:	04c12703          	lw	a4,76(sp)
    52d8:	00c71793          	sll	a5,a4,0xc
    52dc:	0407d263          	bgez	a5,5320 <.L170>

000052e0 <.LVL395>:
    52e0:	04012623          	sw	zero,76(sp)
    52e4:	04012423          	sw	zero,72(sp)
    52e8:	04012223          	sw	zero,68(sp)
    52ec:	04012023          	sw	zero,64(sp)
    52f0:	00100793          	li	a5,1

000052f4 <.LVL396>:
    52f4:	e09ff06f          	j	50fc <.L153>

000052f8 <.L161>:
    52f8:	00082883          	lw	a7,0(a6)
    52fc:	00482e83          	lw	t4,4(a6)
    5300:	00a80f33          	add	t5,a6,a0
    5304:	00d8d8b3          	srl	a7,a7,a3
    5308:	006e9eb3          	sll	t4,t4,t1
    530c:	01d8e8b3          	or	a7,a7,t4
    5310:	011f2023          	sw	a7,0(t5)

00005314 <.LVL398>:
    5314:	001e0e13          	add	t3,t3,1

00005318 <.LVL399>:
    5318:	00480813          	add	a6,a6,4
    531c:	efdff06f          	j	5218 <.L160>

00005320 <.L170>:
    5320:	00c60593          	add	a1,a2,12

00005324 <.L171>:
    5324:	00062783          	lw	a5,0(a2)
    5328:	00462683          	lw	a3,4(a2)
    532c:	00460613          	add	a2,a2,4
    5330:	0037d793          	srl	a5,a5,0x3
    5334:	01d69693          	sll	a3,a3,0x1d
    5338:	00d7e7b3          	or	a5,a5,a3
    533c:	fef62e23          	sw	a5,-4(a2)
    5340:	fec592e3          	bne	a1,a2,5324 <.L171>

00005344 <.LVL402>:
    5344:	00375713          	srl	a4,a4,0x3
    5348:	04e12623          	sw	a4,76(sp)

0000534c <.L172>:
    534c:	00000793          	li	a5,0
    5350:	dadff06f          	j	50fc <.L153>

00005354 <.L154>:
    5354:	04412703          	lw	a4,68(sp)
    5358:	04012783          	lw	a5,64(sp)
    535c:	00e7e7b3          	or	a5,a5,a4
    5360:	04812703          	lw	a4,72(sp)
    5364:	00e7e7b3          	or	a5,a5,a4
    5368:	04c12703          	lw	a4,76(sp)
    536c:	00e7e7b3          	or	a5,a5,a4
    5370:	fc078ee3          	beqz	a5,534c <.L172>

00005374 <.L211>:
    5374:	04012623          	sw	zero,76(sp)
    5378:	04012423          	sw	zero,72(sp)
    537c:	04012223          	sw	zero,68(sp)

00005380 <.LBB178>:
    5380:	04012023          	sw	zero,64(sp)
    5384:	fc9ff06f          	j	534c <.L172>

00005388 <.L142>:
    5388:	000087b7          	lui	a5,0x8
    538c:	04012623          	sw	zero,76(sp)
    5390:	04012423          	sw	zero,72(sp)
    5394:	04012223          	sw	zero,68(sp)
    5398:	04012023          	sw	zero,64(sp)
    539c:	fff78793          	add	a5,a5,-1 # 7fff <.LLST128+0x4b>
    53a0:	d5dff06f          	j	50fc <.L153>

000053a4 <__subtf3>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__subtf3 (TFtype a, TFtype b)
{
    53a4:	f9010113          	add	sp,sp,-112
    53a8:	0085a703          	lw	a4,8(a1)
    53ac:	05512a23          	sw	s5,84(sp)
    53b0:	00c5aa83          	lw	s5,12(a1)
    53b4:	0005a783          	lw	a5,0(a1)
    53b8:	0045a683          	lw	a3,4(a1)

000053bc <.LBB3>:
  FP_DECL_Q (B);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_Q (A, a);
    53bc:	02e12c23          	sw	a4,56(sp)
    53c0:	00e12c23          	sw	a4,24(sp)
    53c4:	010a9713          	sll	a4,s5,0x10

000053c8 <.LBE3>:
{
    53c8:	06912223          	sw	s1,100(sp)

000053cc <.LBB4>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    53cc:	01075713          	srl	a4,a4,0x10
    53d0:	001a9493          	sll	s1,s5,0x1

000053d4 <.LBE4>:
{
    53d4:	00462803          	lw	a6,4(a2)
    53d8:	00862583          	lw	a1,8(a2)
    53dc:	06812423          	sw	s0,104(sp)
    53e0:	07212023          	sw	s2,96(sp)
    53e4:	00062403          	lw	s0,0(a2)
    53e8:	00c62903          	lw	s2,12(a2)
    53ec:	05412c23          	sw	s4,88(sp)

000053f0 <.LBB5>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    53f0:	03512e23          	sw	s5,60(sp)

000053f4 <.LBE5>:
{
    53f4:	00050a13          	mv	s4,a0
    53f8:	06112623          	sw	ra,108(sp)
    53fc:	05312e23          	sw	s3,92(sp)
    5400:	05612823          	sw	s6,80(sp)
    5404:	05712623          	sw	s7,76(sp)
    5408:	05812423          	sw	s8,72(sp)

0000540c <.LBB6>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    540c:	02f12823          	sw	a5,48(sp)
    5410:	02d12a23          	sw	a3,52(sp)
    5414:	00f12823          	sw	a5,16(sp)
    5418:	00d12a23          	sw	a3,20(sp)
    541c:	00e12e23          	sw	a4,28(sp)
    5420:	0114d493          	srl	s1,s1,0x11

00005424 <.LVL1>:
    5424:	01fada93          	srl	s5,s5,0x1f

00005428 <.LBB7>:
    5428:	01010513          	add	a0,sp,16
    542c:	01c10613          	add	a2,sp,28

00005430 <.L2>:
    5430:	00062703          	lw	a4,0(a2)
    5434:	ffc62683          	lw	a3,-4(a2)
    5438:	ffc60613          	add	a2,a2,-4
    543c:	00371713          	sll	a4,a4,0x3
    5440:	01d6d693          	srl	a3,a3,0x1d
    5444:	00d76733          	or	a4,a4,a3
    5448:	00e62223          	sw	a4,4(a2)
    544c:	fec512e3          	bne	a0,a2,5430 <.L2>

00005450 <.LBB8>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    5450:	01091713          	sll	a4,s2,0x10
    5454:	00191b93          	sll	s7,s2,0x1

00005458 <.LBB9>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    5458:	00379793          	sll	a5,a5,0x3

0000545c <.LBB10>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    545c:	01075713          	srl	a4,a4,0x10
    5460:	03012a23          	sw	a6,52(sp)
    5464:	03212e23          	sw	s2,60(sp)
    5468:	03012223          	sw	a6,36(sp)

0000546c <.LBB11>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    546c:	00f12823          	sw	a5,16(sp)

00005470 <.LBB12>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    5470:	02812823          	sw	s0,48(sp)
    5474:	02b12c23          	sw	a1,56(sp)
    5478:	02812023          	sw	s0,32(sp)
    547c:	02b12423          	sw	a1,40(sp)
    5480:	02e12623          	sw	a4,44(sp)
    5484:	011bdb93          	srl	s7,s7,0x11

00005488 <.LVL6>:
    5488:	01f95913          	srl	s2,s2,0x1f

0000548c <.LBB13>:
    548c:	02010813          	add	a6,sp,32
    5490:	02c10313          	add	t1,sp,44

00005494 <.L3>:
    5494:	00032703          	lw	a4,0(t1)
    5498:	ffc32683          	lw	a3,-4(t1)
    549c:	ffc30313          	add	t1,t1,-4
    54a0:	00371713          	sll	a4,a4,0x3
    54a4:	01d6d693          	srl	a3,a3,0x1d
    54a8:	00d76733          	or	a4,a4,a3
    54ac:	00e32223          	sw	a4,4(t1)
    54b0:	fe6812e3          	bne	a6,t1,5494 <.L3>

000054b4 <.LVL9>:
    54b4:	00341413          	sll	s0,s0,0x3

000054b8 <.LBE13>:
  FP_SUB_Q (R, A, B);
    54b8:	00008737          	lui	a4,0x8

000054bc <.LBB14>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    54bc:	02812023          	sw	s0,32(sp)

000054c0 <.LBE14>:
  FP_SUB_Q (R, A, B);
    54c0:	fff70713          	add	a4,a4,-1 # 7fff <.LLST128+0x4b>
    54c4:	02eb9063          	bne	s7,a4,54e4 <.L4>
    54c8:	02812683          	lw	a3,40(sp)
    54cc:	02412703          	lw	a4,36(sp)
    54d0:	00d76733          	or	a4,a4,a3
    54d4:	02c12683          	lw	a3,44(sp)
    54d8:	00d76733          	or	a4,a4,a3
    54dc:	00876733          	or	a4,a4,s0
    54e0:	00071463          	bnez	a4,54e8 <.L5>

000054e4 <.L4>:
    54e4:	00194913          	xor	s2,s2,1

000054e8 <.L5>:
    54e8:	417488b3          	sub	a7,s1,s7

000054ec <.LBE15>:
    54ec:	095916e3          	bne	s2,s5,5d78 <.L6>

000054f0 <.LBB48>:
    54f0:	45105263          	blez	a7,5934 <.L7>

000054f4 <.LVL12>:
    54f4:	01412903          	lw	s2,20(sp)

000054f8 <.LVL13>:
    54f8:	01812983          	lw	s3,24(sp)
    54fc:	01c12b03          	lw	s6,28(sp)
    5500:	0a0b9263          	bnez	s7,55a4 <.L8>
    5504:	02412683          	lw	a3,36(sp)
    5508:	02812703          	lw	a4,40(sp)
    550c:	02c12583          	lw	a1,44(sp)
    5510:	00e6e633          	or	a2,a3,a4
    5514:	00b66633          	or	a2,a2,a1
    5518:	00866633          	or	a2,a2,s0
    551c:	00061e63          	bnez	a2,5538 <.L9>

00005520 <.L363>:
    5520:	02f12823          	sw	a5,48(sp)
    5524:	03212a23          	sw	s2,52(sp)
    5528:	03312c23          	sw	s3,56(sp)
    552c:	03612e23          	sw	s6,60(sp)

00005530 <.LBB91>:
    5530:	00088493          	mv	s1,a7

00005534 <.LVL16>:
    5534:	08c0006f          	j	55c0 <.L10>

00005538 <.L9>:
    5538:	fff88613          	add	a2,a7,-1

0000553c <.LVL18>:
    553c:	04061863          	bnez	a2,558c <.L11>

00005540 <.LBB16>:
    5540:	00878433          	add	s0,a5,s0
    5544:	01268933          	add	s2,a3,s2
    5548:	02812823          	sw	s0,48(sp)

0000554c <.LVL19>:
    554c:	00f43433          	sltu	s0,s0,a5

00005550 <.LVL20>:
    5550:	00890433          	add	s0,s2,s0

00005554 <.LVL21>:
    5554:	02812a23          	sw	s0,52(sp)

00005558 <.LVL22>:
    5558:	00d936b3          	sltu	a3,s2,a3

0000555c <.LVL23>:
    555c:	01243433          	sltu	s0,s0,s2

00005560 <.LVL24>:
    5560:	013709b3          	add	s3,a4,s3

00005564 <.LVL25>:
    5564:	0086e6b3          	or	a3,a3,s0

00005568 <.LVL26>:
    5568:	00d986b3          	add	a3,s3,a3
    556c:	02d12c23          	sw	a3,56(sp)

00005570 <.LVL27>:
    5570:	00e9b7b3          	sltu	a5,s3,a4

00005574 <.LVL28>:
    5574:	0136b6b3          	sltu	a3,a3,s3

00005578 <.LVL29>:
    5578:	00d7e7b3          	or	a5,a5,a3

0000557c <.LVL30>:
    557c:	016585b3          	add	a1,a1,s6
    5580:	00b787b3          	add	a5,a5,a1

00005584 <.L355>:
    5584:	00100493          	li	s1,1

00005588 <.LVL32>:
    5588:	2fc0006f          	j	5884 <.L22>

0000558c <.L11>:
    558c:	00008737          	lui	a4,0x8
    5590:	fff70713          	add	a4,a4,-1 # 7fff <.LLST128+0x4b>
    5594:	00e88463          	beq	a7,a4,559c <.L23>
    5598:	2540106f          	j	67ec <.L343>

0000559c <.L23>:
    559c:	02f12823          	sw	a5,48(sp)
    55a0:	4400006f          	j	59e0 <.L364>

000055a4 <.L8>:
    55a4:	00008737          	lui	a4,0x8
    55a8:	fff70713          	add	a4,a4,-1 # 7fff <.LLST128+0x4b>
    55ac:	16e49a63          	bne	s1,a4,5720 <.L25>

000055b0 <.LVL36>:
    55b0:	02f12823          	sw	a5,48(sp)
    55b4:	03212a23          	sw	s2,52(sp)
    55b8:	03312c23          	sw	s3,56(sp)
    55bc:	03612e23          	sw	s6,60(sp)

000055c0 <.L10>:
  FP_PACK_SEMIRAW_Q (r, R);
    55c0:	03012783          	lw	a5,48(sp)
    55c4:	0077f713          	and	a4,a5,7
    55c8:	04070463          	beqz	a4,5610 <.L257>
    55cc:	00f7f713          	and	a4,a5,15
    55d0:	00400693          	li	a3,4
    55d4:	02d70e63          	beq	a4,a3,5610 <.L257>

000055d8 <.LBB92>:
    55d8:	03412703          	lw	a4,52(sp)
    55dc:	00478793          	add	a5,a5,4
    55e0:	02f12823          	sw	a5,48(sp)

000055e4 <.LVL38>:
    55e4:	0047b793          	sltiu	a5,a5,4

000055e8 <.LVL39>:
    55e8:	00f707b3          	add	a5,a4,a5
    55ec:	02f12a23          	sw	a5,52(sp)

000055f0 <.LVL40>:
    55f0:	00e7b7b3          	sltu	a5,a5,a4

000055f4 <.LVL41>:
    55f4:	03812703          	lw	a4,56(sp)
    55f8:	00f707b3          	add	a5,a4,a5

000055fc <.LVL42>:
    55fc:	02f12c23          	sw	a5,56(sp)

00005600 <.LVL43>:
    5600:	00e7b7b3          	sltu	a5,a5,a4

00005604 <.LVL44>:
    5604:	03c12703          	lw	a4,60(sp)
    5608:	00e787b3          	add	a5,a5,a4

0000560c <.LVL45>:
    560c:	02f12e23          	sw	a5,60(sp)

00005610 <.L257>:
    5610:	03c12783          	lw	a5,60(sp)
    5614:	00c79713          	sll	a4,a5,0xc
    5618:	02075463          	bgez	a4,5640 <.L262>
    561c:	00008737          	lui	a4,0x8
    5620:	00148493          	add	s1,s1,1

00005624 <.LVL47>:
    5624:	fff70713          	add	a4,a4,-1 # 7fff <.LLST128+0x4b>
    5628:	00e49463          	bne	s1,a4,5630 <.LVL47+0xc>
    562c:	1ac0106f          	j	67d8 <.L263>
    5630:	fff80737          	lui	a4,0xfff80
    5634:	fff70713          	add	a4,a4,-1 # fff7ffff <_ebss+0xfff7519f>
    5638:	00e7f7b3          	and	a5,a5,a4
    563c:	02f12e23          	sw	a5,60(sp)

00005640 <.L262>:
    5640:	03010793          	add	a5,sp,48
    5644:	03c10613          	add	a2,sp,60

00005648 <.L265>:
    5648:	0007a703          	lw	a4,0(a5)
    564c:	0047a683          	lw	a3,4(a5)
    5650:	00478793          	add	a5,a5,4
    5654:	00375713          	srl	a4,a4,0x3
    5658:	01d69693          	sll	a3,a3,0x1d
    565c:	00d76733          	or	a4,a4,a3
    5660:	fee7ae23          	sw	a4,-4(a5)
    5664:	fec792e3          	bne	a5,a2,5648 <.L265>

00005668 <.LVL50>:
    5668:	03c12703          	lw	a4,60(sp)

0000566c <.LBE93>:
    566c:	000086b7          	lui	a3,0x8
    5670:	fff68793          	add	a5,a3,-1 # 7fff <.LLST128+0x4b>

00005674 <.LBB94>:
    5674:	00375713          	srl	a4,a4,0x3
    5678:	02e12e23          	sw	a4,60(sp)

0000567c <.LBE94>:
    567c:	02f49a63          	bne	s1,a5,56b0 <.L266>
    5680:	03412603          	lw	a2,52(sp)
    5684:	03012783          	lw	a5,48(sp)
    5688:	00c7e7b3          	or	a5,a5,a2
    568c:	03812603          	lw	a2,56(sp)
    5690:	00c7e7b3          	or	a5,a5,a2
    5694:	00e7e7b3          	or	a5,a5,a4
    5698:	00078c63          	beqz	a5,56b0 <.L266>
    569c:	02d12e23          	sw	a3,60(sp)
    56a0:	02012c23          	sw	zero,56(sp)
    56a4:	02012a23          	sw	zero,52(sp)
    56a8:	02012823          	sw	zero,48(sp)

000056ac <.LVL51>:
    56ac:	00000a93          	li	s5,0

000056b0 <.L266>:
    56b0:	03c12783          	lw	a5,60(sp)
    56b4:	01149493          	sll	s1,s1,0x11

000056b8 <.LVL53>:
    56b8:	0114d493          	srl	s1,s1,0x11
    56bc:	00f11623          	sh	a5,12(sp)

000056c0 <.LBE101>:
  FP_HANDLE_EXCEPTIONS;

  return r;
    56c0:	03012783          	lw	a5,48(sp)

000056c4 <.LBB102>:
  FP_PACK_SEMIRAW_Q (r, R);
    56c4:	00fa9a93          	sll	s5,s5,0xf

000056c8 <.LVL54>:
    56c8:	009aeab3          	or	s5,s5,s1

000056cc <.LBE102>:
  return r;
    56cc:	00fa2023          	sw	a5,0(s4)
    56d0:	03412783          	lw	a5,52(sp)

000056d4 <.LBB103>:
  FP_PACK_SEMIRAW_Q (r, R);
    56d4:	01511723          	sh	s5,14(sp)

000056d8 <.LBE103>:
}
    56d8:	06c12083          	lw	ra,108(sp)
  return r;
    56dc:	00fa2223          	sw	a5,4(s4)
    56e0:	03812783          	lw	a5,56(sp)

000056e4 <.LVL56>:
}
    56e4:	06812403          	lw	s0,104(sp)
    56e8:	06412483          	lw	s1,100(sp)
  return r;
    56ec:	00fa2423          	sw	a5,8(s4)
    56f0:	00c12783          	lw	a5,12(sp)
}
    56f4:	06012903          	lw	s2,96(sp)
    56f8:	05c12983          	lw	s3,92(sp)
  return r;
    56fc:	00fa2623          	sw	a5,12(s4)
}
    5700:	05412a83          	lw	s5,84(sp)
    5704:	05012b03          	lw	s6,80(sp)
    5708:	04c12b83          	lw	s7,76(sp)

0000570c <.LVL57>:
    570c:	04812c03          	lw	s8,72(sp)
    5710:	000a0513          	mv	a0,s4
    5714:	05812a03          	lw	s4,88(sp)
    5718:	07010113          	add	sp,sp,112

0000571c <.LVL59>:
    571c:	00008067          	ret

00005720 <.L25>:
  FP_SUB_Q (R, A, B);
    5720:	02c12703          	lw	a4,44(sp)
    5724:	000806b7          	lui	a3,0x80
    5728:	00d76733          	or	a4,a4,a3
    572c:	02e12623          	sw	a4,44(sp)

00005730 <.LDL1>:
    5730:	07400713          	li	a4,116
    5734:	01175463          	bge	a4,a7,573c <.LDL1+0xc>
    5738:	0c00106f          	j	67f8 <.L26>
    573c:	00088613          	mv	a2,a7

00005740 <.L267>:
    5740:	40565693          	sra	a3,a2,0x5

00005744 <.LVL62>:
    5744:	00030513          	mv	a0,t1
    5748:	01f67613          	and	a2,a2,31

0000574c <.LVL63>:
    574c:	00000713          	li	a4,0
    5750:	00000593          	li	a1,0

00005754 <.L27>:
    5754:	02d59c63          	bne	a1,a3,578c <.L28>
    5758:	00300593          	li	a1,3

0000575c <.LVL65>:
    575c:	40d585b3          	sub	a1,a1,a3
    5760:	00269513          	sll	a0,a3,0x2
    5764:	02061e63          	bnez	a2,57a0 <.L29>

00005768 <.L30>:
    5768:	00a308b3          	add	a7,t1,a0
    576c:	0008a883          	lw	a7,0(a7)
    5770:	00160613          	add	a2,a2,1

00005774 <.LVL67>:
    5774:	00430313          	add	t1,t1,4
    5778:	ff132e23          	sw	a7,-4(t1)

0000577c <.LVL68>:
    577c:	fec5d6e3          	bge	a1,a2,5768 <.L30>
    5780:	00400613          	li	a2,4

00005784 <.LVL69>:
    5784:	40d606b3          	sub	a3,a2,a3

00005788 <.LVL70>:
    5788:	0640006f          	j	57ec <.L34>

0000578c <.L28>:
    578c:	00052883          	lw	a7,0(a0)
    5790:	00158593          	add	a1,a1,1

00005794 <.LVL72>:
    5794:	00450513          	add	a0,a0,4
    5798:	01176733          	or	a4,a4,a7

0000579c <.LVL73>:
    579c:	fb9ff06f          	j	5754 <.L27>

000057a0 <.L29>:
    57a0:	04050893          	add	a7,a0,64
    57a4:	002888b3          	add	a7,a7,sp
    57a8:	fe08a883          	lw	a7,-32(a7)
    57ac:	02000e13          	li	t3,32
    57b0:	40ce0e33          	sub	t3,t3,a2
    57b4:	01c898b3          	sll	a7,a7,t3
    57b8:	01176733          	or	a4,a4,a7

000057bc <.LVL75>:
    57bc:	00000e93          	li	t4,0
    57c0:	00a808b3          	add	a7,a6,a0
    57c4:	40a00533          	neg	a0,a0

000057c8 <.L32>:
    57c8:	14bec263          	blt	t4,a1,590c <.L33>
    57cc:	00400513          	li	a0,4
    57d0:	40d506b3          	sub	a3,a0,a3

000057d4 <.LVL77>:
    57d4:	02c12503          	lw	a0,44(sp)
    57d8:	00259593          	sll	a1,a1,0x2

000057dc <.LVL78>:
    57dc:	04058593          	add	a1,a1,64
    57e0:	002585b3          	add	a1,a1,sp
    57e4:	00c55633          	srl	a2,a0,a2

000057e8 <.LVL79>:
    57e8:	fec5a023          	sw	a2,-32(a1)

000057ec <.L34>:
    57ec:	00400613          	li	a2,4
    57f0:	40d60633          	sub	a2,a2,a3
    57f4:	00261613          	sll	a2,a2,0x2
    57f8:	00269693          	sll	a3,a3,0x2
    57fc:	00800593          	li	a1,8
    5800:	00d806b3          	add	a3,a6,a3
    5804:	00b66a63          	bltu	a2,a1,5818 <.L35>
    5808:	0006a023          	sw	zero,0(a3) # 80000 <_ebss+0x751a0>
    580c:	0006a223          	sw	zero,4(a3)
    5810:	ff860613          	add	a2,a2,-8
    5814:	00868693          	add	a3,a3,8

00005818 <.L35>:
    5818:	00400593          	li	a1,4
    581c:	00b66463          	bltu	a2,a1,5824 <.L36>
    5820:	0006a023          	sw	zero,0(a3)

00005824 <.L36>:
    5824:	02012683          	lw	a3,32(sp)

00005828 <.LBB19>:
    5828:	00e03733          	snez	a4,a4

0000582c <.LBE19>:
    582c:	00d76733          	or	a4,a4,a3

00005830 <.L37>:
    5830:	02412683          	lw	a3,36(sp)

00005834 <.LBB21>:
    5834:	02e12023          	sw	a4,32(sp)

00005838 <.LBB22>:
    5838:	00e78733          	add	a4,a5,a4
    583c:	01268933          	add	s2,a3,s2
    5840:	02e12823          	sw	a4,48(sp)

00005844 <.LVL84>:
    5844:	00f73733          	sltu	a4,a4,a5

00005848 <.LVL85>:
    5848:	02812783          	lw	a5,40(sp)
    584c:	00e90733          	add	a4,s2,a4

00005850 <.LVL86>:
    5850:	02e12a23          	sw	a4,52(sp)

00005854 <.LVL87>:
    5854:	00d936b3          	sltu	a3,s2,a3

00005858 <.LVL88>:
    5858:	01273733          	sltu	a4,a4,s2

0000585c <.LVL89>:
    585c:	013789b3          	add	s3,a5,s3

00005860 <.LVL90>:
    5860:	00e6e733          	or	a4,a3,a4

00005864 <.LVL91>:
    5864:	00e98733          	add	a4,s3,a4
    5868:	02e12c23          	sw	a4,56(sp)

0000586c <.LVL92>:
    586c:	00f9b7b3          	sltu	a5,s3,a5

00005870 <.LVL93>:
    5870:	01373733          	sltu	a4,a4,s3

00005874 <.LVL94>:
    5874:	00e7e7b3          	or	a5,a5,a4

00005878 <.LVL95>:
    5878:	02c12703          	lw	a4,44(sp)

0000587c <.LVL96>:
    587c:	00eb0733          	add	a4,s6,a4
    5880:	00e787b3          	add	a5,a5,a4

00005884 <.L22>:
    5884:	02f12e23          	sw	a5,60(sp)

00005888 <.LBE23>:
    5888:	00c79713          	sll	a4,a5,0xc
    588c:	d2075ae3          	bgez	a4,55c0 <.L10>

00005890 <.LBB24>:
    5890:	03012683          	lw	a3,48(sp)

00005894 <.LBE24>:
    5894:	fff80737          	lui	a4,0xfff80
    5898:	fff70713          	add	a4,a4,-1 # fff7ffff <_ebss+0xfff7519f>
    589c:	00e7f7b3          	and	a5,a5,a4
    58a0:	02f12e23          	sw	a5,60(sp)
    58a4:	00148493          	add	s1,s1,1

000058a8 <.LBB26>:
    58a8:	01f69693          	sll	a3,a3,0x1f

000058ac <.LVL100>:
    58ac:	03010713          	add	a4,sp,48
    58b0:	03c10513          	add	a0,sp,60

000058b4 <.L115>:
    58b4:	00072603          	lw	a2,0(a4)
    58b8:	00472583          	lw	a1,4(a4)
    58bc:	00470713          	add	a4,a4,4
    58c0:	00165613          	srl	a2,a2,0x1
    58c4:	01f59593          	sll	a1,a1,0x1f
    58c8:	00b66633          	or	a2,a2,a1
    58cc:	fec72e23          	sw	a2,-4(a4)
    58d0:	fee512e3          	bne	a0,a4,58b4 <.L115>

000058d4 <.LBE26>:
    58d4:	03012703          	lw	a4,48(sp)

000058d8 <.LBB27>:
    58d8:	0017d793          	srl	a5,a5,0x1
    58dc:	02f12e23          	sw	a5,60(sp)

000058e0 <.LBB28>:
    58e0:	00d037b3          	snez	a5,a3

000058e4 <.LBE28>:
    58e4:	00f767b3          	or	a5,a4,a5
    58e8:	02f12823          	sw	a5,48(sp)

000058ec <.LBE29>:
    58ec:	000087b7          	lui	a5,0x8
    58f0:	fff78793          	add	a5,a5,-1 # 7fff <.LLST128+0x4b>
    58f4:	ccf496e3          	bne	s1,a5,55c0 <.L10>

000058f8 <.LVL104>:
    58f8:	02012e23          	sw	zero,60(sp)
    58fc:	02012c23          	sw	zero,56(sp)
    5900:	02012a23          	sw	zero,52(sp)
    5904:	02012823          	sw	zero,48(sp)

00005908 <.LBB105>:
  FP_PACK_SEMIRAW_Q (r, R);
    5908:	cb9ff06f          	j	55c0 <.L10>

0000590c <.L33>:
  FP_SUB_Q (R, A, B);
    590c:	0008a303          	lw	t1,0(a7)
    5910:	0048af03          	lw	t5,4(a7)
    5914:	00a88fb3          	add	t6,a7,a0
    5918:	00c35333          	srl	t1,t1,a2
    591c:	01cf1f33          	sll	t5,t5,t3
    5920:	01e36333          	or	t1,t1,t5
    5924:	006fa023          	sw	t1,0(t6)

00005928 <.LVL107>:
    5928:	001e8e93          	add	t4,t4,1

0000592c <.LVL108>:
    592c:	00488893          	add	a7,a7,4
    5930:	e99ff06f          	j	57c8 <.L32>

00005934 <.L7>:
    5934:	02412903          	lw	s2,36(sp)

00005938 <.LVL110>:
    5938:	02812983          	lw	s3,40(sp)
    593c:	02c12b03          	lw	s6,44(sp)

00005940 <.LBB108>:
    5940:	26088263          	beqz	a7,5ba4 <.L48>
    5944:	409b8833          	sub	a6,s7,s1

00005948 <.LVL111>:
    5948:	0a049c63          	bnez	s1,5a00 <.L49>
    594c:	01412683          	lw	a3,20(sp)
    5950:	01812703          	lw	a4,24(sp)
    5954:	01c12883          	lw	a7,28(sp)
    5958:	00e6e5b3          	or	a1,a3,a4
    595c:	0115e5b3          	or	a1,a1,a7
    5960:	00f5e5b3          	or	a1,a1,a5
    5964:	00059e63          	bnez	a1,5980 <.L50>

00005968 <.LVL112>:
    5968:	02812823          	sw	s0,48(sp)
    596c:	03212a23          	sw	s2,52(sp)
    5970:	03312c23          	sw	s3,56(sp)
    5974:	03612e23          	sw	s6,60(sp)

00005978 <.L360>:
    5978:	00080493          	mv	s1,a6

0000597c <.LVL114>:
    597c:	c45ff06f          	j	55c0 <.L10>

00005980 <.L50>:
    5980:	fff80593          	add	a1,a6,-1

00005984 <.LVL116>:
    5984:	04059663          	bnez	a1,59d0 <.L51>

00005988 <.LBB31>:
    5988:	00878433          	add	s0,a5,s0
    598c:	01268933          	add	s2,a3,s2
    5990:	02812823          	sw	s0,48(sp)

00005994 <.LVL117>:
    5994:	00f43433          	sltu	s0,s0,a5

00005998 <.LVL118>:
    5998:	00890433          	add	s0,s2,s0

0000599c <.LVL119>:
    599c:	02812a23          	sw	s0,52(sp)

000059a0 <.LVL120>:
    59a0:	00d936b3          	sltu	a3,s2,a3

000059a4 <.LVL121>:
    59a4:	01243433          	sltu	s0,s0,s2

000059a8 <.LVL122>:
    59a8:	013709b3          	add	s3,a4,s3

000059ac <.LVL123>:
    59ac:	0086e6b3          	or	a3,a3,s0

000059b0 <.LVL124>:
    59b0:	00d986b3          	add	a3,s3,a3
    59b4:	02d12c23          	sw	a3,56(sp)

000059b8 <.LVL125>:
    59b8:	00e9b7b3          	sltu	a5,s3,a4

000059bc <.LVL126>:
    59bc:	0136b6b3          	sltu	a3,a3,s3

000059c0 <.LVL127>:
    59c0:	00d7e7b3          	or	a5,a5,a3

000059c4 <.LVL128>:
    59c4:	016888b3          	add	a7,a7,s6
    59c8:	011787b3          	add	a5,a5,a7
    59cc:	bb9ff06f          	j	5584 <.L355>

000059d0 <.L51>:
    59d0:	000087b7          	lui	a5,0x8
    59d4:	fff78793          	add	a5,a5,-1 # 7fff <.LLST128+0x4b>
    59d8:	62f81ae3          	bne	a6,a5,680c <.L62>

000059dc <.L63>:
    59dc:	02812823          	sw	s0,48(sp)

000059e0 <.L364>:
    59e0:	03212a23          	sw	s2,52(sp)
    59e4:	03312c23          	sw	s3,56(sp)
    59e8:	03612e23          	sw	s6,60(sp)

000059ec <.L359>:
    59ec:	000084b7          	lui	s1,0x8

000059f0 <.LVL132>:
    59f0:	fff48493          	add	s1,s1,-1 # 7fff <.LLST128+0x4b>
    59f4:	bcdff06f          	j	55c0 <.L10>

000059f8 <.L274>:
    59f8:	00078413          	mv	s0,a5
    59fc:	fe1ff06f          	j	59dc <.L63>

00005a00 <.L49>:
    5a00:	000087b7          	lui	a5,0x8
    5a04:	fff78793          	add	a5,a5,-1 # 7fff <.LLST128+0x4b>
    5a08:	fcfb8ae3          	beq	s7,a5,59dc <.L63>
    5a0c:	01c12783          	lw	a5,28(sp)
    5a10:	00080737          	lui	a4,0x80
    5a14:	00e7e7b3          	or	a5,a5,a4
    5a18:	00f12e23          	sw	a5,28(sp)

00005a1c <.LDL2>:
    5a1c:	07400793          	li	a5,116
    5a20:	5f07cae3          	blt	a5,a6,6814 <.L64>
    5a24:	00080593          	mv	a1,a6

00005a28 <.L268>:
    5a28:	02000713          	li	a4,32
    5a2c:	02e5c733          	div	a4,a1,a4

00005a30 <.LVL136>:
    5a30:	00060693          	mv	a3,a2
    5a34:	00000493          	li	s1,0

00005a38 <.LVL137>:
    5a38:	00000793          	li	a5,0

00005a3c <.L65>:
    5a3c:	02e7ce63          	blt	a5,a4,5a78 <.L66>
    5a40:	00300793          	li	a5,3

00005a44 <.LVL139>:
    5a44:	01f5f893          	and	a7,a1,31
    5a48:	40e787b3          	sub	a5,a5,a4
    5a4c:	00271813          	sll	a6,a4,0x2
    5a50:	02089e63          	bnez	a7,5a8c <.L67>

00005a54 <.L68>:
    5a54:	010606b3          	add	a3,a2,a6
    5a58:	0006a683          	lw	a3,0(a3)
    5a5c:	00188893          	add	a7,a7,1

00005a60 <.LVL141>:
    5a60:	00460613          	add	a2,a2,4
    5a64:	fed62e23          	sw	a3,-4(a2)

00005a68 <.LVL142>:
    5a68:	ff17d6e3          	bge	a5,a7,5a54 <.L68>
    5a6c:	00400793          	li	a5,4
    5a70:	40e78733          	sub	a4,a5,a4

00005a74 <.LVL143>:
    5a74:	0780006f          	j	5aec <.L73>

00005a78 <.L66>:
    5a78:	0006a803          	lw	a6,0(a3)
    5a7c:	00178793          	add	a5,a5,1

00005a80 <.LVL145>:
    5a80:	00468693          	add	a3,a3,4
    5a84:	0104e4b3          	or	s1,s1,a6

00005a88 <.LVL146>:
    5a88:	fb5ff06f          	j	5a3c <.L65>

00005a8c <.L67>:
    5a8c:	02000693          	li	a3,32
    5a90:	02d5e5b3          	rem	a1,a1,a3

00005a94 <.LVL148>:
    5a94:	40b685b3          	sub	a1,a3,a1
    5a98:	00070693          	mv	a3,a4
    5a9c:	00075463          	bgez	a4,5aa4 <.L70>

00005aa0 <.LVL149>:
    5aa0:	00000693          	li	a3,0

00005aa4 <.L70>:
    5aa4:	00269693          	sll	a3,a3,0x2
    5aa8:	04068693          	add	a3,a3,64
    5aac:	002686b3          	add	a3,a3,sp
    5ab0:	fd06a683          	lw	a3,-48(a3)
    5ab4:	00000313          	li	t1,0
    5ab8:	00b696b3          	sll	a3,a3,a1
    5abc:	00d4e4b3          	or	s1,s1,a3

00005ac0 <.LVL151>:
    5ac0:	010506b3          	add	a3,a0,a6
    5ac4:	41000833          	neg	a6,a6

00005ac8 <.L71>:
    5ac8:	0af34a63          	blt	t1,a5,5b7c <.L72>
    5acc:	00400693          	li	a3,4
    5ad0:	40e68733          	sub	a4,a3,a4

00005ad4 <.LVL153>:
    5ad4:	01c12683          	lw	a3,28(sp)
    5ad8:	00279793          	sll	a5,a5,0x2

00005adc <.LVL154>:
    5adc:	04078793          	add	a5,a5,64
    5ae0:	002787b3          	add	a5,a5,sp
    5ae4:	0116d6b3          	srl	a3,a3,a7
    5ae8:	fcd7a823          	sw	a3,-48(a5)

00005aec <.L73>:
    5aec:	00572793          	slti	a5,a4,5
    5af0:	00000613          	li	a2,0
    5af4:	00078863          	beqz	a5,5b04 <.L75>
    5af8:	00400613          	li	a2,4
    5afc:	40e60633          	sub	a2,a2,a4
    5b00:	00261613          	sll	a2,a2,0x2

00005b04 <.L75>:
    5b04:	00271713          	sll	a4,a4,0x2
    5b08:	00e50533          	add	a0,a0,a4
    5b0c:	00000593          	li	a1,0
    5b10:	a51fb0ef          	jal	1560 <__GI_memset>

00005b14 <.LBE33>:
    5b14:	01012703          	lw	a4,16(sp)

00005b18 <.LBB34>:
    5b18:	009037b3          	snez	a5,s1

00005b1c <.LBE34>:
    5b1c:	00e7e7b3          	or	a5,a5,a4

00005b20 <.L76>:
    5b20:	01412683          	lw	a3,20(sp)

00005b24 <.LBB36>:
    5b24:	00f12823          	sw	a5,16(sp)

00005b28 <.LBB37>:
    5b28:	00f407b3          	add	a5,s0,a5
    5b2c:	01268933          	add	s2,a3,s2
    5b30:	02f12823          	sw	a5,48(sp)

00005b34 <.LVL158>:
    5b34:	0087b7b3          	sltu	a5,a5,s0

00005b38 <.LVL159>:
    5b38:	00f90733          	add	a4,s2,a5
    5b3c:	01812783          	lw	a5,24(sp)

00005b40 <.LVL160>:
    5b40:	02e12a23          	sw	a4,52(sp)

00005b44 <.LVL161>:
    5b44:	00d936b3          	sltu	a3,s2,a3

00005b48 <.LVL162>:
    5b48:	01273733          	sltu	a4,a4,s2

00005b4c <.LVL163>:
    5b4c:	013789b3          	add	s3,a5,s3

00005b50 <.LVL164>:
    5b50:	00e6e733          	or	a4,a3,a4

00005b54 <.LVL165>:
    5b54:	00e98733          	add	a4,s3,a4
    5b58:	02e12c23          	sw	a4,56(sp)

00005b5c <.LVL166>:
    5b5c:	00f9b7b3          	sltu	a5,s3,a5

00005b60 <.LVL167>:
    5b60:	01373733          	sltu	a4,a4,s3

00005b64 <.LVL168>:
    5b64:	00e7e7b3          	or	a5,a5,a4

00005b68 <.LVL169>:
    5b68:	01c12703          	lw	a4,28(sp)

00005b6c <.LBE37>:
    5b6c:	000b8493          	mv	s1,s7

00005b70 <.LBB38>:
    5b70:	00eb0733          	add	a4,s6,a4
    5b74:	00e787b3          	add	a5,a5,a4

00005b78 <.LBE38>:
    5b78:	d0dff06f          	j	5884 <.L22>

00005b7c <.L72>:
    5b7c:	0006a603          	lw	a2,0(a3)
    5b80:	0046ae03          	lw	t3,4(a3)
    5b84:	01068eb3          	add	t4,a3,a6
    5b88:	01165633          	srl	a2,a2,a7
    5b8c:	00be1e33          	sll	t3,t3,a1
    5b90:	01c66633          	or	a2,a2,t3
    5b94:	00cea023          	sw	a2,0(t4)

00005b98 <.LVL172>:
    5b98:	00130313          	add	t1,t1,1

00005b9c <.LVL173>:
    5b9c:	00468693          	add	a3,a3,4
    5ba0:	f29ff06f          	j	5ac8 <.L71>

00005ba4 <.L48>:
    5ba4:	00148813          	add	a6,s1,1
    5ba8:	01181893          	sll	a7,a6,0x11
    5bac:	0128d893          	srl	a7,a7,0x12
    5bb0:	01412683          	lw	a3,20(sp)
    5bb4:	01812703          	lw	a4,24(sp)
    5bb8:	01c12603          	lw	a2,28(sp)
    5bbc:	03010593          	add	a1,sp,48
    5bc0:	03c10513          	add	a0,sp,60
    5bc4:	10089e63          	bnez	a7,5ce0 <.L87>
    5bc8:	00e6e833          	or	a6,a3,a4
    5bcc:	00c86833          	or	a6,a6,a2
    5bd0:	00f86833          	or	a6,a6,a5
    5bd4:	0a049863          	bnez	s1,5c84 <.L88>

00005bd8 <.LVL175>:
    5bd8:	00081e63          	bnez	a6,5bf4 <.L89>
    5bdc:	02812823          	sw	s0,48(sp)
    5be0:	03212a23          	sw	s2,52(sp)
    5be4:	03312c23          	sw	s3,56(sp)
    5be8:	03612e23          	sw	s6,60(sp)

00005bec <.L357>:
    5bec:	00000493          	li	s1,0
    5bf0:	9d1ff06f          	j	55c0 <.L10>

00005bf4 <.L89>:
    5bf4:	013965b3          	or	a1,s2,s3
    5bf8:	0165e5b3          	or	a1,a1,s6
    5bfc:	0085e5b3          	or	a1,a1,s0
    5c00:	00059c63          	bnez	a1,5c18 <.L90>
    5c04:	02f12823          	sw	a5,48(sp)
    5c08:	02d12a23          	sw	a3,52(sp)
    5c0c:	02e12c23          	sw	a4,56(sp)
    5c10:	02c12e23          	sw	a2,60(sp)

00005c14 <.LBB123>:
  FP_PACK_SEMIRAW_Q (r, R);
    5c14:	9adff06f          	j	55c0 <.L10>

00005c18 <.L90>:
  FP_SUB_Q (R, A, B);
    5c18:	00878433          	add	s0,a5,s0
    5c1c:	01268933          	add	s2,a3,s2
    5c20:	02812823          	sw	s0,48(sp)

00005c24 <.LVL180>:
    5c24:	00f43433          	sltu	s0,s0,a5

00005c28 <.LVL181>:
    5c28:	00890433          	add	s0,s2,s0

00005c2c <.LVL182>:
    5c2c:	02812a23          	sw	s0,52(sp)

00005c30 <.LVL183>:
    5c30:	00d936b3          	sltu	a3,s2,a3

00005c34 <.LVL184>:
    5c34:	01243433          	sltu	s0,s0,s2

00005c38 <.LVL185>:
    5c38:	013709b3          	add	s3,a4,s3

00005c3c <.LVL186>:
    5c3c:	0086e6b3          	or	a3,a3,s0

00005c40 <.LVL187>:
    5c40:	00d986b3          	add	a3,s3,a3
    5c44:	02d12c23          	sw	a3,56(sp)

00005c48 <.LVL188>:
    5c48:	00e9b733          	sltu	a4,s3,a4

00005c4c <.LVL189>:
    5c4c:	0136b6b3          	sltu	a3,a3,s3

00005c50 <.LVL190>:
    5c50:	00d76733          	or	a4,a4,a3

00005c54 <.LVL191>:
    5c54:	01660633          	add	a2,a2,s6
    5c58:	00c70733          	add	a4,a4,a2

00005c5c <.LBE40>:
    5c5c:	00c71793          	sll	a5,a4,0xc

00005c60 <.LVL192>:
    5c60:	0007c663          	bltz	a5,5c6c <.L101>

00005c64 <.LBB41>:
    5c64:	02e12e23          	sw	a4,60(sp)
    5c68:	959ff06f          	j	55c0 <.L10>

00005c6c <.L101>:
    5c6c:	fff807b7          	lui	a5,0xfff80
    5c70:	fff78793          	add	a5,a5,-1 # fff7ffff <_ebss+0xfff7519f>
    5c74:	00f77733          	and	a4,a4,a5
    5c78:	02e12e23          	sw	a4,60(sp)

00005c7c <.LBB126>:
    5c7c:	00100493          	li	s1,1

00005c80 <.LVL194>:
    5c80:	941ff06f          	j	55c0 <.L10>

00005c84 <.L88>:
    5c84:	1a080463          	beqz	a6,5e2c <.L271>
    5c88:	01396933          	or	s2,s2,s3
    5c8c:	01696933          	or	s2,s2,s6
    5c90:	00896933          	or	s2,s2,s0
    5c94:	1a090063          	beqz	s2,5e34 <.L272>

00005c98 <.LBB129>:
    5c98:	000087b7          	lui	a5,0x8
    5c9c:	02f12e23          	sw	a5,60(sp)
    5ca0:	02012c23          	sw	zero,56(sp)
    5ca4:	02012a23          	sw	zero,52(sp)
    5ca8:	02012823          	sw	zero,48(sp)

00005cac <.LBB42>:
    5cac:	00050793          	mv	a5,a0

00005cb0 <.L102>:
    5cb0:	0007a703          	lw	a4,0(a5) # 8000 <.LLST128+0x4c>
    5cb4:	ffc7a683          	lw	a3,-4(a5)
    5cb8:	ffc78793          	add	a5,a5,-4
    5cbc:	00371713          	sll	a4,a4,0x3
    5cc0:	01d6d693          	srl	a3,a3,0x1d
    5cc4:	00d76733          	or	a4,a4,a3
    5cc8:	00e7a223          	sw	a4,4(a5)
    5ccc:	fef592e3          	bne	a1,a5,5cb0 <.L102>

00005cd0 <.L213>:
    5cd0:	000084b7          	lui	s1,0x8

00005cd4 <.LVL200>:
    5cd4:	fff48493          	add	s1,s1,-1 # 7fff <.LLST128+0x4b>

00005cd8 <.L358>:
    5cd8:	00000a93          	li	s5,0
    5cdc:	8e5ff06f          	j	55c0 <.L10>

00005ce0 <.L87>:
    5ce0:	00878433          	add	s0,a5,s0
    5ce4:	01268933          	add	s2,a3,s2
    5ce8:	02812823          	sw	s0,48(sp)

00005cec <.LVL203>:
    5cec:	00f43433          	sltu	s0,s0,a5

00005cf0 <.LVL204>:
    5cf0:	00890433          	add	s0,s2,s0

00005cf4 <.LVL205>:
    5cf4:	02812a23          	sw	s0,52(sp)

00005cf8 <.LVL206>:
    5cf8:	00d936b3          	sltu	a3,s2,a3

00005cfc <.LVL207>:
    5cfc:	01243433          	sltu	s0,s0,s2

00005d00 <.LVL208>:
    5d00:	013709b3          	add	s3,a4,s3

00005d04 <.LVL209>:
    5d04:	0086e6b3          	or	a3,a3,s0

00005d08 <.LVL210>:
    5d08:	00d986b3          	add	a3,s3,a3
    5d0c:	02d12c23          	sw	a3,56(sp)

00005d10 <.LVL211>:
    5d10:	00e9b733          	sltu	a4,s3,a4

00005d14 <.LVL212>:
    5d14:	0136b6b3          	sltu	a3,a3,s3

00005d18 <.LVL213>:
    5d18:	00d76733          	or	a4,a4,a3

00005d1c <.LVL214>:
    5d1c:	01660633          	add	a2,a2,s6
    5d20:	00c70733          	add	a4,a4,a2
    5d24:	02e12e23          	sw	a4,60(sp)

00005d28 <.LBB44>:
    5d28:	00058793          	mv	a5,a1

00005d2c <.L113>:
    5d2c:	0007a683          	lw	a3,0(a5)
    5d30:	0047a603          	lw	a2,4(a5)
    5d34:	00478793          	add	a5,a5,4
    5d38:	0016d693          	srl	a3,a3,0x1
    5d3c:	01f61613          	sll	a2,a2,0x1f
    5d40:	00c6e6b3          	or	a3,a3,a2
    5d44:	fed7ae23          	sw	a3,-4(a5)
    5d48:	fef512e3          	bne	a0,a5,5d2c <.L113>

00005d4c <.LBE44>:
    5d4c:	000087b7          	lui	a5,0x8
    5d50:	fff78793          	add	a5,a5,-1 # 7fff <.LLST128+0x4b>
    5d54:	00f80863          	beq	a6,a5,5d64 <.L114>

00005d58 <.LBB47>:
    5d58:	00175713          	srl	a4,a4,0x1
    5d5c:	02e12e23          	sw	a4,60(sp)
    5d60:	c19ff06f          	j	5978 <.L360>

00005d64 <.L114>:
    5d64:	02012e23          	sw	zero,60(sp)
    5d68:	02012c23          	sw	zero,56(sp)
    5d6c:	02012a23          	sw	zero,52(sp)
    5d70:	02012823          	sw	zero,48(sp)
    5d74:	c05ff06f          	j	5978 <.L360>

00005d78 <.L6>:
    5d78:	29105c63          	blez	a7,6010 <.L118>

00005d7c <.LBB133>:
    5d7c:	01412903          	lw	s2,20(sp)

00005d80 <.LVL221>:
    5d80:	01812983          	lw	s3,24(sp)
    5d84:	01c12b03          	lw	s6,28(sp)

00005d88 <.LBB134>:
    5d88:	0a0b9e63          	bnez	s7,5e44 <.L119>
    5d8c:	02412e03          	lw	t3,36(sp)
    5d90:	02812503          	lw	a0,40(sp)
    5d94:	02c12683          	lw	a3,44(sp)
    5d98:	00ae6733          	or	a4,t3,a0
    5d9c:	00d76733          	or	a4,a4,a3
    5da0:	00876733          	or	a4,a4,s0
    5da4:	f6070e63          	beqz	a4,5520 <.L363>
    5da8:	fff88e93          	add	t4,a7,-1

00005dac <.LVL222>:
    5dac:	040e9c63          	bnez	t4,5e04 <.L121>

00005db0 <.LBB61>:
    5db0:	40878733          	sub	a4,a5,s0

00005db4 <.LVL224>:
    5db4:	41c90633          	sub	a2,s2,t3

00005db8 <.LVL225>:
    5db8:	00e7b5b3          	sltu	a1,a5,a4
    5dbc:	00c93833          	sltu	a6,s2,a2

00005dc0 <.LVL226>:
    5dc0:	40b60633          	sub	a2,a2,a1

00005dc4 <.LVL227>:
    5dc4:	00000593          	li	a1,0
    5dc8:	00e7f663          	bgeu	a5,a4,5dd4 <.L126>
    5dcc:	412e0e33          	sub	t3,t3,s2
    5dd0:	001e3593          	seqz	a1,t3

00005dd4 <.L126>:
    5dd4:	0105e7b3          	or	a5,a1,a6

00005dd8 <.LVL228>:
    5dd8:	40a985b3          	sub	a1,s3,a0

00005ddc <.LVL229>:
    5ddc:	00b9b833          	sltu	a6,s3,a1

00005de0 <.LVL230>:
    5de0:	40f585b3          	sub	a1,a1,a5

00005de4 <.LVL231>:
    5de4:	00078663          	beqz	a5,5df0 <.L129>
    5de8:	41350533          	sub	a0,a0,s3
    5dec:	00153e93          	seqz	t4,a0

00005df0 <.L129>:
    5df0:	40db07b3          	sub	a5,s6,a3

00005df4 <.LVL233>:
    5df4:	010ee6b3          	or	a3,t4,a6

00005df8 <.LVL234>:
    5df8:	40d787b3          	sub	a5,a5,a3

00005dfc <.L356>:
    5dfc:	00100493          	li	s1,1

00005e00 <.LVL236>:
    5e00:	1bc0006f          	j	5fbc <.L130>

00005e04 <.L121>:
    5e04:	00008737          	lui	a4,0x8
    5e08:	fff70713          	add	a4,a4,-1 # 7fff <.LLST128+0x4b>
    5e0c:	f8e88863          	beq	a7,a4,559c <.L23>
    5e10:	07400713          	li	a4,116
    5e14:	05d75c63          	bge	a4,t4,5e6c <.L269>

00005e18 <.L132>:
    5e18:	02012623          	sw	zero,44(sp)
    5e1c:	02012423          	sw	zero,40(sp)
    5e20:	02012223          	sw	zero,36(sp)
    5e24:	00100713          	li	a4,1
    5e28:	1340006f          	j	5f5c <.L143>

00005e2c <.L271>:
    5e2c:	00040793          	mv	a5,s0
    5e30:	f6cff06f          	j	559c <.L23>

00005e34 <.L272>:
    5e34:	00068913          	mv	s2,a3
    5e38:	00070993          	mv	s3,a4
    5e3c:	00060b13          	mv	s6,a2
    5e40:	f5cff06f          	j	559c <.L23>

00005e44 <.L119>:
    5e44:	00008737          	lui	a4,0x8
    5e48:	fff70713          	add	a4,a4,-1 # 7fff <.LLST128+0x4b>
    5e4c:	bae486e3          	beq	s1,a4,59f8 <.L274>
    5e50:	02c12703          	lw	a4,44(sp)
    5e54:	000806b7          	lui	a3,0x80
    5e58:	00d76733          	or	a4,a4,a3
    5e5c:	02e12623          	sw	a4,44(sp)

00005e60 <.LDL3>:
    5e60:	07400713          	li	a4,116
    5e64:	fb174ae3          	blt	a4,a7,5e18 <.L132>
    5e68:	00088e93          	mv	t4,a7

00005e6c <.L269>:
    5e6c:	405ed693          	sra	a3,t4,0x5

00005e70 <.LVL242>:
    5e70:	00030593          	mv	a1,t1
    5e74:	01fefe93          	and	t4,t4,31

00005e78 <.LVL243>:
    5e78:	00000713          	li	a4,0
    5e7c:	00000613          	li	a2,0

00005e80 <.L133>:
    5e80:	02d61c63          	bne	a2,a3,5eb8 <.L134>
    5e84:	00300613          	li	a2,3

00005e88 <.LVL245>:
    5e88:	40d60633          	sub	a2,a2,a3
    5e8c:	00269593          	sll	a1,a3,0x2
    5e90:	020e9e63          	bnez	t4,5ecc <.L135>

00005e94 <.L136>:
    5e94:	00b30533          	add	a0,t1,a1
    5e98:	00052503          	lw	a0,0(a0)
    5e9c:	001e8e93          	add	t4,t4,1

00005ea0 <.LVL247>:
    5ea0:	00430313          	add	t1,t1,4
    5ea4:	fea32e23          	sw	a0,-4(t1)

00005ea8 <.LVL248>:
    5ea8:	ffd656e3          	bge	a2,t4,5e94 <.L136>
    5eac:	00400613          	li	a2,4
    5eb0:	40d606b3          	sub	a3,a2,a3

00005eb4 <.LVL249>:
    5eb4:	0640006f          	j	5f18 <.L140>

00005eb8 <.L134>:
    5eb8:	0005a503          	lw	a0,0(a1)
    5ebc:	00160613          	add	a2,a2,1

00005ec0 <.LVL251>:
    5ec0:	00458593          	add	a1,a1,4
    5ec4:	00a76733          	or	a4,a4,a0

00005ec8 <.LVL252>:
    5ec8:	fb9ff06f          	j	5e80 <.L133>

00005ecc <.L135>:
    5ecc:	04058513          	add	a0,a1,64
    5ed0:	00250533          	add	a0,a0,sp
    5ed4:	fe052503          	lw	a0,-32(a0)
    5ed8:	02000313          	li	t1,32
    5edc:	41d30333          	sub	t1,t1,t4
    5ee0:	00651533          	sll	a0,a0,t1
    5ee4:	00a76733          	or	a4,a4,a0

00005ee8 <.LVL254>:
    5ee8:	00000e13          	li	t3,0
    5eec:	00b80533          	add	a0,a6,a1
    5ef0:	40b005b3          	neg	a1,a1

00005ef4 <.L138>:
    5ef4:	0ece4a63          	blt	t3,a2,5fe8 <.L139>
    5ef8:	00400593          	li	a1,4
    5efc:	40d586b3          	sub	a3,a1,a3

00005f00 <.LVL256>:
    5f00:	02c12583          	lw	a1,44(sp)
    5f04:	00261613          	sll	a2,a2,0x2

00005f08 <.LVL257>:
    5f08:	04060613          	add	a2,a2,64
    5f0c:	00260633          	add	a2,a2,sp
    5f10:	01d5d5b3          	srl	a1,a1,t4
    5f14:	feb62023          	sw	a1,-32(a2)

00005f18 <.L140>:
    5f18:	00400613          	li	a2,4
    5f1c:	40d60633          	sub	a2,a2,a3
    5f20:	00261613          	sll	a2,a2,0x2
    5f24:	00269693          	sll	a3,a3,0x2
    5f28:	00800593          	li	a1,8
    5f2c:	00d806b3          	add	a3,a6,a3
    5f30:	00b66a63          	bltu	a2,a1,5f44 <.L141>
    5f34:	0006a023          	sw	zero,0(a3) # 80000 <_ebss+0x751a0>
    5f38:	0006a223          	sw	zero,4(a3)
    5f3c:	ff860613          	add	a2,a2,-8
    5f40:	00868693          	add	a3,a3,8

00005f44 <.L141>:
    5f44:	00400593          	li	a1,4
    5f48:	00b66463          	bltu	a2,a1,5f50 <.L142>
    5f4c:	0006a023          	sw	zero,0(a3)

00005f50 <.L142>:
    5f50:	02012683          	lw	a3,32(sp)

00005f54 <.LBB64>:
    5f54:	00e03733          	snez	a4,a4

00005f58 <.LBE64>:
    5f58:	00d76733          	or	a4,a4,a3

00005f5c <.L143>:
    5f5c:	02412583          	lw	a1,36(sp)

00005f60 <.LBB67>:
    5f60:	02e12023          	sw	a4,32(sp)

00005f64 <.LBB68>:
    5f64:	40e78733          	sub	a4,a5,a4

00005f68 <.LVL263>:
    5f68:	40b90633          	sub	a2,s2,a1

00005f6c <.LVL264>:
    5f6c:	00e7b6b3          	sltu	a3,a5,a4
    5f70:	00c93533          	sltu	a0,s2,a2

00005f74 <.LVL265>:
    5f74:	40d60633          	sub	a2,a2,a3

00005f78 <.LVL266>:
    5f78:	00000693          	li	a3,0
    5f7c:	00e7f663          	bgeu	a5,a4,5f88 <.L148>
    5f80:	412585b3          	sub	a1,a1,s2
    5f84:	0015b693          	seqz	a3,a1

00005f88 <.L148>:
    5f88:	00a6e7b3          	or	a5,a3,a0

00005f8c <.LVL267>:
    5f8c:	02812503          	lw	a0,40(sp)
    5f90:	00000693          	li	a3,0
    5f94:	40a985b3          	sub	a1,s3,a0

00005f98 <.LVL268>:
    5f98:	00b9b833          	sltu	a6,s3,a1

00005f9c <.LVL269>:
    5f9c:	40f585b3          	sub	a1,a1,a5

00005fa0 <.LVL270>:
    5fa0:	00078663          	beqz	a5,5fac <.L151>
    5fa4:	41350533          	sub	a0,a0,s3
    5fa8:	00153693          	seqz	a3,a0

00005fac <.L151>:
    5fac:	02c12783          	lw	a5,44(sp)

00005fb0 <.LVL272>:
    5fb0:	0106e6b3          	or	a3,a3,a6

00005fb4 <.LVL273>:
    5fb4:	40fb07b3          	sub	a5,s6,a5
    5fb8:	40d787b3          	sub	a5,a5,a3

00005fbc <.L130>:
    5fbc:	02e12823          	sw	a4,48(sp)

00005fc0 <.LBB70>:
    5fc0:	02f12e23          	sw	a5,60(sp)
    5fc4:	02b12c23          	sw	a1,56(sp)
    5fc8:	02c12a23          	sw	a2,52(sp)

00005fcc <.LBE70>:
    5fcc:	00c79713          	sll	a4,a5,0xc
    5fd0:	de075863          	bgez	a4,55c0 <.L10>

00005fd4 <.LBB71>:
    5fd4:	00080737          	lui	a4,0x80
    5fd8:	fff70713          	add	a4,a4,-1 # 7ffff <_ebss+0x7519f>
    5fdc:	00e7f7b3          	and	a5,a5,a4
    5fe0:	02f12e23          	sw	a5,60(sp)
    5fe4:	5740006f          	j	6558 <.L233>

00005fe8 <.L139>:
    5fe8:	00052883          	lw	a7,0(a0)
    5fec:	00452f03          	lw	t5,4(a0)
    5ff0:	00b50fb3          	add	t6,a0,a1
    5ff4:	01d8d8b3          	srl	a7,a7,t4
    5ff8:	006f1f33          	sll	t5,t5,t1
    5ffc:	01e8e8b3          	or	a7,a7,t5
    6000:	011fa023          	sw	a7,0(t6)

00006004 <.LVL277>:
    6004:	001e0e13          	add	t3,t3,1

00006008 <.LVL278>:
    6008:	00450513          	add	a0,a0,4
    600c:	ee9ff06f          	j	5ef4 <.L138>

00006010 <.L118>:
    6010:	02412983          	lw	s3,36(sp)
    6014:	02812c03          	lw	s8,40(sp)
    6018:	02c12b03          	lw	s6,44(sp)

0000601c <.LBB137>:
    601c:	28088463          	beqz	a7,62a4 <.L152>
    6020:	409b8333          	sub	t1,s7,s1

00006024 <.LVL280>:
    6024:	0a049e63          	bnez	s1,60e0 <.L153>
    6028:	01412583          	lw	a1,20(sp)
    602c:	01812803          	lw	a6,24(sp)
    6030:	01c12683          	lw	a3,28(sp)
    6034:	0105e8b3          	or	a7,a1,a6
    6038:	00d8e8b3          	or	a7,a7,a3
    603c:	00f8e8b3          	or	a7,a7,a5
    6040:	02089063          	bnez	a7,6060 <.L154>

00006044 <.LVL281>:
    6044:	02812823          	sw	s0,48(sp)
    6048:	03312a23          	sw	s3,52(sp)
    604c:	03812c23          	sw	s8,56(sp)
    6050:	03612e23          	sw	s6,60(sp)

00006054 <.LBB138>:
    6054:	00030493          	mv	s1,t1

00006058 <.L361>:
    6058:	00090a93          	mv	s5,s2

0000605c <.LVL284>:
    605c:	d64ff06f          	j	55c0 <.L10>

00006060 <.L154>:
    6060:	fff30893          	add	a7,t1,-1

00006064 <.LVL286>:
    6064:	04089c63          	bnez	a7,60bc <.L155>

00006068 <.LBB73>:
    6068:	40f40733          	sub	a4,s0,a5

0000606c <.LVL288>:
    606c:	40b98633          	sub	a2,s3,a1

00006070 <.LVL289>:
    6070:	00e437b3          	sltu	a5,s0,a4
    6074:	00c9b533          	sltu	a0,s3,a2

00006078 <.LVL290>:
    6078:	40f60633          	sub	a2,a2,a5

0000607c <.LVL291>:
    607c:	00000793          	li	a5,0
    6080:	00e47663          	bgeu	s0,a4,608c <.L160>
    6084:	413585b3          	sub	a1,a1,s3
    6088:	0015b793          	seqz	a5,a1

0000608c <.L160>:
    608c:	00a7e7b3          	or	a5,a5,a0

00006090 <.LVL292>:
    6090:	410c05b3          	sub	a1,s8,a6

00006094 <.LVL293>:
    6094:	00bc3533          	sltu	a0,s8,a1

00006098 <.LVL294>:
    6098:	40f585b3          	sub	a1,a1,a5

0000609c <.LVL295>:
    609c:	00078663          	beqz	a5,60a8 <.L163>
    60a0:	41880833          	sub	a6,a6,s8
    60a4:	00183893          	seqz	a7,a6

000060a8 <.L163>:
    60a8:	40db07b3          	sub	a5,s6,a3

000060ac <.LVL297>:
    60ac:	00a8e6b3          	or	a3,a7,a0

000060b0 <.LVL298>:
    60b0:	40d787b3          	sub	a5,a5,a3

000060b4 <.LBE73>:
    60b4:	00090a93          	mv	s5,s2

000060b8 <.LVL299>:
    60b8:	d45ff06f          	j	5dfc <.L356>

000060bc <.L155>:
    60bc:	000087b7          	lui	a5,0x8
    60c0:	fff78793          	add	a5,a5,-1 # 7fff <.LLST128+0x4b>
    60c4:	76f31263          	bne	t1,a5,6828 <.L164>

000060c8 <.L165>:
    60c8:	02812823          	sw	s0,48(sp)
    60cc:	03312a23          	sw	s3,52(sp)
    60d0:	03812c23          	sw	s8,56(sp)
    60d4:	03612e23          	sw	s6,60(sp)
    60d8:	00090a93          	mv	s5,s2

000060dc <.LVL302>:
    60dc:	911ff06f          	j	59ec <.L359>

000060e0 <.L153>:
    60e0:	000087b7          	lui	a5,0x8
    60e4:	fff78793          	add	a5,a5,-1 # 7fff <.LLST128+0x4b>
    60e8:	fefb80e3          	beq	s7,a5,60c8 <.L165>
    60ec:	01c12783          	lw	a5,28(sp)
    60f0:	00080737          	lui	a4,0x80
    60f4:	00e7e7b3          	or	a5,a5,a4
    60f8:	00f12e23          	sw	a5,28(sp)

000060fc <.LDL4>:
    60fc:	07400793          	li	a5,116
    6100:	1867c863          	blt	a5,t1,6290 <.L166>

00006104 <.L270>:
    6104:	02000793          	li	a5,32
    6108:	02f347b3          	div	a5,t1,a5

0000610c <.LVL304>:
    610c:	00060693          	mv	a3,a2
    6110:	00000493          	li	s1,0

00006114 <.LVL305>:
    6114:	00000713          	li	a4,0

00006118 <.L167>:
    6118:	02f74e63          	blt	a4,a5,6154 <.L168>
    611c:	00300713          	li	a4,3

00006120 <.LVL307>:
    6120:	01f37893          	and	a7,t1,31
    6124:	40f70e33          	sub	t3,a4,a5
    6128:	00279593          	sll	a1,a5,0x2
    612c:	02089e63          	bnez	a7,6168 <.L169>

00006130 <.L170>:
    6130:	00b60733          	add	a4,a2,a1
    6134:	00072703          	lw	a4,0(a4) # 80000 <_ebss+0x751a0>
    6138:	00188893          	add	a7,a7,1

0000613c <.LVL309>:
    613c:	00460613          	add	a2,a2,4
    6140:	fee62e23          	sw	a4,-4(a2)

00006144 <.LVL310>:
    6144:	ff1e56e3          	bge	t3,a7,6130 <.L170>
    6148:	00400713          	li	a4,4
    614c:	40f707b3          	sub	a5,a4,a5

00006150 <.LVL311>:
    6150:	0780006f          	j	61c8 <.L175>

00006154 <.L168>:
    6154:	0006a583          	lw	a1,0(a3)
    6158:	00170713          	add	a4,a4,1

0000615c <.LVL313>:
    615c:	00468693          	add	a3,a3,4
    6160:	00b4e4b3          	or	s1,s1,a1

00006164 <.LVL314>:
    6164:	fb5ff06f          	j	6118 <.L167>

00006168 <.L169>:
    6168:	02000613          	li	a2,32
    616c:	02c36733          	rem	a4,t1,a2
    6170:	00078693          	mv	a3,a5
    6174:	40e60633          	sub	a2,a2,a4
    6178:	0007d463          	bgez	a5,6180 <.L172>

0000617c <.LVL316>:
    617c:	00000693          	li	a3,0

00006180 <.L172>:
    6180:	00269693          	sll	a3,a3,0x2
    6184:	04068713          	add	a4,a3,64
    6188:	002706b3          	add	a3,a4,sp
    618c:	fd06a703          	lw	a4,-48(a3)
    6190:	00b506b3          	add	a3,a0,a1
    6194:	40b005b3          	neg	a1,a1
    6198:	00c71733          	sll	a4,a4,a2
    619c:	00e4e4b3          	or	s1,s1,a4

000061a0 <.LVL318>:
    61a0:	00000713          	li	a4,0

000061a4 <.L173>:
    61a4:	0dc74263          	blt	a4,t3,6268 <.L174>
    61a8:	01c12683          	lw	a3,28(sp)
    61ac:	00400713          	li	a4,4

000061b0 <.LVL320>:
    61b0:	40f707b3          	sub	a5,a4,a5

000061b4 <.LVL321>:
    61b4:	002e1713          	sll	a4,t3,0x2
    61b8:	04070713          	add	a4,a4,64
    61bc:	00270733          	add	a4,a4,sp
    61c0:	0116d6b3          	srl	a3,a3,a7
    61c4:	fcd72823          	sw	a3,-48(a4)

000061c8 <.L175>:
    61c8:	0057a713          	slti	a4,a5,5
    61cc:	00000613          	li	a2,0
    61d0:	00070863          	beqz	a4,61e0 <.L177>
    61d4:	00400613          	li	a2,4
    61d8:	40f60633          	sub	a2,a2,a5
    61dc:	00261613          	sll	a2,a2,0x2

000061e0 <.L177>:
    61e0:	00279793          	sll	a5,a5,0x2
    61e4:	00f50533          	add	a0,a0,a5
    61e8:	00000593          	li	a1,0
    61ec:	b74fb0ef          	jal	1560 <__GI_memset>

000061f0 <.LBE75>:
    61f0:	01012783          	lw	a5,16(sp)

000061f4 <.LBB76>:
    61f4:	00903733          	snez	a4,s1

000061f8 <.LBE76>:
    61f8:	00f76733          	or	a4,a4,a5

000061fc <.L178>:
    61fc:	01412683          	lw	a3,20(sp)

00006200 <.LBB79>:
    6200:	00e12823          	sw	a4,16(sp)

00006204 <.LBB80>:
    6204:	40e40733          	sub	a4,s0,a4

00006208 <.LVL326>:
    6208:	40d98633          	sub	a2,s3,a3

0000620c <.LVL327>:
    620c:	00e437b3          	sltu	a5,s0,a4
    6210:	00c9b5b3          	sltu	a1,s3,a2

00006214 <.LVL328>:
    6214:	40f60633          	sub	a2,a2,a5

00006218 <.LVL329>:
    6218:	00000793          	li	a5,0
    621c:	00e47663          	bgeu	s0,a4,6228 <.L183>
    6220:	413686b3          	sub	a3,a3,s3
    6224:	0016b793          	seqz	a5,a3

00006228 <.L183>:
    6228:	01812503          	lw	a0,24(sp)
    622c:	00b7e7b3          	or	a5,a5,a1

00006230 <.LVL330>:
    6230:	00000693          	li	a3,0
    6234:	40ac05b3          	sub	a1,s8,a0

00006238 <.LVL331>:
    6238:	00bc3833          	sltu	a6,s8,a1

0000623c <.LVL332>:
    623c:	40f585b3          	sub	a1,a1,a5

00006240 <.LVL333>:
    6240:	00078663          	beqz	a5,624c <.L186>
    6244:	41850533          	sub	a0,a0,s8
    6248:	00153693          	seqz	a3,a0

0000624c <.L186>:
    624c:	01c12783          	lw	a5,28(sp)

00006250 <.LVL335>:
    6250:	0106e6b3          	or	a3,a3,a6

00006254 <.LBE80>:
    6254:	000b8493          	mv	s1,s7

00006258 <.LBB81>:
    6258:	40fb07b3          	sub	a5,s6,a5
    625c:	40d787b3          	sub	a5,a5,a3

00006260 <.LBE81>:
    6260:	00090a93          	mv	s5,s2

00006264 <.LVL337>:
    6264:	d59ff06f          	j	5fbc <.L130>

00006268 <.L174>:
    6268:	0006a803          	lw	a6,0(a3)
    626c:	0046a303          	lw	t1,4(a3)
    6270:	00b68eb3          	add	t4,a3,a1
    6274:	01185833          	srl	a6,a6,a7
    6278:	00c31333          	sll	t1,t1,a2
    627c:	00686833          	or	a6,a6,t1
    6280:	010ea023          	sw	a6,0(t4)

00006284 <.LVL339>:
    6284:	00170713          	add	a4,a4,1

00006288 <.LVL340>:
    6288:	00468693          	add	a3,a3,4
    628c:	f19ff06f          	j	61a4 <.L173>

00006290 <.L166>:
    6290:	00012e23          	sw	zero,28(sp)
    6294:	00012c23          	sw	zero,24(sp)
    6298:	00012a23          	sw	zero,20(sp)
    629c:	00100713          	li	a4,1
    62a0:	f5dff06f          	j	61fc <.L178>

000062a4 <.L152>:
    62a4:	00148713          	add	a4,s1,1
    62a8:	01171513          	sll	a0,a4,0x11
    62ac:	01255513          	srl	a0,a0,0x12

000062b0 <.LBB142>:
    62b0:	01412683          	lw	a3,20(sp)
    62b4:	01812603          	lw	a2,24(sp)
    62b8:	01c12583          	lw	a1,28(sp)

000062bc <.LBB143>:
    62bc:	00008337          	lui	t1,0x8
    62c0:	1e051063          	bnez	a0,64a0 <.L187>
    62c4:	0189e533          	or	a0,s3,s8
    62c8:	00c6e833          	or	a6,a3,a2
    62cc:	01656533          	or	a0,a0,s6
    62d0:	00b86833          	or	a6,a6,a1
    62d4:	00856533          	or	a0,a0,s0
    62d8:	00f86833          	or	a6,a6,a5
    62dc:	10049863          	bnez	s1,63ec <.L188>

000062e0 <.LVL343>:
    62e0:	02081263          	bnez	a6,6304 <.L189>
    62e4:	02812823          	sw	s0,48(sp)
    62e8:	03312a23          	sw	s3,52(sp)
    62ec:	03812c23          	sw	s8,56(sp)
    62f0:	03612e23          	sw	s6,60(sp)
    62f4:	00090a93          	mv	s5,s2

000062f8 <.LVL344>:
    62f8:	ac051463          	bnez	a0,55c0 <.L10>

000062fc <.L209>:
    62fc:	00000493          	li	s1,0

00006300 <.LVL346>:
    6300:	9d9ff06f          	j	5cd8 <.L358>

00006304 <.L189>:
    6304:	00051c63          	bnez	a0,631c <.L190>
    6308:	02f12823          	sw	a5,48(sp)
    630c:	02d12a23          	sw	a3,52(sp)
    6310:	02c12c23          	sw	a2,56(sp)
    6314:	02b12e23          	sw	a1,60(sp)

00006318 <.LBB146>:
  FP_PACK_SEMIRAW_Q (r, R);
    6318:	8d5ff06f          	j	5bec <.L357>

0000631c <.L190>:
  FP_SUB_Q (R, A, B);
    631c:	40878533          	sub	a0,a5,s0

00006320 <.LVL350>:
    6320:	41368e33          	sub	t3,a3,s3

00006324 <.LVL351>:
    6324:	00a7b833          	sltu	a6,a5,a0
    6328:	01c6b8b3          	sltu	a7,a3,t3

0000632c <.LVL352>:
    632c:	410e0833          	sub	a6,t3,a6

00006330 <.LVL353>:
    6330:	00000713          	li	a4,0
    6334:	00a7f463          	bgeu	a5,a0,633c <.L196>
    6338:	001e3713          	seqz	a4,t3

0000633c <.L196>:
    633c:	01176733          	or	a4,a4,a7

00006340 <.LVL354>:
    6340:	418608b3          	sub	a7,a2,s8

00006344 <.LVL355>:
    6344:	01163f33          	sltu	t5,a2,a7

00006348 <.LVL356>:
    6348:	40e88eb3          	sub	t4,a7,a4

0000634c <.LVL357>:
    634c:	00000313          	li	t1,0
    6350:	00070463          	beqz	a4,6358 <.L199>
    6354:	0018b313          	seqz	t1,a7

00006358 <.L199>:
    6358:	01e36333          	or	t1,t1,t5

0000635c <.LVL359>:
    635c:	41658733          	sub	a4,a1,s6

00006360 <.LVL360>:
    6360:	40670733          	sub	a4,a4,t1
    6364:	02e12e23          	sw	a4,60(sp)
    6368:	03d12c23          	sw	t4,56(sp)
    636c:	03012a23          	sw	a6,52(sp)
    6370:	02a12823          	sw	a0,48(sp)

00006374 <.LBE83>:
    6374:	00c71313          	sll	t1,a4,0xc

00006378 <.LVL362>:
    6378:	06035063          	bgez	t1,63d8 <.L200>

0000637c <.LBB84>:
    637c:	40f407b3          	sub	a5,s0,a5

00006380 <.LVL363>:
    6380:	40d986b3          	sub	a3,s3,a3

00006384 <.LVL364>:
    6384:	00f43733          	sltu	a4,s0,a5
    6388:	00d9b9b3          	sltu	s3,s3,a3

0000638c <.LVL365>:
    638c:	40e686b3          	sub	a3,a3,a4

00006390 <.LVL366>:
    6390:	00000713          	li	a4,0
    6394:	00f47463          	bgeu	s0,a5,639c <.L205>
    6398:	001e3713          	seqz	a4,t3

0000639c <.L205>:
    639c:	40cc0633          	sub	a2,s8,a2
    63a0:	013769b3          	or	s3,a4,s3

000063a4 <.LVL367>:
    63a4:	00cc3c33          	sltu	s8,s8,a2

000063a8 <.LVL368>:
    63a8:	00000513          	li	a0,0

000063ac <.LVL369>:
    63ac:	41360633          	sub	a2,a2,s3

000063b0 <.LVL370>:
    63b0:	00098463          	beqz	s3,63b8 <.L208>
    63b4:	0018b513          	seqz	a0,a7

000063b8 <.L208>:
    63b8:	40bb05b3          	sub	a1,s6,a1
    63bc:	01856533          	or	a0,a0,s8

000063c0 <.LVL372>:
    63c0:	40a585b3          	sub	a1,a1,a0
    63c4:	02b12e23          	sw	a1,60(sp)
    63c8:	02c12c23          	sw	a2,56(sp)
    63cc:	02d12a23          	sw	a3,52(sp)
    63d0:	02f12823          	sw	a5,48(sp)

000063d4 <.LVL373>:
    63d4:	c85ff06f          	j	6058 <.L361>

000063d8 <.L200>:
    63d8:	01056533          	or	a0,a0,a6

000063dc <.LVL375>:
    63dc:	01d56533          	or	a0,a0,t4
    63e0:	00e56533          	or	a0,a0,a4
    63e4:	f0050ce3          	beqz	a0,62fc <.L209>
    63e8:	805ff06f          	j	5bec <.L357>

000063ec <.L188>:
    63ec:	03010893          	add	a7,sp,48
    63f0:	03c10713          	add	a4,sp,60
    63f4:	04081e63          	bnez	a6,6450 <.L210>
    63f8:	02051e63          	bnez	a0,6434 <.L211>

000063fc <.LVL377>:
    63fc:	02612e23          	sw	t1,60(sp)
    6400:	02012c23          	sw	zero,56(sp)
    6404:	02012a23          	sw	zero,52(sp)
    6408:	02012823          	sw	zero,48(sp)

0000640c <.LBB85>:
    640c:	00070793          	mv	a5,a4

00006410 <.L212>:
    6410:	0007a703          	lw	a4,0(a5)
    6414:	ffc7a683          	lw	a3,-4(a5)
    6418:	ffc78793          	add	a5,a5,-4
    641c:	00371713          	sll	a4,a4,0x3
    6420:	01d6d693          	srl	a3,a3,0x1d
    6424:	00d76733          	or	a4,a4,a3
    6428:	00e7a223          	sw	a4,4(a5)
    642c:	fef892e3          	bne	a7,a5,6410 <.L212>
    6430:	8a1ff06f          	j	5cd0 <.L213>

00006434 <.L211>:
    6434:	02812823          	sw	s0,48(sp)
    6438:	03312a23          	sw	s3,52(sp)
    643c:	03812c23          	sw	s8,56(sp)
    6440:	03612e23          	sw	s6,60(sp)

00006444 <.LBB148>:
    6444:	00090a93          	mv	s5,s2

00006448 <.L362>:
    6448:	fff30493          	add	s1,t1,-1 # 7fff <.LLST128+0x4b>

0000644c <.LVL382>:
    644c:	974ff06f          	j	55c0 <.L10>

00006450 <.L210>:
    6450:	00051c63          	bnez	a0,6468 <.L214>

00006454 <.LVL384>:
    6454:	02f12823          	sw	a5,48(sp)
    6458:	02d12a23          	sw	a3,52(sp)
    645c:	02c12c23          	sw	a2,56(sp)
    6460:	02b12e23          	sw	a1,60(sp)
    6464:	fe5ff06f          	j	6448 <.L362>

00006468 <.L214>:
    6468:	02612e23          	sw	t1,60(sp)
    646c:	02012c23          	sw	zero,56(sp)
    6470:	02012a23          	sw	zero,52(sp)
    6474:	02012823          	sw	zero,48(sp)

00006478 <.LBB86>:
    6478:	00070793          	mv	a5,a4

0000647c <.L215>:
    647c:	0007a703          	lw	a4,0(a5)
    6480:	ffc7a683          	lw	a3,-4(a5)
    6484:	ffc78793          	add	a5,a5,-4
    6488:	00371713          	sll	a4,a4,0x3
    648c:	01d6d693          	srl	a3,a3,0x1d
    6490:	00d76733          	or	a4,a4,a3
    6494:	00e7a223          	sw	a4,4(a5)
    6498:	fef892e3          	bne	a7,a5,647c <.L215>
    649c:	835ff06f          	j	5cd0 <.L213>

000064a0 <.L187>:
    64a0:	40878533          	sub	a0,a5,s0

000064a4 <.LVL389>:
    64a4:	41368eb3          	sub	t4,a3,s3

000064a8 <.LVL390>:
    64a8:	00a7b833          	sltu	a6,a5,a0
    64ac:	01d6b333          	sltu	t1,a3,t4

000064b0 <.LVL391>:
    64b0:	410e8833          	sub	a6,t4,a6

000064b4 <.LVL392>:
    64b4:	00000713          	li	a4,0
    64b8:	00a7f463          	bgeu	a5,a0,64c0 <.L220>
    64bc:	001eb713          	seqz	a4,t4

000064c0 <.L220>:
    64c0:	00676733          	or	a4,a4,t1

000064c4 <.LVL393>:
    64c4:	41860333          	sub	t1,a2,s8

000064c8 <.LVL394>:
    64c8:	00663fb3          	sltu	t6,a2,t1

000064cc <.LVL395>:
    64cc:	40e30f33          	sub	t5,t1,a4

000064d0 <.LVL396>:
    64d0:	00000e13          	li	t3,0
    64d4:	00070463          	beqz	a4,64dc <.L223>
    64d8:	00133e13          	seqz	t3,t1

000064dc <.L223>:
    64dc:	01fe6e33          	or	t3,t3,t6

000064e0 <.LVL398>:
    64e0:	41658733          	sub	a4,a1,s6

000064e4 <.LVL399>:
    64e4:	41c70733          	sub	a4,a4,t3
    64e8:	02e12e23          	sw	a4,60(sp)
    64ec:	03e12c23          	sw	t5,56(sp)
    64f0:	03012a23          	sw	a6,52(sp)
    64f4:	02a12823          	sw	a0,48(sp)

000064f8 <.LBE87>:
    64f8:	00c71e13          	sll	t3,a4,0xc

000064fc <.LVL401>:
    64fc:	140e5663          	bgez	t3,6648 <.L224>

00006500 <.LBB88>:
    6500:	40f407b3          	sub	a5,s0,a5

00006504 <.LVL402>:
    6504:	40d986b3          	sub	a3,s3,a3

00006508 <.LVL403>:
    6508:	00f43733          	sltu	a4,s0,a5
    650c:	00d9b9b3          	sltu	s3,s3,a3

00006510 <.LVL404>:
    6510:	40e686b3          	sub	a3,a3,a4

00006514 <.LVL405>:
    6514:	00000713          	li	a4,0
    6518:	00f47463          	bgeu	s0,a5,6520 <.L229>
    651c:	001eb713          	seqz	a4,t4

00006520 <.L229>:
    6520:	40cc0633          	sub	a2,s8,a2
    6524:	013769b3          	or	s3,a4,s3

00006528 <.LVL406>:
    6528:	00cc3c33          	sltu	s8,s8,a2

0000652c <.LVL407>:
    652c:	41360633          	sub	a2,a2,s3

00006530 <.LVL408>:
    6530:	00098463          	beqz	s3,6538 <.L232>
    6534:	00133893          	seqz	a7,t1

00006538 <.L232>:
    6538:	40bb05b3          	sub	a1,s6,a1
    653c:	0188e733          	or	a4,a7,s8

00006540 <.LVL410>:
    6540:	40e58733          	sub	a4,a1,a4

00006544 <.LVL411>:
    6544:	02e12e23          	sw	a4,60(sp)
    6548:	02c12c23          	sw	a2,56(sp)
    654c:	02d12a23          	sw	a3,52(sp)
    6550:	02f12823          	sw	a5,48(sp)

00006554 <.LBE88>:
    6554:	00090a93          	mv	s5,s2

00006558 <.L233>:
    6558:	03c12503          	lw	a0,60(sp)
    655c:	10050063          	beqz	a0,665c <.L234>
    6560:	255000ef          	jal	6fb4 <__clzsi2>

00006564 <.L235>:
    6564:	ff450513          	add	a0,a0,-12

00006568 <.LBB56>:
    6568:	02000713          	li	a4,32
    656c:	01f57813          	and	a6,a0,31
    6570:	02e547b3          	div	a5,a0,a4

00006574 <.LVL416>:
    6574:	12080063          	beqz	a6,6694 <.L238>
    6578:	03010313          	add	t1,sp,48
    657c:	02e566b3          	rem	a3,a0,a4

00006580 <.LVL417>:
    6580:	40d70633          	sub	a2,a4,a3
    6584:	ffc00693          	li	a3,-4

00006588 <.LVL418>:
    6588:	02d786b3          	mul	a3,a5,a3
    658c:	00c68713          	add	a4,a3,12
    6590:	00e30733          	add	a4,t1,a4
    6594:	40d006b3          	neg	a3,a3

00006598 <.L239>:
    6598:	12e31663          	bne	t1,a4,66c4 <.L242>
    659c:	03012683          	lw	a3,48(sp)
    65a0:	fff78713          	add	a4,a5,-1

000065a4 <.LVL419>:
    65a4:	00279793          	sll	a5,a5,0x2

000065a8 <.LVL420>:
    65a8:	04078793          	add	a5,a5,64
    65ac:	002787b3          	add	a5,a5,sp
    65b0:	010696b3          	sll	a3,a3,a6
    65b4:	fed7a823          	sw	a3,-16(a5)

000065b8 <.L243>:
    65b8:	00170713          	add	a4,a4,1
    65bc:	03010793          	add	a5,sp,48
    65c0:	00271713          	sll	a4,a4,0x2
    65c4:	00800693          	li	a3,8
    65c8:	00078893          	mv	a7,a5
    65cc:	00d76a63          	bltu	a4,a3,65e0 <.L244>
    65d0:	02012823          	sw	zero,48(sp)
    65d4:	0007a223          	sw	zero,4(a5)
    65d8:	ff870713          	add	a4,a4,-8
    65dc:	03810793          	add	a5,sp,56

000065e0 <.L244>:
    65e0:	00400693          	li	a3,4
    65e4:	00d76463          	bltu	a4,a3,65ec <.L245>
    65e8:	0007a023          	sw	zero,0(a5)

000065ec <.L245>:
    65ec:	1c954863          	blt	a0,s1,67bc <.L246>
    65f0:	40950533          	sub	a0,a0,s1

000065f4 <.LVL422>:
    65f4:	00150513          	add	a0,a0,1

000065f8 <.LBB52>:
    65f8:	40555713          	sra	a4,a0,0x5

000065fc <.LVL424>:
    65fc:	01f57793          	and	a5,a0,31

00006600 <.LVL425>:
    6600:	00088593          	mv	a1,a7
    6604:	00088613          	mv	a2,a7
    6608:	00000313          	li	t1,0
    660c:	00000693          	li	a3,0

00006610 <.L247>:
    6610:	0ce69c63          	bne	a3,a4,66e8 <.L248>
    6614:	00300693          	li	a3,3

00006618 <.LVL427>:
    6618:	40e686b3          	sub	a3,a3,a4
    661c:	00271613          	sll	a2,a4,0x2
    6620:	0c079e63          	bnez	a5,66fc <.L249>

00006624 <.L250>:
    6624:	00c58533          	add	a0,a1,a2
    6628:	00052503          	lw	a0,0(a0)
    662c:	00178793          	add	a5,a5,1

00006630 <.LVL429>:
    6630:	00458593          	add	a1,a1,4
    6634:	fea5ae23          	sw	a0,-4(a1)

00006638 <.LVL430>:
    6638:	fef6d6e3          	bge	a3,a5,6624 <.L250>
    663c:	00400793          	li	a5,4

00006640 <.LVL431>:
    6640:	40e78733          	sub	a4,a5,a4

00006644 <.LVL432>:
    6644:	1040006f          	j	6748 <.L254>

00006648 <.L224>:
    6648:	01056533          	or	a0,a0,a6

0000664c <.LVL434>:
    664c:	01e56533          	or	a0,a0,t5
    6650:	00e56533          	or	a0,a0,a4
    6654:	ca0504e3          	beqz	a0,62fc <.L209>
    6658:	f01ff06f          	j	6558 <.L233>

0000665c <.L234>:
    665c:	03812503          	lw	a0,56(sp)
    6660:	00050863          	beqz	a0,6670 <.L236>
    6664:	151000ef          	jal	6fb4 <__clzsi2>

00006668 <.LVL436>:
    6668:	02050513          	add	a0,a0,32
    666c:	ef9ff06f          	j	6564 <.L235>

00006670 <.L236>:
    6670:	03412503          	lw	a0,52(sp)
    6674:	00050863          	beqz	a0,6684 <.L237>
    6678:	13d000ef          	jal	6fb4 <__clzsi2>

0000667c <.LVL439>:
    667c:	04050513          	add	a0,a0,64
    6680:	ee5ff06f          	j	6564 <.L235>

00006684 <.L237>:
    6684:	03012503          	lw	a0,48(sp)
    6688:	12d000ef          	jal	6fb4 <__clzsi2>

0000668c <.LVL442>:
    668c:	06050513          	add	a0,a0,96
    6690:	ed5ff06f          	j	6564 <.L235>

00006694 <.L238>:
    6694:	ffc00613          	li	a2,-4
    6698:	02c78633          	mul	a2,a5,a2
    669c:	03c10713          	add	a4,sp,60

000066a0 <.LBB58>:
    66a0:	00300693          	li	a3,3

000066a4 <.L240>:
    66a4:	00c705b3          	add	a1,a4,a2
    66a8:	0005a583          	lw	a1,0(a1)
    66ac:	fff68693          	add	a3,a3,-1

000066b0 <.LVL446>:
    66b0:	ffc70713          	add	a4,a4,-4
    66b4:	00b72223          	sw	a1,4(a4)

000066b8 <.LVL447>:
    66b8:	fef6d6e3          	bge	a3,a5,66a4 <.L240>
    66bc:	fff78713          	add	a4,a5,-1
    66c0:	ef9ff06f          	j	65b8 <.L243>

000066c4 <.L242>:
    66c4:	00072583          	lw	a1,0(a4)
    66c8:	ffc72883          	lw	a7,-4(a4)
    66cc:	00d70e33          	add	t3,a4,a3
    66d0:	010595b3          	sll	a1,a1,a6
    66d4:	00c8d8b3          	srl	a7,a7,a2
    66d8:	0115e5b3          	or	a1,a1,a7
    66dc:	00be2023          	sw	a1,0(t3)
    66e0:	ffc70713          	add	a4,a4,-4
    66e4:	eb5ff06f          	j	6598 <.L239>

000066e8 <.L248>:
    66e8:	00062503          	lw	a0,0(a2)
    66ec:	00168693          	add	a3,a3,1

000066f0 <.LVL450>:
    66f0:	00460613          	add	a2,a2,4
    66f4:	00a36333          	or	t1,t1,a0

000066f8 <.LVL451>:
    66f8:	f19ff06f          	j	6610 <.L247>

000066fc <.L249>:
    66fc:	04060593          	add	a1,a2,64
    6700:	002585b3          	add	a1,a1,sp
    6704:	ff05a583          	lw	a1,-16(a1)
    6708:	02000813          	li	a6,32
    670c:	40f80833          	sub	a6,a6,a5
    6710:	010595b3          	sll	a1,a1,a6
    6714:	00b36333          	or	t1,t1,a1

00006718 <.LVL453>:
    6718:	00000e13          	li	t3,0
    671c:	00c885b3          	add	a1,a7,a2
    6720:	40c00633          	neg	a2,a2

00006724 <.L252>:
    6724:	06de4863          	blt	t3,a3,6794 <.L253>
    6728:	00400613          	li	a2,4
    672c:	40e60733          	sub	a4,a2,a4

00006730 <.LVL455>:
    6730:	03c12603          	lw	a2,60(sp)
    6734:	00269693          	sll	a3,a3,0x2

00006738 <.LVL456>:
    6738:	04068693          	add	a3,a3,64
    673c:	002686b3          	add	a3,a3,sp
    6740:	00f657b3          	srl	a5,a2,a5

00006744 <.LVL457>:
    6744:	fef6a823          	sw	a5,-16(a3)

00006748 <.L254>:
    6748:	00400693          	li	a3,4
    674c:	40e686b3          	sub	a3,a3,a4
    6750:	00271713          	sll	a4,a4,0x2
    6754:	00e887b3          	add	a5,a7,a4
    6758:	00269713          	sll	a4,a3,0x2
    675c:	00800693          	li	a3,8
    6760:	00d76a63          	bltu	a4,a3,6774 <.L255>
    6764:	0007a023          	sw	zero,0(a5)
    6768:	0007a223          	sw	zero,4(a5)
    676c:	ff870713          	add	a4,a4,-8
    6770:	00878793          	add	a5,a5,8

00006774 <.L255>:
    6774:	00400693          	li	a3,4
    6778:	00d76463          	bltu	a4,a3,6780 <.L256>
    677c:	0007a023          	sw	zero,0(a5)

00006780 <.L256>:
    6780:	03012703          	lw	a4,48(sp)

00006784 <.LBB54>:
    6784:	006037b3          	snez	a5,t1

00006788 <.LBE54>:
    6788:	00f767b3          	or	a5,a4,a5
    678c:	02f12823          	sw	a5,48(sp)
    6790:	c5cff06f          	j	5bec <.L357>

00006794 <.L253>:
    6794:	0005a503          	lw	a0,0(a1)
    6798:	0045ae83          	lw	t4,4(a1)
    679c:	00c58f33          	add	t5,a1,a2
    67a0:	00f55533          	srl	a0,a0,a5
    67a4:	010e9eb3          	sll	t4,t4,a6
    67a8:	01d56533          	or	a0,a0,t4
    67ac:	00af2023          	sw	a0,0(t5)

000067b0 <.LVL461>:
    67b0:	001e0e13          	add	t3,t3,1

000067b4 <.LVL462>:
    67b4:	00458593          	add	a1,a1,4
    67b8:	f6dff06f          	j	6724 <.L252>

000067bc <.L246>:
    67bc:	03c12783          	lw	a5,60(sp)
    67c0:	fff80737          	lui	a4,0xfff80
    67c4:	fff70713          	add	a4,a4,-1 # fff7ffff <_ebss+0xfff7519f>
    67c8:	00e7f7b3          	and	a5,a5,a4
    67cc:	40a484b3          	sub	s1,s1,a0
    67d0:	02f12e23          	sw	a5,60(sp)

000067d4 <.LBB153>:
  FP_PACK_SEMIRAW_Q (r, R);
    67d4:	dedfe06f          	j	55c0 <.L10>

000067d8 <.L263>:
    67d8:	02012e23          	sw	zero,60(sp)
    67dc:	02012c23          	sw	zero,56(sp)
    67e0:	02012a23          	sw	zero,52(sp)
    67e4:	02012823          	sw	zero,48(sp)
    67e8:	e59fe06f          	j	5640 <.L262>

000067ec <.L343>:
  FP_SUB_Q (R, A, B);
    67ec:	07400713          	li	a4,116
    67f0:	00c74463          	blt	a4,a2,67f8 <.L26>
    67f4:	f4dfe06f          	j	5740 <.L267>

000067f8 <.L26>:
    67f8:	02012623          	sw	zero,44(sp)
    67fc:	02012423          	sw	zero,40(sp)
    6800:	02012223          	sw	zero,36(sp)
    6804:	00100713          	li	a4,1
    6808:	828ff06f          	j	5830 <.L37>

0000680c <.L62>:
    680c:	07400793          	li	a5,116
    6810:	a0b7dc63          	bge	a5,a1,5a28 <.L268>

00006814 <.L64>:
    6814:	00012e23          	sw	zero,28(sp)
    6818:	00012c23          	sw	zero,24(sp)
    681c:	00012a23          	sw	zero,20(sp)
    6820:	00100793          	li	a5,1
    6824:	afcff06f          	j	5b20 <.L76>

00006828 <.L164>:
    6828:	07400793          	li	a5,116
    682c:	a717c2e3          	blt	a5,a7,6290 <.L166>
    6830:	00088313          	mv	t1,a7
    6834:	8d1ff06f          	j	6104 <.L270>

00006838 <__fixunstfsi>:
#include "soft-fp.h"
#include "quad.h"

USItype
__fixunstfsi (TFtype a)
{
    6838:	00052703          	lw	a4,0(a0)
    683c:	00c52783          	lw	a5,12(a0)
    6840:	00852583          	lw	a1,8(a0)
    6844:	00452683          	lw	a3,4(a0)
    6848:	fe010113          	add	sp,sp,-32

0000684c <.LBB3>:
  FP_DECL_EX;
  FP_DECL_Q (A);
  USItype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    684c:	00e12023          	sw	a4,0(sp)
    6850:	00e12823          	sw	a4,16(sp)
    6854:	00179613          	sll	a2,a5,0x1

00006858 <.LBE3>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    6858:	00004737          	lui	a4,0x4

0000685c <.LBB4>:
  FP_UNPACK_RAW_Q (A, a);
    685c:	00d12223          	sw	a3,4(sp)
    6860:	00b12423          	sw	a1,8(sp)
    6864:	00f12623          	sw	a5,12(sp)
    6868:	00b12c23          	sw	a1,24(sp)
    686c:	01165613          	srl	a2,a2,0x11

00006870 <.LBE4>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    6870:	ffe70713          	add	a4,a4,-2 # 3ffe <.L143+0xe>
    6874:	00000513          	li	a0,0
    6878:	06c75a63          	bge	a4,a2,68ec <.L1>
    687c:	01f7d813          	srl	a6,a5,0x1f
    6880:	00004737          	lui	a4,0x4

00006884 <.LBB5>:
  FP_UNPACK_RAW_Q (A, a);
    6884:	00080693          	mv	a3,a6

00006888 <.LBE5>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    6888:	01e70713          	add	a4,a4,30 # 401e <.L144+0x6>
    688c:	00081663          	bnez	a6,6898 <.L5>
    6890:	00004737          	lui	a4,0x4
    6894:	01f70713          	add	a4,a4,31 # 401f <.L144+0x7>

00006898 <.L5>:
    6898:	fff80513          	add	a0,a6,-1
    689c:	04e65863          	bge	a2,a4,68ec <.L1>
    68a0:	00000513          	li	a0,0
    68a4:	04081463          	bnez	a6,68ec <.L1>

000068a8 <.LBB10>:
  FP_UNPACK_RAW_Q (A, a);
    68a8:	01079793          	sll	a5,a5,0x10

000068ac <.LBB11>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    68ac:	00010737          	lui	a4,0x10

000068b0 <.LBB12>:
  FP_UNPACK_RAW_Q (A, a);
    68b0:	0107d793          	srl	a5,a5,0x10

000068b4 <.LBB13>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    68b4:	00e7e7b3          	or	a5,a5,a4

000068b8 <.LBB7>:
    68b8:	00004737          	lui	a4,0x4
    68bc:	06f70713          	add	a4,a4,111 # 406f <.LVL270+0x7>
    68c0:	40c70733          	sub	a4,a4,a2
    68c4:	40575613          	sra	a2,a4,0x5

000068c8 <.LBE7>:
    68c8:	00f12e23          	sw	a5,28(sp)

000068cc <.LBB8>:
    68cc:	01f77713          	and	a4,a4,31

000068d0 <.LVL6>:
    68d0:	02071263          	bnez	a4,68f4 <.L7>

000068d4 <.LVL7>:
    68d4:	00261613          	sll	a2,a2,0x2

000068d8 <.LVL8>:
    68d8:	02060793          	add	a5,a2,32
    68dc:	00278633          	add	a2,a5,sp
    68e0:	ff062783          	lw	a5,-16(a2)
    68e4:	00f12823          	sw	a5,16(sp)

000068e8 <.L8>:
    68e8:	01012503          	lw	a0,16(sp)

000068ec <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    68ec:	02010113          	add	sp,sp,32

000068f0 <.LVL11>:
    68f0:	00008067          	ret

000068f4 <.L7>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    68f4:	00200513          	li	a0,2
    68f8:	02a61063          	bne	a2,a0,6918 <.L9>
    68fc:	02000693          	li	a3,32
    6900:	40e686b3          	sub	a3,a3,a4
    6904:	00d796b3          	sll	a3,a5,a3
    6908:	00e5d5b3          	srl	a1,a1,a4
    690c:	00b6e6b3          	or	a3,a3,a1
    6910:	00d12823          	sw	a3,16(sp)

00006914 <.LVL13>:
    6914:	00100693          	li	a3,1

00006918 <.L9>:
    6918:	00269693          	sll	a3,a3,0x2

0000691c <.LVL15>:
    691c:	02068693          	add	a3,a3,32
    6920:	002686b3          	add	a3,a3,sp
    6924:	00e7d7b3          	srl	a5,a5,a4
    6928:	fef6a823          	sw	a5,-16(a3)
    692c:	fbdff06f          	j	68e8 <.L8>

00006930 <__floatunsitf>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__floatunsitf (USItype i)
{
    6930:	fd010113          	add	sp,sp,-48
    6934:	02912223          	sw	s1,36(sp)
    6938:	02112623          	sw	ra,44(sp)
    693c:	02812423          	sw	s0,40(sp)
    6940:	00050493          	mv	s1,a0

00006944 <.LBB12>:
  FP_DECL_Q (A);
  TFtype a;

  FP_FROM_INT_Q (A, i, SI_BITS, USItype);
    6944:	10058463          	beqz	a1,6a4c <.L2>

00006948 <.LBB3>:
    6948:	00058513          	mv	a0,a1
    694c:	00058413          	mv	s0,a1

00006950 <.LBB5>:
    6950:	664000ef          	jal	6fb4 <__clzsi2>

00006954 <.LVL3>:
    6954:	00004737          	lui	a4,0x4
    6958:	01e70713          	add	a4,a4,30 # 401e <.L144+0x6>

0000695c <.LBB6>:
    695c:	05150793          	add	a5,a0,81

00006960 <.LBB7>:
    6960:	40a70633          	sub	a2,a4,a0

00006964 <.LBE7>:
    6964:	00812823          	sw	s0,16(sp)

00006968 <.LBB8>:
    6968:	4057d713          	sra	a4,a5,0x5

0000696c <.LBE8>:
    696c:	00012a23          	sw	zero,20(sp)
    6970:	00012c23          	sw	zero,24(sp)
    6974:	00012e23          	sw	zero,28(sp)

00006978 <.LBB9>:
    6978:	01f7f793          	and	a5,a5,31

0000697c <.LVL6>:
    697c:	02078c63          	beqz	a5,69b4 <.L3>

00006980 <.LVL7>:
    6980:	00200693          	li	a3,2
    6984:	0cd71063          	bne	a4,a3,6a44 <.L8>
    6988:	02000693          	li	a3,32
    698c:	40f686b3          	sub	a3,a3,a5

00006990 <.LVL8>:
    6990:	00d456b3          	srl	a3,s0,a3

00006994 <.LVL9>:
    6994:	00d12e23          	sw	a3,28(sp)

00006998 <.L4>:
    6998:	fff70693          	add	a3,a4,-1

0000699c <.LVL11>:
    699c:	00271713          	sll	a4,a4,0x2
    69a0:	02070713          	add	a4,a4,32
    69a4:	00270733          	add	a4,a4,sp
    69a8:	00f41433          	sll	s0,s0,a5

000069ac <.LVL12>:
    69ac:	fe872823          	sw	s0,-16(a4)
    69b0:	0340006f          	j	69e4 <.L5>

000069b4 <.L3>:
    69b4:	00300793          	li	a5,3

000069b8 <.LVL14>:
    69b8:	40e787b3          	sub	a5,a5,a4
    69bc:	00279793          	sll	a5,a5,0x2
    69c0:	02078793          	add	a5,a5,32
    69c4:	002787b3          	add	a5,a5,sp
    69c8:	ff07a783          	lw	a5,-16(a5)
    69cc:	00200693          	li	a3,2
    69d0:	00f12e23          	sw	a5,28(sp)

000069d4 <.LVL15>:
    69d4:	00200793          	li	a5,2
    69d8:	00f71663          	bne	a4,a5,69e4 <.L5>
    69dc:	00812c23          	sw	s0,24(sp)

000069e0 <.LVL16>:
    69e0:	00100693          	li	a3,1

000069e4 <.L5>:
    69e4:	00269693          	sll	a3,a3,0x2
    69e8:	00012823          	sw	zero,16(sp)

000069ec <.LVL18>:
    69ec:	00012a23          	sw	zero,20(sp)
    69f0:	ffc68693          	add	a3,a3,-4
    69f4:	00400793          	li	a5,4
    69f8:	00f6e463          	bltu	a3,a5,6a00 <.L7>
    69fc:	00012c23          	sw	zero,24(sp)

00006a00 <.L7>:
  FP_PACK_RAW_Q (a, A);
    6a00:	01c12783          	lw	a5,28(sp)
    6a04:	00c11723          	sh	a2,14(sp)

00006a08 <.LBE13>:

  return a;
}
    6a08:	02c12083          	lw	ra,44(sp)

00006a0c <.LBB14>:
  FP_PACK_RAW_Q (a, A);
    6a0c:	00f11623          	sh	a5,12(sp)

00006a10 <.LBE14>:
  return a;
    6a10:	01012783          	lw	a5,16(sp)
}
    6a14:	02812403          	lw	s0,40(sp)
    6a18:	00048513          	mv	a0,s1
  return a;
    6a1c:	00f4a023          	sw	a5,0(s1)
    6a20:	01412783          	lw	a5,20(sp)
    6a24:	00f4a223          	sw	a5,4(s1)
    6a28:	01812783          	lw	a5,24(sp)
    6a2c:	00f4a423          	sw	a5,8(s1)
    6a30:	00c12783          	lw	a5,12(sp)
    6a34:	00f4a623          	sw	a5,12(s1)
}
    6a38:	02412483          	lw	s1,36(sp)
    6a3c:	03010113          	add	sp,sp,48

00006a40 <.LVL22>:
    6a40:	00008067          	ret

00006a44 <.L8>:
  FP_FROM_INT_Q (A, i, SI_BITS, USItype);
    6a44:	00300713          	li	a4,3

00006a48 <.LVL24>:
    6a48:	f51ff06f          	j	6998 <.L4>

00006a4c <.L2>:
    6a4c:	00012e23          	sw	zero,28(sp)
    6a50:	00012c23          	sw	zero,24(sp)
    6a54:	00012a23          	sw	zero,20(sp)
    6a58:	00012823          	sw	zero,16(sp)
    6a5c:	00000613          	li	a2,0
    6a60:	fa1ff06f          	j	6a00 <.L7>

00006a64 <__extenddftf2>:
  FP_DECL_D (A);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    6a64:	01465713          	srl	a4,a2,0x14
    6a68:	00c61793          	sll	a5,a2,0xc
    6a6c:	7ff77713          	and	a4,a4,2047

00006a70 <.LBE2>:
{
    6a70:	fd010113          	add	sp,sp,-48

00006a74 <.LBB3>:
  FP_UNPACK_RAW_D (A, a);
    6a74:	00c7d793          	srl	a5,a5,0xc

00006a78 <.LBE3>:
#if _FP_W_TYPE_SIZE < 64
  FP_EXTEND (Q, D, 4, 2, R, A);
    6a78:	00170693          	add	a3,a4,1
{
    6a7c:	02812423          	sw	s0,40(sp)
    6a80:	02912223          	sw	s1,36(sp)
    6a84:	03212023          	sw	s2,32(sp)
    6a88:	02112623          	sw	ra,44(sp)
  FP_EXTEND (Q, D, 4, 2, R, A);
    6a8c:	00b12823          	sw	a1,16(sp)
    6a90:	00f12a23          	sw	a5,20(sp)
    6a94:	00012e23          	sw	zero,28(sp)
    6a98:	00012c23          	sw	zero,24(sp)
    6a9c:	7fe6f693          	and	a3,a3,2046
{
    6aa0:	00050913          	mv	s2,a0
    6aa4:	00058413          	mv	s0,a1

00006aa8 <.LBB4>:
  FP_UNPACK_RAW_D (A, a);
    6aa8:	01f65493          	srl	s1,a2,0x1f

00006aac <.LBE4>:
  FP_EXTEND (Q, D, 4, 2, R, A);
    6aac:	08068263          	beqz	a3,6b30 <.L2>
    6ab0:	000046b7          	lui	a3,0x4
    6ab4:	c0068693          	add	a3,a3,-1024 # 3c00 <.LVL180>
    6ab8:	00d70733          	add	a4,a4,a3

00006abc <.LBB5>:
    6abc:	0047d693          	srl	a3,a5,0x4
    6ac0:	00d12e23          	sw	a3,28(sp)

00006ac4 <.LVL4>:
    6ac4:	01c79793          	sll	a5,a5,0x1c

00006ac8 <.LVL5>:
    6ac8:	0045d693          	srl	a3,a1,0x4
    6acc:	00d7e7b3          	or	a5,a5,a3
    6ad0:	01c59413          	sll	s0,a1,0x1c
    6ad4:	00f12c23          	sw	a5,24(sp)

00006ad8 <.LVL6>:
    6ad8:	00812a23          	sw	s0,20(sp)

00006adc <.LVL7>:
    6adc:	00012823          	sw	zero,16(sp)

00006ae0 <.L3>:
#else
  FP_EXTEND (Q, D, 2, 1, R, A);
#endif
  FP_PACK_RAW_Q (r, R);
    6ae0:	01c12783          	lw	a5,28(sp)
    6ae4:	00f49493          	sll	s1,s1,0xf

00006ae8 <.LVL9>:
    6ae8:	00e4e4b3          	or	s1,s1,a4
    6aec:	00f11623          	sh	a5,12(sp)

00006af0 <.LBE6>:
  FP_HANDLE_EXCEPTIONS;

  return r;
    6af0:	01012783          	lw	a5,16(sp)

00006af4 <.LBB7>:
  FP_PACK_RAW_Q (r, R);
    6af4:	00911723          	sh	s1,14(sp)

00006af8 <.LBE7>:
}
    6af8:	02c12083          	lw	ra,44(sp)
  return r;
    6afc:	00f92023          	sw	a5,0(s2)
    6b00:	01412783          	lw	a5,20(sp)

00006b04 <.LVL11>:
}
    6b04:	02812403          	lw	s0,40(sp)
    6b08:	02412483          	lw	s1,36(sp)
  return r;
    6b0c:	00f92223          	sw	a5,4(s2)
    6b10:	01812783          	lw	a5,24(sp)
}
    6b14:	00090513          	mv	a0,s2
  return r;
    6b18:	00f92423          	sw	a5,8(s2)
    6b1c:	00c12783          	lw	a5,12(sp)
    6b20:	00f92623          	sw	a5,12(s2)
}
    6b24:	02012903          	lw	s2,32(sp)
    6b28:	03010113          	add	sp,sp,48

00006b2c <.LVL13>:
    6b2c:	00008067          	ret

00006b30 <.L2>:
  FP_EXTEND (Q, D, 4, 2, R, A);
    6b30:	00b7e533          	or	a0,a5,a1
    6b34:	10071063          	bnez	a4,6c34 <.L4>
    6b38:	fa0504e3          	beqz	a0,6ae0 <.L3>

00006b3c <.LBB8>:
    6b3c:	04078e63          	beqz	a5,6b98 <.L5>
    6b40:	00078513          	mv	a0,a5
    6b44:	470000ef          	jal	6fb4 <__clzsi2>

00006b48 <.L6>:
    6b48:	03150693          	add	a3,a0,49
    6b4c:	4056d793          	sra	a5,a3,0x5

00006b50 <.LVL17>:
    6b50:	01f6f693          	and	a3,a3,31

00006b54 <.LVL18>:
    6b54:	04068863          	beqz	a3,6ba4 <.L7>
    6b58:	ffc00613          	li	a2,-4
    6b5c:	02c78633          	mul	a2,a5,a2
    6b60:	02000813          	li	a6,32
    6b64:	01010313          	add	t1,sp,16
    6b68:	40d80833          	sub	a6,a6,a3

00006b6c <.LVL19>:
    6b6c:	00c60713          	add	a4,a2,12
    6b70:	00e30733          	add	a4,t1,a4
    6b74:	40c00633          	neg	a2,a2

00006b78 <.L8>:
    6b78:	08e31c63          	bne	t1,a4,6c10 <.L11>
    6b7c:	fff78713          	add	a4,a5,-1

00006b80 <.LVL20>:
    6b80:	00279793          	sll	a5,a5,0x2

00006b84 <.LVL21>:
    6b84:	02078793          	add	a5,a5,32
    6b88:	002787b3          	add	a5,a5,sp
    6b8c:	00d416b3          	sll	a3,s0,a3

00006b90 <.LVL22>:
    6b90:	fed7a823          	sw	a3,-16(a5)
    6b94:	03c0006f          	j	6bd0 <.L10>

00006b98 <.L5>:
    6b98:	41c000ef          	jal	6fb4 <__clzsi2>

00006b9c <.LVL24>:
    6b9c:	02050513          	add	a0,a0,32
    6ba0:	fa9ff06f          	j	6b48 <.L6>

00006ba4 <.L7>:
    6ba4:	ffc00613          	li	a2,-4
    6ba8:	02c78633          	mul	a2,a5,a2
    6bac:	01c10713          	add	a4,sp,28

00006bb0 <.LBB10>:
    6bb0:	00300693          	li	a3,3

00006bb4 <.L9>:
    6bb4:	00c705b3          	add	a1,a4,a2
    6bb8:	0005a583          	lw	a1,0(a1)
    6bbc:	fff68693          	add	a3,a3,-1

00006bc0 <.LVL28>:
    6bc0:	ffc70713          	add	a4,a4,-4
    6bc4:	00b72223          	sw	a1,4(a4)

00006bc8 <.LVL29>:
    6bc8:	fef6d6e3          	bge	a3,a5,6bb4 <.L9>
    6bcc:	fff78713          	add	a4,a5,-1

00006bd0 <.L10>:
    6bd0:	00170793          	add	a5,a4,1
    6bd4:	00279793          	sll	a5,a5,0x2
    6bd8:	00800693          	li	a3,8
    6bdc:	01010713          	add	a4,sp,16
    6be0:	00d7ea63          	bltu	a5,a3,6bf4 <.L12>
    6be4:	00012823          	sw	zero,16(sp)
    6be8:	00072223          	sw	zero,4(a4)
    6bec:	ff878793          	add	a5,a5,-8
    6bf0:	01810713          	add	a4,sp,24

00006bf4 <.L12>:
    6bf4:	00400693          	li	a3,4
    6bf8:	00d7e463          	bltu	a5,a3,6c00 <.L13>
    6bfc:	00072023          	sw	zero,0(a4)

00006c00 <.L13>:
    6c00:	00004737          	lui	a4,0x4
    6c04:	c0c70713          	add	a4,a4,-1012 # 3c0c <.LVL182>
    6c08:	40a70733          	sub	a4,a4,a0

00006c0c <.LVL31>:
    6c0c:	ed5ff06f          	j	6ae0 <.L3>

00006c10 <.L11>:
    6c10:	00072583          	lw	a1,0(a4)
    6c14:	ffc72883          	lw	a7,-4(a4)
    6c18:	00c70e33          	add	t3,a4,a2
    6c1c:	00d595b3          	sll	a1,a1,a3
    6c20:	0108d8b3          	srl	a7,a7,a6
    6c24:	0115e5b3          	or	a1,a1,a7
    6c28:	00be2023          	sw	a1,0(t3)
    6c2c:	ffc70713          	add	a4,a4,-4
    6c30:	f49ff06f          	j	6b78 <.L8>

00006c34 <.L4>:
    6c34:	02050863          	beqz	a0,6c64 <.L14>

00006c38 <.LBB12>:
    6c38:	01c79713          	sll	a4,a5,0x1c

00006c3c <.LVL35>:
    6c3c:	0045d693          	srl	a3,a1,0x4
    6c40:	00d76733          	or	a4,a4,a3
    6c44:	00e12c23          	sw	a4,24(sp)

00006c48 <.LVL36>:
    6c48:	0047d793          	srl	a5,a5,0x4

00006c4c <.LBE12>:
    6c4c:	00008737          	lui	a4,0x8

00006c50 <.LBB13>:
    6c50:	01c59413          	sll	s0,a1,0x1c

00006c54 <.LBE13>:
    6c54:	00e7e7b3          	or	a5,a5,a4

00006c58 <.LBB14>:
    6c58:	00812a23          	sw	s0,20(sp)

00006c5c <.LVL39>:
    6c5c:	00012823          	sw	zero,16(sp)

00006c60 <.LBE14>:
    6c60:	00f12e23          	sw	a5,28(sp)

00006c64 <.L14>:
    6c64:	00008737          	lui	a4,0x8
    6c68:	fff70713          	add	a4,a4,-1 # 7fff <.LLST128+0x4b>
    6c6c:	e75ff06f          	j	6ae0 <.L3>

00006c70 <__trunctfdf2>:
#include "double.h"
#include "quad.h"

DFtype
__trunctfdf2 (TFtype a)
{
    6c70:	00c52583          	lw	a1,12(a0)
    6c74:	00852703          	lw	a4,8(a0)
    6c78:	00452683          	lw	a3,4(a0)
    6c7c:	fe010113          	add	sp,sp,-32
    6c80:	00052783          	lw	a5,0(a0)

00006c84 <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_Q (A, a);
    6c84:	00e12423          	sw	a4,8(sp)
    6c88:	00e12c23          	sw	a4,24(sp)
    6c8c:	01059713          	sll	a4,a1,0x10
    6c90:	01075713          	srl	a4,a4,0x10
    6c94:	00d12223          	sw	a3,4(sp)
    6c98:	00d12a23          	sw	a3,20(sp)
    6c9c:	01010613          	add	a2,sp,16
    6ca0:	00159693          	sll	a3,a1,0x1
    6ca4:	00b12623          	sw	a1,12(sp)
    6ca8:	00e12e23          	sw	a4,28(sp)
    6cac:	00f12023          	sw	a5,0(sp)
    6cb0:	00f12823          	sw	a5,16(sp)
    6cb4:	0116d693          	srl	a3,a3,0x11

00006cb8 <.LVL1>:
    6cb8:	01f5d593          	srl	a1,a1,0x1f

00006cbc <.LBB4>:
    6cbc:	01c10713          	add	a4,sp,28
    6cc0:	00060893          	mv	a7,a2

00006cc4 <.L2>:
    6cc4:	00072503          	lw	a0,0(a4)
    6cc8:	ffc72803          	lw	a6,-4(a4)
    6ccc:	ffc70713          	add	a4,a4,-4
    6cd0:	00351513          	sll	a0,a0,0x3
    6cd4:	01d85813          	srl	a6,a6,0x1d
    6cd8:	01056533          	or	a0,a0,a6
    6cdc:	00a72223          	sw	a0,4(a4)
    6ce0:	fee612e3          	bne	a2,a4,6cc4 <.L2>

00006ce4 <.LVL4>:
    6ce4:	00379513          	sll	a0,a5,0x3

00006ce8 <.LBE4>:
#if _FP_W_TYPE_SIZE < 64
  FP_TRUNC (D, Q, 2, 4, R, A);
    6ce8:	00168793          	add	a5,a3,1
    6cec:	01179713          	sll	a4,a5,0x11

00006cf0 <.LBB5>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    6cf0:	00a12823          	sw	a0,16(sp)

00006cf4 <.LBE5>:
  FP_TRUNC (D, Q, 2, 4, R, A);
    6cf4:	01275713          	srl	a4,a4,0x12
    6cf8:	1c070263          	beqz	a4,6ebc <.L3>
    6cfc:	ffffc7b7          	lui	a5,0xffffc
    6d00:	40078793          	add	a5,a5,1024 # ffffc400 <_ebss+0xffff15a0>
    6d04:	00f686b3          	add	a3,a3,a5

00006d08 <.LVL6>:
    6d08:	7fe00793          	li	a5,2046
    6d0c:	20d7c463          	blt	a5,a3,6f14 <.L23>
    6d10:	06d05463          	blez	a3,6d78 <.L5>

00006d14 <.LBB6>:
    6d14:	01812603          	lw	a2,24(sp)
    6d18:	01c12783          	lw	a5,28(sp)
    6d1c:	01412703          	lw	a4,20(sp)

00006d20 <.LVL8>:
    6d20:	01c65813          	srl	a6,a2,0x1c
    6d24:	00479793          	sll	a5,a5,0x4
    6d28:	0107e7b3          	or	a5,a5,a6
    6d2c:	00f12a23          	sw	a5,20(sp)

00006d30 <.LBB8>:
    6d30:	00471793          	sll	a5,a4,0x4
    6d34:	00a7e7b3          	or	a5,a5,a0

00006d38 <.LVL10>:
    6d38:	01c75713          	srl	a4,a4,0x1c

00006d3c <.LVL11>:
    6d3c:	00461613          	sll	a2,a2,0x4
    6d40:	00f037b3          	snez	a5,a5

00006d44 <.LVL12>:
    6d44:	00c76733          	or	a4,a4,a2

00006d48 <.LBE8>:
    6d48:	00e7e7b3          	or	a5,a5,a4

00006d4c <.L6>:
    6d4c:	01412703          	lw	a4,20(sp)

00006d50 <.L4>:
#else
  FP_TRUNC (D, Q, 1, 2, R, A);
#endif
  FP_PACK_SEMIRAW_D (r, R);
    6d50:	0077f613          	and	a2,a5,7
    6d54:	1c060663          	beqz	a2,6f20 <.L18>
    6d58:	00f7f613          	and	a2,a5,15
    6d5c:	00400513          	li	a0,4
    6d60:	1ca60063          	beq	a2,a0,6f20 <.L18>

00006d64 <.LBB11>:
    6d64:	00478613          	add	a2,a5,4
    6d68:	00f63533          	sltu	a0,a2,a5
    6d6c:	00a70733          	add	a4,a4,a0

00006d70 <.LVL15>:
    6d70:	00060793          	mv	a5,a2

00006d74 <.LVL16>:
    6d74:	1ac0006f          	j	6f20 <.L18>

00006d78 <.L5>:
  FP_TRUNC (D, Q, 2, 4, R, A);
    6d78:	fcc00793          	li	a5,-52
    6d7c:	00f6da63          	bge	a3,a5,6d90 <.L7>
    6d80:	00012a23          	sw	zero,20(sp)
    6d84:	00100793          	li	a5,1

00006d88 <.L39>:
    6d88:	00000693          	li	a3,0
    6d8c:	fc1ff06f          	j	6d4c <.L6>

00006d90 <.L7>:
    6d90:	01c12783          	lw	a5,28(sp)
    6d94:	00080737          	lui	a4,0x80

00006d98 <.LBB15>:
    6d98:	00060813          	mv	a6,a2

00006d9c <.LBE15>:
    6d9c:	00f76eb3          	or	t4,a4,a5

00006da0 <.LBB17>:
    6da0:	03d00793          	li	a5,61
    6da4:	40d787b3          	sub	a5,a5,a3
    6da8:	4057d693          	sra	a3,a5,0x5

00006dac <.LVL20>:
    6dac:	01f7f713          	and	a4,a5,31

00006db0 <.LBE17>:
    6db0:	01d12e23          	sw	t4,28(sp)

00006db4 <.LBB18>:
    6db4:	00000513          	li	a0,0
    6db8:	00000793          	li	a5,0

00006dbc <.L8>:
    6dbc:	00082303          	lw	t1,0(a6)
    6dc0:	00150513          	add	a0,a0,1

00006dc4 <.LVL23>:
    6dc4:	00480813          	add	a6,a6,4
    6dc8:	0067e7b3          	or	a5,a5,t1

00006dcc <.LVL24>:
    6dcc:	fea698e3          	bne	a3,a0,6dbc <.L8>
    6dd0:	00300513          	li	a0,3

00006dd4 <.LVL25>:
    6dd4:	40d50533          	sub	a0,a0,a3
    6dd8:	00269813          	sll	a6,a3,0x2
    6ddc:	02071463          	bnez	a4,6e04 <.L9>

00006de0 <.L10>:
    6de0:	01088333          	add	t1,a7,a6
    6de4:	00032303          	lw	t1,0(t1)
    6de8:	00170713          	add	a4,a4,1 # 80001 <_ebss+0x751a1>

00006dec <.LVL27>:
    6dec:	00488893          	add	a7,a7,4
    6df0:	fe68ae23          	sw	t1,-4(a7)

00006df4 <.LVL28>:
    6df4:	fee556e3          	bge	a0,a4,6de0 <.L10>
    6df8:	00400713          	li	a4,4

00006dfc <.LVL29>:
    6dfc:	40d706b3          	sub	a3,a4,a3

00006e00 <.LVL30>:
    6e00:	04c0006f          	j	6e4c <.L14>

00006e04 <.L9>:
    6e04:	02080893          	add	a7,a6,32
    6e08:	002888b3          	add	a7,a7,sp
    6e0c:	ff08a883          	lw	a7,-16(a7)
    6e10:	02000e13          	li	t3,32
    6e14:	40ee0e33          	sub	t3,t3,a4
    6e18:	01c898b3          	sll	a7,a7,t3
    6e1c:	0117e7b3          	or	a5,a5,a7

00006e20 <.LVL32>:
    6e20:	00000f13          	li	t5,0
    6e24:	010608b3          	add	a7,a2,a6
    6e28:	41000833          	neg	a6,a6

00006e2c <.L12>:
    6e2c:	06af4463          	blt	t5,a0,6e94 <.L13>
    6e30:	00251513          	sll	a0,a0,0x2
    6e34:	02050513          	add	a0,a0,32
    6e38:	00400813          	li	a6,4
    6e3c:	00250533          	add	a0,a0,sp
    6e40:	00eed733          	srl	a4,t4,a4

00006e44 <.LVL34>:
    6e44:	40d806b3          	sub	a3,a6,a3

00006e48 <.LVL35>:
    6e48:	fee52823          	sw	a4,-16(a0)

00006e4c <.L14>:
    6e4c:	00400513          	li	a0,4
    6e50:	40d50533          	sub	a0,a0,a3
    6e54:	00269693          	sll	a3,a3,0x2

00006e58 <.LVL37>:
    6e58:	00d60733          	add	a4,a2,a3
    6e5c:	00251693          	sll	a3,a0,0x2
    6e60:	00800613          	li	a2,8
    6e64:	00c6ea63          	bltu	a3,a2,6e78 <.L15>
    6e68:	00072023          	sw	zero,0(a4)
    6e6c:	00072223          	sw	zero,4(a4)
    6e70:	ff868693          	add	a3,a3,-8
    6e74:	00870713          	add	a4,a4,8

00006e78 <.L15>:
    6e78:	00400613          	li	a2,4
    6e7c:	00c6e463          	bltu	a3,a2,6e84 <.L16>
    6e80:	00072023          	sw	zero,0(a4)

00006e84 <.L16>:
    6e84:	01012703          	lw	a4,16(sp)

00006e88 <.LBB19>:
    6e88:	00f037b3          	snez	a5,a5

00006e8c <.LBE19>:
    6e8c:	00e7e7b3          	or	a5,a5,a4
    6e90:	ef9ff06f          	j	6d88 <.L39>

00006e94 <.L13>:
    6e94:	0008a303          	lw	t1,0(a7)
    6e98:	0048af83          	lw	t6,4(a7)
    6e9c:	010882b3          	add	t0,a7,a6
    6ea0:	00e35333          	srl	t1,t1,a4
    6ea4:	01cf9fb3          	sll	t6,t6,t3
    6ea8:	01f36333          	or	t1,t1,t6
    6eac:	0062a023          	sw	t1,0(t0)

00006eb0 <.LVL41>:
    6eb0:	001f0f13          	add	t5,t5,1

00006eb4 <.LVL42>:
    6eb4:	00488893          	add	a7,a7,4
    6eb8:	f75ff06f          	j	6e2c <.L12>

00006ebc <.L3>:
    6ebc:	01412603          	lw	a2,20(sp)
    6ec0:	01812703          	lw	a4,24(sp)
    6ec4:	01c12803          	lw	a6,28(sp)

00006ec8 <.LBE23>:
    6ec8:	00c767b3          	or	a5,a4,a2
    6ecc:	0107e7b3          	or	a5,a5,a6
    6ed0:	00a7e7b3          	or	a5,a5,a0
    6ed4:	00069863          	bnez	a3,6ee4 <.L17>

00006ed8 <.LVL44>:
    6ed8:	00f037b3          	snez	a5,a5
    6edc:	00000713          	li	a4,0
    6ee0:	e71ff06f          	j	6d50 <.L4>

00006ee4 <.L17>:
    6ee4:	0a078e63          	beqz	a5,6fa0 <.L24>

00006ee8 <.LBB24>:
    6ee8:	00471793          	sll	a5,a4,0x4
    6eec:	01c65613          	srl	a2,a2,0x1c

00006ef0 <.LVL47>:
    6ef0:	01c75713          	srl	a4,a4,0x1c

00006ef4 <.LVL48>:
    6ef4:	00481813          	sll	a6,a6,0x4

00006ef8 <.LBE25>:
    6ef8:	004006b7          	lui	a3,0x400

00006efc <.LBB26>:
    6efc:	00f66633          	or	a2,a2,a5

00006f00 <.LVL51>:
    6f00:	01076733          	or	a4,a4,a6

00006f04 <.LBE26>:
    6f04:	00d76733          	or	a4,a4,a3

00006f08 <.LVL53>:
    6f08:	ff867793          	and	a5,a2,-8

00006f0c <.LVL54>:
    6f0c:	7ff00693          	li	a3,2047
    6f10:	e41ff06f          	j	6d50 <.L4>

00006f14 <.L23>:
    6f14:	00000713          	li	a4,0
    6f18:	00000793          	li	a5,0

00006f1c <.L40>:
    6f1c:	7ff00693          	li	a3,2047

00006f20 <.L18>:
  FP_PACK_SEMIRAW_D (r, R);
    6f20:	00871613          	sll	a2,a4,0x8
    6f24:	00065e63          	bgez	a2,6f40 <.L21>

00006f28 <.LVL58>:
    6f28:	00168693          	add	a3,a3,1 # 400001 <_ebss+0x3f51a1>

00006f2c <.LVL59>:
    6f2c:	7ff00613          	li	a2,2047
    6f30:	06c68c63          	beq	a3,a2,6fa8 <.L25>
    6f34:	ff800637          	lui	a2,0xff800
    6f38:	fff60613          	add	a2,a2,-1 # ff7fffff <_ebss+0xff7f519f>
    6f3c:	00c77733          	and	a4,a4,a2

00006f40 <.L21>:
    6f40:	01d71613          	sll	a2,a4,0x1d
    6f44:	0037d793          	srl	a5,a5,0x3

00006f48 <.LVL61>:
    6f48:	00f667b3          	or	a5,a2,a5

00006f4c <.LVL62>:
    6f4c:	7ff00613          	li	a2,2047
    6f50:	00375713          	srl	a4,a4,0x3
    6f54:	00c69e63          	bne	a3,a2,6f70 <.L22>

00006f58 <.LVL64>:
    6f58:	00e7e7b3          	or	a5,a5,a4

00006f5c <.LVL65>:
    6f5c:	00000713          	li	a4,0

00006f60 <.LVL66>:
    6f60:	00078863          	beqz	a5,6f70 <.L22>
    6f64:	00080737          	lui	a4,0x80
    6f68:	00000793          	li	a5,0
    6f6c:	00000593          	li	a1,0

00006f70 <.L22>:
    6f70:	01469693          	sll	a3,a3,0x14
    6f74:	7ff00637          	lui	a2,0x7ff00
    6f78:	00c71713          	sll	a4,a4,0xc

00006f7c <.LVL68>:
    6f7c:	00c75713          	srl	a4,a4,0xc
    6f80:	00c6f6b3          	and	a3,a3,a2
    6f84:	01f59593          	sll	a1,a1,0x1f

00006f88 <.LVL69>:
    6f88:	00e6e6b3          	or	a3,a3,a4
    6f8c:	00b6e733          	or	a4,a3,a1

00006f90 <.LBE28>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    6f90:	00078513          	mv	a0,a5
    6f94:	00070593          	mv	a1,a4
    6f98:	02010113          	add	sp,sp,32

00006f9c <.LVL71>:
    6f9c:	00008067          	ret

00006fa0 <.L24>:
    6fa0:	00000713          	li	a4,0
    6fa4:	f79ff06f          	j	6f1c <.L40>

00006fa8 <.L25>:
    6fa8:	00000713          	li	a4,0

00006fac <.LVL74>:
    6fac:	00000793          	li	a5,0

00006fb0 <.LVL75>:
    6fb0:	f91ff06f          	j	6f40 <.L21>

00006fb4 <__clzsi2>:
int
__clzSI2 (UWtype x)
{
  Wtype ret;

  count_leading_zeros (ret, x);
    6fb4:	000107b7          	lui	a5,0x10
    6fb8:	02f57a63          	bgeu	a0,a5,6fec <.L2>
    6fbc:	10053793          	sltiu	a5,a0,256
    6fc0:	0017b793          	seqz	a5,a5
    6fc4:	00379793          	sll	a5,a5,0x3

00006fc8 <.L3>:
    6fc8:	02000713          	li	a4,32
    6fcc:	40f70733          	sub	a4,a4,a5
    6fd0:	00f55533          	srl	a0,a0,a5

00006fd4 <.LVL2>:
    6fd4:	00000797          	auipc	a5,0x0
    6fd8:	0c87a783          	lw	a5,200(a5) # 709c <_GLOBAL_OFFSET_TABLE_+0x34>

00006fdc <.LVL3>:
    6fdc:	00a787b3          	add	a5,a5,a0
    6fe0:	0007c503          	lbu	a0,0(a5)

00006fe4 <.LBE3>:

  return ret;
}
    6fe4:	40a70533          	sub	a0,a4,a0
    6fe8:	00008067          	ret

00006fec <.L2>:
  count_leading_zeros (ret, x);
    6fec:	01000737          	lui	a4,0x1000
    6ff0:	01800793          	li	a5,24
    6ff4:	fce57ae3          	bgeu	a0,a4,6fc8 <.L3>
    6ff8:	01000793          	li	a5,16
    6ffc:	fcdff06f          	j	6fc8 <.L3>

00007000 <main>:
#include <stdio.h>

int main( int argc, char ** argv )
{
    7000:	ff010113          	add	sp,sp,-16
    7004:	00050593          	mv	a1,a0

00007008 <.LVL1>:
	printf( "Hello, world %08x\n", argc );
    7008:	00001517          	auipc	a0,0x1
    700c:	2b450513          	add	a0,a0,692 # 82bc <.LC0>

00007010 <.LVL2>:
{
    7010:	00112623          	sw	ra,12(sp)
	printf( "Hello, world %08x\n", argc );
    7014:	90cf90ef          	jal	120 <__GI_printf>

00007018 <.LVL3>:
	float ft = 7.3f;
	printf( "f: %f\n", ft );
    7018:	00001797          	auipc	a5,0x1
    701c:	2c078793          	add	a5,a5,704 # 82d8 <.LC1>
    7020:	0007a603          	lw	a2,0(a5)
    7024:	0047a683          	lw	a3,4(a5)
    7028:	00001517          	auipc	a0,0x1
    702c:	2a850513          	add	a0,a0,680 # 82d0 <.LC2>
    7030:	8f0f90ef          	jal	120 <__GI_printf>

00007034 <.LVL4>:
}
    7034:	00c12083          	lw	ra,12(sp)
    7038:	00000513          	li	a0,0
    703c:	01010113          	add	sp,sp,16
    7040:	00008067          	ret
