; naskfunc
; TAB=4

[FORMAT "WCOFF"]				; ƒIƒuƒWƒFƒNƒgƒtƒ@ƒCƒ‹‚ðì‚éƒ‚[ƒh	
[INSTRSET "i486p"]				; 486‚Ì–½—ß‚Ü‚ÅŽg‚¢‚½‚¢‚Æ‚¢‚¤‹Lq
[BITS 32]						; 32ƒrƒbƒgƒ‚[ƒh—p‚Ì‹@ŠBŒê‚ðì‚ç‚¹‚é
[FILE "naskfunc.nas"]			; ƒ\[ƒXƒtƒ@ƒCƒ‹–¼î•ñ

		GLOBAL	_io_hlt, _io_cli, _io_sti, _io_stihlt
		GLOBAL	_io_in8, _io_in16, _io_in32
		GLOBAL	_io_out8, _io_out16, _io_out32
		GLOBAL	_io_load_eflags, _io_store_eflags

[SECTION .text]

_io_hlt:	; void io_hlt(void);
		HLT
		RET

_io_cli:	; void io_cli(void);
		CLI
		RET
_io_sti:	; void io_sti(void);
		STI
		RET
_io_stihlt:	; void io_stihlt(void);
		STI
		HLT
		RET
_io_in8:	;void io_in8(int port);
		MOV		EDX,[ESP+4]	;port
		MOV		EAX,0
		IN 		AL,DX
		RET
_io_in16:	;void io_in16(int port);
		MOV		EDX,[ESP+4]	;port
		MOV		EAX,0
		IN 		AX,DX
		RET
_io_in32:	;void io_in32(int port);
		MOV		EDX,[ESP+4]	;port
		IN 		EAX,DX
		RET
_io_out8:	;void io_out8(int port,int data);
		MOV		EDX,[ESP+4]
		MOV		AL,[ESP+8]
		OUT 	DX,AL
		RET
_io_out16:	;void io_out16(int port,int data);
		MOV		EDX,[ESP+4]
		MOV		EAX,[ESP+8]
		OUT 	DX,AX
		RET
_io_out32:	;void io_out32(int port,int data);
		MOV		EDX,[ESP+4]
		MOV		AL,[ESP+8]
		OUT 	DX,EAX
		RET
_io_load_eflags:	;int io_load_eflags(void);
		PUSHFD		;PUSH EFLAGS
		POP		EAX
		RET
_io_store_eflags:	;void io_store_eflags(int eflags);
		MOV		EAX,[ESP+4]
		PUSH 	EAX
		POPFD
		RET
