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
  <img alt="Status" src="https://img.shields.io/badge/status-early%20development-orange">
  <img alt="Architecture" src="https://img.shields.io/badge/architecture-x86--64-blue">
  <img alt="Base" src="https://img.shields.io/badge/base-Debian%20Stable-red">
  <img alt="Desktop" src="https://img.shields.io/badge/desktop-XFCE-2284F2">
  
</p>

---

## What is TechBench?

**TechBench Linux** is a portable Linux environment designed to boot directly
from USB without installing anything on the target computer.

It is intended primarily for:

- PC and laptop repair technicians
- Computer refurbishers
- People inspecting used PCs and laptops before buying them

TechBench follows the toolbox philosophy of projects such as Hiren's BootCD PE,
but uses Linux-native and primarily open-source utilities.

The goal is not to create another general-purpose Linux distribution.

The goal is to create a **portable technician appliance**:

```text
Insert USB
    ↓
Boot TechBench
    ↓
Diagnose / Test / Repair / Recover
    ↓
Shut down
    ↓
Remove USB
```

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
             ┌────────────┴────────────┐
             │                         │
      TechBench Check           TechBench Pro
       Used-PC profile        Technician profile
```

Both editions will be produced from the same repository.

### TechBench Check

Designed primarily for inspecting used PCs and laptops.

The focus is on **safe, simple, graphical diagnostics**.

Planned capabilities include:

- CPU identification
- GPU identification
- RAM information
- Motherboard and system information
- HDD / SSD / NVMe identification
- SMART data
- NVMe health and wear information
- Battery condition
- Temperatures and sensors
- CPU stress testing
- GPU stress testing
- Memory testing
- Display testing
- Keyboard testing
- Webcam testing
- Speaker and microphone testing
- Wi-Fi
- Bluetooth
- USB and PCI device inspection

TechBench Check should contain few or no destructive utilities.

### TechBench Pro

Designed for repair technicians and refurbishers.

It includes the Check functionality plus tools for:

- Partition management
- Filesystem repair
- Data recovery
- Damaged-drive recovery
- Disk cloning
- Disk imaging
- Disk wiping
- Network troubleshooting
- File transfer
- USB / ISO preparation
- Archive and file utilities
- Advanced storage tools
- Terminal-based technician utilities

---

## Hardware goals

TechBench targets approximately **Windows 7-era x86-64 hardware through modern systems**.

Priority hardware includes:

- Intel CPUs
- AMD CPUs
- Intel graphics
- AMD graphics
- NVIDIA graphics
- SATA HDDs
- SATA SSDs
- NVMe SSDs
- USB storage
- Ethernet adapters
- Wi-Fi adapters
- Bluetooth adapters
- Laptop batteries
- Common hardware sensors

A device that Linux cannot operate must be reported as **unsupported or unavailable**, not incorrectly labelled as failed hardware.

---

## V1 target

The first major milestone is intentionally smaller than the eventual
technician-toolbox vision.

### V1 foundation

- [ ] Debian Live environment
- [ ] XFCE desktop
- [ ] UEFI boot
- [ ] Legacy BIOS boot where practical
- [ ] Networking
- [ ] Broad firmware support
- [ ] Thunar file manager
- [ ] CPU identification
- [ ] GPU identification
- [ ] Temperature / sensor monitoring
- [ ] SMART diagnostics
- [ ] NVMe diagnostics
- [ ] CPU stress testing
- [ ] GPU stress testing
- [ ] Memtest86+ boot entry
- [ ] GParted
- [ ] TestDisk
- [ ] PhotoRec
- [ ] Physical hardware validation

Once that foundation is reliable, additional recovery, cloning,
refurbishment and usability features can be added incrementally.

---

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

## Documentation

Project documentation lives in [`res/doc/`](res/doc/).

- [Architecture](res/doc/architecture.md)
- [Hardware compatibility](res/doc/compatibility.md)
- [Testing strategy](res/doc/testing.md)
- [Tool selection](res/doc/tools.md)

---

## Planned build outputs

Eventually the repository will produce:

```text
TechBench-Check-x86_64.iso
TechBench-Pro-x86_64.iso
```

Both will inherit the same TechBench Core configuration.

The build system is **not yet complete**, and there are currently no official
TechBench ISO releases.

---

## Contributing

TechBench is currently in early development.

Contributions, hardware testing, compatibility reports and tool suggestions are
welcome.

Before contributing, please read:

- [CONTRIBUTING.md](CONTRIBUTING.md)
- [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)

When proposing a new bundled application, consider:

1. What technician problem does it solve?
2. Is it actively maintained?
3. Is it available for Debian?
4. Does another included utility already provide the same functionality?
5. Does it improve hardware coverage or usability?
6. Can it legally be redistributed?

---

## Security

Please do not report security vulnerabilities through public GitHub issues.

See [SECURITY.md](SECURITY.md) for the project's security reporting policy.

---

## Project status

> [!IMPORTANT]
> TechBench is currently in **early development**.


There are no stable releases yet.

The immediate objective is to produce and validate a basic Debian + XFCE Live
ISO before expanding the project into its full technician toolbox.

---


<p align="center">
  <strong>TechBench Linux</strong><br>
  Boot. Diagnose. Test. Repair. Recover.
</p>