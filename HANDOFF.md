> **Delete this file** before publishing or sharing the repo. Temporary handoff notes only.

# 42hz email signature — handoff summary

## What this is

Static HTML tool for Tim and Geethan to build 42hz.ai email signatures. Pick a person, pick a layout, edit fields, copy HTML, paste into Gmail / Apple Mail / Outlook HTML editor.

- Email-safe output: tables, inline styles, Helvetica/Arial, hosted logo URL
- Copy puts **HTML markup** on the clipboard (not plain rendered text)
- JS only runs in the browser tool — pasted signature is static HTML
- Does **not** work on GitHub file preview; needs **GitHub Pages** (or local server)

## Repo layout

```
email-signature/
├── index.html              # Pages entry → redirects to signature.html
├── signature.html          # The tool (preview + form + Copy HTML)
├── config.js               # Defaults + people (Tim, Geethan)
├── assets/logo-42hz-email.png   # Smaller logo (~16KB, 240×79) — not hosted yet
├── README.md
└── .devcontainer/
    ├── devcontainer.json
    ├── post-create.sh      # configure_git + start preview server
    └── configure_git.sh    # Git name/email, SSH remotes, vim, etc.
```

## People (config.js)

| Person  | Email           | Title            | Meeting URL |
|---------|-----------------|------------------|-------------|
| Tim     | tim@42hz.ai     | Co-Founder / CTO | https://scheduler.zoom.us/timothy-sabat/30m |
| Geethan | geethan@42hz.ai | Co-Founder       | (blank — hides meeting row) |

Shared defaults:

- website: https://42hz.ai
- logo: https://42hz.ai/assets/logo-42hz.png (59KB site asset; lighter version in repo not uploaded yet)
- logo display size: 120×40

## Layouts

- **Split** — logo + gold vertical rule + outlined meeting button
- **Stacked** — letterhead, gold rule under logo, gold meeting link
- **Compact** — smaller logo, gold underline under name

## Query params

`?person=geethan&layout=split&logo=https://...&meeting=https://...`

Field overrides also work by name. Blank `meetingUrl` hides “Schedule a meeting”.

## Dev container

**Image:** `mcr.microsoft.com/devcontainers/python:3.14-bookworm`  
**Features:** GitHub CLI (`gh`, latest from GitHub releases)  
**Port:** 8765 (auto-forward, opens browser)

**On create:** `post-create.sh` runs `configure_git.sh` (non-interactive defaults) + starts preview server  
**On reopen:** `postStartCommand` restarts preview if not running

**Preview URL:** http://localhost:8765/signature.html

Manual commands:

```bash
python3 -m http.server 8765          # restart preview
.devcontainer/configure_git.sh       # interactive git setup
gh auth login                        # authenticate GitHub CLI
```

## GitHub Pages (when ready)

1. Push repo to GitHub
2. Enable Pages from repo root
3. Share: `https://<you>.github.io/email-signature/?person=geethan`

Use `gh` inside dev container for repo/Pages setup.

## Todo

- [ ] Geethan: upload `assets/logo-42hz-email.png` to 42hz.ai (suggested: `https://42hz.ai/assets/logo-42hz-email.png`) and update `logoUrl` in `config.js`
- [ ] Geethan: add real meeting URL when available
- [ ] Push to GitHub + enable Pages
- [ ] **Delete this file (`HANDOFF.md`)**

## Design constraints (already baked in)

- No San Francisco font — Helvetica/Arial only
- No base64/data: images — hosted HTTPS logo only
- Logo links to https://42hz.ai, `alt=""` on image
- Title does not repeat “42hz.ai” (gold site link below is enough)
- Brand colors: gold `#eeb94a`, near-black `#0b0f14`, gray `#5a6472`
