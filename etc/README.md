## Ports Enabled 

| Port  | Service            | Details                                       |
|-------|--------------------|-----------------------------------------------|
| 2**  | SSH                | Secure Shell access.                          |
| 80    | NGINX (Reverse Proxy) | Forwarding requests for Jenkins and other services. |
| 8080  | Jenkins (Proxied to 80) | Automation server (proxied via NGINX).    |
| 8443  | LXD WebUI          | LXD Web interface.                            |
| 8000  | Portainer          | Portainer management endpoint.                |
| 9443  | Portainer (HTTPS)  | Secure management endpoint.                   |
| 8081  | cAdvisor           | Container metrics and insights.               |
| 6379  | Redis              | In-memory database.                           |
| 3000  | Grafana            | Monitoring and visualization.                 |
| 9090  | Prometheus         | Metrics monitoring system.                    |
| 9100  | Node Exporter      | System metrics for Prometheus.                |
