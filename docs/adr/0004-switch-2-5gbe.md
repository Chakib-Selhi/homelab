# ADR-0004: 2.5GbE switch in the lab

- Status: accepted
- Date: <YYYY-MM-DD>

## Context

The lab needs a switch to fan out the single backhaul link to multiple wired
devices. The NAS has 2.5GbE and 10GbE ports; the workstation has gigabit. The
internet is ~900 Mbps.

## Options considered

1. **Gigabit switch** — cheapest, fine for internet, but caps local NAS <-> workstation transfers at ~1 Gbps regardless of the NAS ports.
2. **2.5GbE unmanaged switch** — modest premium, matches the NAS 2.5GbE port, speeds local transfers, future-proofs.
3. **Managed 2.5GbE switch** — adds VLANs for segmentation, at higher cost and complexity.

## Decision

Chose an unmanaged 2.5GbE switch (TP-Link TL-SG108S-M2). Local transfers run
through the switch and benefit from 2.5GbE even though the internet is slower;
unmanaged keeps it plug-and-play. A managed switch is deferred until network
segmentation (for IoT isolation) is actually needed.

## Consequences

- Easier: fast local transfers; headroom for the NAS multi-gig ports.
- Harder: to exceed 1 Gbps on the workstation side, a USB-C 2.5GbE adapter is needed.
- Revisit: move to a managed switch when VLAN isolation becomes a goal.
