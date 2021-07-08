#WORKUNIT('name', 'hpccsystems_opendata_population_us_states_etl');

import hpccsystems.opendata.population.us.files as files;
import std;

//Filter so that we only have state population
statesOnlyDS := files.rawDS (state <> '0');

statesGroupedDS := GROUP(SORT(statesOnlyDS, name), name);// GROUP the data by name

statesDS := ROLLUP(statesGroupedDS, GROUP, 
                   TRANSFORM(files.statesFileLayout, 
                             SELF.population := SUM(ROWS(LEFT), (REAL)POPEST2018_CIV) ,
                             SELF.location := Std.Str.ToUpperCase(LEFT.name)));

OUTPUT(statesDS,,files.statesFilePath,
   thor,compressed,overwrite,expire(10),named('state_population'));
