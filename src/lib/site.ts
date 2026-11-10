// The site config plus the base path. Everything reads the config through here.

import type { SiteConfig } from './config.js';
import raw from '../../site.config.js';

// Widen to the full shape, so optional fields read as optional everywhere.
const config: SiteConfig = raw;

// VITE_BASE serves the site under a subfolder, as GitHub Pages does
// (VITE_BASE=/mytool-site). VITE_ORIGIN is the full public address, base
// included. vite.config.ts reads VITE_BASE too.
const base = import.meta.env.VITE_BASE ?? '';

/** A site path such as "/docs/quick-start", with the base path in front. */
export function href(path: string): string {
	return path.startsWith('/') ? base + path : path;
}

export const site: SiteConfig = {
	...config,
	origin: ((import.meta.env.VITE_ORIGIN as string | undefined) ?? config.origin).replace(/\/$/, '')
};
