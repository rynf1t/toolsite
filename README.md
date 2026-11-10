# toolsite

A landing page and docs site for a tool, made from one config file and a
folder of Markdown. This repo is the template, and its own site is the
example: https://rynf1t.github.io/toolsite

## Make a site for a tool

```sh
scripts/new-site.sh mytool --from ~/Projects/mytool
cd ../mytool-site
npm run dev
```

Fill in `site.config.ts` and `content/docs`, then `scripts/deploy-pages.sh`.
The docs at `content/docs` (or the site above) cover every step.
`AGENTS.md` has the rules for agents filling in a site.

## What every site gets

- A landing page from `site.config.ts`: headline, install line with a copy
  button, a terminal sample or screenshot, sections and questions.
- Docs from Markdown, with a grouped sidebar, heading links, code copy
  buttons and ⌘K search.
- A Markdown copy of every page at the same address plus `.md`, and
  `llms.txt`, `llms-full.txt` and `search.json`.
- Light and dark palettes from two hues, a generated favicon, and a 404 page
  with search.
- A one-command deploy to GitHub Pages, with your own domain if you set one.

## Working on the template

```sh
npm install
npm run dev
npm run check
npm run build
```

Template code lives in `src`. Sites are copies, so changes here don't reach
existing sites. Copy `src` across by hand when one needs an update.
