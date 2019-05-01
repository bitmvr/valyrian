#!/usr/bin/env bash

manifest="timestamps.manifest"
video_source="$1"

if [[ -z $video_source ]]; then
  echo '      .'
  echo ' .>   )\;`a__'
  echo '(  _ _)/ /-." ~~ ERROR: Please provide a video file'
  echo ' `( )_ )/'
  echo '  <_  <_'
  echo ""
  echo "Usage: ./valyrian.sh VIDEO_FILE"
  echo ""

  exit 1
fi

timestamp_array=()

while IFS= read -r line; do
  if [[ -n "$line" ]]; then
    timestamp_array+=("$line")
  fi
done < "$manifest"

ts=0

while (( ts <= ${#timestamp_array[@]} )); do
  
  if [[ $ts -eq 0 ]]; then
    start_time="00:00:00" 
  else
    previous_index=$(( ts - 1 ))
    start_time="${timestamp_array[$previous_index]}" 
  fi
  
  if [[ "$ts" -eq ${#timestamp_array[@]} ]]; then
    end_time="0$(ffprobe $video_source -show_format -sexagesimal 2>&1 | sed -n 's/duration=//p')"
    end_time="${end_time%%.*}"
  else
    end_time="${timestamp_array[$ts]}"
  fi
  
  ffmpeg -i "$video_source" -ss "${start_time}.000" -to "${end_time}.000" "VIDEO_${ts}.mp4"

  ((ts++))

done

