# Ruida commands

Commands are in the range of 0x80 to 0xff

All parameter values are in the range of 0x00 to 0x7f

## Table of commands

<table>
<tr><th>Command</th><th>Parameters</th><th>Meaning</th></tr>
<tr><td>88 </td><td>&lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>Mov_Abs</td></tr>
<tr><td>89 </td><td>&lt;<a href='#rel'>rel</a>&gt;&lt;<a href='#rel'>rel</a>&gt;</td><td>Mov_Rel</td></tr>
<tr><td>8a </td><td>&lt;<a href='#rel'>rel</a>&gt;</td><td>Move_Horiz</td></tr>
<tr><td>8b </td><td>&lt;<a href='#rel'>rel</a>&gt;</td><td>Move_Vert</td></tr>
<tr><td>a8 </td><td>&lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>Cut_Abs</td></tr>
<tr><td>a9 </td><td>&lt;<a href='#rel'>rel</a>&gt;&lt;<a href='#rel'>rel</a>&gt;</td><td>Cut_Rel</td></tr>
<tr><td>aa </td><td>&lt;<a href='#rel'>rel</a>&gt;</td><td>Cut_Horiz</td></tr>
<tr><td>ab </td><td>&lt;<a href='#rel'>rel</a>&gt;</td><td>Cut_Vert</td></tr>
<tr><td>c0 </td><td>XX </td><td>C0</td></tr>
<tr><td>c1 </td><td>XX </td><td>C1</td></tr>
<tr><td>c2 </td><td>XX </td><td>C2</td></tr>
<tr><td>c3 </td><td>XX </td><td>C3</td></tr>
<tr><td>c4 </td><td>XX </td><td>C4</td></tr>
<tr><td>c5 </td><td>XX </td><td>C5</td></tr>
<tr><td>c6 01 </td><td>&lt;<a href='#power'>power</a>&gt;</td><td>Laser_1_Min_Pow_C6_01</td></tr>
<tr><td>c6 02 </td><td>&lt;<a href='#power'>power</a>&gt;</td><td>Laser_1_Max_Pow_C6_02</td></tr>
<tr><td>c6 05 </td><td>&lt;<a href='#power'>power</a>&gt;</td><td>Laser_3_Min_Pow_C6_05</td></tr>
<tr><td>c6 06 </td><td>&lt;<a href='#power'>power</a>&gt;</td><td>Laser_3_Max_Pow_C6_06</td></tr>
<tr><td>c6 07 </td><td>&lt;<a href='#power'>power</a>&gt;</td><td>Laser_4_Min_Pow_C6_07</td></tr>
<tr><td>c6 08 </td><td>&lt;<a href='#power'>power</a>&gt;</td><td>Laser_4_Max_Pow_C6_08</td></tr>
<tr><td>c6 10 </td><td>&lt;<a href='#sec'>sec</a>&gt;</td><td>Dot time</td></tr>
<tr><td>c6 12 </td><td>&lt;<a href='#ms'>ms</a>&gt;</td><td>Cut_Open_delay_12</td></tr>
<tr><td>c6 13 </td><td>&lt;<a href='#ms'>ms</a>&gt;</td><td>Cut_Close_delay_13</td></tr>
<tr><td>c6 15 </td><td>&lt;<a href='#ms'>ms</a>&gt;</td><td>Cut_Open_delay_15</td></tr>
<tr><td>c6 16 </td><td>&lt;<a href='#ms'>ms</a>&gt;</td><td>Cut_Close_delay_16</td></tr>
<tr><td>c6 21 </td><td>&lt;<a href='#power'>power</a>&gt;</td><td>Laser_2_Min_Pow_C6_21</td></tr>
<tr><td>c6 22 </td><td>&lt;<a href='#power'>power</a>&gt;</td><td>Laser_2_Max_Pow_C6_22</td></tr>
<tr><td>c6 31 </td><td>&lt;<a href='#layer'>layer</a>&gt;&lt;<a href='#power'>power</a>&gt;</td><td>Laser_1_Min_Pow_C6_31</td></tr>
<tr><td>c6 32 </td><td>&lt;<a href='#layer'>layer</a>&gt;&lt;<a href='#power'>power</a>&gt;</td><td>Laser_1_Max_Pow_C6_32</td></tr>
<tr><td>c6 35 </td><td>&lt;<a href='#layer'>layer</a>&gt;&lt;<a href='#power'>power</a>&gt;</td><td>Laser_3_Min_Pow_C6_35</td></tr>
<tr><td>c6 36 </td><td>&lt;<a href='#layer'>layer</a>&gt;&lt;<a href='#power'>power</a>&gt;</td><td>Laser_3_Max_Pow_C6_36</td></tr>
<tr><td>c6 37 </td><td>&lt;<a href='#layer'>layer</a>&gt;&lt;<a href='#power'>power</a>&gt;</td><td>Laser_4_Min_Pow_C6_37</td></tr>
<tr><td>c6 38 </td><td>&lt;<a href='#layer'>layer</a>&gt;&lt;<a href='#power'>power</a>&gt;</td><td>Laser_4_Max_Pow_C6_38</td></tr>
<tr><td>c6 41 </td><td>&lt;<a href='#layer'>layer</a>&gt;&lt;<a href='#power'>power</a>&gt;</td><td>Laser_2_Min_Pow_C6_41</td></tr>
<tr><td>c6 42 </td><td>&lt;<a href='#layer'>layer</a>&gt;&lt;<a href='#power'>power</a>&gt;</td><td>Laser_2_Max_Pow_C6_42</td></tr>
<tr><td>c6 50 </td><td>&lt;<a href='#power'>power</a>&gt;</td><td>Cut_through_power1</td></tr>
<tr><td>c6 51 </td><td>&lt;<a href='#power'>power</a>&gt;</td><td>Cut_through_power2</td></tr>
<tr><td>c6 55 </td><td>&lt;<a href='#power'>power</a>&gt;</td><td>Cut_through_power3</td></tr>
<tr><td>c6 56 </td><td>&lt;<a href='#power'>power</a>&gt;</td><td>Cut_through_power4</td></tr>
<tr><td>c6 60 </td><td>&lt;<a href='#laser'>laser</a>&gt;00 &lt;<a href='#freq'>freq</a>&gt;</td><td>Laser_Freq</td></tr>
<tr><td>c7 </td><td>XX </td><td>C7</td></tr>
<tr><td>c8 </td><td>XX </td><td>C8</td></tr>
<tr><td>c9 02 </td><td>&lt;<a href='#speed'>speed</a>&gt;</td><td>Speed_C9</td></tr>
<tr><td>c9 04 </td><td>&lt;<a href='#layer'>layer</a>&gt;&lt;<a href='#speed'>speed</a>&gt;</td><td>Layer_Speed</td></tr>
<tr><td>ca 01 </td><td>&lt;<a href='#flags'>flags</a>&gt;</td><td>Flags_CA_01</td></tr>
<tr><td>ca 02 </td><td>&lt;<a href='#priority'>priority</a>&gt;</td><td>CA 02</td></tr>
<tr><td>ca 03 </td><td>XX </td><td>CA_03</td></tr>
<tr><td>ca 06 </td><td>&lt;<a href='#layer'>layer</a>&gt;&lt;<a href='#color'>color</a>&gt;</td><td>Layer_Color</td></tr>
<tr><td>ca 10 </td><td>XX </td><td>CA 10</td></tr>
<tr><td>ca 22 </td><td>XX </td><td>Layer_Count</td></tr>
<tr><td>ca 41 </td><td>&lt;<a href='#layer'>layer</a>&gt;XX </td><td>Layer_CA_41</td></tr>
<tr><td>d7 </td><td></td><td>EOF</td></tr>
<tr><td>d8 00 </td><td>00 </td><td>Light_RED</td></tr>
<tr><td>d8 12 </td><td></td><td>UploadFollows</td></tr>
<tr><td>da </td><td>XX &lt;<a href='#meter'>meter</a>&gt;&lt;<a href='#meter'>meter</a>&gt;</td><td>Work_Interval</td></tr>
<tr><td>e6 </td><td>01 </td><td>E601</td></tr>
<tr><td>e7 00 </td><td></td><td>Stop</td></tr>
<tr><td>e7 01 </td><td>&lt;<a href='#string'>string</a>&gt;</td><td>SetFilename</td></tr>
<tr><td>e7 03 </td><td>&lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>Top_Left_E7_07</td></tr>
<tr><td>e7 04 </td><td>XX &lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>E7 04</td></tr>
<tr><td>e7 05 </td><td>XX </td><td>E7_05</td></tr>
<tr><td>e7 06 </td><td>&lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>Feeding</td></tr>
<tr><td>e7 07 </td><td>&lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>Bottom_Right_E7_07</td></tr>
<tr><td>e7 08 </td><td>XX &lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>Bottom_Right_E7_08</td></tr>
<tr><td>e7 13 </td><td>&lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>E7 13</td></tr>
<tr><td>e7 17 </td><td>&lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>Bottom_Right_E7_17</td></tr>
<tr><td>e7 23 </td><td>&lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>E7 23</td></tr>
<tr><td>e7 24 </td><td>XX </td><td>E7 24</td></tr>
<tr><td>e7 50 </td><td>&lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>Top_Left_E7_50</td></tr>
<tr><td>e7 51 </td><td>&lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>Bottom_Right_E7_51</td></tr>
<tr><td>e7 52 </td><td>&lt;<a href='#layer'>layer</a>&gt;&lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>Layer_Top_Left_E7_52</td></tr>
<tr><td>e7 53 </td><td>&lt;<a href='#layer'>layer</a>&gt;&lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>Layer_Bottom_Right_E7_53</td></tr>
<tr><td>e7 54 </td><td>&lt;<a href='#layer'>layer</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>Pen_Draw_Y</td></tr>
<tr><td>e7 55 </td><td>&lt;<a href='#layer'>layer</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>Laser_Y_Offset</td></tr>
<tr><td>e7 60 </td><td>XX </td><td>E7 60</td></tr>
<tr><td>e7 61 </td><td>&lt;<a href='#layer'>layer</a>&gt;&lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>Layer_Top_Left_E7_61</td></tr>
<tr><td>e7 62 </td><td>&lt;<a href='#layer'>layer</a>&gt;&lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>Layer_Bottom_Right_E7_62</td></tr>
<tr><td>e8 01 </td><td>00 &lt;<a href='#number'>number</a>&gt;&lt;<a href='#string'>string</a>&gt;</td><td>FileStore</td></tr>
<tr><td>e8 02 </td><td></td><td>PrepFilename</td></tr>
<tr><td>ea </td><td>XX </td><td>EA</td></tr>
<tr><td>eb </td><td></td><td>Finish</td></tr>
<tr><td>f1 00 </td><td>00 </td><td>Start0</td></tr>
<tr><td>f1 01 </td><td>00 </td><td>Start1</td></tr>
<tr><td>f1 02 </td><td>00 </td><td>Start2</td></tr>
<tr><td>f1 03 </td><td>&lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>Laser2_Offset</td></tr>
<tr><td>f1 04 </td><td>&lt;<a href='#bool'>bool</a>&gt;</td><td>Enable_Feeding(auto?)</td></tr>
<tr><td>f2 00 </td><td>XX </td><td>F2 00</td></tr>
<tr><td>f2 01 </td><td>XX </td><td>F2 01</td></tr>
<tr><td>f2 02 </td><td>XX </td><td>F2 02</td></tr>
<tr><td>f2 03 </td><td>&lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>F2 03</td></tr>
<tr><td>f2 04 </td><td>&lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>Bottom_Right_F2_04</td></tr>
<tr><td>f2 05 </td><td>XX &lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>Bottom_Right_F2_05</td></tr>
<tr><td>f2 06 </td><td>&lt;<a href='#abs'>abs</a>&gt;&lt;<a href='#abs'>abs</a>&gt;</td><td>F2 06</td></tr>
<tr><td>f2 07 </td><td>XX </td><td>F2 07</td></tr>
</table>

## Parameters

### <a name='abs'></a> abs - absolute value

Absolute values are unsigned 5-byte integers. MSB-first.

Measurements are in µm - divide by 1000 to get mm.

Since all parameters are in the range of 0x00 - 0x7f, the ecoding is
0x7f-based.

Decoding formula: &lt;byte1&gt;*127<sup>4</sup> + &lt;byte2&gt;*127<sup>3</sup> + &lt;byte3&gt;*127<sup>2</sup> + &lt;byte4&gt;*127 + &lt;byte1&gt;

### <a name='rel'></a> rel - relative value

Relative values are signed 2-byte integers in the range of -8192 .. 8192

### <a name='power'></a> power - laser power

Laser power in percent (0..100)

### <a name='layer'></a> layer - layer number

1-byte layer number, starting at 0

### <a name='string'></a> string - string

zero-terminated (ascii?) characters

### <a name='meter'></a> meter - absolute distance in meters

Same encoding as <a href='#abs'>absolute</a> but in meter.


