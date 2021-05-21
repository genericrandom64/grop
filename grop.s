grop:
	db 0x7f, "ELF", 1, 1, 1, 0
	dq 0				; FREE 8
	dw 2, 3				; executable for x86 linux
	dd 3				; hehe
	db 0x24, 0x80, 0x04, 0x08	; hand crafted entry address
	dd 0x34				; header offset
	dd 0				; FREE 8
					; in this example the next 4 bytes
					; are used for code

	mov al, 1			; embed our code in flags
	int 0x80			; readelf shows this code

	dw 0x34				; header size
	dw 0x20				; program header table size

	dq 1				; 4 bytes for PHE listing followed by
					; FREE 4
					; no section table

	dd 1				; we are done with elf header (?)
					; loadable segment

	dd 0				; segment offset 0 (? sounds wrong)
	times 2 db 0, 0x80, 0x04, 0x08	; virtual address to load into (?)

	times 2 dd 0x6C 		; size of segment (?)

	dq 4				; 4 byte segment dependent flags followed by
					; FREE 4
