611 Project README
==================

For my 611 Final Project, I will be looking at data on the CBS show 'Survivor'. I have a couple different datasets from 2 different sources.

# First source: 
Kaggle - https://www.kaggle.com/datasets/justinveiner/survivor-cbs-dataset?resource=download 
There are 3 datasets from this source -- contestant data, season data, and tribe data. I mainly will be looking at the contestant dataset, but the other 2 datasets have been helpful for background information. I also may do some data wrangling to add information from the season/tribe datasets to the contestant dataset. All of these files are .csv's. The data from Kaggle is on the first 43 seasons of Survivor US. Contestant data contains observations on each contestant in the first 43 seasons. It has 785 observations and 32 variables. The variables in the contestant data are as follows:
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

I will not investigate all of these variables. Also note that the season data contains information on each of the 43 seasons (43 observations, 22 variables) and the tribe data contains information on every tribe over all seasons (224 observations, 16 variables).

# Second souce: 
The second source of data that I found comes from the `survivoR` R package: https://cran.r-project.org/web/packages/survivoR/survivoR.pdf. It has a multitude of datasets, but the ones that are the most of interest to me are challenge_summary, advantage_movement, and confessionals. The information that I want to take from these datasets would be 
1. calculate a win percentage in challenges for each contestant (number of challenges they won/number of challenges competed in)
2. create a boolean variables for if a contestant found an advantage, calculate the number of advantages found, and calculate a success rate of using the advantage
3. calculate the average number of confessionals for each contestant per episode

Here are the relevant variables for challenge_summary:
* version_season - country + season number (will filter out the non-US seasons)
* challenge_id
* outcome_type - tribal or individual 
* tribe
* castaway_id
* castaway - contestant first name
* n_winners - number of winners
* n_in_team - number of people per team 
* won - boolean for won

Here are the relevant variables for advantage_movement:
* version_season - country + season number (will filter out the non-US seasons)
* castaway - first name
* castaway_id
* advantage_id - id number for distinct advantages each season (1st advantage found each season has id=1)
* sequence_id - id number indicating the sequence of events. (when advantage is found id=1 and each subsequent event follows)
* day - day that an event with the advantage took place
* event - what happened with advantage - found, played, expired, etc
* played_for - who advantage was played for
* played_for_id
* success - if advantage was successfully played

here are the relevant variables for confessional_data:
* version_season - country + season number (will filter out the non-US seasons)
* episode
* castaway - first name
* castaway_id
* confessional_count

# 5 things of interest in the data

1. Is there a certain demographic of people who tend to win survivor? Make final tribal? Get voted out first? I hypothesize that white males win the most and older women get voted out first.

2. Are there some professions (or fields of professions) that tend to last longer in the game? Are there some that tend to get voted out sooner? I know that some common professions in survivor players are lawyers, firefighters, police officers, and students. I hypothesize that professions that would tend to last longer would be professions that have strong social and communication skills and professions where you need to be deceitful and convincing. So professions such as undercover cops, lawyers, sales, and actors.

3. Has the demographic of players changed over time? If so, has the demographic of those who won, made final tribal, and got voted out first changed over time? I hypothesize that the demographic over time has shifted from mostly white players to more of a mix of many different races. There has always been an equal split of men and women. I am interested to see if this shift has translated into the demographics of winners, final tribal groups, and those voted out first.

4. How is win percentage in challenges related to how long you last in the game? What is average win percentage of those who win? make final tribal? I hypothesize that this relationship would be a curve that increases until a point and then starts to decrease as you can be seen as a threat if you are too strong. 

5. Do advantages help you win? I hypothesize that using advantages correctly may help you win, but sometimes it can put a bigger target on your back. I am interested to see how often winners have had advantages and used them sucessfully (or not). I also am interested to see how often people with advantages get voted out before final tribal council.

6. Do winners get more confessional time? Seasons are filmed far before they are aired, so the producers know who wins the game before editing of the episodes begins. Is there a way to predict who will win the show based on the average number of confessionals each contestant gets per episode? 









