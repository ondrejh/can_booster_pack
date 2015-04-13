//*****************************************************************************
//
// project.c - Simple project to use as a starting point for more complex
//             projects.
//
// Copyright (c) 2013-2014 Texas Instruments Incorporated.  All rights reserved.
// Software License Agreement
//
//   Redistribution and use in source and binary forms, with or without
//   modification, are permitted provided that the following conditions
//   are met:
//
//   Redistributions of source code must retain the above copyright
//   notice, this list of conditions and the following disclaimer.
//
//   Redistributions in binary form must reproduce the above copyright
//   notice, this list of conditions and the following disclaimer in the
//   documentation and/or other materials provided with the
//   distribution.
//
//   Neither the name of Texas Instruments Incorporated nor the names of
//   its contributors may be used to endorse or promote products derived
//   from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// This is part of revision 2.1.0.12573 of the Tiva Firmware Development Package.
//
//*****************************************************************************

#include <stdbool.h>
#include <stdint.h>
#include "inc/hw_can.h"
#include "inc/hw_ints.h"
#include "inc/hw_memmap.h"
#include "inc/hw_types.h"
#include "inc/hw_gpio.h"
#include "driverlib/can.h"
#include "driverlib/debug.h"
#include "driverlib/gpio.h"
#include "driverlib/interrupt.h"
#include "driverlib/pin_map.h"
#include "driverlib/rom.h"
#include "driverlib/sysctl.h"
#include "driverlib/uart.h"
#include "driverlib/timer.h"
#include "utils/uartstdio.h"

//*****************************************************************************
//
//! \addtogroup example_list
//! <h1>Simple Project (project)</h1>
//!
//! A very simple example that can be used as a starting point for more complex
//! projects.  Most notably, this project is fully TI BSD licensed, so any and
//! all of the code (including the startup code) can be used as allowed by that
//! license.
//!
//! The provided code simply toggles a GPIO using the Tiva Peripheral Driver
//! Library.
//
//*****************************************************************************

#define LED_CAN_RX_ON() do{GPIOPinWrite(GPIO_PORTD_BASE,GPIO_PIN_6,GPIO_PIN_6);}while(0)
#define LED_CAN_RX_OFF() do{GPIOPinWrite(GPIO_PORTD_BASE,GPIO_PIN_6,0);}while(0)
#define LED_CAN_TX_ON() do{GPIOPinWrite(GPIO_PORTD_BASE,GPIO_PIN_7,GPIO_PIN_7);}while(0)
#define LED_CAN_TX_OFF() do{GPIOPinWrite(GPIO_PORTD_BASE,GPIO_PIN_7,0);}while(0)

#define UART_RX_BUFF_SIZE 64

//*****************************************************************************
//
// The error routine that is called if the driver library encounters an error.
//
//*****************************************************************************
#ifdef DEBUG
void
__error__(char *pcFilename, uint32_t ui32Line)
{
}
#endif

void debugConsoleInit(void)
{
  // enable GPIO port A which is used for UART0
  SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);
  GPIOPinConfigure(GPIO_PA0_U0RX);
  GPIOPinConfigure(GPIO_PA1_U0TX);

  // enable UART0
  SysCtlPeripheralEnable(SYSCTL_PERIPH_UART0);
  UARTClockSourceSet(UART0_BASE, UART_CLOCK_PIOSC); // use internal 16MHz osc.
  GPIOPinTypeUART(GPIO_PORTA_BASE, GPIO_PIN_0 | GPIO_PIN_1);
  UARTStdioConfig(0, 1000000, 16000000);
}

volatile uint32_t g_ui32MsgCount = 0;
volatile bool g_bRXFlag = 0;
volatile bool g_bErrFlag = 0;

