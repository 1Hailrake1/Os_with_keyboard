; ------------------------------------------------------------------------------
; Guide:	00-BOOT-SECTOR
; File:		ex07 / main.asm
; Title:	Простая программа загрузочного сектора (boot sector), которая
;			демонстрирует чтение с диска
; ------------------------------------------------------------------------------
; Description:
; ------------------------------------------------------------------------------


[org 0x7c00]

mov bp, 0x8000						; Распологаем наш стек подальше в безопасное
mov sp, bp							; место

mov bx, 0x9000						; Данные из сектороров будут загружаться в
									; адрес 0x0000(es):0x9000(bx), т.е.
									; (es * 16 + bs), равный 0x90000

mov dh, 2							; Загрузим 2 сектора

call disk_load						; Загружаем диск

mov dx, [0x9000]					; Выводим на экран первое загрузившееся
call print_hex						; "слово" (т.е. машинное слово = 2 байта)
									; предполагая, что оно будет равно 0xdada
									; (распологается по адресу 0x9000)

mov dx, [0x9000 + 512]				; Выводим на экран первое "слово" из 2-го
									; загруженного нами сектора. Должно быть
									; равно 0xface
call print_hex

jmp $

%include "../ex04/print_string.asm"	; Функция печати строки
%include "../ex05/print_hex.asm"	; Функция печати 16-ричного числа
%include "disk_load.asm"			; Функция чтения диска

HEX_OUT:
	db "0x0000", 0

times 510-($-$$) db 0
dw 0xaa55

times 256 dw 0xdada					; TODO
times 256 dw 0xface
