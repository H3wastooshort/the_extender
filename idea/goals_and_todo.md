## Goals:
### Main
[-] USB PD Power SRC and Data Device (not Host)
[X] Expand Storage
[X] Connect Headphones
	[ ] Only enable Headphones if present
	[X] Only enable microphone if present
[X] Charge via USB C
[-] Low Profile USB C Cable
### Aux
[X] Charge other devices via USB C
[X] Have extra USB data socket
[-] Volume COntrols on headphone Cable

#### Legend
[ ] Not yet finished
[-] In Progress
[X] Done

## TODO
### Main
 * MOSFET to control Audio power (maybe look for component that has MOSFET and NPN in one package...)
 * Headphone detection (pullup Tip to 3V3 and connect via diode to GPIO?)
### Aux
 * Audio EEPROM emulation (~~needs **small** level shifter IC~~ might be 3V3 Logic!)
