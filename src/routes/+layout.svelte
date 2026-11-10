<script lang="ts">
	import '@fontsource-variable/instrument-sans';
	import fontUrl from '@fontsource-variable/instrument-sans/files/instrument-sans-latin-wght-normal.woff2?url';
	import { onNavigate } from '$app/navigation';
	import '../app.css';
	import { focusHue, oklchHex } from '#lib/config.js';
	import { href, site } from '#lib/site.js';
	import Search from '#lib/components/Search.svelte';
	import type { LayoutProps } from './$types';

	// A site's own styles, after the template's (see src/custom/README.md).
	import.meta.glob('/src/custom/*.css', { eager: true });

	let { children }: LayoutProps = $props();

	// The site's identity: two hues from site.config.ts. app.css derives the rest.
	const { tint, accent } = site.colours;
	// A short cross-fade between pages. The header and docs sidebar have their
	// own transition names in app.css, so they stay put while the page changes.
	onNavigate((nav) => {
		if (!document.startViewTransition || matchMedia('(prefers-reduced-motion: reduce)').matches) return;
		return new Promise((resolve) => {
			document.startViewTransition(async () => {
				resolve();
				await nav.complete;
			});
		});
	});

	const hues = `<style>html:root{--tint-h:${tint};--accent-h:${accent};--focus-h:${focusHue(accent)}}</style>`;
</script>

<svelte:head>
	<!-- eslint-disable-next-line svelte/no-at-html-tags -->
	{@html hues}
	<link rel="preload" href={fontUrl} as="font" type="font/woff2" crossorigin="anonymous" />
	<link rel="icon" href={href('/favicon.svg')} type="image/svg+xml" />
	<meta name="theme-color" content={oklchHex(0.975, 0.004, tint)} media="(prefers-color-scheme: light)" />
	<meta name="theme-color" content={oklchHex(0.175, 0.009, tint)} media="(prefers-color-scheme: dark)" />
</svelte:head>

{@render children()}
<Search />
