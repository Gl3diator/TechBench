# TechBench

TechBench is a compact, bootable Linux hardware diagnostics, repair,
recovery and refurbishment environment for used-PC buyers, computer
technicians and refurbishers.

It is inspired by the toolbox philosophy of Hiren's BootCD PE while
using Linux-native and primarily open-source tools.

## Project goals

TechBench is designed to be:

- Bootable from USB
- Offline-first
- Easy to use
- Technician-focused
- Compatible with a broad range of x86-64 PCs
- Based primarily on mature existing tools
- Reproducible from source

TechBench is not intended to become a general-purpose Linux desktop
distribution.

## Architecture

The planned foundation is:

- Debian Stable
- Debian live-build
- XFCE
- x86-64
- SquashFS Live filesystem
- Broad firmware support
- UEFI support
- Legacy BIOS support where practical
- Validated modern Linux kernel

## Editions

TechBench is built from one shared core.

### TechBench Check

Designed primarily for used-PC inspection.

Focus:

- Hardware identification
- CPU / GPU / RAM information
- Storage health
- SMART / NVMe
- Battery condition
- Temperatures
- CPU / GPU / RAM testing
- Display testing
- Keyboard testing
- Webcam / audio testing
- Networking
- USB and device inspection

The Check edition should avoid destructive repair tools.

### TechBench Pro

Designed for technicians and refurbishers.

Includes TechBench Check functionality plus:

- Partition management
- Data recovery
- Disk imaging
- Disk cloning
- Filesystem repair
- Damaged-drive recovery
- Disk wiping
- Network diagnostics
- USB / ISO tools
- Advanced technician utilities

## Repository layout

```text
TechBench/
├── project/
│   ├── build/
│   ├── config/
│   │   ├── core/
│   │   ├── check/
│   │   └── pro/
│   ├── scripts/
│   └── tests/
├── res/
│   ├── doc/
│   └── img/
├── AUTHORS
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── README.md
├── SECURITY.md
└── .gitignore
```

## Planned build outputs

```text
TechBench-Check-x86_64.iso
TechBench-Pro-x86_64.iso
```

Both images will be generated from the same repository and shared
TechBench Core.

## Core development rule

> Do not reinvent a good technician tool. Make it easier to find, boot,
> use and carry.

## Status

Early development.
