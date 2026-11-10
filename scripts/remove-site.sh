#!/usr/bin/env bash
# Take this site down: turn off GitHub Pages, delete its DNS record on
# Cloudflare (only if it points at GitHub Pages), and archive the repo.
# The repo stays on GitHub, read-only, so nothing is lost.
#
#   scripts/remove-site.sh --yes
set -euo pipefail
cd "$(dirname "$0")/.."

if [[ ${1:-} != --yes ]]; then
	sed -n '2,6p' "$0" | sed 's/^# \{0,1\}//'
	echo "Add --yes to do it." >&2
	exit 2
fi

origin=$(node -e "import('./site.config.ts').then(m => console.log(m.default.origin.replace(/\/$/, '')))")
host=$(sed -E 's#^https?://##; s#/.*##' <<<"$origin")
remote=$(git remote get-url origin)
repo=$(sed -E 's#^(git@github.com:|https://github.com/)##; s#\.git$##' <<<"$remote")

if gh api "repos/$repo/pages" >/dev/null 2>&1; then
	gh api -X PUT "repos/$repo/pages" -F cname=null >/dev/null 2>&1 || true
	if gh api -X DELETE "repos/$repo/pages" >/dev/null 2>&1; then
		echo "Pages: turned off for $repo"
	else
		# Some repos refuse that. Without its branch, Pages has nothing to serve.
		gh api -X DELETE "repos/$repo/git/refs/heads/gh-pages" >/dev/null 2>&1 || true
		echo "Pages: deleted the gh-pages branch, so $repo serves nothing"
	fi
else
	echo "Pages: already off for $repo"
fi

if [[ $host != *.github.io ]]; then
	token=${CLOUDFLARE_API_TOKEN:-$(security find-generic-password -s toolsite-cloudflare -w 2>/dev/null || true)}
	if [[ -n $token ]]; then
		CLOUDFLARE_API_TOKEN=$token node scripts/cloudflare-dns.mjs --delete "$host" "${repo%%/*}.github.io"
	else
		echo "DNS: no Cloudflare token saved. Delete the record for $host yourself."
	fi
fi

gh repo archive "$repo" --yes >/dev/null
echo "Repo: archived $repo. Delete this folder whenever you like."
