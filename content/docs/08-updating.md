---
title: Updating a site
description: Pulling template improvements into an existing site.
group: Guide
---

**Each site is a copy of the template, so it doesn't change on its own. `scripts/update-site.sh` brings it up to date.**

## Run it

```sh
scripts/update-site.sh
npm run check && npm run build
git diff
```

Commit when you're happy with it. The script won't run with uncommitted changes, so the update is always a diff of its own.

## What it changes

The template's code: `src` (apart from `src/custom`), the scripts, `AGENTS.md`, `CLAUDE.md` and the build config. It takes the template's `package.json` but keeps your site's name, and runs `npm install` if the packages changed. It records the template version in `.toolsite-version`.

## What it leaves alone

`site.config.ts`, `content`, `static`, `src/custom` and `README.md`. Those are the site's.

## Where the template comes from

`--template DIR` if you give it, then `$TOOLSITE_TEMPLATE`, then `~/Projects/toolsite`, and otherwise a fresh clone from GitHub.
