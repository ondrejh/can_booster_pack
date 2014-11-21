EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:canboost-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "20 nov 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCP2551-I/SN IC1
U 1 1 546E4178
P 5600 3800
F 0 "IC1" H 5350 4100 40  0000 C CNN
F 1 "MCP2551-I/SN" H 5850 3500 40  0000 C CNN
F 2 "SO8" H 5600 3800 35  0000 C CIN
F 3 "" H 5600 3800 60  0000 C CNN
	1    5600 3800
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 P3
U 1 1 546E41AA
P 8000 3800
F 0 "P3" V 7950 3800 40  0000 C CNN
F 1 "CONN_2" V 8050 3800 40  0000 C CNN
F 2 "" H 8000 3800 60  0000 C CNN
F 3 "" H 8000 3800 60  0000 C CNN
	1    8000 3800
	1    0    0    1   
$EndComp
Wire Wire Line
	6050 3700 6950 3700
Wire Wire Line
	6950 3700 7050 3700
Wire Wire Line
	6050 3900 6150 3900
Wire Wire Line
	6150 3900 7050 3900
$Comp
L R R1
U 1 1 546E4226
P 6950 3350
F 0 "R1" V 7030 3350 40  0000 C CNN
F 1 "120" V 6957 3351 40  0000 C CNN
F 2 "~" V 6880 3350 30  0000 C CNN
F 3 "~" H 6950 3350 30  0000 C CNN
	1    6950 3350
	1    0    0    -1  
$EndComp
$Comp
L JUMPER JP1
U 1 1 546E425B
P 6550 3000
F 0 "JP1" H 6550 3150 60  0000 C CNN
F 1 "JUMPER" H 6550 2920 40  0000 C CNN
F 2 "~" H 6550 3000 60  0000 C CNN
F 3 "~" H 6550 3000 60  0000 C CNN
	1    6550 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 3700 6950 3600
Connection ~ 6950 3700
Wire Wire Line
	6950 3000 6950 3100
Wire Wire Line
	6950 3000 6850 3000
Wire Wire Line
	6250 3000 6150 3000
Wire Wire Line
	6150 3000 6150 3900
$Comp
L GND #PWR?
U 1 1 546E42D4
P 5600 4700
F 0 "#PWR?" H 5600 4700 30  0001 C CNN
F 1 "GND" H 5600 4630 30  0001 C CNN
F 2 "" H 5600 4700 60  0000 C CNN
F 3 "" H 5600 4700 60  0000 C CNN
	1    5600 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 4200 5600 4700
$Comp
L VDD #PWR?
U 1 1 546E42FC
P 5600 3300
F 0 "#PWR?" H 5600 3400 30  0001 C CNN
F 1 "VDD" H 5600 3410 30  0000 C CNN
F 2 "" H 5600 3300 60  0000 C CNN
F 3 "" H 5600 3300 60  0000 C CNN
	1    5600 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3300 5600 3400
Connection ~ 6150 3900
$Comp
L R R2
U 1 1 546E4345
P 5050 4350
F 0 "R2" V 5130 4350 40  0000 C CNN
F 1 "1k0" V 5057 4351 40  0000 C CNN
F 2 "~" V 4980 4350 30  0000 C CNN
F 3 "~" H 5050 4350 30  0000 C CNN
	1    5050 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 4100 5050 4000
Wire Wire Line
	5050 4000 5150 4000
$Comp
L GND #PWR?
U 1 1 546E436D
P 5050 4700
F 0 "#PWR?" H 5050 4700 30  0001 C CNN
F 1 "GND" H 5050 4630 30  0001 C CNN
F 2 "" H 5050 4700 60  0000 C CNN
F 3 "" H 5050 4700 60  0000 C CNN
	1    5050 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 4600 5050 4700
Text GLabel 4100 3600 0    47   Input ~ 0
PE4_CAN0RX
Text GLabel 4100 3700 0    47   Input ~ 0
PE5_CAN0TX
$Comp
L R R4
U 1 1 546E44B9
P 4800 3600
F 0 "R4" V 4880 3600 40  0000 C CNN
F 1 "100" V 4807 3601 40  0000 C CNN
F 2 "~" V 4730 3600 30  0000 C CNN
F 3 "~" H 4800 3600 30  0000 C CNN
	1    4800 3600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5050 3600 5150 3600
