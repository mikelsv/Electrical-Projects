EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R R1
U 1 1 65A02F9F
P 1500 1350
F 0 "R1" H 1570 1396 50  0000 L CNN
F 1 "10k" H 1570 1305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 1430 1350 50  0001 C CNN
F 3 "~" H 1500 1350 50  0001 C CNN
	1    1500 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 65A0361F
P 2250 1000
F 0 "R2" H 2320 1046 50  0000 L CNN
F 1 "10K" H 2320 955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 2180 1000 50  0001 C CNN
F 3 "~" H 2250 1000 50  0001 C CNN
	1    2250 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 65A037E2
P 2850 1000
F 0 "R3" H 2920 1046 50  0000 L CNN
F 1 "1K" H 2920 955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 2780 1000 50  0001 C CNN
F 3 "~" H 2850 1000 50  0001 C CNN
	1    2850 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 65A03A12
P 3300 1450
F 0 "R4" H 3370 1496 50  0000 L CNN
F 1 "680R" H 3370 1405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3230 1450 50  0001 C CNN
F 3 "~" H 3300 1450 50  0001 C CNN
	1    3300 1450
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q1
U 1 1 65A03E9D
P 2150 1450
F 0 "Q1" H 2340 1496 50  0000 L CNN
F 1 "2N2222" H 2340 1405 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2350 1375 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 2150 1450 50  0001 L CNN
	1    2150 1450
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q2
U 1 1 65A04B6B
P 2750 1550
F 0 "Q2" H 2940 1596 50  0000 L CNN
F 1 "2N2222" H 2940 1505 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2950 1475 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 2750 1550 50  0001 L CNN
	1    2750 1550
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q3
U 1 1 65A05027
P 3200 1900
F 0 "Q3" H 3390 1946 50  0000 L CNN
F 1 "2N2222" H 3390 1855 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 3400 1825 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 3200 1900 50  0001 L CNN
	1    3200 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 65A05504
P 3300 1000
F 0 "D1" V 3339 882 50  0000 R CNN
F 1 "LED" V 3248 882 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 3300 1000 50  0001 C CNN
F 3 "~" H 3300 1000 50  0001 C CNN
	1    3300 1000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_POT SW1
U 1 1 65A060CF
P 1300 1750
F 0 "SW1" H 1231 1796 50  0000 R CNN
F 1 "200K" H 1231 1705 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK09K_Single_Vertical" H 1150 1910 50  0001 C CNN
F 3 "~" H 1300 2010 50  0001 C CNN
	1    1300 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 65A07C0C
P 1800 1600
F 0 "C1" H 1915 1646 50  0000 L CNN
F 1 "22nF" H 1915 1555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 1838 1450 50  0001 C CNN
F 3 "~" H 1800 1600 50  0001 C CNN
	1    1800 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 65A08074
P 3700 1000
F 0 "C2" H 3815 1046 50  0000 L CNN
F 1 "10uF" H 3815 955 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 3738 850 50  0001 C CNN
F 3 "~" H 3700 1000 50  0001 C CNN
	1    3700 1000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J1
U 1 1 65A091F0
P 1100 850
F 0 "J1" H 1050 900 50  0000 C CNN
F 1 "Human +" H 950 800 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 1100 850 50  0001 C CNN
F 3 "~" H 1100 850 50  0001 C CNN
	1    1100 850 
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J2
U 1 1 65A09B81
P 1100 1200
F 0 "J2" H 1050 1250 50  0000 C CNN
F 1 "Human -" H 950 1150 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 1100 1200 50  0001 C CNN
F 3 "~" H 1100 1200 50  0001 C CNN
	1    1100 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 850  3700 850 
Connection ~ 2250 850 
Wire Wire Line
	2250 850  1300 850 
Connection ~ 2850 850 
Wire Wire Line
	2850 850  2250 850 
Connection ~ 3300 850 
Wire Wire Line
	3300 850  2850 850 
Connection ~ 3700 850 
Wire Wire Line
	3700 850  3300 850 
Wire Wire Line
	3700 1150 3950 1150
Wire Wire Line
	3300 1150 3300 1300
Wire Wire Line
	3300 1700 3300 1600
Wire Wire Line
	2850 1150 2850 1350
Wire Wire Line
	2250 1250 2250 1150
Wire Wire Line
	2250 1650 2550 1650
Wire Wire Line
	2550 1650 2550 1550
Wire Wire Line
	2850 1750 2850 1900
Wire Wire Line
	2850 1900 3000 1900
Wire Wire Line
	1500 1550 1650 1550
Wire Wire Line
	1650 1550 1650 1450
Wire Wire Line
	1650 1450 1800 1450
Wire Wire Line
	1800 1450 1950 1450
Connection ~ 1800 1450
Wire Wire Line
	1800 1750 2500 1750
Wire Wire Line
	2500 1750 2500 2100
Wire Wire Line
	2500 2100 3300 2100
Wire Wire Line
	3300 2100 3700 2100
Wire Wire Line
	3700 2100 3700 1150
Connection ~ 3300 2100
Connection ~ 3700 1150
Wire Wire Line
	1500 1500 1500 1550
Wire Wire Line
	1300 1200 1500 1200
$Comp
L Connector:USB_B_Micro J3
U 1 1 65A21B27
P 4300 1000
F 0 "J3" H 4357 1467 50  0000 C CNN
F 1 "USB_B_Micro" H 4357 1376 50  0000 C CNN
F 2 "Connector_USB:USB_Micro_Ali-2Pin" H 4450 950 50  0001 C CNN
F 3 "~" H 4450 950 50  0001 C CNN
	1    4300 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 1400 4300 1500
Wire Wire Line
	4300 1500 3950 1500
Wire Wire Line
	3950 1500 3950 1150
Wire Wire Line
	3950 850  3950 550 
Wire Wire Line
	3950 550  4650 550 
Wire Wire Line
	4650 550  4650 800 
Wire Wire Line
	4650 800  4600 800 
Connection ~ 1500 1550
Connection ~ 1800 1750
Wire Wire Line
	1450 1750 1800 1750
Wire Wire Line
	1500 1900 1300 1900
Wire Wire Line
	1500 1550 1500 1900
$EndSCHEMATC
