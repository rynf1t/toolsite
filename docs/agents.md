---
title: "Agents"
description: "How a coding agent builds a site, and how agents read one."
canonical_url: https://toolsite.itsryan.me/docs/agents
---

# Agents

**Agents are first-class readers and writers here. They can make a site for you, and every published page is there for them as Markdown.**

## Having an agent build the site

Each site carries an `AGENTS.md` with the rules: where things go, what each config field is for, and what good copy looks like. To have an agent build a site, ask it something like:

```text
Make a toolsite for ~/Projects/mytool. Run new-site.sh with --from,
then fill in site.config.ts and content/docs from the tool's code and README.
Show me the dev server before deploying.
```

## Reading a published site

- Add `.md` to any docs address for the page as Markdown, with front matter.
- `/index.md` is the landing page as Markdown.
- `/llms.txt` lists every page with its description. `/llms-full.txt` is every page in one file.
- `/search.json` is the search index, one entry per section.

Links inside the Markdown copies point at other Markdown copies, so an agent can follow them without parsing HTML.
