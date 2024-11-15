﻿# On-Prem Linux Server Management with LXD/LXC
Welcome to the repository for documenting my journey in managing an on-premises Ubuntu server using LXD/LXC for containerized application hosting. This repository includes setup instructions, storage configurations, and network configurations.

<img src="https://github.com/user-attachments/assets/1757a052-2931-4018-9714-e5a2c250c63f" width="320" height="100"/><br>
## Motivation

The primary motivation behind this project is to hone my skills as a DevOps Engineer and to gain hands-on experience in system operations. While cloud-based VMs are managed by providers, I wanted to take on the challenge of managing a server myself.

## Hardware Specifications

- **Architecture:** x86-64
- **Storage:** 500GB HDD
- **Memory:** 4GB RAM

## Operating System

- **OS:** Ubuntu 24.04 LTS

## Repository Contents

- **Documentation:** Detailed guides and instructions for setting up and managing the server.
- **Configuration Files:** Sample configuration files for various services and settings.

## Topics Covered

- Initial server setup
- LXD/LXC installation and configuration
- Storage management
- Network configuration
- Container management

## Container Management using LXD/LXC

LXD is used to create, manage, and configure Linux containers (LXC) on the server. The following are key steps and configurations:

<img src="https://github.com/user-attachments/assets/30b34510-e11c-4241-8fa4-c8380dc56305" width="280" height="130"/><br>
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

## Contributing

This repository is primarily for documenting my learning experience, but contributions or feedback are welcome. If you have suggestions or improvements, feel free to open an issue or submit a pull request.

## Contact

For any questions or suggestions, feel free to open an issue or contact me directly.

[Amaan Ul Haq Siddiqui](https://www.linkedin.com/in/amaanulhaqsiddiqui/)
