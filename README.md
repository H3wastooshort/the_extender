# The Extender
Modern phones suck in theor own unique way, don't they?
Hard-to-replace or -expand lithium cells, no expandable storage, and worst of all: no headphone jack.

This projects aims to fix some of those flaws by combining a powerbank, USB hub, USB audio, and RP2040 IC in one cures PCB.

==PICS HERE==

## Working Principle
5V power and battery charging is handled by an IP5310 powerbank IC.

The PCB connects to a phone via a low-profile USB Type C Cable.
Once connected, the RP2040 uses the FUSB302 to tell the phone via USB Power Delivery,
that it should keep charging while switching into USB Data Host mode.

The phone then connects to the CH334F USB Hub IC, which in turn connects to several things:
 * a USB 3.0 socket for a USB Stick which is used to expand the internal storage.
 * the HS-100B USB audio IC. (Only powered when headphones are connected)
 * the RP2040 for HID volume and playback control aswell as FW Updates
 * an external USB 2.0 header

![a diagram showing data flow in the extender](/idea/the_extender.drawio.svg)

## more info
The [ideas](/ideas) directory has some partially outdated notes.
