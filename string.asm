0x08049300 <+0>:   push   ebp           ; save last stack pointer
0x08049301 <+1>:   mov    ebp, esp      ; declare new one
0x08049303 <+3>:   sub    esp, 0x20     ; allocate 32 byte for lacal variables

0x08049306 <+6>:   mov    DWORD PTR [ebp-0x4], 0x67686665   ; char x[4] = "efhg"
0x0804930d <+13>:  mov    WORD PTR [ebp-0x8], 0x00          ; 2 bytes 0x00 end string with "\0"
0x08049313 <+19>:  lea    eax, [ebp-0x4]                    ; load memmory from char x stored in eax
0x08049316 <+22>:  push   eax                               ; push eax to stack
0x08049317 <+23>:  call   0x8049200 <puts@plt>              ; call push in C
0x0804931c <+28>:  add    esp, 0x4                          ; add 0x4 to stack pointer

0x0804931f <+31>:  mov    eax, 0x0                          ; return 0;
0x08049324 <+36>:  leave                                    ; pop
0x08049325 <+37>:  ret                                      ; exit

;   how to look for password in ASCII:
;       first we look from back: 0x65 = 'e'     ; end <- look from here
;                                0x66 = 'f'
;                                0x68 = 'h'
;                                0x67 = 'g'     ; start
;   int func() {
;       char x[4] = "efhg";
;       push (x); // not shure about this but it shows in asm dump what it pushes char x 4 bytes in to esp
;       return 0;
;   }
;
;   so here is our byte map:
;
;       address    value   Meaning
;       ebp-0x1     65      'e'
;       ebp-0x2     66      'f'
;       ebp-0x3     68      'h'
;       ebp-0x4     67      'g'
;
;       ebp-0x5     ??      unused
;       ebp-0x6     ??      unused
;
;       ebp-0x7     00      extra null does nothing
;       ebp-0x8     00      '\0'
