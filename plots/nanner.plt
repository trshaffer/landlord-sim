load "common.opts"
load "Set1.plt"

set output ARG1
#set output "opcount_".ARG2.".pdf"

#set title "cache operations (".ARG2."GB cache)"
set xlabel "α"
set ylabel "Count (thousands)"
set y2label "TB"
set y2tics

set key at graph 0.9, 1

set label "More Responsive\n(Falling Miss Rate)" at 0.63, graph 0.4 font ",10" right
set arrow from 0.65, graph 0 to 0.65, graph 1 nohead
set arrow from 0.53, graph 0.2 to 0.63, graph 0.2

set arrow from 0.95, graph 0 to 0.95, graph 1 nohead
set label "Increased IO Overhead\n(Excessive Container Size)" at 0.93, graph 0.4 font ",10" right
set arrow from 0.92, graph 0.2 to 0.82, graph 0.2


plot "summary_".ARG2.".dat" \
   using ($1/100):(($4+$5)/1000) axes x1y1 with lines title "Misses" ls 1, \
"" using ($1/100):($11/1e12) axes x1y2 with lines title "Bytes Written" ls 2
