.PHONY: clean
.PHONY: init

clean:
	rm -rf models
	rm -rf figures
	rm -rf derived_data
	rm -rf logs
	rm -rf report.html

init:
	mkdir -p models
	mkdir -p figures
	mkdir -p derived_data
	mkdir -p logs
	
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
 derived_data/advantages_success.csv derived_data/contestants_all_seasons.csv
	Rscript contestants.R

 