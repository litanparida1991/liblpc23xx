
/*
 * lpc23xx-uart.c
 */

#include <stdint.h>
#include "lpc23xx.h"

#include "lpc23xx-pll.h"

#include "lpc23xx-uart.h"

//    #include "olimexlpcp2378reva.h"

#ifdef OLIMEXLPCP2378REVA
    #include "olimexlpcp2378reva.h"
#elif LPC2368PSASGFE
    #include "lpc2368-PSAS-GFE"
#else
    #error ***** No board configuration defined. ******
#endif

/*
 * uart_0_init_115200
 * initialize uart0
 */
void uart_0_init_115200 {
    uint16_t divisor;
    Freq     cclk;

    // Enable GPIO for TXD/RXD
    SET_RXD0_TXD0;

    // turn on power.
    POWER_ON_UART0;

    // divide cclk by one
    PCLKSEL0_UART0_DIV1;

    // set parameters
    UART0_8N1;

    // enable divisor latch access
    SET_DLAB0;

    cclk = pllquery_cclk_mhz();

    switch(cclk) {
        case TWELVE_MHZ:
            U0DLL = 4
            U0DLM = 0
            U0FDR = (8<<4) | 5; // MULVAL = 8, DIVADD = 5
            break;
        case FOURTY_EIGHT_MHZ:
            U0DLL = 17
            U0DLM = 0
            U0FDR = (15<<4) | 8; // MULVAL = 15, DIVADD = 8
            break;
        case SIXTY_MHZ:
            U0DLL = 21
            U0DLM = 0
            U0FDR = (11<<4) | 6; // MULVAL = 11, DIVADD = 6
            break;
        default:
            break;
    }
    // enable interrupt
    
    CLEAR_DLAB0;
    UART0_FCR_ONE_CHAR_EN;
    
}

