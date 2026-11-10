---
title: Changelog
description: Dated release notes, one Markdown file each.
group: Guide
---

**Release notes live in `content/changelog`, one file per release. Once there's one, the header gets a Changelog link.**

## File names

Name each file with its date and a slug, like `2026-11-10-toasts.md`. The date sets the order, newest first, and the whole name becomes the address: `/changelog/2026-11-10-toasts`.

## Front matter

```yaml
---
title: Toasts when an agent needs you
description: One line for llms.txt and search.
version: 0.3.0
---
```

`version` is optional. It shows under the title.

## Writing an entry

Make the first paragraph bold. It becomes the lead on the changelog page, so it should say what changed for the reader in a sentence or two. Then one `##` section per change. Say what's different now, and what it replaces if anything.

## What the site makes from it

- `/changelog`: every entry, newest first, with its lead and a link to the full post.
- `/changelog/SLUG`: the full post.
- `/changelog.md` and `/changelog/SLUG.md`: Markdown copies for agents.
- `llms.txt` lists the ten newest. `llms-full.txt` and search include every entry.
