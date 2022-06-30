#load "common.opts"
set terminal pdf size 2.25in,1.2in font "Nimbus Roman,11"
set yrange [0:]
set y2range [0:]
load "Set1.plt"

set output ARG1
#set output "overhead_".ARG2.".pdf"

#set title ARG2." GB cache"
set xlabel "Alpha"
set ylabel "TB"

if (ARG2=="100") {
	set key bottom left
}
if (ARG2=="500") {
	set key top left
}
if (ARG2=="1000") {
	set key top left
}
if (ARG2=="5000"){
	set key top left
}


plot "summary_".ARG2.".dat" \
   using ($1/100):($10/1e12) with lines title "Required IO" ls 1, \
"" using ($1/100):($11/1e12) with lines title "Actual IO" ls 2
