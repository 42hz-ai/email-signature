# 42hz.ai email signatures

A small static page Tim and Geethan can open, pick a name and layout, then copy HTML into Gmail, Apple Mail, or Outlook.

The copied HTML is email-safe: tables, inline styles, Helvetica/Arial, and a hosted logo. Email clients do not run the page’s JavaScript — once pasted, the signature is just that HTML.

**Live:** [https://42hz-ai.github.io/email-signature/](https://42hz-ai.github.io/email-signature/?person=geethan)

Hosted on GitHub Pages from the repo root. GitHub’s file preview will not run it.

## How to use it

1. Open [the live page](https://42hz-ai.github.io/email-signature/) (or `signature.html` locally).
2. Click **Tim** or **Geethan**.
3. Pick **Split**, **Stacked**, or **Compact**.
4. Change any field if you need to (meeting link, logo URL, title).
5. Click **Copy HTML**, then paste into the email client’s signature / HTML editor.

A blank meeting URL hides the “Schedule a meeting” row.

Defaults live in `config.js`. The form and query params override them for a session:

`?person=geethan&layout=split&logo=https://...&meeting=https://...`

## Dev container

Open the repo in a dev container (VS Code or Cursor: **Reopen in Container**). The container uses Python 3.14 and includes the GitHub CLI (`gh`).

On first create, `post-create.sh` runs `configure_git.sh` and starts a local preview server. The server also restarts when you reopen the container.

Preview URL: **http://localhost:8765/signature.html**

To start or restart the preview manually:

```bash
python3 -m http.server 8765
```

To run Git setup interactively (name, email, SSH remotes):

```bash
.devcontainer/configure_git.sh
```

## Files

| File | Role |
| --- | --- |
| `index.html` | GitHub Pages entry; redirects to the tool |
| `signature.html` | The tool (preview + copy) |
| `config.js` | Shared defaults and people |
| `assets/logo-42hz-email.png` | Smaller logo for email (~16KB, 240×79) |
| `.devcontainer/` | Python dev container, GitHub CLI, local preview |

## Todo

- [ ] **Geethan:** Upload `assets/logo-42hz-email.png` to the 42hz.ai site (suggested URL: `https://42hz.ai/assets/logo-42hz-email.png`) and update `logoUrl` in `config.js`. The current site logo is a 59KB 640×218 PNG; this version is cropped, retina-sized for a 120×40 display, and much smaller for inboxes that load remote images.
