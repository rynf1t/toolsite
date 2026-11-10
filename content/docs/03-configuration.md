---
title: Configuration
description: Every field in site.config.ts.
group: Guide
---

**`site.config.ts` holds everything that makes the site about your tool. The landing page, its Markdown copy, `llms.txt`, the header, the favicon and the colours all read from it.**

## Fields

| Field | What it's for |
|---|---|
| `name` | The tool's name, as you'd write it in a sentence. Shown in the header and page titles. |
| `description` | One sentence a stranger understands. Used in meta tags and `llms.txt`. |
| `repo` | The tool's source. The header's GitHub link goes here. |
| `origin` | Where the site lives, such as `https://you.github.io/mytool-site`. Links in the Markdown copies are built from it. |
| `install` | The first command someone runs. Shown with a copy button. |
| `requirement` | What it needs, printed under the install line. |
| `status` | Optional. A short chip above the headline, such as `Early` or `v1.2`. |
| `colours` | Two hues. See [Colours](#colours). |
| `mark` | Optional. The inside of a 20 by 20 SVG for the header and favicon. |
| `hero` | The headline, the lead paragraph, and a screenshot or code sample. |
| `sections` | The landing page bands. See [Sections](#sections). |
| `questions` | The questions at the bottom of the landing page. |
| `nav` | Optional. Extra header links after Docs, such as a second tool's docs group. |
| `author` | Optional. Who made it, as `{ label, href }`, linked at the end of the footer. |

Text fields take inline Markdown: `code`, bold, and links. A link that starts with `/` is a path on this site.

## Colours

```ts
colours: { tint: 255, accent: 75 },
```

Both are hues on the oklch colour wheel, from 0 to 360. Roughly: 25 red, 75 amber, 150 green, 200 teal, 255 blue, 300 violet.

- `tint` nudges every grey on the page toward a hue. The greys stay grey. They just feel warm or cool.
- `accent` is the one colour with jobs: the text caret, selection, search highlights, the status dot and one syntax colour. It appears nowhere else.

Focus rings get their own hue, picked to stay clear of the accent. Light and dark palettes, shadows, the browser's theme colour and the favicon all follow from these two numbers.

## Sections

Each section is a band on the landing page: copy on the left, and something to look at on the right.

```ts
{
  eyebrow: 'Jump',
  title: 'Enter takes you there.',
  body: 'Two or three sentences. Inline `code` and [links](/docs/commands) work.',
  link: { label: 'Commands', href: '/docs/commands' },
  // then at most one of these
  items: [{ name: 'enter', text: 'Jump to the pane' }],
  code: '# a comment\nmytool run --json',
  image: { src: '/jump.webp', alt: 'The pane after a jump', width: 1600, height: 1000 }
}
```

Leave all three out and the copy stands alone. Images go in `static/`. Give them `width` and `height`, the image's real pixel size, so the page doesn't jump while they load. WebP keeps them small: `cwebp -q 82 shot.png -o shot.webp`.

## The hero

Show the tool working. Use `image` for a screenshot in `static/`, or `code` for a short terminal session. In a terminal sample the first word of each command is coloured as the program, and lines starting with `#` are comments.

For a live demo, add `src/custom/Hero.svelte`. See [Custom hero and styles](/docs/custom-code).
