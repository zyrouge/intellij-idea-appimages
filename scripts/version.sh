#!/bin/bash

set -eu

data=$(curl --fail -s 'https://data.services.jetbrains.com/products/releases?code=IIC&latest=true&type=release&build=linux')
version=$(echo "${data}" | sed -nr 's/.*"version":"(.*?)","majorVersion.*/\1/p')

echo "${version}"
