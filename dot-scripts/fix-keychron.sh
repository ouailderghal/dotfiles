#!/bin/bash

# ==============================================================================
# KEYCHRON LINUX FIX FOR HID DEVICE C0NNECTED [K]
# Author: morkev
#
# Contributors:
# - SIMULATAN: Fixed dongle interference by filtering out "Link" devices.
# - karoltheguy: Added SELinux context reset (restorecon) to prevent silent blocks.
# - wanjas: Verified 'input' group addition is required for distros like Pop_OS.
# - Veliion: simplifying the script for multiple devices (mice, dongles) at once.
#
# INSTRUCTIONS
#
# Step 1: Open your terminal and create the file:
#   nano fix-keychron.sh
#
# Step 2: Paste this entire script into the nano editor.
#
# Step 3: Save and Exit nano
#   Press Ctrl + O to save.
#   Press Enter to confirm.
#   Press Ctrl + X to exit.
#
# Step 4: Make executable and run
#   chmod +x fix-keychron.sh
#   sudo ./fix-keychron.sh
# ==============================================================================

# --- 1. QUICK CHECK ---
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo: sudo ./fix-keychron.sh"
  exit 1
fi

# --- 2. SETUP VARIABLES ---
REAL_USER=${SUDO_USER:-$USER}
USER_GROUP=$(id -gn "$REAL_USER")
RULE_FILE="/etc/udev/rules.d/99-keychron.rules"

# --- 3. FIND KEYCHRON VENDOR ID ---
echo "Looking for Keychron devices..."

# Grab the first Keychron device found to extract the Vendor ID.
# Since we now ignore $PRODUCT_ID, it doesn't matter if it grabs the keyboard or the dongle first.
KEYCHRON_INFO=$(lsusb | grep -i "Keychron" | head -n 1)

if [ -z "$KEYCHRON_INFO" ]; then
    echo "No Keychron device detected. Please ensure it is plugged in via USB."
    exit 1
fi

echo "Found: $KEYCHRON_INFO"

# Extract the Vendor ID
VENDOR_ID=$(echo "$KEYCHRON_INFO" | awk '{print $6}' | cut -d':' -f1)
echo "Authorizing Keychron Vendor ID: $VENDOR_ID"

# --- 4. APPLY UDEV RULES ---
echo "Creating udev rule at $RULE_FILE..."

# Write the rule dynamically based ONLY on Vendor ID.
# This ensures mice, keyboards, and dongles all work with one rule.
cat <<EOF > "$RULE_FILE"
# Keychron Keyboard/Mouse udev rule for VIA / Keychron Launcher
KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="$VENDOR_ID", MODE="0660", GROUP="$USER_GROUP", TAG+="uaccess", TAG+="udev-acl"
EOF

# Reset SELinux context (if applicable)
if command -v restorecon &> /dev/null; then
    echo "Resetting SELinux context for the udev rule..."
    restorecon -v "$RULE_FILE"
fi

echo "Reloading udev rules..."
udevadm control --reload-rules
udevadm trigger

# --- 5. PERMISSIONS ---
echo "Adding $REAL_USER to the 'input' group..."
usermod -aG input "$REAL_USER"

# --- 6. WRAP UP ---
echo "Done! ALL your Keychron devices should now be accessible."
echo "IMPORTANT: Please unplug your device(s) and plug them back in for the changes to take full effect."
