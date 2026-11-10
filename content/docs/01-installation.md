---
title: Installation
description: What you need, and how to make a site for a tool.
group: Start
---

**toolsite is a template. You copy it once per tool, and each copy becomes that tool's site.**

## What you need

- Node 22 or later.
- The [GitHub CLI](https://cli.github.com), logged in, if you want to publish to GitHub Pages.

## Get the template

```sh
git clone https://github.com/rynf1t/toolsite
```

Keep it somewhere you'll find it again, like `~/Projects/toolsite`. You never edit the template to make a site. You make a copy.

## Make a site

```sh
toolsite/scripts/new-site.sh mytool
```

This makes `mytool-site` next to the template, with a starter config, one docs page, a fresh git repository and its packages installed. Add `--from` with your tool's folder and it also brings across the tool's `docs/` folder, or its README if there's no `docs/`:

```sh
toolsite/scripts/new-site.sh mytool --from ~/Projects/mytool
```

To publish on your own domain, add `--domain`. The site goes to `mytool.example.com`, and the deploy adds the DNS record if the domain is on Cloudflare:

```sh
toolsite/scripts/new-site.sh mytool --from ~/Projects/mytool --domain example.com
```

The [quick start](/docs/quick-start) goes from here to a published site.
