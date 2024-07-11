# TEA x OFB
 implements the OFB mode TEA algorithm
## Cơ sở lý thuyết
+ Thuật toán **TEA**: ở [đây](https://en.wikipedia.org/wiki/Tiny_Encryption_Algorithm)
+ Chế độ vận hành **OFB**: ở [đây](https://www.geeksforgeeks.org/block-cipher-modes-of-operation/)
## Các kết quả
### Vivado
+ Product family: Artix-7
+ Project part: xc7a200tiffg1156-1L
#### Synthesis
|Resource|Estimation|Available|Ultilization \%|
|--------------|------- |------|-------|
| LUT  | 9234  | 134600 | 6.860327     |
| FF   | 128   | 269200 | 0.04754829   |
| IO   | 322   | 500    | 64.4         |
| BUFG | 1     | 32     | 3.125        |
#### Implementation
`xdc.xdc:`
```
create_clock -period 175.000 -name clk -waveform {0.000 87.500} -add [get_ports clk]
```
|Resource|Estimation|Available|Ultilization \%|
|--------------|------- |------|-------|
| LUT  | 8742  | 134600 | 6.494799     |
| FF   | 128   | 269200 | 0.04754829   |
| IO   | 322   | 500    | 64.4         |
| BUFG | 1     | 32     | 3.125        |
### OpenLane