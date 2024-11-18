# PromGrafNode Setup

This guide provides instructions on setting up a monitoring stack using Docker Compose. The stack includes Prometheus, Grafana, Redis, Node Exporter, and cAdvisor.

## Folder Structure

To ensure proper volume mounting, create the following folder structure:

```sh
mkdir -p promgrafnode/prometheus && \
mkdir -p promgrafnode/grafana/provisioning && \
touch promgrafnode/docker-compose.yml && \
touch promgrafnode/prometheus/prometheus.yml
```

```
  promgrafnode/
  ├── docker-compose.yml
  ├── grafana/
  │   └── provisioning/
  └── prometheus/
      └── prometheus.yml
 ```

## Starting the Stack

With the correct folder structure in place, you can start the stack using Docker Compose:

```sh
cd promgrafnode
docker compose up -d
```

You should see output indicating that all containers are running:

```sh
[+] Running 5/5
 ✔ Container redis        Running 0.0s
 ✔ Container node-exporter Running 0.0s
 ✔ Container grafana      Running 0.0s
 ✔ Container cadvisor     Running 0.0s
 ✔ Container prometheus   Started 1.1s
```

Ensure that the `prometheus.yml` file has the correct permissions:

```sh
chmod 644 promgrafnode/prometheus/prometheus.yml
```

Running `docker compose up -d` again will confirm that all containers are running:

```sh
[+] Running 5/0
 ✔ Container prometheus   Running 0.0s
 ✔ Container redis        Running 0.0s
 ✔ Container node-exporter Running 0.0s
 ✔ Container grafana      Running 0.0s
 ✔ Container cadvisor     Running 0.0s
```

The following services will be started:
 * Redis
 * Node Exporter
 * Grafana
 * cAdvisor
 * Prometheus
 
 If you need to adjust permissions for configuration files, use `chmod` as necessary.