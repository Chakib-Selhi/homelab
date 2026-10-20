# Security and operations

This document describes the security posture of the lab. It is deliberately
specific about *approach* and deliberately vague about *exploitable detail*
(exact versions, public endpoints, internal rules), which is itself a design
choice.

## Principles

1. Minimize exposure. No inbound ports are forwarded on the gateway.
2. Assume the repo is public. Nothing committed should help an attacker.
3. Secrets never touch git history.
4. Backups are tested, not assumed.

## Remote access

Remote access uses a private overlay network (Tailscale) rather than port
forwarding or a DMZ. Devices authenticate to a coordination service and reach
each other over an encrypted mesh; nothing is published to the public internet.

## Secrets hygiene

- `.env` files are gitignored; only `.env.example` templates with placeholder values are committed.
- A pre-commit hook runs `gitleaks` to block accidental secret commits.
- If a secret is ever committed, it is rotated immediately and purged from history with `git filter-repo` (removing it in a later commit is not enough, it remains in history).

### Pre-commit hook (example)

```bash
# .git/hooks/pre-commit  (make executable: chmod +x)
#!/usr/bin/env bash
if command -v gitleaks >/dev/null 2>&1; then
  gitleaks protect --staged --redact || {
    echo "gitleaks found a potential secret. Commit aborted."
    exit 1
  }
fi
```

## What is never committed

Public IP addresses, Wi-Fi SSIDs or passwords, any credentials, API keys or
auth keys, private keys and certificates, real `.env` files, serial numbers,
and account identifiers. IP addresses shown in docs are placeholders or
documentation ranges (RFC 5737: 192.0.2.0/24, 198.51.100.0/24, 203.0.113.0/24).

## Account hardening

- Dedicated admin account separate from the daily-use account.
- 2FA enabled on the NAS admin account.
- Automatic IP ban after repeated failed logins.
- Firmware and container images kept current.

## Backups (3-2-1)

| Copy | Location | Medium |
|------|----------|--------|
| Primary | NAS redundant pool | on-site |
| Secondary | Encrypted offsite (Backblaze B2) | off-site |
| Cold | External drive updated periodically | on-site, offline |

A restore is tested periodically. An untested backup is not a backup.

## Threat notes

- Accidental secret exposure in a public repo: mitigated by gitignoring `.env` files, committing only `.env.example` templates, and enforcing gitleaks secret scanning in CI.
