# TechBench Tool Inventory

This document tracks applications and utilities considered for inclusion
in TechBench.

TechBench should prefer mature existing Linux tools instead of creating
custom replacements.

## Tool Selection Criteria

Before adding a tool, evaluate:

- purpose
- maintenance status
- hardware compatibility
- Debian availability
- graphical or command-line interface
- package size
- dependency size
- redistribution and license compatibility
- overlap with tools already included
- suitability for TechBench Check
- suitability for TechBench Pro

## Editions

A tool may be classified as:

- Core
- Check
- Pro
- Check and Pro
- Under Evaluation
- Rejected

## Initial Candidates

### Hardware Information

- CPU-X
- hwinfo
- lshw
- HardInfo2
- GPU-Viewer
- pciutils
- usbutils

### Sensors and Monitoring

- lm-sensors
- UPower

### Storage Diagnostics

- smartmontools
- GSmartControl
- nvme-cli

### Stress and Testing

- stress-ng
- memtester
- Memtest86+
- GLMark2

### Disk and Partition

- GParted

### Recovery

- TestDisk
- PhotoRec
- GNU ddrescue

### Imaging and Cloning

- Clonezilla
- Rescuezilla
- partclone

### Networking

- NetworkManager
- NetworkManager graphical applet
- iproute2
- ethtool
- iperf3
- OpenSSH

## Design Rule

Every included tool must answer a clear technician or used-PC inspection
need.

Avoid unnecessary duplicate applications.

Some overlap is acceptable when different tools support different
hardware vendors or recovery scenarios.
