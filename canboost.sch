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
LIBS:bus_choke
LIBS:canboost-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "21 nov 2014"
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
P 5350 5100
F 0 "IC1" H 5100 5400 40  0000 C CNN
F 1 "MCP2551-I/SN" H 5600 4800 40  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 6000 4700 30  0000 C CIN
F 3 "" H 5350 5100 60  0000 C CNN
	1    5350 5100
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 P3
U 1 1 546E41AA
P 8750 5100
F 0 "P3" V 8700 5100 40  0000 C CNN
F 1 "CONN_2" V 8800 5100 40  0000 C CNN
F 2 "Sockets_MOLEX_KK-System:Socket_MOLEX-KK-RM3-96mm_Lock_2pin_straight" H 8750 5400 30  0000 C CNN
F 3 "" H 8750 5100 60  0000 C CNN
	1    8750 5100
	1    0    0    1   
$EndComp
Wire Wire Line
	5800 5000 6700 5000
Wire Wire Line
	6700 5000 6800 5000
Wire Wire Line
	5800 5200 5900 5200
Wire Wire Line
	5900 5200 6800 5200
$Comp
L R R1
U 1 1 546E4226
P 6700 4650
F 0 "R1" V 6780 4650 40  0000 C CNN
F 1 "120" V 6707 4651 40  0000 C CNN
F 2 "SMD_Packages:SMD-0805" H 7100 4550 30  0000 C CNN
F 3 "~" H 6700 4650 30  0000 C CNN
	1    6700 4650
	1    0    0    -1  
$EndComp
$Comp
L JUMPER JP1
U 1 1 546E425B
P 6300 4300
F 0 "JP1" H 6300 4450 60  0000 C CNN
F 1 "JUMPER" H 6300 4220 40  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 6300 4550 30  0000 C CNN
F 3 "~" H 6300 4300 60  0000 C CNN
	1    6300 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 5000 6700 4900
Connection ~ 6700 5000
Wire Wire Line
	6700 4300 6700 4400
Wire Wire Line
	6700 4300 6600 4300
Wire Wire Line
	6000 4300 5900 4300
Wire Wire Line
	5900 4300 5900 5200
$Comp
L GND #PWR01
U 1 1 546E42D4
P 5350 6000
F 0 "#PWR01" H 5350 6000 30  0001 C CNN
F 1 "GND" H 5350 5930 30  0001 C CNN
F 2 "" H 5350 6000 60  0000 C CNN
F 3 "" H 5350 6000 60  0000 C CNN
	1    5350 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 5500 5350 6000
$Comp
L VDD #PWR02
U 1 1 546E42FC
P 5350 4600
F 0 "#PWR02" H 5350 4700 30  0001 C CNN
F 1 "VDD" H 5350 4710 30  0000 C CNN
F 2 "" H 5350 4600 60  0000 C CNN
F 3 "" H 5350 4600 60  0000 C CNN
	1    5350 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4600 5350 4700
Connection ~ 5900 5200
$Comp
L R R2
U 1 1 546E4345
P 4800 5650
F 0 "R2" V 4880 5650 40  0000 C CNN
F 1 "1k0" V 4807 5651 40  0000 C CNN
F 2 "SMD_Packages:SMD-0805" V 4700 5650 30  0000 C CNN
F 3 "~" H 4800 5650 30  0000 C CNN
	1    4800 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 5400 4800 5300
Wire Wire Line
	4800 5300 4900 5300
$Comp
L GND #PWR03
U 1 1 546E436D
P 4800 6000
F 0 "#PWR03" H 4800 6000 30  0001 C CNN
F 1 "GND" H 4800 5930 30  0001 C CNN
F 2 "" H 4800 6000 60  0000 C CNN
F 3 "" H 4800 6000 60  0000 C CNN
	1    4800 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 5900 4800 6000
Text GLabel 3850 4900 0    47   Input ~ 0
PE4_CAN0RX
Text GLabel 3850 5000 0    47   Input ~ 0
PE5_CAN0TX
$Comp
L R R4
U 1 1 546E44B9
P 4550 4900
F 0 "R4" V 4630 4900 40  0000 C CNN
F 1 "100" V 4557 4901 40  0000 C CNN
F 2 "SMD_Packages:SMD-0805" V 4700 4900 30  0000 C CNN
F 3 "~" H 4550 4900 30  0000 C CNN
	1    4550 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4800 4900 4900 4900
