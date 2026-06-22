#!/usr/bin/env bash
sudo systemctl start tailscaled.service
tailscale up || true