Wire Wire Line
	4550 3600 4100 3600
$Comp
L R R3
U 1 1 546E451B
P 4800 3700
F 0 "R3" V 4700 3700 40  0000 C CNN
F 1 "100" V 4807 3701 40  0000 C CNN
F 2 "~" V 4730 3700 30  0000 C CNN
F 3 "~" H 4800 3700 30  0000 C CNN
	1    4800 3700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5050 3700 5150 3700
Wire Wire Line
	4550 3700 4100 3700
$Comp
L GND #PWR?
U 1 1 546E45DE
P 4500 4700
F 0 "#PWR?" H 4500 4700 30  0001 C CNN
F 1 "GND" H 4500 4630 30  0001 C CNN
F 2 "" H 4500 4700 60  0000 C CNN
F 3 "" H 4500 4700 60  0000 C CNN
	1    4500 4700
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 546E4606
P 4500 4400
F 0 "C1" H 4500 4500 40  0000 L CNN
F 1 "100n" H 4506 4315 40  0000 L CNN
F 2 "~" H 4538 4250 30  0000 C CNN
F 3 "~" H 4500 4400 60  0000 C CNN
	1    4500 4400
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR?
U 1 1 546E4613
P 4500 4100
F 0 "#PWR?" H 4500 4200 30  0001 C CNN
F 1 "VDD" H 4500 4210 30  0000 C CNN
F 2 "" H 4500 4100 60  0000 C CNN
F 3 "" H 4500 4100 60  0000 C CNN
	1    4500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 4100 4500 4200
Wire Wire Line
	4500 4700 4500 4600
$Comp
L CONN_10X2 P1
U 1 1 546E4C1D
P 2500 2250
F 0 "P1" H 2500 2800 60  0000 C CNN
F 1 "CONN_10X2" V 2500 2150 50  0000 C CNN
F 2 "" H 2500 2250 60  0000 C CNN
F 3 "" H 2500 2250 60  0000 C CNN
	1    2500 2250
	1    0    0    -1  
$EndComp
$Comp
L CONN_10X2 P2
U 1 1 546E4C2C
P 9400 2250
F 0 "P2" H 9400 2800 60  0000 C CNN
F 1 "CONN_10X2" V 9400 2150 50  0000 C CNN
F 2 "" H 9400 2250 60  0000 C CNN
F 3 "" H 9400 2250 60  0000 C CNN
	1    9400 2250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 546E4CA4
P 3000 2000
F 0 "#PWR?" H 3000 2000 30  0001 C CNN
F 1 "GND" H 3000 1930 30  0001 C CNN
F 2 "" H 3000 2000 60  0000 C CNN
F 3 "" H 3000 2000 60  0000 C CNN
	1    3000 2000
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR?
U 1 1 546E4CAF
P 3000 1700
F 0 "#PWR?" H 3000 1800 30  0001 C CNN
F 1 "VDD" H 3000 1810 30  0000 C CNN
F 2 "" H 3000 1700 60  0000 C CNN
F 3 "" H 3000 1700 60  0000 C CNN
	1    3000 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1800 3000 1800
Wire Wire Line
	3000 1800 3000 1700
Wire Wire Line
	3000 1900 3000 2000
Wire Wire Line
	3000 1900 2900 1900
Wire Wire Line
	2100 2200 1900 2200
Wire Wire Line
	2100 2300 1900 2300
Text GLabel 1900 2200 0    47   Input ~ 0
PE4_CAN0RX
Text GLabel 1900 2300 0    47   Input ~ 0
PE5_CAN0TX
$Comp
L R R6
U 1 1 546E4F87
P 7300 3700
F 0 "R6" V 7380 3700 40  0000 C CNN
F 1 "4R7" V 7307 3701 40  0000 C CNN
F 2 "~" V 7230 3700 30  0000 C CNN
F 3 "~" H 7300 3700 30  0000 C CNN
	1    7300 3700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7550 3700 7650 3700
$Comp
L R R5
U 1 1 546E4FCC
P 7300 3900
F 0 "R5" V 7380 3900 40  0000 C CNN
F 1 "4R7" V 7307 3901 40  0000 C CNN
F 2 "~" V 7230 3900 30  0000 C CNN
F 3 "~" H 7300 3900 30  0000 C CNN
	1    7300 3900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7550 3900 7650 3900
$EndSCHEMATC
