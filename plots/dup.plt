#load "common.opts"
set terminal pdf size 2.25in,1.2in font "Nimbus Roman,11"
set yrange [0:105]
set y2range [0:]
load "Set1.plt"

set output ARG1
#set output "dup_".ARG2.".pdf"

#set title ARG2." GB cache"
set xlabel "Alpha"
set ylabel "GB"
set offsets graph 0, 0, 0.05, 0

if (ARG2 == "5000") {
	set key top right
} else {
	set key center right
}

plot "summary_".ARG2.".dat" \
   using ($1/100):($18/1e9) with lines title "Unique Data" ls 1, \
"" using ($1/100):($19/1e9) with lines title "Total Data" ls 2
