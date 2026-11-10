// Search state shared by every trigger and the dialog.
import { href } from './site.js';

export type Entry = { path: string; title: string; page: string; group: string; text: string };

class SearchState {
	open = $state(false);
	show = () => (this.open = true);
	hide = () => (this.open = false);
}

export const search = new SearchState();

let pending: Promise<Entry[]> | undefined;

/** The search index, fetched once. Triggers call it on hover and focus, so it's ready before the dialog opens. */
export function loadIndex(): Promise<Entry[]> {
	pending ??= fetch(href('/search.json'))
		.then((res) => res.json() as Promise<Entry[]>)
		.catch((err) => {
			pending = undefined;
			throw err;
		});
	return pending;
}
