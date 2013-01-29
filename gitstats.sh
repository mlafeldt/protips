#!/bin/sh
# Based on https://www.destroyallsoftware.com/screencasts/catalog/statistics-over-git-repositories

set -e

file_pattern=$1

revisions() {
    git rev-list --reverse HEAD
}

commit_description() {
    git log --oneline --no-decorate -1 $rev
}

number_of_lines() {
    git ls-tree -r $rev |
    grep "$file_pattern" |
    awk '{print $3}' |
    xargs git show |
    wc -l
}

for rev in `revisions`; do
    echo "`number_of_lines` `commit_description`"
done
