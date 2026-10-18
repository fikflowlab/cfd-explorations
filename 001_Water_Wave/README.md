# CFD Exploration 001
## Water Wave Propagation

2D shallow-water wave propagation simulated using Basilisk C.

### Simulation
- Model: Saint-Venant equations
- Maximum refinement level: 7
- Adaptive Mesh Refinement (AMR)
- Simulation time: 0–2.5
- Output: 65 snapshots

### Original Source
https://basilisk.fr/src/test/bump2D.c

### Project
FikFlow Lab — Fluid Physics, Numerically Visualized.

### How to Run

Requirements: Linux and Basilisk C installed.

**1. Compile the simulation:**
```bash
qcc -O2 -Wall bump2D_ig.c -o bump2D_ig -lm
```

**2. Run at refinement level 7:**
```bash
./bump2D_ig 7 > results.txt 2> simulation.log
```

**3. Check the number of snapshots:**
```bash
grep -c '^file: eta-' results.txt
```

Expected output: `65`

The simulation data are written to `results.txt`.
Additional post-processing is required to generate
PNG frames and an MP4 animation.
