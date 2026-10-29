#!/bin/bash
# Double-click this file to publish the website.
# It copies the latest academic CV and JMP PDFs into files/, then commits and pushes everything.
cd "$(dirname "$0")"
CV="/Users/Yudan_1/Library/CloudStorage/Dropbox/My AI Agent/Job/CV/CV_Yudan Ying_Academic.pdf"
if [ -f "$CV" ]; then
  cp "$CV" files/Ying_CV.pdf && echo "Copied latest CV."
else
  echo "Warning: academic CV PDF not found at expected path; keeping the existing files/Ying_CV.pdf"
fi
JMP="/Users/Yudan_1/Library/CloudStorage/Dropbox/My AI Agent/Job/JMP/JMP_Yudan Ying_latest.pdf"
# The JMP is refreshed only once it has been posted (i.e. files/Ying_JMP.pdf already exists).
if [ -f files/Ying_JMP.pdf ]; then
  if [ -f "$JMP" ]; then
    cp "$JMP" files/Ying_JMP.pdf && echo "Copied latest JMP."
  else
    echo "Warning: JMP PDF not found at expected path; keeping the existing files/Ying_JMP.pdf"
  fi
else
  echo "JMP not posted yet; skipping."
fi
CFC="/Users/Yudan_1/Library/CloudStorage/Dropbox/My AI Agent/Job/Other paper/capital_flow_composition_latest.pdf"
if [ -f files/capital_flow_composition.pdf ]; then
  if [ -f "$CFC" ]; then
    cp "$CFC" files/capital_flow_composition.pdf && echo "Copied latest capital flow paper."
  else
    echo "Warning: capital flow PDF not found at expected path; keeping the existing files/capital_flow_composition.pdf"
  fi
fi
git add -A
if git diff --cached --quiet; then
  echo "Nothing changed since the last publish."
else
  git commit -q -m "Update website $(date '+%Y-%m-%d %H:%M')" && git push && echo "Published. Live in about a minute at https://yudanying.github.io"
fi
echo
read -n 1 -s -r -p "Press any key to close."
