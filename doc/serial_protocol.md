# Ruida serial protocol

The serial protocol was decoded using [usbmon](https://github.com/kkaempf/usbmon)

See 'Debug setup' below for the full stack.

## Serial settings

8N1, 38400 Baud

## Control lines

Uses DTR and RTS

### Serial reset

Setting DTR low and RTS low stops serial communication.

### Serial init

Setting DTR low RTS high for ~5msec followed by DTR high RTS low
initiates the communication from the Thunderlaser.

### Command timeout

Some commands, like listing filenames from the internal storage (aka
`da 00 04 05`), can timeout after ~250msec.

In this case, a `serial reset` is required.


# Debug setup

The following stack was used to snoop the USB protocol:

* [RDWorks8](http://rdworks.software.informer.com/8.0/) on Windows
* Windows running under [VirtualBox](https://www.virtualbox.org/) on [openSUSE](https://www.opensuse.org)
* USB (idVendor=0403, idProduct=6001) shared with VirtualBox as explained [here](https://forums.virtualbox.org/viewtopic.php?f=35&t=82639)
* USB monitoring on Linux, see [here](https://www.kernel.org/doc/Documentation/usb/usbmon.txt)
* Decoding the USB log with the `ftdi` component of [usbmon](https://github.com/kkaempf/usbmon)