void CANIntHandler(void)
{
  uint32_t ui32Status;

  ui32Status = CANIntStatus(CAN0_BASE, CAN_INT_STS_CAUSE);

  // controller status interrupt
  if (ui32Status == CAN_INT_INTID_STATUS) {
    ui32Status = CANStatusGet(CAN0_BASE, CAN_STS_CONTROL);
    g_bErrFlag = 1;
  }
  // receive message
  else if (ui32Status == 1) {
    CANIntClear(CAN0_BASE, 1);
    g_ui32MsgCount++;
    g_bRXFlag = 1;
    g_bErrFlag = 0;
  }
  // this should never happen
  else {
  }
}

int h2i(char c)
{
    if ((c>='0') && (c<='9'))
        return (c-'0');
    if ((c>='A') && (c<='F'))
        return (c-'A'+10);
    if ((c>='a') && (c<='f'))
        return (c-'a'+10);
    return -1;
}

int UartUseBuffer(char *buff)
{
    int cnt;
    char c;

    uint32_t id = 0;
    bool typeB = false;
    int dlen = 0;
    uint8_t data[8];

    for (cnt=0;cnt<9;cnt++) {
        c = *buff++;
        if (c=='.')
            break;
        int i = h2i(c);
        if (i<0)
            break;
        id<<=4;
        id|=i;
    }
    if (cnt==8)
        typeB = true;
    else if (cnt==3)
        typeB = false;
    else
        return -1; // wrong ID length (should be 3 for A or 8 for B type)
    cnt++;

    for (;cnt<UART_RX_BUFF_SIZE;cnt+=2) {
        c = *buff++;
        if ((c=='.')||(c=='\0'))
            break;
        int iH = h2i(c);
        int iL = h2i(*buff++);
        if ((iH<0)|(iL<0))
            return -2;
        data[dlen++]=(iH<<4)|iL;
    }

    UARTprintf("Ahoj\n");
    return(0);
}
//*****************************************************************************
//
// Toggle a GPIO.
//
//*****************************************************************************
int main(void)
{
    debugConsoleInit();

    tCANMsgObject sCANMessage;
    uint8_t pui8MsgData[8];

    SysCtlClockSet(SYSCTL_SYSDIV_1 | SYSCTL_USE_OSC | SYSCTL_OSC_MAIN | SYSCTL_XTAL_16MHZ);

    // init CAN TX/RX led outputs
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);
    // unlock GPIOD7
    HWREG(GPIO_PORTD_BASE + GPIO_O_LOCK) = GPIO_LOCK_KEY;
    HWREG(GPIO_PORTD_BASE + GPIO_O_CR)  |= 0x80;
    HWREG(GPIO_PORTD_BASE + GPIO_O_LOCK) = 0;
    GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_6|GPIO_PIN_7);
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_6|GPIO_PIN_7, GPIO_PIN_6|GPIO_PIN_7);
    SysCtlDelay(2000000);
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_6|GPIO_PIN_7, 0);
    SysCtlDelay(2000000);

    SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER0);
    TimerConfigure(TIMER0_BASE, TIMER_CFG_PERIODIC_UP);
    //TimerRTCEnable(TIMER0_BASE);
    TimerEnable(TIMER0_BASE, TIMER_BOTH);

    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOE);
    GPIOPinConfigure(GPIO_PE4_CAN0RX);
    GPIOPinConfigure(GPIO_PE5_CAN0TX);
    GPIOPinTypeCAN(GPIO_PORTE_BASE, GPIO_PIN_4 | GPIO_PIN_5);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_CAN0);
    CANInit(CAN0_BASE);
    CANBitRateSet(CAN0_BASE, SysCtlClockGet(), 250000);
    CANIntEnable(CAN0_BASE, CAN_INT_MASTER | CAN_INT_ERROR | CAN_INT_STATUS);
    IntEnable(INT_CAN0);
    CANEnable(CAN0_BASE);

    sCANMessage.ui32MsgID = 0;
    sCANMessage.ui32MsgIDMask = 0;
    sCANMessage.ui32Flags = MSG_OBJ_RX_INT_ENABLE | MSG_OBJ_USE_ID_FILTER;
    sCANMessage.ui32MsgLen = 8;

    CANMessageSet(CAN0_BASE, 1, &sCANMessage, MSG_OBJ_TYPE_RX);

    //
    // Enable the GPIO module.
    //
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
    GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_1);

    int32_t rxLedOn = 0;
    uint32_t tRxLed = TimerValueGet(TIMER0_BASE,TIMER_B);
    uint32_t last_tRxLed = tRxLed;

    int UartRxBuffCnt = 0;
    char UartRxBuff[UART_RX_BUFF_SIZE];
    //UARTprintf("CAN booster pack FW .. receiving CanBus messages:\n");

    //
    // Loop forever.
    //
    while(1)
    {
        unsigned int uIdx;

        if (g_bRXFlag) {
            GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1, GPIO_PIN_1);

            //uint32_t tFast = TimerValueGet(TIMER0_BASE,TIMER_A); // faster time ticks
            uint32_t tSlow = TimerValueGet(TIMER0_BASE,TIMER_B); // slower time ticks

            sCANMessage.pui8MsgData = pui8MsgData;
            CANMessageGet(CAN0_BASE, 1, &sCANMessage, 0);
            g_bRXFlag = 0;
            UARTprintf(":%04X",tSlow);
            if(sCANMessage.ui32Flags & MSG_OBJ_DATA_LOST) {
                UARTprintf(".ERROR\n");
                sCANMessage.ui32Flags &= ~MSG_OBJ_DATA_LOST;
                CANMessageSet(CAN0_BASE, 1, &sCANMessage, MSG_OBJ_TYPE_RX);
            }
            if (sCANMessage.ui32Flags & MSG_OBJ_EXTENDED_ID)
                UARTprintf(".%08X."/*%u."*/,sCANMessage.ui32MsgID);//, sCANMessage.ui32MsgLen);
            else
                UARTprintf(".%03X.",sCANMessage.ui32MsgID);
            for (uIdx = 0; uIdx<sCANMessage.ui32MsgLen; uIdx++)
                UARTprintf("%02X",pui8MsgData[uIdx]);
            //UARTprintf("total count=%u\n",g_ui32MsgCount);
            UARTprintf("\n");

            //SysCtlDelay(100000);
            GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1, 0);
            rxLedOn = 10;
        }

        // rx Led timing
        tRxLed = TimerValueGet(TIMER0_BASE,TIMER_B);
        rxLedOn -= (tRxLed-last_tRxLed);
        if (rxLedOn<=0) {
          rxLedOn = 0;
          LED_CAN_RX_OFF();
        }
        else {
          LED_CAN_RX_ON();
        }
        last_tRxLed = tRxLed;

        //int chr = UARTCharGetNonBlocking(UART0_BASE);
        //if (chr>=0) {
        if (UARTCharsAvail(UART0_BASE)) {
            //char c = chr;
            char c = UARTCharGet(UART0_BASE);
            if (c==':') {
                // reset
                UartRxBuffCnt=0;
                LED_CAN_TX_ON();
            }
            else if ((c=='\r')||(c=='\n')) {
                // insert end of string
                UartRxBuff[UartRxBuffCnt]='\0';
                LED_CAN_TX_OFF();
            }
            else {
                UartRxBuff[UartRxBuffCnt++] = c;
            }
        }
        /*static int cnt = 0;
        UARTprintf("ahoj vole %d\n",cnt++);
        //
        // Set the GPIO high.
        //
        ROM_GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1, GPIO_PIN_1);

        //
        // Delay for a while.
        //
        ROM_SysCtlDelay(1000000);

        //
        // Set the GPIO low.
        //
        ROM_GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1, 0);

        //
        // Delay for a while.
        //
        ROM_SysCtlDelay(10000000);*/
    }
}
