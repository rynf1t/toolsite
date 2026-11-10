import { docs, markdownTwin } from '#lib/docs.server.js';

export function GET() {
	const body = docs.map((d) => markdownTwin(d)).join('\n\n');
	return new Response(body, { headers: { 'content-type': 'text/plain; charset=utf-8' } });
}

export const prerender = true;
