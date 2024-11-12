# Netplan Configuration Guide

This guide provides instructions on configuring network settings using Netplan on your Ubuntu server. It includes steps to apply the configuration, check the network interface, and draft a `00-installer-config.yaml` file for Wi-Fi settings.

## Applying Netplan Configuration

To apply the Netplan configuration, use the following command:

```sh
sudo netplan apply
```

This command applies the current Netplan configuration, making any changes take effect immediately.

## Checking Network Interface

To check the network interfaces and their configurations, use the following command:

```sh
ip -a
```

This command displays detailed information about all network interfaces on the server.

## Drafting `00-installer-config.yaml`

Below is an example of a `00-installer-config.yaml` file for configuring Wi-Fi settings on your server:

```yaml
network:
    version: 2
    renderer: networkd
    wifis:
        wlp2s0:  # Replace 'wlp2s0' with your Wi-Fi interface name
            dhcp4: yes
            access-points:
                "Your_WiFi_Network_Name":
                    password: "Your_WiFi_Password"
```

Replace `wlp2s0` with the actual name of your Wi-Fi interface, and update `Your_WiFi_Network_Name` and `Your_WiFi_Password` with your network's SSID and password.

## Summary

1. **Apply Netplan Configuration**: `sudo netplan apply`
2. **Check Network Interface**: `ip -a`
3. **Draft `00-installer-config.yaml`**: Configure Wi-Fi settings as shown in the example above.

By following these steps, you can configure and manage network settings on your Ubuntu server using Netplan.