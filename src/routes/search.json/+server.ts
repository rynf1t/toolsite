import { searchIndex } from '#lib/docs.server.js';

export function GET() {
	return Response.json(searchIndex());
}

export const prerender = true;
