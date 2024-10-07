611 Project README
==================

For my 611 Final Project, I will be looking at data on the CBS show 'Survivor'. I have a couple different datasets from 2 different sources.

First source: Kaggle - https://www.kaggle.com/datasets/justinveiner/survivor-cbs-dataset?resource=download 
There are 3 datasets from this source -- contestant data, season data, and tribe data. I mainly will be looking at the contestant dataset, but the other 2 datasets have been helpful for background information. I also may do some data wrangling to add information from the season/tribe datasets to the contestant dataset. All of these files are .csv's. The data from Kaggle is on the first 43 seasons of Survivor US. Contestant data contains observations on each contestant in the first 43 seasons. It has 785 observations and 32 variables. Season data contains information on each of the 43 seasons (43 observations, 22 variables). Lastly, tribe data contains information on every tribe from each of the 43 seasons (224 observations, 16 variables). The variables in the contestant data are as follows:
* contestant_name
* age
* hometown
* profession
* num_season - season they were on
* finish - what place they got (1=first place)
* gender
* african_american - boolean for african american
* asiain_american - boolean for asian america
* latin_american - boolean for latin america
* poc - boolean for poc
* jewish - boolean for jewish
* muslim - boolean for muslim
* lbgt - bookean for lgbt
* state - state they currently reside in
* country - either US or CA
* num_appearance - number of appearances on show (1=1st season, 2=2nd season, ...)
* birthdate
* merge - boolean for if they made the merge
* jury - boolean for if were in the jury
* ftc - boolean for if were in final tribal council
* votes_against - total number of votes casted against them throughout the season
* num_boot - elimination order (1=1st person voted off)
* tribe1 - 1st tribe's name
* tribe2 - 2nd pre-merge tribe's name (if applicable)
* tribe3 - 3rd pre-merge tribe's name (if applicable)
* quit - boolean for if they quit
* evac - boolean for if they were medically evacuated
* ejected - boolean for if they were ejected
* fmc - boolean for if they won the fire making challenge 
* num_jury_votes - number of jury votes received (if applicable)
* normalized_finish - placement percentile

I will not investigate all of these variables.

The second source of data that I found comes from the `survivoR` R package: https://cran.r-project.org/web/packages/survivoR/survivoR.pdf. It has a multitude of datasets, but the ones that are the most of interest to me are challenge_summary, advantage_movement, and confessionals. The information that I want to take from these datasets would be 
1. calculate a win percentage in challenges for each contestant (number of challenges they won/number of challenges competed in)
2. create a boolean variables for if a contestant found an advantage, calculate the number of advantages found, and calculate a success rate of using the advantage
3. calculate the average number of confessionals for each contestant per episode

Here are the relevant variables for challenge_summary:
* version_season - country + season number (will filter out the non-US seasons)
* challenge_id
* challenge_type - immunity, reward, immunity & reward, or duel
* outcome_type - tribal or individual
* tribe
* castaway_id
* castaway - contestant first name
* n_entities - number of competitors
* n_winners - number of winners
* n_in_team - number of people per team 
* won - boolean for won

Here are the relevant variables for advantage_movement:
* version_season - country + season number (will filter out the non-US seasons)
* castaway - first name
* castaway_id
* advantage_id
* sequence_id
* day - day that an event with the advantage took place
* event - what happened with advantage - found, played, expired, etc
* played_for - who advantage was played for
* played_for_id
* success - if advantage was successfully played
* votes_nullified

here are the relevant variables for confessional_data:
* version_season - country + season number (will filter out the non-US seasons)
* season
* episode
* castaway - first name
* castaway_id
* confessional_count







Choose a data set! Describe what is in the data set (what columns are available, what files, etc). Dig deep and imagine five things which might be of interesting about it.  The best way to think about this is to just think about what variables in the data set are maybe causally related or correlated, but you might also hypothesize about clusters in the data set that you expect to see.