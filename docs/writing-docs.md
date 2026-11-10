---
title: "Writing docs"
description: "File names, front matter and the conventions every page follows."
canonical_url: https://toolsite.itsryan.me/docs/writing-docs
---

# Writing docs

**Each docs page is one Markdown file in `content/docs`. The site builds the page, the sidebar, search, the Markdown copy and the `llms.txt` entry from it.**

## File names

Name files with a number and a slug, like `03-commands.md`. The number sets the order and the slug becomes the address, so this one lives at `/docs/commands`. The first page is where `/docs` opens, and it should be Installation.

## Front matter

```yaml
---
title: Commands
description: Every command, its flags and what it prints.
group: Reference
---
```

`group` makes the sidebar headings. Pages with the same group sit together, in file order.

## The lead

Make the first paragraph bold, and only that, and it becomes the page's lead: larger, and in full ink. Use it for the one or two sentences that answer what this page is for.

## Headings

Use `##` for sections. Each one gets a link on hover, an entry under the page in the sidebar, and its own result in search. Keep them short and say what's in them.

## Code

Fenced code blocks get syntax colours and a copy button. Name the language after the fence. The ones built in are `sh`, `go`, `json`, `lua`, `ts`, `js`, `yaml`, `toml`, `swift`, `python` and `rust`. Add more in `src/lib/docs.server.ts`.

## Links

Link to other pages by path, like `[Commands](https://toolsite.itsryan.me/docs/commands.md)`. The site adds the base path when it's published under a subfolder, and the Markdown copies turn these links into full addresses that point at other Markdown copies.

## Good docs pages

- Open at installation. Someone arriving cold should get to a working command in one page.
- Put limits next to the feature they limit.
- Write errors and fixes together: what you'll see, and what to do.
- Prefer prose to bullet lists, and tables for anything with two or more fields.
