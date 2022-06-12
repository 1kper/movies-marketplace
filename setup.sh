#!/bin/bash
echo "# movies-marketplace" >> README.md
git init
git checkout -b master
git checkout -b preprod
git checkout -b develop
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/1kper/movies-marketplace.git
git push -u origin develop
