 .data
    .def x,y,z,start
x    .int 0x1, 0x2, 0x3, 0x4  ;przypisanie wartosci do komorek tablicy
y    .int 0x5, 0x6, 0x7, 0x8
z    .int 0x4, 0x3, 0x2, 0x1
     .bss w, 2, 16 ;utworzenie sekjci bss
     .dp w
     .text ;utworzenie sekcji text
     .global start


start
    AMOV #x,XAR0
    AMOV #(y+3),XAR6

;    w
    MPY *AR0+, *AR6-, AC0 ; mnozenie , post+/- , przekazywanie do AC0
    MOV AC0, @w                ; AC0 do w
    MPY *AR0+, *AR6-, AC0
    ADD  @w, AC0
    MOV AC0, @w
    MPY *AR0+, *AR6-, AC0
    ADD  @w, AC0
    MOV AC0, @w
    MPY *AR0+, *AR6-, AC0
    ADD  @w, AC0
    MOV AC0, *(#w)


    AMOV #x,XAR0
    AMOV #z,XAR6


 ;	w+1

    MPY *AR0+, *AR6+, AC0
    MOV AC0, @(w+1)
    MPY *AR0+, *AR6+, AC0
    ADD  @(w+1), AC0
    MOV AC0, @(w+1)
    MPY *AR0+, *AR6+, AC0
    ADD  @(w+1), AC0
    MOV AC0, @(w+1)
    MPY *AR0+, *AR6+, AC0
    ADD  @(w+1), AC0
    MOV AC0, *(#w+1)
    AMOV #x,XAR0
    AMOV #(y+3),XAR6
    MOV #0,AC0





    RPT #3	;powtarzamy instrukcje x3(Repeat)
        MAC *AR0+, *AR6-, AC0
    MOV AC0, *(#w)
    AMOV #x,XAR0
    AMOV #z,XAR6
    MOV #0,AC0
    RPT #3
        MAC *AR0+, *AR6+, AC0
    MOV AC0, *(#w+1)
;
    NOP
end
