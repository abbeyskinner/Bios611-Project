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
	rm -rf report.html
	mkdir -p derived_data
	mkdir -p figures
	mkdir -p logs

report.html: report.Rmd
	Rscript -e "rmarkdown::render('report.Rmd', output_file = 'report.html')"