#!/usr/bin/env bash

weather=$(curl -s 'https://wttr.in/?format=j1')

temp=$(echo "$weather" | jq -r '.current_condition[0].temp_F')
feels=$(echo "$weather" | jq -r '.current_condition[0].FeelsLikeF')
humidity=$(echo "$weather" | jq -r '.current_condition[0].humidity')
wind=$(echo "$weather" | jq -r '.current_condition[0].windspeedMiles')
desc=$(echo "$weather" | jq -r '.current_condition[0].weatherDesc[0].value')

icon="󰖐"

case "$desc" in
  *Sunny*) icon="󰖙" ;;
  *Clear*) icon="󰖔" ;;
  *Cloud*) icon="󰖐" ;;
  *Rain*)  icon="󰖗" ;;
  *Snow*)  icon="󰼶" ;;
  *Storm*) icon="󰖓" ;;
esac

tooltip="$desc\\nFeels Like: ${feels}°F\\nHumidity: ${humidity}%\\nWind: ${wind} mph"

printf '{"text":"%s %s°F","tooltip":"%s"}\n' \
"$icon" "$temp" "$tooltip"
