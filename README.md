# TEA x OFB
 Thiết kế lõi IP thực hiện mã hóa và giải mã TEA (Tiny Encryption Algorithm) theo chế độ OFB.
## Cơ sở lý thuyết
- Thuật toán **TEA**: ở [đây](https://en.wikipedia.org/wiki/Tiny_Encryption_Algorithm)
- Chế độ **OFB**: ở [đây](https://www.geeksforgeeks.org/block-cipher-modes-of-operation/)
## Các kết quả
### Vivado
- Product family: Artix-7
- Project part: xc7a200tiffg1156-1L

#### Simulation
![Simulation](/img/simulation.jpg)
Tcl console:
```
Time: 70000, data_in: 0123456789abcdef, data_out: ad463072d1ca97fb
Time: 190000, data_in: ad463072d1ca97fb, data_out: 0123456789abcdef
Time: 310000, data_in: 0011223344556677, data_out: ac7457261c343c63
Time: 430000, data_in: ac7457261c343c63, data_out: 0011223344556677
```

#### Schematic
![Schematic](/img/schematic.jpg)

#### Synthesis
|Resource|Estimation|Available|Ultilization \%|
|--------------|------- |------|-------|
| LUT  | 9234  | 134600 | 6.860327     |
| FF   | 128   | 269200 | 0.04754829   |
| IO   | 322   | 500    | 64.4         |
| BUFG | 1     | 32     | 3.125        |

![Layout](/img/layout.jpg)
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
![Summary](/img/summary.jpg)
![On-Chip](/img/onchip.jpg)

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