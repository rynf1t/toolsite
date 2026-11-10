---
title: "Limits"
description: "What toolsite doesn't do, and how to work around it."
canonical_url: https://toolsite.itsryan.me/docs/limits
---

# Limits

**One landing page and one docs set per site. A few things are out of scope on purpose.**

## Two tools on one site

A site has one landing page. If two tools ship together, give the second its own sidebar group with `group: craftkit` in its pages' front matter, and add a header link with `nav` in `site.config.ts`. If it stands on its own, give it its own site.

## DNS only on Cloudflare

The deploy script can add DNS records on Cloudflare. Anywhere else, add the `CNAME` yourself once per domain.

## GitHub Pages needs a public repository

On a free GitHub plan, so the site's source is public. The tool's own repository can stay private, because the site lives in a separate one.

## Template code is the template's

`scripts/update-site.sh` replaces everything in `src` outside `src/custom`. Put site-specific code in `src/custom`, or add the feature to the template.
