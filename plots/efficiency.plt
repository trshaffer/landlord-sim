load "common.opts"
load "Set1.plt"

set output ARG1
#set output "efficiency_".ARG2.".pdf"

#set title "storage efficiency (".ARG2."GB cache)"
set xlabel "Alpha"
set ylabel "Percent Efficiency"

set yrange [:103]

set key top left

set label "Operational\nZone" at 0.7,50 font ",20" center

#set label "Lower Cache\nEfficiency Limit" at 0.63,60 font ",10" right
#set arrow from 0.65,0 to 0.65,103 nohead
#set arrow from 0.53,40 to 0.63,40

#set arrow from 0.95,0 to 0.95,103 nohead
#set label "Upper Compute\nTime Limit" at 0.93,60 font ",10" right
#set arrow from 0.92,40 to 0.82,40

plot "summary_".ARG2.".dat" \
   using ($1/100):($16*100) with lines title "Cache" ls 1, \
"" using ($1/100):($17*100) with lines title "Container" ls 2
