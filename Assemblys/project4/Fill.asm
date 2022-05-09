// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


(loop)
    @KBD
    D=M
    @white
    D; JEQ        // if not val(keyboard) == 0:

(black)
    @R0
    M=-1          //   R0 = -1
    @fill
    0; JMP
(white)           // else:
    @R0
    M=0           //   R0 = 0
    
(fill)
    @8192
    D=A
    @R1
    M=D           // R1 = 8192
    
    @SCREEN
    D=A
    @R2
    M=D           // R2 = SCREEN
    
(loop_fill)       // while True:
    @R1
    D=M
    @end_fill
    D; JEQ        //   if R1 == 0 then break
    @R0
    D=M
    @R2
    A=M
    M=D           //   R[R2] = R0
    @R1
    M=M-1         //   R1 --
    @R2
    M=M+1         //   R2 ++
    @loop_fill
    0; JMP
(end_fill)
    
    
    @loop
    0; JMP       // goto loop
