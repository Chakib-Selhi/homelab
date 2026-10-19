# Hardware

Selected components for the build. Status: selected; pool not yet finalized.

## Compute and storage

| Component | Model | Specs | Notes |
|-----------|-------|-------|-------|
| NAS | UGREEN NASync DXP4800 Plus | Intel Pentium Gold 8505 (5-core), 8 GB DDR5, 4 bays, 10GbE + 2.5GbE, 2x M.2 | Docker + VM capable, open (non-locked) drive support |
| Drives | WD Red Plus / Seagate IronWolf | `<count> x <size>`, CMR, NAS-rated | redundant pool, sizes TBD |
| Cache (optional) | `<model>` | `<size>` M.2 NVMe | optional read/write cache |

## Network

| Component | Model | Specs | Notes |
|-----------|-------|-------|-------|
| Gateway | ISP gateway (DOCSIS 3.1) | ~900 Mbps plan | provided by ISP, upper floor |
| Switch | TP-Link TL-SG108S-M2 | 8 x 2.5GbE, unmanaged, fanless | basement lab |
| MoCA A/B | ASUS MA-25 x2 | MoCA 2.5, 2.5GbE port, MPS security | Ethernet over coax |
| PoE filter | MoCA point-of-entry filter | low-pass | installed at coax entry |

## Clients

| Component | Model | Link | Notes |
|-----------|-------|------|-------|
| Workstation | Mac mini M4 | 1GbE (2.5GbE via USB-C adapter optional) | NAS client |

## Notes on selection

- Drives are CMR and NAS-rated for 24/7 duty; sizes depend on final data inventory.
- The switch is 2.5GbE to match the NAS ports and keep local transfers fast, independent of the 900 Mbps internet. See [ADR-0004](adr/0004-switch-2-5gbe.md).
- MoCA adapters expose a true 2.5GbE port, though the link mainly carries internet. See [ADR-0003](adr/0003-moca-speed-tier.md).
