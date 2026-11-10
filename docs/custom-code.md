---
title: "Custom hero and styles"
description: "A live demo on the landing page, and site-specific CSS."
canonical_url: https://toolsite.itsryan.me/docs/custom-code
---

# Custom hero and styles

**A site can bring its own code in `src/custom`. Template updates never touch that folder.**

## A custom hero

Add `src/custom/Hero.svelte` and the landing page shows it in place of the hero screenshot or code sample. It gets the right-hand column, about 30rem wide on a desktop and the full width on a phone. Keep it light: it runs on every visit to the home page.

Anything the hero imports, like data for a demo, goes in `src/custom` too.

## Custom styles

Every `.css` file in `src/custom` loads on every page, after the template's styles. Use the colour tokens from `src/app.css`, like `--ink`, `--soft`, `--accent` and `--surface`, so both light and dark work.

Colours that only make sense for this tool can go there as new tokens. Define the dark version under `:root[data-mode='dark']`.

## Everything else

Changes anywhere else in `src` are the template's, and `scripts/update-site.sh` replaces them. If a site needs something the template can't do, add it to the template so every site gets it.
