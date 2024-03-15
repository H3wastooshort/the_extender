# The Extender
Modern phones suck in theor own unique way, don't they?
Hard-to-replace or -expand lithium cells, no expandable storage, and worst of all: no headphone jack!

This projects aims to fix some of those flaws by
combining a powerbank, USB hub, USB audio, and RP2040 IC into one very cursed PCB.

![top pcb view](/images/pcb_top.png)
![bottom pcb view](/images/pcb_bot.png)
images as of 2024-03-15 fb29e33b6f3fa4a7d4d1bb9766dbc5967a70b5ad

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

## more info

The [idea](/idea) directory has some partially outdated notes.
