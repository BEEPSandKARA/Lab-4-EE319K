; SysTick.s
; Module written by: **-UUU-*Your Names**update this***
; Date Created: 2/14/2017
; Last Modified: 1/17/2020 
; Brief Description: Initializes SysTick

NVIC_ST_CTRL_R        EQU 0xE000E010
NVIC_ST_RELOAD_R      EQU 0xE000E014
NVIC_ST_CURRENT_R     EQU 0xE000E018

        AREA    |.text|, CODE, READONLY, ALIGN=2
        THUMB
; -UUU- You add code here to export your routine(s) from SysTick.s to main.s
        EXPORT SysTick_Init
;------------SysTick_Init------------
; ;-UUU-Complete this subroutine
; Initialize SysTick running at bus clock.
; Make it so NVIC_ST_CURRENT_R can be used as a 24-bit time
; Input: none
; Output: none
; Modifies: ??
SysTick_Init
 ; **-UUU-**Implement this function****
	LDR R0, =NVIC_ST_CTRL_R
	LDR R1, [R0] 
	BIC R1, #0x03
	STR R1, [R0]
	LDR R0, =NVIC_ST_RELOAD_R
	LDR R1, [R0]
	MOV R1, #0xFFFFFF			;WRITE MAX #
	STR R1, [R0]
	LDR R0, =NVIC_ST_CURRENT_R
	LDR R1, [R0]
	MOV R1, #0
	STR R1, [R0]
	LDR R0, =NVIC_ST_CTRL_R
	LDR R1, [R0]
	ORR R0, #0x05				;ENABLE BITS 0 AND 2
	
  
    BX  LR                          ; return


    ALIGN                           ; make sure the end of this section is aligned
    END                             ; end of file
