# Celebrity Baby Names

#### By: [Keevey Song](https://github.com/Keevey), [Peng Zhao](https://github.com/pengzhao001), [Rasha Gargees](https://github.com/rashasg), [Andrew Pistole](https://github.com/APistole) & [James Bain](https://github.com/jcbain)

[The Dataset(National Level)](https://catalog.data.gov/dataset/baby-names-from-social-security-card-applications-national-level-data)

[The Dataset(State Level)](https://catalog.data.gov/dataset/baby-names-from-social-security-card-applications-data-by-state-and-district-of-)

[The Dataset for Presidents](http://www.presidency.ucsb.edu/data/popularity.php)

[The Dataset for movies of all time adjusted for inflation](http://www.filmsite.org/boxoffice3.html)
	 The data was cleaned and integrated with characters and cast information from IMDb http://www.imdb.com/ through IMDbPY package http://imdbpy.sourceforge.net/. 

[The Dataset for Disney Movies](http://www.imdb.com/list/ls053518863/?start=1&view=compact&sort=listorian:asc&defaults=1)
	
# The Questions:
	1)Does the approval rating of a President influence the rate of babies named after them?
	2)Does a famous sports player's MVP status influence the popularity of babies named after their MVP recognition?
	3)Do characters from top movies names influence the popularity of babies named after their release?
	4)Does Disney Character's names influence the popularity of babies named after the film's release?

### Instructions for executing your code
#### Presidential Approval

Ensure that the `approval_analysis.R` script and the `data/` directory is in the parent directory. The analysis draws from the `data/presApprovalAverage.csv`.  Set your working directory to the parent directory of the R script and then run the code. 

#### Movie Characters
Ensure that `raw_100_films_inflation_adj.csv` is in `/data` when executing `movie_data_carpentry.ipynb`. Please be aware that this is a python 2 notebook since the IMDbPY package only works under Python 2. Make sure IMDbPY has been installed before executing this file. After executing this notebook, `movie_data_final.csv` will be created. This file will be used in `movie_exploration.ipynb` (Python 3) as input.

#### Disney Characters
For the (`Rasha_data_coll.R`) program:Ensure that the (`Disney_Data.csv`) in the E: directory. After executing this program the (`Rasha_Data.csv`) will be created.
For the (`disney_char.ipynb`), ensure(`Rasha_Data.csv`) and (`StateNames.csv`) in the output folder.

#[The Extended Documentation](https://docs.google.com/document/d/1UMTl81b4zbJz0xprrjVmWvOU5WAy-3XYd90N__wtLfU/edit)
	
