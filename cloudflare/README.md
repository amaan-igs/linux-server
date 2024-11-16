# Jenkins Hosting with Nginx and Cloudflare DNS

This guide provides instructions on how to host Jenkins using Nginx as a reverse proxy and manage DNS with Cloudflare. The Jenkins instance will be served on the subdomain `jenkins.inotech-pk.com`.

## Overview

By following this guide, you will:
- Set up Jenkins on your server.
- Configure Nginx as a reverse proxy for Jenkins.
- Manage DNS settings with Cloudflare to point to your Jenkins instance.

## Prerequisites

- A server with Jenkins installed.
- Nginx installed on the server.
- A Cloudflare account managing a domain, In my case `inotech-pk.com`.

## Steps

### 1. Install Jenkins

Follow the official Jenkins installation guide for your operating system: [Jenkins Installation](https://www.jenkins.io/doc/book/installing/).

### 2. Configure Nginx

Create an Nginx configuration file for Jenkins:

```conf
server {
    listen 80;
    server_name jenkins.inotech-pk.com; 
    location / {
        proxy_pass http://localhost:8080; 
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    location ~ /\. {
        deny all;
    }
}
```

Save this configuration in `/etc/nginx/sites-available/jenkins.conf` and create a symlink to enable it:

```sh
sudo ln -s /etc/nginx/sites-available/jenkins.conf /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

### 3. Configure Cloudflare DNS

Log in to your Cloudflare account and navigate to the DNS settings for your domain `inotech-pk.com`. Add a DNS A record:

- **Type:** A
- **Name:** jenkins
- **IPv4 address:** Your server's IP address
- **TTL:** Auto
- **Proxy status:** DNS only

![Cloudflare DNS](cloudflare-dns.png)

### 4. Verify the Setup

Open your web browser and navigate to `http://jenkins.inotech-pk.com`. You should see the Jenkins login page.

![Hosted Site](hosted-site.png)

## Conclusion

You have successfully set up Jenkins to be hosted through Nginx with DNS managed by Cloudflare on the subdomain `jenkins.inotech-pk.com`. This setup ensures that your Jenkins instance is accessible via a user-friendly URL and benefits from Cloudflare's DNS management features.

For any issues or further customization, refer to the official documentation of Jenkins, Nginx, and Cloudflare.