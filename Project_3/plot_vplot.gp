
set terminal pngcairo size 1400,700 enhanced
set output "vplot.png"

set title "V-plot"
set xlabel "Position offset"
set ylabel "Fragment length (bp)"

set xrange [-0.5:999.5]
set yrange [-0.5:350.5]

set xtics ("-500" 0, "-250" 250, "0" 500, "250" 750, "499" 999)

set ytics ("50" 0, "100" 50, "150" 100, "200" 150, "250" 200, "300" 250, "350" 300, "400" 350)

set palette defined (0 "#1b0c41", \
                     0.20 "#4f3b9a", \
                     0.40 "#2c7fb8", \
                     0.60 "#41b6c4", \
                     0.80 "#fed976", \
                     1.00 "#e31a1c")

set logscale cb
set cbrange [1:*]
set cblabel "Fragment count (log scale)"

set colorbox

plot "plot_data.txt" matrix with image notitle

unset output

