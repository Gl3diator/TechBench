# TechBench Hardware Compatibility

This document records hardware compatibility testing for TechBench.

TechBench targets a broad range of x86-64 PCs, from approximately the
Windows 7 era through current hardware.

Hardware compatibility is more important than saving a small amount of
ISO space.

## Test Categories

Compatibility testing should cover:

- CPU
- GPU
- motherboard and chipset
- SATA controllers
- SATA HDD
- SATA SSD
- NVMe SSD
- USB storage
- Ethernet
- Wi-Fi
- Bluetooth
- laptop batteries
- temperature and hardware sensors
- audio
- webcam
- USB devices
- UEFI boot
- Legacy BIOS boot
- Ventoy boot
- direct USB boot
- firmware requirements

## CPU Coverage

Priority platforms include:

- older Intel Core processors
- modern Intel Core processors
- Intel Core Ultra
- older AMD Ryzen processors
- modern AMD Ryzen processors

## GPU Coverage

Priority graphics hardware includes:

- Intel integrated graphics
- AMD integrated graphics
- AMD Radeon discrete graphics
- NVIDIA discrete graphics

Testing should include both older and recent GPU generations where
hardware is available.

## Storage Coverage

Storage testing should include:

- SATA HDD
- SATA SSD
- NVMe SSD
- USB HDD
- USB SSD
- USB flash drives

## Networking Coverage

Networking testing should include:

- Ethernet
- Intel Wi-Fi
- Realtek Wi-Fi
- Broadcom Wi-Fi where hardware is available
- Bluetooth

## Compatibility Status

When documenting hardware results, use clear states such as:

- WORKING
- PARTIAL
- UNSUPPORTED
- UNAVAILABLE
- REGRESSION
- NOT TESTED

Unsupported hardware must not automatically be classified as failed
hardware.

A device may be physically functional even when the Linux kernel,
firmware or userspace stack cannot operate it.

## Test Record Format

Each tested machine should eventually record:

- manufacturer
- model
- CPU
- GPU
- RAM
- storage
- network hardware
- firmware or BIOS version
- boot mode
- TechBench edition
- TechBench version
- kernel version
- working devices
- unsupported devices
- regressions
- notes
