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
L Transistor_BJT:2N3904 Q2
U 1 1 65889CCE
P 3900 2150
F 0 "Q2" H 4090 2196 50  0000 L CNN
F 1 "2N5551" H 4090 2105 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4100 2075 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 3900 2150 50  0001 L CNN
	1    3900 2150
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3906 Q1
U 1 1 6588AB2A
P 3250 1850
F 0 "Q1" H 3440 1804 50  0000 L CNN
F 1 "2N5401" H 3440 1895 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 3450 1775 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3906-D.PDF" H 3250 1850 50  0001 L CNN
	1    3250 1850
	1    0    0    1   
$EndComp
$Comp
L power:+12V #PWR0101
U 1 1 6588B716
P 1800 1250
F 0 "#PWR0101" H 1800 1100 50  0001 C CNN
F 1 "+12V" V 1815 1378 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 1800 1250 50  0001 C CNN
F 3 "" H 1800 1250 50  0001 C CNN
	1    1800 1250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 6588C0BD
P 2050 2650
F 0 "#PWR0102" H 2050 2400 50  0001 C CNN
F 1 "GND" V 2055 2522 50  0000 R CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 2050 2650 50  0001 C CNN
F 3 "" H 2050 2650 50  0001 C CNN
	1    2050 2650
	0    1    1    0   
$EndComp
Text Notes 1400 1750 0    50   ~ 0
Power circuit\nПитание схемы\n   12V 1mA
$Comp
L Device:R R1
U 1 1 6588D37E
P 2600 1400
F 0 "R1" H 2670 1446 50  0000 L CNN
F 1 "220K" H 2670 1355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 2530 1400 50  0001 C CNN
F 3 "~" H 2600 1400 50  0001 C CNN
	1    2600 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 6588E227
P 4000 1400
F 0 "R3" H 4070 1446 50  0000 L CNN
F 1 "220K" H 4070 1355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3930 1400 50  0001 C CNN
F 3 "~" H 4000 1400 50  0001 C CNN
	1    4000 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 6588EB0B
P 2600 1850
F 0 "RV1" H 2531 1896 50  0000 R CNN
F 1 "10K" H 2531 1805 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK09K_Single_Vertical" H 2600 1850 50  0001 C CNN
F 3 "~" H 2600 1850 50  0001 C CNN
	1    2600 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV2
U 1 1 6588F3BA
P 2600 2350
F 0 "RV2" H 2531 2396 50  0000 R CNN
F 1 "5K" H 2531 2305 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_ACP_CA6-H2,5_Horizontal" H 2600 2350 50  0001 C CNN
F 3 "~" H 2600 2350 50  0001 C CNN
	1    2600 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 65890C11
P 2950 2350
F 0 "C1" H 3065 2396 50  0000 L CNN
F 1 "1uF" H 3065 2305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2988 2200 50  0001 C CNN
F 3 "~" H 2950 2350 50  0001 C CNN
	1    2950 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 6589487B
P 4600 2200
F 0 "R5" V 4393 2200 50  0000 C CNN
F 1 "1K" V 4484 2200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4530 2200 50  0001 C CNN
F 3 "~" H 4600 2200 50  0001 C CNN
	1    4600 2200
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:IRF540N Q3
U 1 1 6589560C
P 4700 1850
F 0 "Q3" H 4904 1896 50  0000 L CNN
F 1 "IRF530N" H 4904 1805 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 4950 1775 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 4700 1850 50  0001 L CNN
	1    4700 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 65895F39
P 4800 2400
F 0 "R6" H 4730 2354 50  0000 R CNN
F 1 "0.15R" H 4730 2445 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4730 2400 50  0001 C CNN
F 3 "~" H 4800 2400 50  0001 C CNN
	1    4800 2400
	-1   0    0    1   
$EndComp
$Comp
L Device:R R4
U 1 1 6589659C
P 3350 2350
F 0 "R4" H 3420 2396 50  0000 L CNN
F 1 "220K" H 3420 2305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3280 2350 50  0001 C CNN
F 3 "~" H 3350 2350 50  0001 C CNN
	1    3350 2350
	1    0    0    -1  
$EndComp
Text Notes 4350 1500 0    50   ~ 0
Испывтуемый источник питания\nPower supply under test\n0-50V 0-5A 50W
Connection ~ 2600 1250
Wire Wire Line
	4800 2250 4800 2200
Wire Wire Line
	4800 2550 4800 2650
Wire Wire Line
	4800 2650 4000 2650
Wire Wire Line
	2600 2650 2600 2500
Connection ~ 2600 2650
Wire Wire Line
	4800 1650 4800 1600
Wire Wire Line
	4800 1600 4900 1600