Wire Wire Line
	4300 4900 3850 4900
$Comp
L R R3
U 1 1 546E451B
P 4550 5000
F 0 "R3" V 4450 5000 40  0000 C CNN
F 1 "100" V 4557 5001 40  0000 C CNN
F 2 "SMD_Packages:SMD-0805" V 4400 5000 30  0000 C CNN
F 3 "~" H 4550 5000 30  0000 C CNN
	1    4550 5000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4800 5000 4900 5000
Wire Wire Line
	4300 5000 3850 5000
$Comp
L GND #PWR04
U 1 1 546E45DE
P 4250 6000
F 0 "#PWR04" H 4250 6000 30  0001 C CNN
F 1 "GND" H 4250 5930 30  0001 C CNN
F 2 "" H 4250 6000 60  0000 C CNN
F 3 "" H 4250 6000 60  0000 C CNN
	1    4250 6000
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 546E4606
P 4250 5700
F 0 "C1" H 4250 5800 40  0000 L CNN
F 1 "100n" H 4256 5615 40  0000 L CNN
F 2 "SMD_Packages:SMD-0805" V 4100 5750 30  0000 C CNN
F 3 "~" H 4250 5700 60  0000 C CNN
	1    4250 5700
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR05
U 1 1 546E4613
P 4250 5400
F 0 "#PWR05" H 4250 5500 30  0001 C CNN
F 1 "VDD" H 4250 5510 30  0000 C CNN
F 2 "" H 4250 5400 60  0000 C CNN
F 3 "" H 4250 5400 60  0000 C CNN
	1    4250 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 5400 4250 5500
Wire Wire Line
	4250 6000 4250 5900
$Comp
L CONN_10X2 P1
U 1 1 546E4C1D
P 2500 2250
F 0 "P1" H 2500 2800 60  0000 C CNN
F 1 "CONN_10X2" V 2500 2150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x10" H 2500 1650 30  0000 C CNN
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
F 2 "Pin_Headers:Pin_Header_Straight_2x10" H 9400 1650 30  0000 C CNN
F 3 "" H 9400 2250 60  0000 C CNN
	1    9400 2250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 546E4CA4
P 3000 2000
F 0 "#PWR06" H 3000 2000 30  0001 C CNN
F 1 "GND" H 3000 1930 30  0001 C CNN
F 2 "" H 3000 2000 60  0000 C CNN
F 3 "" H 3000 2000 60  0000 C CNN
	1    3000 2000
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR07
U 1 1 546E4CAF
P 3000 1700
F 0 "#PWR07" H 3000 1800 30  0001 C CNN
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
P 7050 5000
F 0 "R6" V 7130 5000 40  0000 C CNN
F 1 "4R7" V 7057 5001 40  0000 C CNN
F 2 "SMD_Packages:SMD-0805" V 7200 4900 30  0000 C CNN
F 3 "~" H 7050 5000 30  0000 C CNN
	1    7050 5000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7300 5000 7700 5000
Wire Wire Line
	7700 5000 7800 5000
$Comp
L R R5
U 1 1 546E4FCC
P 7050 5200
F 0 "R5" V 7130 5200 40  0000 C CNN
F 1 "4R7" V 7057 5201 40  0000 C CNN
F 2 "SMD_Packages:SMD-0805" V 6950 5200 30  0000 C CNN
F 3 "~" H 7050 5200 30  0000 C CNN
	1    7050 5200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7300 5200 7400 5200
Wire Wire Line
	7400 5200 7800 5200
$Comp
L ZENER D1
U 1 1 546F81F0
P 7400 5600
F 0 "D1" H 7400 5700 50  0000 C CNN
F 1 "ZENER" H 7400 5500 40  0000 C CNN
F 2 "Diodes_SMD:Diode-SMA_Handsoldering" V 6900 5400 30  0000 C CNN
F 3 "~" H 7400 5600 60  0000 C CNN
	1    7400 5600
	0    -1   -1   0   
$EndComp
$Comp
L ZENER D2
U 1 1 546F81FF
P 7700 5600
F 0 "D2" H 7700 5700 50  0000 C CNN
F 1 "ZENER" H 7700 5500 40  0000 C CNN
F 2 "Diodes_SMD:Diode-SMA_Handsoldering" V 7150 5700 30  0000 C CNN
F 3 "~" H 7700 5600 60  0000 C CNN
	1    7700 5600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7400 5400 7400 5200
