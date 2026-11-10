---
title: "Changelog, a light and dark switch, custom heroes and template updates (2026-11-10)"
description: "Four things the first version couldn't do."
canonical_url: https://toolsite.itsryan.me/changelog/2026-11-10-first-release
---

# Changelog, a light and dark switch, custom heroes and template updates (2026-11-10)

**Sites can now keep release notes, readers can pick light or dark, a site can bring its own hero demo, and existing sites can pull in template improvements.**

## Changelog

Put dated Markdown files in `content/changelog`, named like `2026-11-10-what-changed.md`. The site adds a Changelog link to the header, an index page, a page per entry, Markdown copies and entries in `llms.txt`. See [Changelog](https://toolsite.itsryan.me/docs/changelog.md).

## Light and dark

There's now a switch in the header and the docs sidebar. Pages still follow the system until a reader picks, and the choice is remembered.

## Custom heroes

Drop a `Hero.svelte` into `src/custom` and it replaces the sample on the landing page. CSS files there load on every page. Template updates never touch that folder.

## Template updates

`scripts/update-site.sh` brings a site up to the latest template. It replaces the template's code and leaves your words, images and `src/custom` alone. See [Updating a site](https://toolsite.itsryan.me/docs/updating.md).