Connection ~ 4800 2650
Wire Wire Line
	4750 2200 4800 2200
Connection ~ 4800 2200
Wire Wire Line
	4800 2200 4800 2050
Wire Wire Line
	4000 2350 4000 2650
Connection ~ 4000 2650
Wire Wire Line
	4000 2650 3350 2650
Wire Wire Line
	3350 2500 3350 2650
Connection ~ 3350 2650
Wire Wire Line
	3350 2650 2950 2650
Wire Wire Line
	3350 2200 3350 2150
Wire Wire Line
	3350 2150 3700 2150
Connection ~ 3350 2150
Wire Wire Line
	3350 2150 3350 2050
Wire Wire Line
	4000 1950 4000 1850
Wire Wire Line
	3350 1650 3350 1550
Wire Wire Line
	2750 1850 2950 1850
Wire Wire Line
	2950 2200 2950 1850
Connection ~ 2950 1850
Wire Wire Line
	2950 1850 3050 1850
Wire Wire Line
	2950 2500 2950 2650
Connection ~ 2950 2650
Wire Wire Line
	2950 2650 2600 2650
Wire Wire Line
	2600 2000 2600 2200
Wire Wire Line
	2600 1700 2600 1550
Wire Wire Line
	4500 1850 4000 1850
Connection ~ 4000 1850
Wire Wire Line
	4000 1850 4000 1550
Wire Wire Line
	4450 2200 4450 1650
Wire Wire Line
	4450 1650 3350 1650
Connection ~ 3350 1650
Wire Wire Line
	4800 2650 4900 2650
$Comp
L Connector:Conn_01x01_Male J1
U 1 1 658A5A34
P 1800 1050
F 0 "J1" V 1862 1094 50  0000 L CNN
F 1 "12V" V 1953 1094 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 1800 1050 50  0001 C CNN
F 3 "~" H 1800 1050 50  0001 C CNN
	1    1800 1050
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Male J2
U 1 1 658A6308
P 2100 2850
F 0 "J2" V 2254 2762 50  0000 R CNN
F 1 "GND" V 2163 2762 50  0000 R CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 2100 2850 50  0001 C CNN
F 3 "~" H 2100 2850 50  0001 C CNN
	1    2100 2850
	0    -1   -1   0   
$EndComp
Connection ~ 2100 2650
Wire Wire Line
	2100 2650 2050 2650
$Comp
L Connector:Conn_01x01_Male J3
U 1 1 658A979E
P 5100 1600
F 0 "J3" H 5250 1650 50  0000 R CNN
F 1 "0-50V" H 5050 1600 50  0000 R CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 5100 1600 50  0001 C CNN
F 3 "~" H 5100 1600 50  0001 C CNN
	1    5100 1600
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Male J4
U 1 1 658AC7DF
P 5100 2650
F 0 "J4" H 5250 2700 50  0000 R CNN
F 1 "GND" H 5050 2650 50  0000 R CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 5100 2650 50  0001 C CNN
F 3 "~" H 5100 2650 50  0001 C CNN
	1    5100 2650
	-1   0    0    1   
$EndComp
Text Notes 1500 2150 0    50   ~ 0
Led +5mA
$Comp
L Device:LED D1
U 1 1 658B8715
P 2100 2150
F 0 "D1" V 2150 2300 50  0000 R CNN
F 1 "LED" V 2050 2350 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 2100 2150 50  0001 C CNN
F 3 "~" H 2100 2150 50  0001 C CNN
	1    2100 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2100 2000 2100 1550
Wire Wire Line
	2100 2300 2100 2650
Wire Wire Line
	2100 2650 2600 2650
Connection ~ 3350 1250
Wire Wire Line
	3350 1250 4000 1250
Wire Wire Line
	2600 1250 3350 1250
$Comp
L Device:R R2
U 1 1 6588DA05
P 3350 1400
F 0 "R2" H 3420 1446 50  0000 L CNN
F 1 "20K" H 3420 1355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 3280 1400 50  0001 C CNN
F 3 "~" H 3350 1400 50  0001 C CNN
	1    3350 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1250 2100 1250
Wire Wire Line
	2100 1250 2600 1250
Connection ~ 2100 1250
$Comp
L Device:R R7
U 1 1 658B9760
P 2100 1400
F 0 "R7" H 2170 1446 50  0000 L CNN
F 1 "2.2K" H 2170 1355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 2030 1400 50  0001 C CNN
F 3 "~" H 2100 1400 50  0001 C CNN
	1    2100 1400
	-1   0    0    1   
$EndComp
Wire Wire Line
	2750 2350 2750 2500
Wire Wire Line
	2750 2500 2600 2500
Connection ~ 2600 2500
Connection ~ 1800 1250
$EndSCHEMATC
