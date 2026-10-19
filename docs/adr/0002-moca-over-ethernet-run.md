# ADR-0002: MoCA backhaul over pulling new Ethernet

- Status: accepted
- Date: <YYYY-MM-DD>

## Context

The gateway is on an upper floor and must stay there for whole-home coverage.
The basement lab needs a reliable wired link. The room has a coaxial wall
outlet but no Ethernet drop, and pulling cable through finished floors is
disruptive.

## Options considered

1. **Pull a dedicated Ethernet run** — best raw performance and lowest latency, but requires drilling and fishing cable through floors.
2. **Wi-Fi backhaul / repeater** — no cabling, but variable latency and throughput, poor for a NAS.
3. **MoCA over existing coax** — reuses the coax already in the room, near-wired performance, minimal install effort.

## Decision

Chose MoCA. It reuses existing cabling, delivers low-latency wired-class
performance, and avoids opening walls, which fits a rented or shared-living
basement.

## Consequences

- Easier: no construction; stable wired link to the lab.
- Harder: requires compatible splitters and a PoE filter; one extra link in the path to troubleshoot.
- Revisit: if a dedicated Ethernet run becomes feasible, it is the marginal upgrade.
