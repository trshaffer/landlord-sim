Landlord Simulator
==================

This script simulates the Landlord algorithm applied to the launch
logs from the public Binder service. It uses the SQLite database from
[this dataset](https://zenodo.org/record/4915858),
which must be downloaded. Repo metadata listings for both Pip and
Conda are included, but need to be uncompressed before using.
The simulator script accepts a cache size limit in bytes and an
alpha value, and writes a log of cache activity for each launch.

Note that this simulation is only an approximation:
Conda and Pip each have their own solvers (and Conda's solver is
quite complex and resource intensive to run), whereas this script
implements a fast and simple algorithm. It uses Conda and Pip
libraries to parse and check version constraints, but only
computes a simple closure of package dependencies and does not
backtrack and re-examine previous choices (similar to the operation
of Pip's solver). If this code were adapted into an actual container
build service, this approximate solver would not be used since the
full Conda/Pip solve will be part of the container build process.

This simulation is serial, but requires a fair amount of memory
(runs comfortably with 64 GB, might get by with less).
It also depends on several libraries, with Conda being the easiest
way to get everything:
- python=3.9.4
- conda=4.10.1
- pip=20.2.4
- sortedcontainers=2.3.0
- sqlite=3.35.5
