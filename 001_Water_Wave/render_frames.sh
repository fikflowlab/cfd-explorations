#!/bin/bash
set -e

INPUT="${1:-results.txt}"
mkdir -p frames_output

# Extract simulation snapshots
awk '
/^file: eta-[0-9]+$/ {
  split($2,a,"-")
  out=sprintf("frames_output/eta%02d.dat",a[2])
  next
}
/^file:/ {out=""}
out!="" && $1!~/^#/ && NF>=3 {
  print $1,$2,$3 > out
}
' "$INPUT"

# Generate PNG frames
for f in frames_output/eta*.dat; do
  base="${f%.dat}"

  gnuplot -e "
    set terminal pngcairo size 800,800;
    set output '${base}_contrast.png';
    set view map;
    set size ratio -1;
    unset key;
    set xlabel 'x';
    set ylabel 'y';
    set cblabel 'Elevation change';
    set cbrange [-0.15:0.25];
    set palette defined (-0.15 '#143D59', 0 '#F5F5F5', 0.25 '#FFB703');
    plot '$f' using 1:2:(\$3-0.1) with image
  "
done

echo "PNG frames generated successfully."
