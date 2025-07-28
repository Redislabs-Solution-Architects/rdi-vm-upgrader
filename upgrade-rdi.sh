#!/bin/bash
#
# Redis Data Integration (RDI) Upgrade Script
# --------------------------------------------
# This script upgrades an existing RDI installation on a RHEL server.
# Ensure you run this script as a privileged user (sudo/root) and that
# your current working directory has sufficient space for the download.
#
# Version, host, port, and password are defined as constants for clarity and reuse.
#
# Owner: Gabriel Cerioni (LATAM Senior Solutions Architect)
# Champion: Janine Marjoub
# Date: 2025-07-27

# === CONFIGURATION ===
RDI_VERSION="1.12.3"
RDI_PASSWORD="secret42"
RDI_HOST="localhost"
RDI_PORT="12000"

# === SCRIPT START ===
set -e  # Exit on error

echo "[INFO] Upgrading Redis RDI to version $RDI_VERSION on $RDI_HOST:$RDI_PORT..."

# Clean up immutable Jobs that can block upgrade
echo "[INFO] Cleaning up previous webhook Jobs (if any)..."
kubectl delete job rdi-operator-webhook-certgen -n rdi --ignore-not-found
kubectl delete job rdi-operator-webhook-certpatch -n rdi --ignore-not-found

# Download RDI installer
echo "[INFO] Downloading RDI installer..."
wget -q "https://redis-enterprise-software-downloads.s3.amazonaws.com/redis-di/rdi-installation-$RDI_VERSION.tar.gz"

# Extract the installer
echo "[INFO] Extracting installer..."
tar -xvf "rdi-installation-$RDI_VERSION.tar.gz"

# Navigate to installation folder
cd "rdi_install/$RDI_VERSION"

# Run upgrade (user must type 'y' when prompted)
echo "[INFO] Running upgrade... (You will be prompted to confirm with 'y')"
sudo ./upgrade.sh \
  --rdi-host "$RDI_HOST" \
  --rdi-port "$RDI_PORT" \
  --rdi-password "$RDI_PASSWORD" \
  --log-level DEBUG

# Validation
echo "[INFO] Validating upgrade..."
redis-di --version
