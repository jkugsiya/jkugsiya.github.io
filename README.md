# Jayesh Kugsiya Portfolio

A static portfolio site with no dependencies, plus the source for your resume.

## Contents

- `index.html` and `styles.css`: the portfolio site.
- `resume/resume.html`: the resume source.
- `resume/Jayesh_Kugsiya_Resume.pdf` and `.docx`: built resume files.
- `docs/`: job search plan and cover letter template. Git ignores this folder, so it stays private.

## Update the Resume

Edit `resume/resume.html`, then run:

```bash
./build.sh
```

The script rebuilds the PDF and Word file and copies the PDF into the site.

## Deploy to GitHub Pages

The resume links to `jkugsiya.github.io`, so the repo name must match:

```bash
git init && git add . && git commit -m "add portfolio site"
gh repo create jkugsiya.github.io --public --source . --push
```

GitHub Pages serves the site from the `main` branch in about 1 minute. You can also import the repo into Vercel and add your own domain.
