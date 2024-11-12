# Linux Server Management on Ubuntu 24.04 LTS

This repository documents my experience managing an on-premises x86-64 Ubuntu 24.04 LTS server, focusing on using **LXD/LXC** for containerized application hosting. This project is part of my journey to learn, configure, and optimize a Linux server for running applications reliably in a home environment.

## Table of Contents

- [Overview](#overview)
- [Project Goals](#project-goals)
- [System Specifications](#system-specifications)
- [Environment Setup](#environment-setup)
- [Configuration](#configuration)
  - [Network Configuration with Netplan](#network-configuration-with-netplan)
  - [Storage Management with LVM](#storage-management-with-lvm)
- [Container Management using LXD/LXC](#container-management-using-lxd-lxc)
- [Useful Commands and Tips](#useful-commands-and-tips)
- [Troubleshooting and Challenges](#troubleshooting-and-challenges)
- [Future Plans](#future-plans)

## Overview

This project explores managing an Ubuntu server with a focus on **LXD** and **LXC** for containerized workloads. The server will be used to host various applications in a controlled and isolated environment, ensuring efficient use of resources and flexibility for deployment.

## Project Goals

- **Set up an Ubuntu server environment** with a reliable network configuration and secure access.
- **Deploy applications in LXD containers** to separate workloads and enhance resource management.
- **Document setup, configurations, and challenges** encountered throughout the project.
- **Optimize for hosting personal applications** and automate routine management tasks.

## System Specifications

- **Hardware**: x86-64 architecture with a 500GB HDD and 4GB of RAM
- **OS**: Ubuntu 24.04 LTS
- **Container Platform**: LXD/LXC
- **Networking**: Configured using Netplan with both DHCP and static IP setups for containers

## Environment Setup

The server setup includes the following:

1. **Networking Configuration**: Set up using Netplan for both dynamic and static IP management.
2. **Logical Volume Management (LVM)**: Allocated 100GB for the root file system with remaining space available for expansion.
3. **Container Platform**: Installed LXD for containerized applications, allowing isolated environments for each application.

## Configuration

### Network Configuration with Netplan

Network settings were configured using **Netplan**, located in `/etc/netplan`. This allows flexible configuration of IP addresses, enabling DHCP and static IP setups for containers. The `netplan` configuration file and any relevant changes are documented in the `/etc/netplan/README.md` file.

#### Example `netplan` Configuration

```yaml
network:
  version: 2
  ethernets:
    eth0:
      dhcp4: true
```

## Container Management using LXD/LXC

LXD is used to create, manage, and configure Linux containers (LXC) on the server. The following are key steps and configurations:

- **Installation**: LXD installed using `snap` to ensure the latest stable version.
- **Container Creation**: Containers are created using images, such as `ubuntu:24.04`, for each application.
- **Network Configuration for Containers**: Set up NAT and bridged networks, depending on the needs of each containerized application.
- **Resource Allocation**: Memory and storage resources are allocated to each container to optimize server performance.

#### Example Commands for LXD/LXC

- **Create a container**: `lxc launch ubuntu:24.04 my-container`
- **List containers**: `lxc list`
- **Manage container storage**: LVM-backed storage pools and volume resizing

## Useful Commands and Tips

| **Command**                                   | **Description**                            |
|-----------------------------------------------|--------------------------------------------|
| `df -h`                                       | Check available disk space                 |
| `free -h`                                     | Display memory usage                       |
| `sudo lxc list`                               | List all LXD containers                    |
| `sudo lxc start <container-name>`             | Start a specific container                 |
| `sudo lxc stop <container-name>`              | Stop a specific container                  |
| `sudo lxc delete <container-name>`            | Delete a container                         |
| `sudo lvextend -L +50G /dev/ubuntu-vg/ubuntu-lv` | Increase the size of the root volume   |
| `sudo lxd init`                               | Initialize LXD settings                    |

## Troubleshooting and Challenges**

Documented here are common issues faced and solutions:

- **Container Networking**: Configuring network settings to ensure containers have internet access.
- **Storage Expansion**: Adjusting logical volumes and partition sizes as application requirements increase.
- **LXD Snap Installation Conflicts**: Issues with `snap` installation and removing old configurations were resolved with manual configuration cleanup.

Details are provided in `troubleshooting/common-issues.md`.

## Future Plans

- **Automation with Scripts**: Automate regular tasks such as backup, updates, and resource monitoring.
- **Containerized Application Deployments**: Experiment with deploying web applications and databases in containers.
- **Performance Monitoring**: Implement monitoring tools for resource tracking and load balancing between containers.

## Contributions

This repository is primarily for documenting my learning experience, but contributions or feedback are welcome. If you have suggestions or improvements, feel free to open an issue or submit a pull request.

<hr>

[Amaan Ul Haq Siddiqui](https://www.linkedin.com/in/amaanulhaqsiddiqui/).