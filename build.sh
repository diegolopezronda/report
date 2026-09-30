#!/bin/bash

AX_PROJECT_KEY=$1
export AX_PROJECT_KEY
rm -rf generated
mkdir -p generated
./scripts/metadata.sh > generated/metadata.tex
python3 scripts/project.py >> generated/metadata.tex
python3 scripts/sprint.py >> generated/metadata.tex
python3 scripts/epics.py > generated/epics.tex
python3 scripts/stories.py > generated/stories.tex
python3 scripts/subtasks.py > generated/subtasks.tex
python3 scripts/backlog.py > generated/backlog.tex
if [[ "$2" == "--no-compile" ]]; then
  echo "Skipping LaTeX compilation as --no-compile option is provided."
  exit 0
fi
latexmk -synctex=1 -interaction=nonstopmode -file-line-error -xelatex
