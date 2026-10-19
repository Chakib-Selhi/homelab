# Services

Each subfolder is one Docker stack. Commit only:

- `docker-compose.example.yml` (sanitized, placeholders for paths/ports)
- `.env.example` (placeholder values)
- a short description

Never commit the real `docker-compose.yml` if it holds secrets, the real
`.env`, or the `./config` and `./data` bind mounts. These are gitignored.

## Stacks

| Folder | Purpose | Exposure |
|--------|---------|----------|
| immich | Self-hosted photo library | LAN / overlay only |
| media-stack | Media library and streaming (Jellyfin) | LAN / overlay only |
| home-assistant | Home automation + HomeKit bridge | LAN / overlay only |

See [`../docs/services.md`](../docs/services.md) for the full plan.
