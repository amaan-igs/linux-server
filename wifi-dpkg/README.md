# Wi-Fi IP Reservation through MAC Address in Router

## Overview
Reserving an IP address in your router ensures that your server or device consistently receives the same IP every time it connects to your Wi-Fi network. This is essential for setups like servers, smart home devices, or remote access systems.

## Steps to Reserve an IP for Wi-Fi Interface in Router

### 1. Log into Your Router
- Connect to your Wi-Fi network.
- Open a web browser and type the router’s gateway IP address (commonly 192.168.1.1 or 192.168.0.1).

#### How to Find the Router’s IP:
- **On Linux:** Run `ip route | grep default`.
- **On Windows:** Use `ipconfig` in Command Prompt and look for the “Default Gateway.”

- Enter your router’s username and password (default credentials are often on a label on your router or in its manual).

### 2. Navigate to DHCP or LAN Settings
- Once logged in, look for the DHCP Settings, LAN Settings, or Advanced Settings section.
- This location varies by router model/brand (e.g., TP-Link, Netgear, Huawei, etc.).
- Find the Address Reservation or Static IP Assignment option.

### 3. Identify Your Wi-Fi Interface
- On your device (e.g., Linux server or PC), determine the MAC address of the Wi-Fi interface:

    - **Linux:** Run `ip link show wlp2s0` or `ifconfig wlp2s0` and find the MAC address (e.g., a0:f4:b7:e2:3b:01).
    - **Windows:** Run `ipconfig /all` and look for the "Physical Address" under your Wi-Fi adapter.

- Copy the MAC address exactly as shown.

### 4. Add a Static IP Reservation
- In the DHCP Reservation section of your router:
    - **MAC Address:** Input your device’s Wi-Fi MAC address (ensure the correct format: XX:XX:XX:XX:XX:XX or XX-XX-XX-XX-XX-XX).
    - **IP Address:** Assign an IP within your router's subnet range (e.g., 192.168.1.106).
- Click Add or Reserve.

### 5. Save and Reboot
- Save the changes to apply the new reservation.
- Reboot the router for the settings to take effect.

## Verifying Configuration
- Reconnect the server or device to Wi-Fi.
- Check the assigned IP:
    - **Linux:** Run `ip addr show wlp2s0` or `nmcli device show wlp2s0`.
    - **Windows:** Use `ipconfig` and look for the IPv4 address.
- Ensure the assigned IP matches the reserved one.

## Troubleshooting

### 1. Invalid MAC Address Format
- Convert between formats if needed:
    - From `a0:f4:b7:e2:3b:01` to `A0-F4-B7-E2-3B-01`.
- Ensure it’s uppercase.

### 2. Duplicate Reservations
- Check for existing reservations with the same MAC or IP.
- Remove any duplicates.

### 3. Router Compatibility Issues
- Verify your router supports IP reservations.
- Update your router firmware if the option is unavailable.

### 4. Confirm Subnet Range
- Ensure the reserved IP is within the DHCP range of the router (e.g., 192.168.1.100–192.168.1.200).

## Optional: Port Forwarding for Remote Access
- Navigate to Port Forwarding or NAT Settings on your router.
- Add a rule to forward specific ports (e.g., 80 for HTTP or 22 for SSH) to the reserved IP.

## Notes
- IP reservation ensures consistency within the local network but does not affect public IP assignments.
- To maintain external access, consider using a Dynamic DNS (DDNS) service.