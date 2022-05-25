#! /bin/bash

git add * && sleep 1 && git commit -m "New update"
git add * || sleep 1 && git commit -m "New update"
git push
