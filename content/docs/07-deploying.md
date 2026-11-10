---
title: Deploying
description: Publishing to GitHub Pages, and using your own domain.
group: Guide
---

**`scripts/deploy-pages.sh` builds the site and publishes it to GitHub Pages. Run it again whenever you change something.**

## What it does

1. Stops if `site.config.ts` still has a `TODO:` in it.
2. Creates a public GitHub repository for the site, named after its folder, if there isn't one.
3. Pushes `main`.
4. Builds the site for the address in `origin`.
5. Replaces the `gh-pages` branch with the build and turns on Pages.

Pages needs a public repository on a free GitHub plan. The site's repository is separate from your tool's, so the tool can stay private.

## Your own domain

Set `origin` in `site.config.ts` to the address, like `https://mytool.example.com`, and deploy. The script sees the domain isn't on github.io, so it builds without a subfolder, adds the `CNAME` file and tells GitHub about the domain.

If the domain's DNS is on Cloudflare, the script adds the DNS record too. It needs a Cloudflare token for that, which you save once per Mac:

```sh
scripts/cloudflare-token.sh
```

It opens Cloudflare's token page, checks the token you paste, and keeps it in your login keychain. From then on every deploy makes sure there's a DNS-only `CNAME` from the domain to your `github.io` address. It never replaces a record that points somewhere else. It tells you what's there and stops.

Without a token, add that `CNAME` yourself. Leave Cloudflare's proxy off for it, so GitHub can issue the certificate. HTTPS usually works within a few minutes, and the next deploy switches on HTTPS only.

## Somewhere else

`npm run build` writes a plain static site to `build/`. Any static host can serve it. Set `VITE_ORIGIN` to the address, and `VITE_BASE` too if it lives under a subfolder.
