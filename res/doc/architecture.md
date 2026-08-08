# TechBench Architecture

TechBench is a bootable Linux technician environment built around one
shared codebase and two product editions.

The project will eventually produce two x86-64 Live ISO images:

- TechBench Check
- TechBench Pro

These are separate product editions, but they must not become separate
Linux distribution forks.

## Architecture Overview

    TechBench
        |
        v
    TechBench Core
        |
        +------------------------+
        |                        |
        v                        v
    TechBench Check         TechBench Pro
        |                        |
        v                        v
    Check Live ISO          Pro Live ISO

Both editions inherit the same shared TechBench Core.

## TechBench Core

The shared Core contains the foundation required by both editions.

Planned shared components include:

- Debian Stable base
- Debian live-build
- XFCE desktop
- x86-64 architecture
- SquashFS Live filesystem
- Linux kernel
- firmware
- bootloader configuration
- networking
- audio support
- filesystem support
- graphical file manager
- common hardware utilities
- common scripts
- common branding

Hardware compatibility has priority over saving a small amount of ISO
space.

Broad firmware support should be included.

## Kernel Strategy

The primary kernel should be the newest stable Linux kernel validated by
the TechBench project.

A recent LTS kernel may also be provided as an optional compatibility
boot entry if practical.

Kernel upgrades must be tested before release.

## Boot Support

TechBench should support:

- UEFI
- Legacy BIOS where practical
- direct USB boot
- Ventoy boot where practical

Secure Boot behavior must be tested and documented.

## TechBench Check

TechBench Check is intended primarily for people inspecting used PCs and
laptops.

It should be:

- smaller
- safer
- simple
- graphical
- primarily diagnostic

Typical functionality includes:

- CPU identification
- GPU identification
- RAM information
- storage information
- SMART and NVMe health
- battery information
- temperatures and sensors
- CPU stress testing
- GPU stress testing
- memory testing
- display testing
- keyboard testing
- webcam testing
- audio testing
- networking
- USB and device inspection

Destructive repair utilities should not normally be included in the
Check edition.

## TechBench Pro

TechBench Pro is intended for repair technicians, refurbishers and IT
staff.

It includes the shared diagnostic functionality plus technician tools
such as:

- partition management
- data recovery
- damaged-media recovery
- disk imaging
- disk cloning
- filesystem repair
- disk wiping
- advanced storage tools
- network diagnostics
- USB and ISO utilities
- file tools
- advanced terminal utilities

Destructive tools must be clearly separated from diagnostic tools.

## Build Model

Both editions must be produced from the same repository.

The configuration layout is:

    project/config/core/
            |
            +----------------------+
            |                      |
            v                      v
    project/config/check/   project/config/pro/
            |                      |
            v                      v
       Check ISO               Pro ISO

Shared functionality belongs in:

    project/config/core/

Check-specific configuration belongs in:

    project/config/check/

Pro-specific configuration belongs in:

    project/config/pro/

Common build logic belongs in:

    project/build/

## Offline-First

Core diagnostics must work without Internet access.

Internet access may be useful for:

- documentation
- updates
- remote support
- file transfer
- downloading additional resources

but it must not be required for normal TechBench diagnostics.

## Design Rule

TechBench is primarily an integration and distribution project.

Existing mature Linux tools should be used instead of creating custom
replacements whenever they adequately solve the requirement.
