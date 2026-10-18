#!/bin/bash
set -e

# FikFlow Lab - CFD Exploration 001
# Convert 65 simulation frames into MP4

ffmpeg -framerate 12 \
  -i frames_output/eta%02d_contrast.png \
  -c:v libx264 \
  -preset ultrafast \
  -pix_fmt yuv420p \
  -r 24 \
  FikFlow_001_animation.mp4

echo "Video generated successfully."
