# How to install Docker and Docker Compose on AlmaLinux

This guide will walk you through installing Docker and the Docker Compose plugin on AlmaLinux 8 and 9.

## Prerequisites

Before you begin, make sure that you have removed any old versions of Docker and Docker Compose:

```bash
sudo dnf remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
```
Also, make sure that podman is not installed as it will conflict with Docker.

```bash
sudo dnf remove podman
```
## Update the system

Before you install Docker, you should make sure that your system is up-to-date with all the latest packages:

```bash 
sudo dnf update
```
## Install Docker Repository

The easiest way to install Docker is to use the official Docker repository. To do this, you will need to install the `dnf-plugins-core` package:

```bash
sudo dnf install dnf-plugins-core
```
Once the package is installed, you can add the Docker repository:

```bash
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```
## Install Docker

Now that the repository is installed, you can install Docker:

```bash
sudo dnf install docker-ce docker-ce-cli containerd.io
```
## Start Docker

Once Docker is installed, you can start the Docker service:

```bash
sudo systemctl start docker
```
You can also enable Docker to start on boot:

```bash
sudo systemctl enable docker
```
You're now ready to use Docker!