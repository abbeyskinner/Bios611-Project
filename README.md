611 Project - Survivor 
==================

* add something about what im doing*


# How to use this Repo?

* First, clone this git repository by running `git clone https://github.com/abbeyskinner/Bios611-Project`.
* Then run `cd Bios611-Project` to enter into the directory.

* Now you should build the docker container by running `docker build . -t bios611project`.
* Next, to run the docker container run this code: `docker run --rm -ti -p 8789:8787 -e PASSWORD=mypassword -v "$(pwd):/home/rstudio/work" bios611project`.

* Go to https://localhost:8787 and sign in with the username: rstudio and password: mypassword.
* Once connected to Rstudio, run `cd work` to navigate to the work folder.
* Run `make clean` to clean out all the targets.
* Finally run `make report/report.html` to build the report.

More information on the `survivoR` package can be found here: https://cran.r-project.org/web/packages/survivoR/survivoR.pdf 









