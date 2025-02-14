#!/bin/bash

ruby param_ils_2_3_run.rb -scenariofile example_minisat/scenario-minisat.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_minisat/help_minisat_time.txt

ruby param_ils_2_3_run.rb -scenariofile example_minisat/scenario-minisat-branches.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_minisat/help_minisat_branches.txt

ruby param_ils_2_3_run.rb -scenariofile example_minisat/scenario-minisat-cache-references.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_minisat/help_minisat_cache-references.txt

ruby param_ils_2_3_run.rb -scenariofile example_minisat/scenario-minisat-cycles.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_minisat/help_minisat_cycles.txt

ruby param_ils_2_3_run.rb -scenariofile example_minisat/scenario-minisat-L1.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_minisat/help_minisat_L1.txt

ruby param_ils_2_3_run.rb -scenariofile example_minisat/scenario-minisat-perf-time.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_minisat/help_minisat_perf-time.txt

ruby param_ils_2_3_run.rb -scenariofile example_minisat/scenario-minisat-weights.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_minisat/help_minisat_weights.txt

ruby param_ils_2_3_run.rb -scenariofile example_minisat/scenario-minisat-energy.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_minisat/help_minisat_energy.txt