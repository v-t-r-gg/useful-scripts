#!/bin/bash
MUSIC_DIR="YOUR-DIRECTORY"

find "$MUSIC_DIR" -mindepth 1 -maxdepth 1 -type d | while read -r album; do
    artist=$(metaflac --show-tag=ARTIST "$album"/*.flac 2>/dev/null | head -n 1 | cut -d'=' -f2)

    if [[ -n "$artist" ]]; then
        artist_dir="$MUSIC_DIR/$artist"
        mkdir -p "$artist_dir"
        mv "$album" "$artist_dir/"
        echo "Moved: $album -> $artist_dir"
    else
        echo "No artist metadata found for: $album"
    fi
done
