# toolsite

A landing page and docs site for a tool, made from one config file and a
folder of Markdown. This repo is the template, and its own site is the
example: https://toolsite.itsryan.me

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
- A changelog from dated Markdown files.
- Light and dark palettes from two hues with a switch, a generated favicon,
  and a 404 page with search.
- A custom hero or styles in `src/custom`, safe from template updates.
- A one-command deploy to GitHub Pages. With your own domain on Cloudflare,
  it adds the DNS record too.
- `scripts/update-site.sh` to pull template improvements into a site.

## Working on the template

```sh
npm install
npm run dev
npm run check
npm run build
```

Template code lives in `src`. Sites pick up changes when they run
`scripts/update-site.sh`, which copies `src` (apart from `src/custom`), the
scripts and the build config.
