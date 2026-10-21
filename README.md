# yudanying.com

Static personal website. No build step: edit `index.html` and `style.css` directly.

## Folder layout

- `index.html` — the page
- `style.css` — styles
- `files/` — public PDFs (CV, papers). Only final versions go here.
- `img/headshot.jpg` — photo

## Updating

1. Export the new PDF (CV or paper) and overwrite the file in `files/` with the same name.
2. If the abstract or paper list changed, edit the matching text in `index.html`.
3. Commit and push. GitHub Pages redeploys in about a minute.

## First-time deployment to GitHub Pages

1. Create a GitHub account and a new public repository named `yudanying.github.io`
   (if your username is `yudanying`), or any name like `website`.
2. In this folder, run:

       git init
       git add .
       git commit -m "Initial website"
       git branch -M main
       git remote add origin https://github.com/USERNAME/REPO.git
       git push -u origin main

3. On GitHub: Settings → Pages → Source: "Deploy from a branch", Branch: `main`, folder `/ (root)`. Save.
4. The site is live at `https://USERNAME.github.io/REPO/` within a few minutes.

## Custom domain (after buying yudanying.com)

1. On GitHub: Settings → Pages → Custom domain: `yudanying.com`. Save. Tick "Enforce HTTPS" once it becomes available.
   This creates a `CNAME` file in the repo; keep it.
2. At the registrar's DNS panel add:
   - `A` records for `@` pointing to 185.199.108.153, 185.199.109.153, 185.199.110.153, 185.199.111.153
   - `CNAME` record for `www` pointing to `USERNAME.github.io`
3. Wait up to an hour. Then `https://yudanying.com` serves the site.

## Local preview

Open `index.html` in a browser, or run `python3 -m http.server 8000` in this folder and visit http://localhost:8000.
