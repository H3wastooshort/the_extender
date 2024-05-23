# The Extender
Modern phones suck in theor own unique way, don't they?
Hard-to-replace or -expand lithium cells, no expandable storage, and worst of all: no headphone jack!

This projects aims to fix some of those flaws by
combining a powerbank, USB hub, USB audio, and RP2040 IC into one very cursed PCB.

![top pcb view](https://h3wastooshort.github.io/the_extender/top.png)
![bottom pcb view](https://h3wastooshort.github.io/the_extender/bottom.png)
![rotating pcb GIF](https://h3wastooshort.github.io/the_extender/rotating.gif)
![schematic](https://h3wastooshort.github.io/the_extender/the_extender.svg)

## Working Principle
5V power and battery charging is handled by an IP5310 powerbank IC.

The PCB connects to a phone via a low-profile 90° USB Type C cable (either [DIY](/cable) or [bought](https://de.aliexpress.com/item/1005005371248824.html)).
Once connected, the RP2040 turns on 5V power, then uses the FUSB302 to tell the phone via USB Power Delivery,
that it should keep charging while also switching into USB Data Host mode.

The phone then connects to the CH334F USB Hub IC, which in turn connects to several things:
 * a USB 3.0 socket for a USB Stick which is used to expand the internal storage,
 * the HS-100B USB audio IC, (only powered on when headphones are connected)
 * the RP2040 for HID volume and playback control aswell as FW Updates,
 * and an external USB 2.0 socket for whatever you desire.

![a diagram showing data flow in the extender](/idea/the_extender.drawio.svg)

## 3D-printable case
WIP

## schematic POIs

### HS-100B Audio IC
 * The Audio IC circuit is based on a low-resolution image of a reference design i found online.
 * 5V Power to the IC gets cut va a MOSFET when the headphones are disconnected. An RC circuit prevents loose plugs from causing issues. (Turns off about 1 second after unplugging)
 * The datasheet is quite sparse
 * The EEPROM data lines are connected to the RP2040, so that it can emulate the EEPROM in the future. This is not requred.

### IP5310 power-bank IC
 * I2C variant is unobtainium
 * MOSFET between VOUT and rest of system, so that power to phone and other components can be controlled
   even though VOUT can't.
 * if needed, a solder jumper can be cut and shottky diode put in place to prevent current flowing back into the IC
 * KEY pin connected to RP2040. might be needed, i don't know, should turn on when detecting a load
 * D+ and D- not connected because there is very little space. the CC lines should suffice

### CH334F
 * clock line can be grounded to use internal OSC, but this is discouraged in its datasheet.
   RP2040 is to provide a better clock once programmed.
 * 

### RP2040
 * main purpose is to communicate via USB C PD
 * might supply clock for hub
 * might be used to emulate EEPROMs for USB Hub and Audio

## more info

The [idea](/idea) directory has some partially outdated notes.
