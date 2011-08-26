
/* Copyright (C) 2011 Keith Wilson.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
 * Except as contained in this notice, the names of the authors or their
 * institutions shall not be used in advertising or otherwise to promote the
 * sale, use or other dealings in this Software without prior written
 * authorization from the authors.
 */


/*
 * lpc23xx-uart.c
 */

#include <stdint.h>
#include "lpc23xx.h"

#include "lpc23xx-pll.h"

#include "lpc23xx-uart.h"

struct uart0_status uart0stat;

/*
 * uart0_query_baud
 */
Baud uart0_query_baud(void) {
    return(uart0stat.baudrate);
}

/*
 * uart0_query_charlength
 */
uint8_t uart0_query_charlength(void) {
    return(uart0stat.charlength);
}

/*
 * uart0_query_stopbits
 */
uint8_t uart0_query_stopbits(void) {
    return(uart0stat.stopbits);
}

/*
 * uart_0_init_9600
 * initialize uart0
 */
void uart0_init_9600(void) {

    Freq     cclk;

    uart0stat.baudrate = ZERO_H_B;

    // Enable GPIO for TXD/RXD
    SET_RXD0_TXD0;

    // turn on power.
    POWER_ON_UART0;

    // divide cclk by one
    PCLKSEL0_UART0_DIV1;

    // enable divisor latch access
    SET_DLAB0;

    cclk = pllquery_cclk_mhz();

    switch(cclk) {
        case FOURTY_EIGHT_MHZ:
            U0DLL = 208;
            U0DLM = 0;
            U0FDR = (2<<4) | 1; // MULVAL = 2, DIVADD = 1;
            break;
        case SIXTY_MHZ:
            U0DLL = 4;
            U0DLM = 1;
            U0FDR = (2<<4) | 1; // MULVAL = 2, DIVADD = 1;
            break;
        case SEVENTY_TWO_MHZ:
            U0DLL = 56;
            U0DLM = 1;
            U0FDR = (2<<4) | 1; // MULVAL = 2, DIVADD = 1;
            break;
        default:
            while(1);
            break;
    }
    // enable interrupt
    UART0_FCR_ONE_CHAR_EN;

    // set parameters
    UART0_8N1;

    uart0stat.charlength = 8;
    uart0stat.stopbits   = 1;

    CLEAR_DLAB0;

    uart0stat.baudrate = NINETY_SIX_H_B;

}


/*
 * uart_0_init_115200
 * initialize uart0
 */
void uart0_init_115200(void) {

    Freq     cclk;

    uart0stat.baudrate = ZERO_H_B;

    // Enable GPIO for TXD/RXD
    SET_RXD0_TXD0;

    // turn on power.
    POWER_ON_UART0;

    // divide cclk by one
    PCLKSEL0_UART0_DIV1;

    // enable divisor latch access
    SET_DLAB0;

    cclk = pllquery_cclk_mhz();

    switch(cclk) {
        case FOURTY_EIGHT_MHZ:
            U0DLL = 17;
            U0DLM = 0;
            U0FDR = (15<<4) | 8; // MULVAL = 15, DIVADD = 8;
            break;
        case SIXTY_MHZ:
            U0DLL = 21;
            U0DLM = 0;
            U0FDR = (11<<4) | 6; // MULVAL = 11, DIVADD = 6;
            break;
        case SEVENTY_TWO_MHZ:
            U0DLL = 26;
            U0DLM = 0;
            U0FDR = (2<<4) | 1; // MULVAL = 11, DIVADD = 6;
            break;
        default:
            while(1);
            break;
    }
    // enable interrupt
    UART0_FCR_ONE_CHAR_EN;

    // set parameters
    UART0_8N1;

    uart0stat.charlength = 8;
    uart0stat.stopbits   = 1;

    CLEAR_DLAB0;


    uart0stat.baudrate = ONE_FIFTEEN_TWO_H_B;

}

/*
 * uart0_putchar
 */
void uart0_putchar(char ch) {
    if (ch == '\n') {
        while (!(U0THR_EMPTY));
        U0THR = '\r';
    }
    while (!(U0THR_EMPTY));
    U0THR = ch;
}


/*
 * uart0_putstring
 * -------------------------------------
 * put a string to the serial port
 *
 * Assumes null termination of string.
 */
void uart0_putstring(const char *s) {

    while(*s ) {
        uart0_putchar(*s++); // put the char
    }
}


/*
 * uart0_getchar
 */
char uart0_getchar (void)  {

    while (!U0RDR_READY);

    return (U0RBR);
}


/*
 * uart0_getstring
 * --------------------------------------
 * receive chars from the serial port until
 *   '\n'.
 * maximum length of line is UART_MAXBUFFER-1 chars.
 */
char* uart0_getstring (void) {

    static char uart0_linebuffer[UART_MAXBUFFER] ;

    char    current = ' ';
    uint32_t   index   = 0;

    while((current != '\n' && current != '\r') && index < UART_MAXBUFFER-1) {
        current                 = uart0_getchar();
        uart0_linebuffer[index] = current;
        ++index;
    }
    uart0_linebuffer[index]     = '\0';

    return(uart0_linebuffer);
}

