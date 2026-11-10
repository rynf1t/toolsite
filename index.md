---
title: "toolsite"
description: "A landing page and docs site for a tool, made from one config file and a folder of Markdown."
canonical_url: https://toolsite.itsryan.me/
---

# toolsite

**Every tool you make gets a site like this one.**

Write one config file and a folder of Markdown. You get a landing page, docs with ⌘K search, a changelog, a Markdown copy of every page for agents, and a one-command deploy to your own domain.

```sh
git clone https://github.com/rynf1t/toolsite
```

Needs Node 22 or later and the GitHub CLI to publish.

## From a tool’s folder to its own address.

Make the site from the tool’s repo, write the words, and publish. On your own domain, the deploy adds the DNS record and turns on HTTPS. This site was made the same way.

```
# make a site for a tool
scripts/new-site.sh mytool --from ~/Projects/mytool --domain example.com

# write site.config.ts and content/docs, then look
npm run dev

# publish, with DNS and HTTPS
scripts/deploy-pages.sh
```

[Quick start](https://toolsite.itsryan.me/docs/quick-start.md)

## Write it once, get it five ways.

Each docs page is a Markdown file. The site renders it, adds it to the sidebar and search, serves it as `.md`, and lists it in `llms.txt`. Nothing to keep in step by hand.

| | |
|---|---|
| page | The docs page, with heading links and copy buttons |
| sidebar | Grouped from front matter, ordered by file name |
| ⌘K | Search over every section, built at build time |
| .md | The same page as Markdown, for agents |
| llms.txt | An index of every page, plus llms-full.txt |

[Writing docs](https://toolsite.itsryan.me/docs/writing-docs.md)

## Two numbers set the look.

Pick a hue for the greys and a hue for the accent. Light and dark palettes, shadows, selection, focus and the favicon all follow. Type, spacing and motion come from the build-craft rules and stay the same across your tools.

```
colours: { tint: 255, accent: 75 },
```

[Configuration](https://toolsite.itsryan.me/docs/configuration.md)

## An agent can build the site for you.

The template ships an `AGENTS.md` that says where everything goes and what good copy looks like. Point a coding agent at your tool and the new site folder and it fills in both.

[Read this, agents](https://toolsite.itsryan.me/docs/agents.md)

## Questions

**What does it cost?** Nothing. It builds to static files, and GitHub Pages hosts them for free on a public repo.

**Can I use my own domain?** Yes. Set `origin` and deploy. If your DNS is on Cloudflare, the deploy adds the record for you. See [Deploying](https://toolsite.itsryan.me/docs/deploying.md#your-own-domain).

**What if a tool needs a custom demo?** Put it in `src/custom/Hero.svelte` and it replaces the hero sample. Template updates leave it alone. See [Custom hero and styles](https://toolsite.itsryan.me/docs/custom-code.md).

**Can my agent read these docs?** Yes. Add `.md` to any docs URL, or start at [llms.txt](https://toolsite.itsryan.me/llms.txt).

## Docs

- [Installation](https://toolsite.itsryan.me/docs/installation.md): What you need, and how to make a site for a tool.
- [Quick start](https://toolsite.itsryan.me/docs/quick-start.md): From an empty site to a published one.
- [Configuration](https://toolsite.itsryan.me/docs/configuration.md): Every field in site.config.ts.
- [Writing docs](https://toolsite.itsryan.me/docs/writing-docs.md): File names, front matter and the conventions every page follows.
- [Changelog](https://toolsite.itsryan.me/docs/changelog.md): Dated release notes, one Markdown file each.
- [Custom hero and styles](https://toolsite.itsryan.me/docs/custom-code.md): A live demo on the landing page, and site-specific CSS.
- [Deploying](https://toolsite.itsryan.me/docs/deploying.md): Publishing to GitHub Pages, and using your own domain.
- [Updating a site](https://toolsite.itsryan.me/docs/updating.md): Pulling template improvements into an existing site.
- [Agents](https://toolsite.itsryan.me/docs/agents.md): How a coding agent builds a site, and how agents read one.
- [Limits](https://toolsite.itsryan.me/docs/limits.md): What toolsite doesn't do, and how to work around it.

The full index is at [llms.txt](https://toolsite.itsryan.me/llms.txt).
