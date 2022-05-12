load "common.opts"
load "Set1.plt"

set output ARG1
#set output "dup_".ARG2.".pdf"

#set title ARG2." GB cache"
set xlabel "α"
set ylabel "GB"
set offsets graph 0, 0, 0.05, 0

if (ARG2 == "5000") {
	set key top right
} else {
	set key center right
}

plot "summary_".ARG2.".dat" \
   using ($1/100):($8/1e9) with lines title "Unique Data" ls 1, \
"" using ($1/100):($9/1e9) with lines title "Total Data" ls 2
