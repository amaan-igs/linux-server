# On-Prem Server Management - Linux-Virtualization 
Welcome to the repository for documenting my journey in managing an on-premises Ubuntu server using LXC/LXD, Docker and Portainer for containerized application hosting. This repository includes setup instructions, storage configurations, and network configurations.

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
- Initial LXD setup
- Docker and Portainer installation and configuration
- Storage management
- Network & DNS configuration
- Container management

## Container Management using Docker and Portainer

Docker is used to create, manage, and configure containers on the server, with Portainer providing a web-based interface for easier management. The following are key steps and configurations:

<img src="https://github.com/user-attachments/assets/09ee2ffd-205a-4b1e-9275-265f45d0eb38" width="416" height="120"/>
<br><br>

- **Installation**: Docker installed using the official Docker repository to ensure the latest stable version.
- **Container Creation**: Containers are created using Docker images for each application.
- **Network Configuration for Containers**: Set up NAT and bridged networks, depending on the needs of each containerized application.
- **Resource Allocation**: Memory and storage resources are allocated to each container to optimize server performance.

#### Example Commands for Docker

- **Create a container**: `docker run -d --name my-container ubuntu:24.04`
- **List containers**: `docker ps`
- **Manage container storage**: Docker volumes and bind mounts

## Useful Commands and Tips

| **Command**                                   | **Description**                            |
|-----------------------------------------------|--------------------------------------------|
| `df -h`                                       | Check available disk space                 |
| `free -h`                                     | Display memory usage                       |
| `docker ps`                                   | List all running Docker containers         |
| `docker start <container-name>`               | Start a specific container                 |
| `docker stop <container-name>`                | Stop a specific container                  |
| `docker rm <container-name>`                  | Delete a container                         |
| `docker volume create <volume-name>`          | Create a Docker volume                     |
| `docker-compose up -d`                        | Start services defined in a Docker Compose file |

## Container Management using LXD/LXC

LXD is used to create, manage, and configure Linux containers (LXC) on the server. The following are key steps and configurations:

<img src="https://github.com/user-attachments/assets/30b34510-e11c-4241-8fa4-c8380dc56305" width="280" height="130"/><br>
- **Installation**: LXD installed using `snap` to ensure the latest stable version.
- **Container Creation**: Containers are created using images, such as `ubuntu:24.04`, for each application.
- **Network Configuration for Containers**: Set up NAT and bridged networks, depending on the needs of each containerized application.
- **Resource Allocation**: Memory and storage resources are allocated to each container to optimize server performance.

## Network Configuration

The server uses WiFi for network connectivity, which can be complex to configure. The following ports are used for various services:

| **Port** | **Service**         | **Description**                              |
|----------|---------------------|----------------------------------------------|
| 80       | NGINX (Reverse Proxy) | Forwarding requests for Jenkins and other services. |
| 8080     | Jenkins (Proxied to 80) | Automation server (proxied via NGINX).    |
| 8443     | LXD WebUI           | LXD Web interface.                            |
| 8000     | Portainer           | Portainer management endpoint.                |
| 9443     | Portainer (HTTPS)   | Secure management endpoint.                   |
| 8081     | cAdvisor            | Container metrics and insights.               |
| 6379     | Redis               | In-memory database.                           |
| 3000     | Grafana             | Monitoring and visualization.                 |
| 9090     | Prometheus          | Metrics monitoring system.                    |
| 9100     | Node Exporter       | System metrics for Prometheus.                |

## Contributing

This repository is primarily for documenting my learning experience, but contributions or feedback are welcome. If you have suggestions or improvements, feel free to open an issue or submit a pull request.

## Contact

For any questions or suggestions, feel free to open an issue or contact me directly.

[Amaan Ul Haq Siddiqui](https://www.linkedin.com/in/amaanulhaqsiddiqui/)
