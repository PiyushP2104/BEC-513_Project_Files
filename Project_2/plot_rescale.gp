set terminal pngcairo size 1200,700
set output "fragment_length_distributions.png"

set title "Fragment Length Distribution Before and After Rescaling"
set xlabel "Fragment length (bp)"
set ylabel "Normalized frequency"
set key top right

plot "query.hist" using 1:2 with lines lc rgb "#3498DB" title "Original query", \
     "reference.hist" using 1:2 with lines lc rgb "#2ECC71" title "Reference", \
     "query.rescaled.hist" using 1:2 with lines lc rgb "#E74C3C" title "Rescaled query"
