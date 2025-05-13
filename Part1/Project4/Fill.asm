// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(check_input)
    @KBD
    D=M
    @color_screen
    D;JNE
    @clear_screen
    D;JEQ

(color_screen)
    @SCREEN
    D=A
(color_screen_loop)
    A=D
    D=0
    M=!D
    D=A+1 // store i+1 in D
    // if i - KBD >= 0, then break
    @KBD
    D=D-A
    @check_input
    D;JGE
    @KBD
    D=D+A
    @color_screen_loop
    0;JEQ

(clear_screen)
    @SCREEN
    D=A
(clear_screen_loop)
    A=D
    M=0
    D=A+1
    @KBD
    D=D-A
    @check_input
    D;JGE
    @KBD
    D=D+A
    @clear_screen_loop
    0;JEQ

(halt)
    0;JMP