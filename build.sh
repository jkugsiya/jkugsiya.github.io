#!/usr/bin/env bash
# Builds resume.pdf (via headless Brave or Chrome) and resume.docx (via macOS textutil)
# from resume/resume.html, then copies the PDF into the site root for download.
set -euo pipefail
cd "$(dirname "$0")"

browser=""
for candidate in \
  "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"; do
  [[ -x "$candidate" ]] && browser="$candidate" && break
done
[[ -n "$browser" ]] || { echo "build: no Chrome or Brave found, so the PDF was not built" >&2; exit 1; }

"$browser" --headless=new --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="resume/Jayesh_Kugsiya_Resume.pdf" "file://$PWD/resume/resume.html" 2>/dev/null

textutil -convert docx -output "resume/Jayesh_Kugsiya_Resume.docx" resume/resume.html

cp resume/Jayesh_Kugsiya_Resume.pdf Jayesh_Kugsiya_Resume.pdf
echo "build: wrote resume PDF and DOCX"
