#!/usr/bin/env bash

json=$(curl -Ss "wttr.in/$1?format=j1")

i=0
date=$(jq -r --arg index "$i" '.weather[$index | tonumber] | .date' <<<"$json")
temp=$(jq -r --arg index "$i" '.weather[$index | tonumber] | .avgtempC' <<<"$json")
humidity=$(jq -r --arg index "$i" '.weather[$index | tonumber]| .hourly[$index | tonumber] | .humidity' <<<"$json")
echo "$temp degrees, $humidity%"
