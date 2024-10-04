# Docker Watchtower Setup

This repository contains the configuration and setup instructions for running Watchtower, a tool that automatically updates running Docker containers whenever their base image is refreshed.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
- [Configuration](#configuration)
- [Notifications](#notifications)
- [License](#license)

## Prerequisites

- Docker installed on your machine
- An SMTP email server (e.g., Gmail) for notifications

## Setup Instructions

1. **Clone the repository (if applicable)**:
   ```bash
   git clone https://github.com/yourusername/docker-watchtower.git
   cd docker-watchtower
   ```

2. **Run Watchtower**:
   Use the following command to start Watchtower in detached mode with the desired configuration:
   ```bash
   docker run -d --name watchtower \
     -v /var/run/docker.sock:/var/run/docker.sock \
     -e WATCHTOWER_NOTIFICATIONS=email \
     -e WATCHTOWER_NOTIFICATION_EMAIL_FROM=suji.cloud.mfedu@gmail.com \
     -e WATCHTOWER_NOTIFICATION_EMAIL_TO=sujeeth.m31@gmail.com \
     -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER=smtp.gmail.com \
     -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PORT=587 \
     -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_USER=suji.cloud.mfedu@gmail.com \
     -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PASSWORD=prkqondmezioeqgw \
     -e WATCHTOWER_INTERVAL=300 \
     containrrr/watchtower
   ```

## Configuration

- **Email Notifications**:
  - `WATCHTOWER_NOTIFICATION_EMAIL_FROM`: Sender's email address.
  - `WATCHTOWER_NOTIFICATION_EMAIL_TO`: Recipient's email address.
  - `WATCHTOWER_NOTIFICATION_EMAIL_SERVER`: SMTP server address (e.g., `smtp.gmail.com`).
  - `WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PORT`: SMTP server port (587 for TLS).
  - `WATCHTOWER_NOTIFICATION_EMAIL_SERVER_USER`: Email username.
  - `WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PASSWORD`: Email password (consider using environment variables or secrets for security).

- **Interval**: 
  - `WATCHTOWER_INTERVAL`: Set to `300` seconds (5 minutes) to check for updates every 5 minutes.

## Notifications

Watchtower will send email notifications to the specified recipient whenever it updates a container. Ensure that your email settings allow for SMTP access.
