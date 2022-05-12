SCALES = 100 500 1000 5000

.PHONY: all
all: $(foreach capacity, $(SCALES), opcount_$(capacity).pdf) \
     $(foreach capacity, $(SCALES), dup_$(capacity).pdf) \
     $(foreach capacity, $(SCALES), overhead_$(capacity).pdf) \
     $(foreach capacity, $(SCALES), efficiency_$(capacity).pdf) \
     $(foreach capacity, $(SCALES), hitrate_$(capacity).pdf) \
     $(foreach capacity, $(SCALES), nanner_$(capacity).pdf) \

.PHONY: clean
clean:
	rm -rf *.png *.pdf

opcount_%.pdf: opcount.plt common.opts summary_%.dat
	gnuplot -c $< $@ $(*F)

dup_%.pdf: dup.plt common.opts summary_%.dat
	gnuplot -c $< $@ $(*F)

overhead_%.pdf: overhead.plt common.opts summary_%.dat
	gnuplot -c $< $@ $(*F)

efficiency_%.pdf: efficiency.plt common.opts summary_%.dat
	gnuplot -c $< $@ $(*F)

hitrate_%.pdf: hitrate.plt common.opts summary_%.dat
	gnuplot -c $< $@ $(*F)

nanner_%.pdf: nanner.plt common.opts summary_%.dat
	gnuplot -c $< $@ $(*F)
