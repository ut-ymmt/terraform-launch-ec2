#!/bin/bash

set -eu

VERSION=$(tfupdate release latest hashicorp/terraform)
UPDATE_MESSAGE="[tfupdate] Update terraform to v${VERSION}"
if hub pr list -s "open" -f "%t: %U%n" | grep -F "$UPDATE_MESSAGE"; then
  echo "A pull request already exists"
elif hub pr list -s "merged" -f "%t: %U%n" | grep -F "$UPDATE_MESSAGE"; then
  echo "A pull request is already merged"
else
  git checkout -b update-terraform-to-v${VERSION} origin/${BASE_BRANCH}
  tfupdate terraform -v ${VERSION} -r ./
  if git add . && git diff --cached --exit-code --quiet; then
    echo "No changes"
  else
    git commit -m "$UPDATE_MESSAGE"
    PULL_REQUEST_BODY="For details see: https://github.com/hashicorp/terraform/releases"
    git push origin HEAD && hub pull-request -m "$UPDATE_MESSAGE" -m "$PULL_REQUEST_BODY" -b "$BASE_BRANCH"
  fi
fi