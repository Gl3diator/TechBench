# TechBench Testing

TechBench must be tested using both virtual machines and physical
hardware.

Virtual machine testing is useful for validating the build itself.

Physical hardware testing is required for real hardware compatibility.

## Virtual Machine Testing

VM testing may use:

- QEMU/KVM
- VirtualBox where useful
- VMware where useful

VM tests should validate:

- ISO boots
- boot menu appears
- XFCE starts
- networking starts
- applications launch
- filesystems mount
- scripts execute
- menu entries exist
- build profiles produce expected files

VM testing cannot replace physical hardware testing.

## Physical Hardware Testing

Physical testing should cover as many different systems as practical.

### Age

- older x86-64 BIOS machine
- Windows 7-era laptop
- Windows 10-era laptop
- recent laptop
- recent desktop

### CPU

- older Intel Core
- modern Intel Core
- Intel Core Ultra where available
- older AMD Ryzen
- modern AMD Ryzen

### GPU

- Intel integrated graphics
- AMD integrated graphics
- older NVIDIA GPU
- recent NVIDIA GPU
- older AMD Radeon GPU
- recent AMD Radeon GPU

### Storage

- SATA HDD
- SATA SSD
- NVMe SSD
- USB HDD
- USB SSD
- USB flash drive

### Boot

- Legacy BIOS
- UEFI
- Secure Boot behavior
- Ventoy
- direct-flashed USB

### Networking

- Ethernet
- Intel Wi-Fi
- Realtek Wi-Fi
- Broadcom Wi-Fi where available
- Bluetooth

## Core Validation

Before publishing a build, verify at minimum:

- ISO boots
- XFCE starts
- Ethernet works
- Wi-Fi works where supported
- storage devices are detected
- removable drives mount
- CPU is identified
- GPU is identified
- temperatures can be inspected where supported
- SMART works
- NVMe health information works
- CPU stress testing works
- GPU stress testing works
- memory testing works
- Memtest86+ boots
- GParted launches in Pro
- TestDisk launches in Pro
- PhotoRec launches in Pro

## Unsupported Hardware

A device that Linux cannot operate must not automatically be marked as
failed.

Testing should distinguish between:

- WORKING
- PARTIAL
- UNSUPPORTED
- UNAVAILABLE
- REGRESSION
- FAILED
- NOT TESTED

## Release Testing Flow

A release should generally follow this order:

1. Select Debian base
2. Select validated kernel
3. Update firmware
4. Update package lists
5. Build TechBench Check
6. Build TechBench Pro
7. Run VM smoke tests
8. Run physical hardware tests
9. Record regressions
10. Fix blocking issues
11. Generate checksums
12. Publish release

Reliability is more important than rapidly adopting every new package or
kernel release.
