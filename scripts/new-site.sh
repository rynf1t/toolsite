#!/usr/bin/env bash
# Make a new tool site from this template.
#
#   scripts/new-site.sh NAME [--from TOOL_DIR] [--dir DIR] [--no-install]
#
# NAME      the tool's name, as it appears in the header
# --from    the tool's folder. Its docs/*.md (or README.md) become the first
#           docs pages, and its git remote and go.mod fill in repo and install.
# --dir     where to make the site. Default: NAME-site next to this template.
set -euo pipefail

usage() { sed -n '2,9p' "$0" | sed 's/^# \{0,1\}//'; }

name='' from='' dir='' install=1
while (($#)); do
	case $1 in
		--from) from=${2:?--from needs a folder}; shift 2 ;;
		--dir) dir=${2:?--dir needs a folder}; shift 2 ;;
		--no-install) install=0; shift ;;
		-h|--help) usage; exit 0 ;;
		-*) echo "new-site: unknown option $1" >&2; usage >&2; exit 2 ;;
		*) [[ -z $name ]] || { echo "new-site: one NAME only" >&2; exit 2; }; name=$1; shift ;;
	esac
done
[[ -n $name ]] || { usage >&2; exit 2; }
[[ $name =~ ^[A-Za-z0-9][A-Za-z0-9._-]*$ ]] || { echo "new-site: NAME can use letters, digits, dots, dashes and underscores" >&2; exit 2; }

template=$(cd "$(dirname "$0")/.." && pwd)
dir=${dir:-$(dirname "$template")/$name-site}
if [[ -e $dir ]]; then
	echo "new-site: $dir already exists. Pick another --dir or remove it first." >&2
	exit 1
fi
if [[ -n $from && ! -d $from ]]; then
	echo "new-site: --from $from is not a folder" >&2
	exit 1
fi

# Copy the template's tracked files, or everything but build output if it isn't a git checkout.
mkdir -p "$dir"
if git -C "$template" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
	git -C "$template" ls-files -z | (cd "$template" && xargs -0 tar -cf -) | tar -xf - -C "$dir"
else
	(cd "$template" && tar --exclude node_modules --exclude build --exclude .svelte-kit --exclude .git -cf - .) | tar -xf - -C "$dir"
fi

# The template's own content stays behind.
rm -rf "$dir/content" "$dir/static/"*.png "$dir/scripts/new-site.sh" "$dir/scripts/starter"
mkdir -p "$dir/content/docs"
git -C "$template" rev-parse --short HEAD >"$dir/.toolsite-version" 2>/dev/null || echo unknown >"$dir/.toolsite-version"

# Facts we can work out from the tool's folder.
owner=$(gh api user -q .login 2>/dev/null || echo you)
repo="https://github.com/$owner/$name"
install_cmd="TODO: the install command"
if [[ -n $from ]]; then
	remote=$(git -C "$from" remote get-url origin 2>/dev/null || true)
	if [[ -n $remote ]]; then
		repo=$(sed -E 's#^git@github.com:#https://github.com/#; s#\.git$##' <<<"$remote")
	fi
	if [[ -f $from/go.mod ]]; then
		module=$(awk '/^module /{print $2; exit}' "$from/go.mod")
		if [[ -d $from/cmd/$name ]]; then
			install_cmd="go install $module/cmd/$name@latest"
		else
			install_cmd="go install $module@latest"
		fi
	elif [[ -f $from/package.json ]]; then
		install_cmd="npm install -g $(node -p "require('$from/package.json').name" 2>/dev/null || echo "$name")"
	fi
fi
origin="https://$owner.github.io/$(basename "$dir")"

# A tint and accent that differ from tool to tool, picked from the name.
sum=$(printf %s "$name" | cksum | cut -d' ' -f1)
accent=$(( (sum % 12) * 30 ))
tint=$(( (accent + 180) % 360 ))

fill() {
	sed -e "s#__NAME__#$name#g" -e "s#__REPO__#$repo#g" -e "s#__ORIGIN__#$origin#g" \
		-e "s#__INSTALL__#$install_cmd#g" -e "s#__TINT__#$tint#g" -e "s#__ACCENT__#$accent#g" "$1"
}
fill "$template/scripts/starter/site.config.ts" >"$dir/site.config.ts"

# Docs: the tool's own docs folder, its README, or the starter page.
n=1
if [[ -n $from && -d $from/docs ]] && compgen -G "$from/docs/*.md" >/dev/null; then
	for f in "$from"/docs/*.md; do
		slug=$(basename "$f" .md | tr '[:upper:] ' '[:lower:]-' | sed -E 's/^[0-9]+-//')
		printf -v out '%s/content/docs/%02d-%s.md' "$dir" "$n" "$slug"
		if head -1 "$f" | grep -q '^---$'; then cp "$f" "$out"; else
			title=$(grep -m1 '^# ' "$f" | sed 's/^# //')
			{ printf -- '---\ntitle: %s\ndescription: TODO: one line on this page\ngroup: Docs\n---\n\n' "${title:-$slug}"; grep -v '^# ' "$f"; } >"$out"
		fi
		n=$((n + 1))
	done
elif [[ -n $from && -f $from/README.md ]]; then
	{ printf -- '---\ntitle: Overview\ndescription: TODO: one line on this page\ngroup: Start\n---\n\n'; sed '1{/^# /d;}' "$from/README.md"; } >"$dir/content/docs/01-overview.md"
else
	fill "$template/scripts/starter/01-installation.md" >"$dir/content/docs/01-installation.md"
fi

cat >"$dir/README.md" <<README
# $name site

The landing page and docs for [$name]($repo), made with toolsite.
Published at $origin

\`\`\`sh
npm run dev                 # work on it
scripts/deploy-pages.sh     # publish
scripts/update-site.sh      # pull in template improvements
\`\`\`

Words live in \`site.config.ts\` and \`content/docs\`. See \`AGENTS.md\`.
README

# Name the package after the site.
node -e "const f='$dir/package.json',p=require(f);p.name='$(basename "$dir")';require('fs').writeFileSync(f,JSON.stringify(p,null,'\t')+'\n')"

git -C "$dir" init -q -b main
git -C "$dir" add -A
git -C "$dir" commit -q -m "Start the $name site from toolsite"

if ((install)); then
	(cd "$dir" && npm install --silent)
fi

cat <<MSG
Made $dir

Next:
  cd $dir
  npm run dev                 # look at it while you write
  edit site.config.ts         # every TODO needs a real value
  edit content/docs/*.md      # one Markdown file per page
  scripts/deploy-pages.sh     # publish to $origin
MSG
