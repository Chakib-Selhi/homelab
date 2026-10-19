#!/usr/bin/env bash
# Example offsite backup using rclone. Sanitized: remote names and paths are
# placeholders. Real rclone config lives in ~/.config/rclone and is NOT in git.
#
# 3-2-1: this handles the offsite copy. The NAS redundant pool is copy 1,
# a periodic external drive is the cold copy.
set -euo pipefail

SRC="${SRC:-/volume1/data}"
REMOTE="${REMOTE:-offsite-encrypted}"     # an rclone crypt remote
DEST="${DEST:-backup/nas}"

echo "Starting offsite sync: ${SRC} -> ${REMOTE}:${DEST}"
rclone sync "${SRC}" "${REMOTE}:${DEST}" \
  --fast-list \
  --transfers 4 \
  --log-level INFO \
  --log-file /var/log/rclone-backup.log

echo "Offsite sync complete."
