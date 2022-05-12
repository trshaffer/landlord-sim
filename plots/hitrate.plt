load "common.opts"
load "Set1.plt"

set output ARG1
#set output "opcount_".ARG2.".pdf"

#set title "cache operations (".ARG2."GB cache)"
set xlabel "α"
set ylabel "Hit rate (percent)"

set key off

plot "summary_".ARG2.".dat" \
   using ($1/100):($6/($4+$5+$6)*100) with lines
