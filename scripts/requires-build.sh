#!/bin/bash

curl_ua="Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/118.0"

if [ -z "$1" ]; then
    echo "error: Missing tag name argument"
    exit 1
fi

if [ "${X_FORCE_BUILD}" == "true" ]; then
    echo "yes"
    exit 0
fi

tag_name=$1
repo="zyrouge/intellij-idea-appimages"

api_url="https://api.github.com/repos/${repo}/releases/tags/${tag_name}"
data=$(curl --fail -s -A "${curl_ua}" "${api_url}")
appimages_count=$(echo "${data}" | grep -c '.AppImage"')
requires_build="no"

if [ "${appimages_count}" == "0" ]; then
    requires_build="yes"
fi

echo "${requires_build}"
