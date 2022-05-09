// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
    
    @R2
    M=0           // R2 = 0
(loop)
    @R0
    D=M
    @end
    D; JEQ        // if R0 == 0 goto end
    @R1
    D=M
    @R2
    M=M+D         // R2 = R2 + R1
    @R0
    M=M-1         // R0 --
    @loop
    0; JMP        // goto loop
(end)

(final)
    @final
    0; JMP

