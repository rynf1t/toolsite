# Working on a toolsite

This folder is a website for one tool: a landing page plus docs, built with
SvelteKit to static files. Ryan made it from the toolsite template. Most work
here is writing, not code.

## Where things go

| Path | What |
|---|---|
| `site.config.ts` | Every fact and every word on the landing page: name, one-line description, install command, requirement, colours, hero, sections, questions. The landing page's Markdown copy and `llms.txt` are generated from it. |
| `content/docs/NN-slug.md` | One docs page each. The number sets the order. Front matter: `title`, `description`, `group`. A bold first paragraph becomes the lead. |
| `static/` | Screenshots and other files served as they are. |
| `src/` | The template's code. Change it only when the config can't express what the tool needs, such as a custom hero demo in `src/routes/+page.svelte`. |
| `scripts/deploy-pages.sh` | Publishes to GitHub Pages. Ask Ryan before running it. |

## Filling in a new site

1. Read the tool: its README, `--help` output, the code behind each command,
   and any existing docs. Check facts against the code, not just the README.
2. Fill in `site.config.ts`. Every `TODO:` must go. `deploy-pages.sh`
   refuses to publish while one is left.
3. Write `content/docs`. Start at Installation, then a quick start that gets
   to a working result, then guides, then reference (commands, config, exit
   codes, limits). Add a page for agents if the tool has JSON output or a
   skill.
4. Run `npm run dev`, look at the landing page and two docs pages at desktop
   and phone width, light and dark. Run `npm run check` and `npm run build`.
5. Show Ryan the dev server before committing or deploying.

## The landing page

- `hero.title`: what it does for the reader, in one line. Not the name.
- `hero.lead`: two sentences. What it is, and the papercut it fixes.
- Show the tool working: a real screenshot in `static/`, or a short terminal
  session in `hero.code`.
- `install` is the real first command, never "Learn more".
- Three to five `sections`, each one thing the tool does. Eyebrows are one or
  two words. Titles are short and plain.
- `questions` answer what a stranger asks first: what it needs, how early it
  is, what it doesn't do, whether agents can read the docs.
- Pick `colours` so this tool doesn't look like Ryan's other tools. The
  accent appears only on the caret, selection, search, the status dot and one
  syntax colour.

## Writing

- Plain, specific words. Say what it is in one sentence a stranger
  understands, and name the category.
- Australian spelling. Contractions are fine.
- No semicolons. No em dashes, en dashes or spaced hyphens.
- Put limits next to the feature they limit. Errors name the fix.
- If Ryan's writing linter is available, run each changed file through it:
  `node ~/.codex/skills/ryan-writing/scripts/lint-writing.mjs < file`

## Checks before calling it done

- `npm run check` and `npm run build` pass.
- No `TODO:` left in `site.config.ts` or `content/docs`.
- Every docs link goes somewhere. The build warns about missing pages.
- No horizontal scroll at 390px wide.
- The hero shows the tool, not a description of it.
