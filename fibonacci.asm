INCLUDE Irvine32.inc

.data
  inputMsg  BYTE  "Type in the nth Fibonacci number to print.",0

.code
main PROC

_read:
  ; Read user input

  mov   edx, OFFSET inputMsg
  call  WriteString
  
  call  ReadInt
  jno   _goodInput
  
  jmp   _read ; On bad input, go back to _read

_goodInput:
  ; Setup stuff for the algorithm
  sub   eax, 2

  mov   edx, eax ; loop counter
  mov   ebx, 1
  mov   ecx, 1

  ; If fib # was 1 or 2, just output 1
  cmp   eax, 0
  jle   _done

_loop:
  ; The fibonacci algorithm

  mov   eax, ebx
  add   ebx, ecx
  mov   ecx, eax
  
  dec   edx 
  cmp   edx, 0
  jne   _loop

_done:
  ; Output fibonacci number

  mov   eax, ebx
  call  WriteInt
  call  CrLf
  
  Invoke ExitProcess,0
main ENDP

END main