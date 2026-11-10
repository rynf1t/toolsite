// Everything that makes this site about one tool. The landing page, its
// Markdown twin, llms.txt, the header, the favicon and the colours all come
// from here. Docs pages live in content/docs. See AGENTS.md for the rules.
//
// Text fields take inline Markdown: `code`, **bold** and [links](/docs/x).
// Links starting with / are site paths and pick up the base path.

import type { SiteConfig } from './src/lib/config.js';

export default {
	name: 'toolsite',
	description: 'A landing page and docs site for a tool, made from one config file and a folder of Markdown.',
	repo: 'https://github.com/rynf1t/toolsite',
	origin: 'https://toolsite.itsryan.me',
	install: 'git clone https://github.com/rynf1t/toolsite',
	requirement: 'Needs Node 22 or later and the GitHub CLI to publish.',
	status: 'Early',

	// Hues on the oklch wheel, 0 to 360. tint nudges the greys, accent is the
	// one colour with jobs (caret, selection, search, the status dot).
	colours: { tint: 165, accent: 150 },

	// Optional: the inside of a 20 by 20 SVG, drawn in currentColor, with
	// var(--accent) for the one accent part. Leave it out for a plain dot.
	mark: `<rect x="2.75" y="2.75" width="14.5" height="14.5" rx="4" fill="none" stroke="currentColor" stroke-width="1.5" opacity=".4"/><rect x="6.5" y="6.5" width="7" height="7" rx="2" fill="var(--accent)"/>`,

	hero: {
		title: 'Every tool you make gets a site like this one.',
		lead: 'Write one config file and a folder of Markdown. You get a landing page, docs with ⌘K search, a changelog, a Markdown copy of every page for agents, and a one-command deploy to your own domain.',
		// Show the product: these docs, as toolsite draws them.
		image: { src: '/examples/docs.webp', alt: 'A toolsite docs page: sidebar, search and a fields table', width: 1600, height: 1000 },
		link: { label: 'Read the quick start', href: '/docs/quick-start' }
	},

	sections: [
		{
			eyebrow: 'Three commands',
			title: 'From a tool’s folder to its own address.',
			body: 'Make the site from the tool’s repo, write the words, and publish. On your own domain, the deploy adds the DNS record and turns on HTTPS. This site was made the same way.',
			link: { label: 'Quick start', href: '/docs/quick-start' },
			code: `# make a site for a tool
scripts/new-site.sh mytool --from ~/Projects/mytool --domain example.com

# write site.config.ts and content/docs, then look
npm run dev

# publish, with DNS and HTTPS
scripts/deploy-pages.sh`
		},
		{
			eyebrow: 'One source',
			title: 'Write it once, get it five ways.',
			body: 'Each docs page is a Markdown file. The site renders it, adds it to the sidebar and search, serves it as `.md`, and lists it in `llms.txt`. Nothing to keep in step by hand.',
			link: { label: 'Writing docs', href: '/docs/writing-docs' },
			items: [
				{ name: 'page', text: 'The docs page, with heading links and copy buttons' },
				{ name: 'sidebar', text: 'Grouped from front matter, ordered by file name' },
				{ name: '⌘K', text: 'Search over every section, built at build time' },
				{ name: '.md', text: 'The same page as Markdown, for agents' },
				{ name: 'llms.txt', text: 'An index of every page, plus llms-full.txt' }
			]
		},
		{
			eyebrow: 'Your colours',
			title: 'Two numbers set the look.',
			body: 'Pick a hue for the greys and a hue for the accent. Light and dark palettes, shadows, selection, focus and the favicon all follow. Type, spacing and motion come from the build-craft rules and stay the same across your tools.',
			link: { label: 'Configuration', href: '/docs/configuration' },
			code: `colours: { tint: 255, accent: 75 },`
		},
		{
			eyebrow: 'Agents',
			title: 'An agent can build the site for you.',
			body: 'The template ships an `AGENTS.md` that says where everything goes and what good copy looks like. Point a coding agent at your tool and the new site folder and it fills in both.',
			link: { label: 'Read this, agents', href: '/docs/agents' }
		}
	],

	author: { label: 'by Ryan', href: 'https://itsryan.me' },

	questions: [
		{
			q: 'What does it cost?',
			a: 'Nothing. It builds to static files, and GitHub Pages hosts them for free on a public repo.'
		},
		{
			q: 'Can I use my own domain?',
			a: 'Yes. Set `origin` and deploy. If your DNS is on Cloudflare, the deploy adds the record for you. See [Deploying](/docs/deploying#your-own-domain).'
		},
		{
			q: 'What if a tool needs a custom demo?',
			a: 'Put it in `src/custom/Hero.svelte` and it replaces the hero sample. Template updates leave it alone. See [Custom hero and styles](/docs/custom-code).'
		},
		{
			q: 'Can my agent read these docs?',
			a: 'Yes. Add `.md` to any docs URL, or start at [llms.txt](/llms.txt).'
		}
	]
} satisfies SiteConfig;
