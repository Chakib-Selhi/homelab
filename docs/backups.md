# Backups

RAID is not a backup. The redundant pool protects against a single drive
failure, not against accidental deletion, ransomware, theft, or fire. This lab
follows a 3-2-1 strategy, with photos treated as the highest priority.

## 3-2-1

| Copy | Location | Medium | Frequency |
|------|----------|--------|-----------|
| Primary | NAS redundant pool | on-site | continuous |
| Secondary | Encrypted offsite (`<cloud or remote>`) | off-site | scheduled (see `scripts/backup.sh`) |
| Cold | External drive, kept offline | on-site, offline | periodic |

## Snapshots

The volume uses Btrfs snapshots on important shares, which guard against
accidental changes and deletions and allow point-in-time recovery.

## Offsite job

`scripts/backup.sh` runs an `rclone sync` to an encrypted remote. The real
rclone configuration lives in `~/.config/rclone` and is never committed.

## Restore testing

A restore is tested periodically from each copy. An untested backup is not a
backup. Record each test here:

- `<date>`: restored `<what>` from `<copy>` -> `<result>`.
