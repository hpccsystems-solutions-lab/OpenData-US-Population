Get the data here:    
https://www2.census.gov/programs-surveys/popest/tables/2010-2018/state/asrh/sc-est2018-agesex-civ.csv

2.Upload the file to the landing zone of an HPCC cluster using ECL Watch
3.Spray the data on cluster by using the delimited option with the following parameters
    scope=~hpccsystems::opendata::population::us::raw
    name=sc-est2018-agesex-civ.csv  

Data dictionary: https://www2.census.gov/programs-surveys/popest/technical-documentation/file-layouts/2010-2018/sc-est2018-agesex-civ.pdf     