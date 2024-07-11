# TEA x OFB
 Thực hiện thuật toán TEA (Tiny Encryption Algorithm) ở chế độ OFB (Output Feedback)
## Cơ sở lý thuyết
- Thuật toán **TEA**: ở [đây](https://en.wikipedia.org/wiki/Tiny_Encryption_Algorithm)
- Chế độ **OFB**: ở [đây](https://www.geeksforgeeks.org/block-cipher-modes-of-operation/)
## Các kết quả
### Vivado
- Product family: Artix-7
- Project part: xc7a200tiffg1156-1L
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

#### Timing
- Setup
    - Worst Negative Slack (WNS): 1.397 ns
    - Total Negative Slack (TNS): 0 ns
    - Number of Falling Endpoints: 0
    - Total Number of Endpoints: 128

- Hold
    - Worst Hold Slack (WHS): 13.861 ns
    - Total Hold Slack (THS): 0 ns
    - Number of Falling Endpoints: 0
    - Total Number of Endpoints: 128

- Pulse Width
    - Worst Pulse Width Slack (WPWS): 87 ns
    - Total Pulse Width Negative Slack (TPWS): 0 ns
    - Number of Falling Endpoints: 0
    - Total Number of Endpoints: 129

#### Power
![Summary](/img/summary.png)
![On-Chip](/img/onchip.png)

### OpenLane
`config.json`
```
{
  "DESIGN_NAME": "OFB",
  "VERILOG_FILES": "dir::src/*.v",
  "CLOCK_PERIOD": 25,
  "CLOCK_PORT": "clk"
}
```
![Summary](/img/a.jpg)
![On-Chip](/img/b.jpg)