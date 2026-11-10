---
title: Limits
description: What toolsite doesn't do.
group: Reference
---

**It's one landing page and a docs folder per tool. A few things are out of scope on purpose.**

## One tool per site

Each site documents one tool. Two tools that ship together can share a site with sidebar groups, but there's no product switcher.

## No blog or changelog yet

There's no dated posts section. Put release notes in a docs page for now.

## Updates don't flow back

A site is a copy of the template. When the template improves, existing sites don't change. Copy the files you want across by hand, usually `src/lib`, `src/routes` and `src/app.css`, and leave `site.config.ts`, `content` and `static` alone.

## Light and dark only

The site follows the reader's system setting. There's no toggle.
