# Services

All services run as Docker containers on the NAS. None are exposed to the
public internet; access is over the LAN or a private overlay network (Tailscale).

## Running / planned

| Stack | Purpose | Status |
|-------|---------|--------|
| immich | Self-hosted photo library with mobile app and face recognition; replaces cloud photos | planned |
| media (Jellyfin) | Personal media library and streaming | planned |
| home-assistant | Home automation; HomeKit bridge re-exposes non-HomeKit devices into Apple Home | planned |
| pi-hole / adguard | Network-wide ad and tracker blocking | backlog |
| vaultwarden | Self-hosted password manager (Bitwarden-compatible) | backlog |
| paperless-ngx | Document scanning and archiving | backlog |
| tailscale | Private overlay network for remote access | planned |

## Conventions

- Each stack lives under `services/<stack>/` with a sanitized `docker-compose.example.yml` and an `.env.example`.
- Real `.env`, bind-mounted `config/` and `data/` are gitignored.
- No `ports:` are published beyond the LAN; remote access is via the overlay network.

## Home automation note

Home Assistant includes a HomeKit bridge integration. Devices that are not
natively HomeKit-compatible can be added to Home Assistant and then surfaced in
Apple Home through that bridge, which keeps the option open to buy non-HomeKit
hardware without leaving the existing ecosystem.
