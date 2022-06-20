#!/usr/bin/env python

# for i in 100 500 1000 5000; do for a in $(seq 0 2 101); do (echo -ne "$a\t"; mkdir -p summary/slow/; ./summary.py < /scratch365/tphung/landlord1/landlord_${a}_${i}.log) | tee -a summary/slow/summary_${i}.dat; done; done

import fileinput
import statistics

#ts,
#commit,
#inserts,
#merges,
#hits,
#evicts,
#len(self.containers),
#self.storage(),
#self.unique_storage(),
#len(spec.conda) + len(spec.pip),
#len(picked.spec.conda) + len(picked.spec.pip),
#initial.size,
#initial.storage,
#picked.size,
#picked.storage,

CACHE_E = []
CONTAINER_E = []
UNIQUE_DATA = []
TOTAL_DATA = []
INSERTS = 0
MERGES = 0
HITS = 0
EVICTS = 0
WRITTEN_ACTUAL = 0
WRITTEN_REQUESTED = 0

for line in fileinput.input():
    fields = line.split('\t')
    CACHE_E.append(int(fields[8])/int(fields[7]))
    #CONTAINER_E.append(int(fields[9])/int(fields[15]))
    CONTAINER_E.append(int(fields[12])/int(fields[14]))
    UNIQUE_DATA.append(int(fields[8]))
    TOTAL_DATA.append(int(fields[7]))
    INSERTS += int(fields[2])
    MERGES += int(fields[3])
    HITS += int(fields[4])
    EVICTS += int(fields[5])
    if int(fields[2]) + int(fields[3]) > 0:
        WRITTEN_REQUESTED += int(fields[12])
        WRITTEN_ACTUAL += int(fields[14])

print('\t'.join((str(x) for x in (
    statistics.median(CACHE_E), # 2
    statistics.median(CONTAINER_E), # 3
    INSERTS, # 4
    MERGES, # 5
    HITS, # 6
    EVICTS, # 7
    UNIQUE_DATA[-1], # 8
    TOTAL_DATA[-1], # 9
    WRITTEN_REQUESTED, # 10
    WRITTEN_ACTUAL, # 11
    max(CACHE_E), # 12
    max(CONTAINER_E), # 13
    CONTAINER_E[-1], #14
    CACHE_E[-1], #15
    statistics.median(CACHE_E[-1000:]), # 16
    statistics.median(CONTAINER_E[-1000:]), # 17
    statistics.median(UNIQUE_DATA[-1000:]), # 18
    statistics.median(TOTAL_DATA[-1000:]), # 19
))))
