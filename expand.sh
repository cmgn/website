#!/usr/bin/env sh

IFS='
'

content=$(cat -)
for entry in $(env); do
  key=$(echo "${entry}" | sed 's|\([^=]\+\).*|$VAR_\1|g')
  value=$(echo "${entry}" | sed 's|^[^=]\+=||g')
  content=$(echo "${content}" | sed "s|${key}|${value}|g")
done
echo "${content}"
