---
title: "Quick start"
description: "From an empty site to a published one."
canonical_url: https://toolsite.itsryan.me/docs/quick-start
---

# Quick start

**Four steps: make the site, fill in the config, write the docs, publish.**

## 1. Make the site

```sh
toolsite/scripts/new-site.sh mytool --from ~/Projects/mytool
cd mytool-site
npm run dev
```

The dev server prints an address, usually `http://localhost:5173`. Keep it open while you work. It reloads on every save.

## 2. Fill in the config

Open `site.config.ts`. Every `TODO:` needs a real value: the one sentence that says what the tool is, the install command and what it needs to run. The two colour hues start out picked from the name. Change them if you like. [Configuration](https://toolsite.itsryan.me/docs/configuration.md) covers every field.

## 3. Write the docs

Each page is a Markdown file in `content/docs`, named like `03-commands.md`. The number sets the order. [Writing docs](https://toolsite.itsryan.me/docs/writing-docs.md) has the conventions.

## 4. Publish

```sh
scripts/deploy-pages.sh
```

The first run creates a public GitHub repository for the site and turns on Pages. After that, the same command updates it. GitHub usually has it live within a minute. See [Deploying](https://toolsite.itsryan.me/docs/deploying.md) for your own domain.
