
/*
 * lpc23xx-uart-test.c
 */

#include <stdint.h>
#include "lpc23xx.h"

#include "lpc23xx-pll.h"

#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"
#include "printf-lpc.h"

#include "lpc23xx-uart-test.h"

/*

 ***Starting UART test: uart0.***

 12
 3 4
 Type a character.
 a
 You typed: a
 Type a line.
 This is a line of text.

 You typed: This is a line of text.

 ***End of UART test***

*/


int main (void) {

    int8_t c;
    char* instring;

    pllstart_seventytwomhz() ;
    //pllstart_sixtymhz() ;
    //pllstart_fourtyeightmhz() ;

    uart0_init_115200() ;
    //uart0_init_9600() ;

    unsigned int t1 = 221;

    uart0_putstring("\n***Starting UART test: uart0.***\n\n");
    printf_lpc(UART0, "\n***Testing printf ***\n\n");
    printf_lpc(UART0, "\n***Testing printf\nHex(%%X):\t%X\nDec(%%d):\t%d\nOct(%%o):\t%o\nBin(%%b):\t%b\nString(%%s):\t%s\nChar(%%c):\t%c\n ***\n\n", t1, 220, 220, 220, "220", '2');

    uart0_putchar('1');
    uart0_putchar('2');
    uart0_putchar('\n');
    uart0_putchar('3');
    uart0_putchar(' ');
    uart0_putchar('4');
    uart0_putchar('\n');

    uart0_putstring("Type a character.\n");

    c = uart0_getchar();

    uart0_putstring("\nYou typed: ");
    uart0_putchar(c);

    uart0_putstring("\nType a line.\n");
    instring = uart0_getstring();

    uart0_putstring("\nYou typed: ");
    uart0_putstring(instring);

    uart0_putstring("\n\n***End of UART test***\n");

    return(0);

}

