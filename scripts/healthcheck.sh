#!/usr/bin/env bash
# Minimal homelab health check: pool free space, container status, and whether
# key services answer. Prints a short report. Extend as needed.
set -euo pipefail

echo "== Disk usage =="
df -h | awk 'NR==1 || /\/volume|\/mnt/'

echo
echo "== Running containers =="
if command -v docker >/dev/null 2>&1; then
  docker ps --format 'table {{.Names}}\t{{.Status}}'
else
  echo "docker not found"
fi

echo
echo "== Service reachability =="
for url in "http://localhost:8096" "http://localhost:2283"; do
  if curl -fsS -o /dev/null --max-time 5 "$url"; then
    echo "OK   $url"
  else
    echo "DOWN $url"
  fi
done
