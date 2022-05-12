load "common.opts"
load "Set1.plt"

set output ARG1
#set output "opcount_".ARG2.".pdf"

#set title ARG2." GB cache"
set xlabel "α"
set ylabel "Count"

if (ARG2=="100") {
	set key center left
}
if (ARG2=="500") {
	set key center left
}
if (ARG2=="1000") {
	set key top right
}
if (ARG2=="5000"){
	set key off
}

plot "summary_".ARG2.".dat" \
   using ($1/100):4 with lines title "Inserts" ls 1, \
"" using ($1/100):5 with lines title "Merges" ls 2, \
"" using ($1/100):7 with lines title "Deletes" ls 3, \
"" using ($1/100):($4+$5) with lines title "Misses" ls 4
