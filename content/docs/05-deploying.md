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

1. Add a CNAME record at your DNS provider pointing your domain at `you.github.io`.
2. Set `origin` in `site.config.ts` to `https://your.domain`.
3. Run `scripts/deploy-pages.sh`.

The script sees the domain isn't on github.io, builds without a subfolder, adds the `CNAME` file and tells GitHub about the domain. HTTPS can take up to an hour to switch on after the first deploy.

## Somewhere else

`npm run build` writes a plain static site to `build/`. Any static host can serve it. Set `VITE_ORIGIN` to the address, and `VITE_BASE` too if it lives under a subfolder.
