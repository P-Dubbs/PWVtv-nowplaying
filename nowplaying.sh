#!/bin/bash
while true; do
  curl -s "https://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=StitchBitch&api_key=96f95d8d1a640d4963f9eecadaa060d7&format=json&limit=1" |
  jq -r 'if .recenttracks.track[0]["@attr"].nowplaying == "true" then
    "\(.recenttracks.track[0].artist["#text"]) – \(.recenttracks.track[0].name)"
  else
    "\(.recenttracks.track[0].artist["#text"]) – \(.recenttracks.track[0].name) (last played)"
  end' > ~/Documents/nowplaying-repo/nowplaying.txt
  sleep 10
done