Connection ~ 7400 5200
Wire Wire Line
	7700 5400 7700 5000
Connection ~ 7700 5000
$Comp
L GND #PWR08
U 1 1 546F8269
P 7400 6000
F 0 "#PWR08" H 7400 6000 30  0001 C CNN
F 1 "GND" H 7400 5930 30  0001 C CNN
F 2 "" H 7400 6000 60  0000 C CNN
F 3 "" H 7400 6000 60  0000 C CNN
	1    7400 6000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 546F826F
P 7700 6000
F 0 "#PWR09" H 7700 6000 30  0001 C CNN
F 1 "GND" H 7700 5930 30  0001 C CNN
F 2 "" H 7700 6000 60  0000 C CNN
F 3 "" H 7700 6000 60  0000 C CNN
	1    7700 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 6000 7400 5800
Wire Wire Line
	7700 6000 7700 5800
$Comp
L LED D3
U 1 1 546F83C6
P 6100 2800
F 0 "D3" H 6100 2900 50  0000 C CNN
F 1 "LED" H 6100 2700 50  0000 C CNN
F 2 "LEDs:LED-0805" H 6100 3000 30  0000 C CNN
F 3 "~" H 6100 2800 60  0000 C CNN
	1    6100 2800
	1    0    0    -1  
$EndComp
$Comp
L LED D4
U 1 1 546F83D5
P 6100 3100
F 0 "D4" H 6100 3200 50  0000 C CNN
F 1 "LED" H 6100 3000 50  0000 C CNN
F 2 "LEDs:LED-0805" H 6100 2900 30  0000 C CNN
F 3 "~" H 6100 3100 60  0000 C CNN
	1    6100 3100
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 546F8416
P 5650 2800
F 0 "R7" V 5730 2800 40  0000 C CNN
F 1 "470" V 5657 2801 40  0000 C CNN
F 2 "SMD_Packages:SMD-0805" V 5550 2800 30  0000 C CNN
F 3 "~" H 5650 2800 30  0000 C CNN
	1    5650 2800
	0    -1   -1   0   
$EndComp
$Comp
L R R8
U 1 1 546F8425
P 5650 3100
F 0 "R8" V 5730 3100 40  0000 C CNN
F 1 "470" V 5657 3101 40  0000 C CNN
F 2 "SMD_Packages:SMD-0805" V 5800 3100 30  0000 C CNN
F 3 "~" H 5650 3100 30  0000 C CNN
	1    5650 3100
	0    -1   -1   0   
$EndComp
$Comp
L VDD #PWR010
U 1 1 546F8486
P 5300 2700
F 0 "#PWR010" H 5300 2800 30  0001 C CNN
F 1 "VDD" H 5300 2810 30  0000 C CNN
F 2 "" H 5300 2700 60  0000 C CNN
F 3 "" H 5300 2700 60  0000 C CNN
	1    5300 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2700 5300 2800
Wire Wire Line
	5300 2800 5300 3100
Wire Wire Line
	5300 3100 5400 3100
Wire Wire Line
	5400 2800 5300 2800
Connection ~ 5300 2800
Wire Wire Line
	6300 3100 6400 3100
Wire Wire Line
	6300 2800 6400 2800
Text GLabel 6400 2800 2    47   Input ~ 0
PB0_LED_RX
Text GLabel 6400 3100 2    47   Input ~ 0
PB1_LED_TX
$Comp
L BUS_CHOKE L1
U 1 1 546F8F8B
P 8050 5100
F 0 "L1" H 8050 4900 60  0000 C CNN
F 1 "B82789C513N002" H 8050 5300 60  0000 C CNN
F 2 "My footprints:SIMDAD_1812" H 8050 5400 30  0000 C CNN
F 3 "~" H 8050 5100 60  0000 C CNN
	1    8050 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 5000 8400 5000
Wire Wire Line
	8300 5200 8400 5200
Text GLabel 1900 2000 0    47   Input ~ 0
PB0_LED_RX
Text GLabel 1900 2100 0    47   Input ~ 0
PB1_LED_TX
Wire Wire Line
	1900 2000 2100 2000
Wire Wire Line
	1900 2100 2100 2100
$EndSCHEMATC
