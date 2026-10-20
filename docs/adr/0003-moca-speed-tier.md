# ADR-0003: MoCA speed tier vs the internet ceiling

- Status: accepted
- Date: 2026-10-19

## Context

MoCA adapters come in 2.0 (~1 Gbps) and 2.5 (~2.5 Gbps) tiers, and many "2.5"
models actually expose only a gigabit Ethernet port. The internet plan is about
900 Mbps.

## Options considered

1. **MoCA 2.0 / gigabit-port adapter** — cheaper, and sufficient for a sub-gigabit internet link.
2. **MoCA 2.5 with a true 2.5GbE port** — future-proofs against a faster plan and avoids an Ethernet-port bottleneck.

## Decision

Selected a MoCA 2.5 adapter with a genuine 2.5GbE port, while acknowledging the
link mainly carries internet (~900 Mbps). The MoCA link rarely needs more than
1 Gbps because local NAS <-> workstation traffic stays on the basement switch
and never crosses MoCA. The 2.5 tier is bought only as cheap insurance against a
future plan upgrade; if the price gap were large, gigabit would be the rational
choice.

## Consequences

- Easier: headroom if the internet plan is upgraded past 1 Gbps.
- Harder: marginally higher cost for capacity not used today.
- Watch: verify the Ethernet port is actually 2.5GbE, not just the MoCA badge.
