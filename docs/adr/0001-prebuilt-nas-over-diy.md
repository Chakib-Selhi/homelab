# ADR-0001: Prebuilt x86 NAS over a DIY build

- Status: accepted
- Date: <YYYY-MM-DD>

## Context

The primary goal is reliable bulk storage with automated cloud backups and
irreplaceable photos, with a secondary interest in running containers and a
possible home-automation VM. The platform must be low-maintenance and protect
data I cannot re-download.

## Options considered

1. **Full DIY build** — best hardware value and maximum flexibility, but highest effort, no integrated support, and more surface area for mistakes on a first build protecting irreplaceable data.
2. **Repurpose an old PC** — cheapest, good for learning, but uncertain reliability for 24/7 use, limited drive bays, and higher power draw.
3. **Prebuilt x86 NAS with open drive support** — turnkey, polished backup software, low power, quiet, Docker + VM capable, warranty.

## Decision

Chose a prebuilt x86 4-bay NAS with open (non-locked) drive support. The
deciding factor was data safety and low maintenance for a first build, without
giving up the ability to run containers and a VM later.

## Consequences

- Easier: automated cloud sync, photo management, Docker, remote access apps.
- Harder: less hardware flexibility than DIY; tied to the vendor's OS.
- Revisit: if tinkering becomes the priority, a mini-PC + TrueNAS/Unraid build is the upgrade path.
