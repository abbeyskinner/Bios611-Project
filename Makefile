.PHONY: clean
.PHONY: init

clean:
	rm -rf figures
	rm -rf derived_data
	rm -rf report

init:
	mkdir -p figures
	mkdir -p derived_data
	
derived_data/contestants_all_seasons.csv: merge_seasons.R\
 /home/rstudio/work/data/survivor/contestant_table.csv | init
	Rscript merge_seasons.R

derived_data/challenge_data.csv: win_percentage.R | init
	Rscript win_percentage.R

derived_data/advantages.csv derived_data/advantages_success.csv: advantage.R | init
	Rscript advantage.R
	
derived_data/confessional_data.csv: confessional.R | init
	Rscript confessional.R

derived_data/contestant_data.csv: contestants.R job_category.R\
 derived_data/challenge_data.csv derived_data/advantages.csv\
 derived_data/advantages_success.csv derived_data/contestants_all_seasons.csv\
 derived_data/confessional_data.csv
	Rscript contestants.R
	
figures/job_finish.png: figure_job_finish.R derived_data/contestant_data.csv
	Rscript figure_job_finish.R
	
figures/gender_race_finish.png: figure_gender_race_finish.R derived_data/contestant_data.csv
	Rscript figure_gender_race_finish.R
	
figures/personality.png: figure_personality.R derived_data/contestant_data.csv
	Rscript figure_personality.R
	
figures/win_perc.png: figure_win_perc.R derived_data/contestant_data.csv
	Rscript figure_win_perc.R
	
figures/demographics.png: figure_demographics.R derived_data/contestant_data.csv
	Rscript figure_demographics.R

report/report.html: report.Rmd figures/job_finish.png figures/gender_race_finish.png\
 figures/personality.png figures/win_perc.png figures/demographics.png
	Rscript -e "rmarkdown::render('report.Rmd', output_format = 'html_document')"


 