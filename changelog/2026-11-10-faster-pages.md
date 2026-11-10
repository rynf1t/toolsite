---
title: "Faster pages, smoother moves, and taking a site down (2026-11-10)"
description: "Search that's ready before you open it, page cross-fades, and remove-site.sh."
canonical_url: https://toolsite.itsryan.me/changelog/2026-11-10-faster-pages
---

# Faster pages, smoother moves, and taking a site down (2026-11-10)

**Pages load and move faster, and a site can now be taken down with one command.**

## Faster and smoother

- Search fetches its index as soon as you hover or focus the search button, so results are there the moment it opens.
- Pages cross-fade in 150ms. The header and the docs sidebar stay still while the page changes. With Reduce Motion on, pages switch instantly.
- The text font is preloaded, so headings don't reflow as it arrives.
- Images take a `width` and `height`, so the page doesn't jump while they load. The hero here is now a 56 KB WebP.

## Taking a site down

`scripts/remove-site.sh --yes` stops GitHub Pages serving the site, deletes its DNS record on Cloudflare, and archives the repository. See [Deploying](https://toolsite.itsryan.me/docs/deploying.md#taking-a-site-down).
