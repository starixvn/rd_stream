#!/bin/sh

echo $1
input=$(find "$1" -type f \( -name '*.mp4' \))

for file in $input; do
    name=$(basename "${file}" .mp4)
    dir=$(basename "$(dirname "${file}")")
    output="$2/$dir"

    mkdir -p "$output"

    ffmpeg -i "$file" \
        -vf scale=1280:720 \
        -b:v 2500k \
        -b:a 96k \
        -force_key_frames 'expr:gte(t,n_forced*3)' \
        -hls_list_size 0 \
        -f hls "$output/${name}_720p.m3u8" \
        -vf scale=426:240 \
        -b:v 400k \
        -b:a 96k \
        -force_key_frames 'expr:gte(t,n_forced*3)' \
        -hls_list_size 0 \
        -f hls "$output/${name}_240p.m3u8"
done
