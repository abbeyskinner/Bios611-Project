.PHONY: clean
.PHONY: init

init:
	mkdir -p derived_data
	mkdir -p figures
	mkdir -p logs

clean:
	rm -rf derived_data
	rm -rf figures
	rm -rf logs
	mkdir -p derived_data
	mkdir -p figures
	mkdir -p logs

report.Rmd: 
	Rscript