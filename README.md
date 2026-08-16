<p align="center">
  <img src="res/img/logo/techbench-logo.png" alt="TechBench Linux logo" width="300">
</p>

<h1 align="center">TechBench Linux</h1>

<p align="center">
  <strong>Boot. Diagnose. Test. Repair. Recover.</strong>
</p>

<p align="center">
  A compact, bootable Linux technician environment for hardware diagnostics,
  used-PC inspection, repair, recovery and refurbishment.
</p>

<p align="center">
  <img alt="Release" src="https://img.shields.io/badge/release-v1.0.0-brightgreen">
  <img alt="Edition" src="https://img.shields.io/badge/edition-TechBench%20Check-0A84FF">
  <img alt="base" src="https://img.shields.io/badge/base-Debian%2013%20Trixie-A81D33?logo=debian&logoColor=white">
  <img alt="Desktop" src="https://img.shields.io/badge/desktop-XFCE-2284F2?logo=xfce&logoColor=white">
  <img alt="Architecture" src="https://img.shields.io/badge/architecture-x86--64%20%2F%20amd64-4C8BF5">
  <img alt="Boot" src="https://img.shields.io/badge/boot-UEFI%20%2B%20Legacy%20BIOS-6C63FF">
 
---
# TechBench Linux

TechBench Linux is a bootable Linux Live USB toolkit for PC diagnostics, hardware testing, repair, refurbishment, and used-PC inspection.

The current public edition is **TechBench Check**.

### TechBench Check v1.0.0

Download the latest release from GitHub Releases:

<p align="center">
  <h1 align="center">
    <a href="https://github.com/Gl3diator/TechBench/releases/tag/v1.0.0">
      Download TechBench Check v1.0.0
    </a>
  </h1>
</p>



## What is TechBench?

TechBench is designed primarily for:

1. PC and laptop repair technicians and refurbishers.
2. People inspecting used PCs and laptops before purchasing them.

It runs directly from USB without installation and is designed to keep core diagnostic functionality available offline.

TechBench is not intended to be a general-purpose desktop Linux distribution.



---

## Project principles

TechBench is being designed around a few core rules:

- **Bootable** — runs directly from USB
- **Offline-first** — core diagnostics must not depend on Internet access
- **User-friendly** — suitable for technicians with little Linux experience
- **Hardware-focused** — diagnostics and repair come before desktop features
- **Broadly compatible** — firmware and hardware support are prioritized over shaving a few hundred MB
- **Safe by design** — destructive tools are clearly separated from diagnostics
- **Reproducible** — ISO builds should be generated from source
- **Existing tools first** — mature software is integrated instead of unnecessarily rewritten

---

## Editions

TechBench is designed around **one shared TechBench Core** with multiple build
profiles.

```text
                    TechBench Core
                          │
             ┌────────────┴────────────────┐
             │                             │
      TechBench Check               TechBench Pro
       Used-PC profile            Technician profile
  (TechBench Check v1.0.0)          (coming soon)
```

Both editions will be produced from the same repository.

# TechBench Check

TechBench Check focuses on hardware diagnostics and used-PC inspection.

Included capabilities include:

- CPU and system hardware information
- GPU identification and information
- CPU stress testing
- GPU stress testing
- Memory testing
- Bootable memory diagnostics
- HDD, SSD, and NVMe information
- SMART drive health diagnostics
- Storage performance testing
- Temperature and hardware sensor monitoring
- Battery information and health checks
- Display testing
- Keyboard and touchpad testing
- Webcam testing
- Audio and microphone testing
- Ethernet and Wi-Fi testing
- Bluetooth support
- USB and connected-device inspection

## Platform

- Debian 13 (Trixie)
- XFCE
- x86-64 / amd64
- UEFI and Legacy BIOS
- Bootable Live ISO
- Offline-first core functionality

## Build TechBench Yourself

TechBench is currently built and tested on **Debian 13 (Trixie) x86-64**.

A clean Debian 13 installation or virtual machine is recommended.

### Build environment

- Debian 13 (Trixie)
- x86-64 / amd64
- Sufficient free disk space for the live-build workspace and resulting ISO
- `sudo` access

### Clone the repository

```bash
git clone https://github.com/Gl3diator/TechBench.git
cd TechBench
```

### Build TechBench

Run:

```bash
./project/build/build-core.sh 2>&1 | tee ~/techbench-core-build.log
```

The build process uses Debian `live-build` to create the TechBench Live ISO.

When the build completes successfully, the ISO will be available at:

```text
out/
```

### Verify the build

```bash
sha256sum out/TechBench-Core-amd64.iso
```

## Repository layout

```text
TechBench/
├── project/
│   ├── build/
│   │
│   ├── config/
│   │   ├── core/
│   │   ├── check/
│   │   └── pro/
│   │
│   ├── scripts/
│   │   ├── hardware/
│   │   ├── helpers/
│   │   └── reports/
│   │
│   └── tests/
│       ├── boot/
│       ├── hardware/
│       └── iso/
│
├── res/
│   ├── doc/
│   │   ├── architecture.md
│   │   ├── compatibility.md
│   │   ├── testing.md
│   │   └── tools.md
│   │
│   └── img/
│       ├── artwork/
│       ├── logo/
│       └── wallpaper/
│
├── AUTHORS
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── README.md
├── SECURITY.md
└── .gitignore
```

---

## TechBench Pro

**TechBench Pro** is planned as the expanded technician edition.

It will include everything in TechBench Check plus additional tools for:

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

TechBench Check and TechBench Pro are generated from the same shared TechBench Core.

## Contributing and Security

See:

- `CONTRIBUTING.md`
- `CODE_OF_CONDUCT.md`
- `SECURITY.md`

## Status
> [!IMPORTANT]
> **TechBench Check v1.0.0 is released.**

> TechBench Pro is currently  **under development**.


---


<p align="center">
  <strong>TechBench Linux</strong><br>
  Boot. Diagnose. Test. Repair. Recover.
</p>
