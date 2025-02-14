#!/bin/bash

ruby param_ils_2_3_run.rb -scenariofile example_minisat_hack/scenario-minisat-hack.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_minisat_hack/help_minisat_hack_time.txt

ruby param_ils_2_3_run.rb -scenariofile example_minisat_hack/scenario-minisat-hack-branches.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_minisat_hack/help_minisat_hack_branches.txt

ruby param_ils_2_3_run.rb -scenariofile example_minisat_hack/scenario-minisat-hack-cache-references.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_minisat_hack/help_minisat_hack_cache-references.txt

ruby param_ils_2_3_run.rb -scenariofile example_minisat_hack/scenario-minisat-hack-cycles.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_minisat_hack/help_minisat_hack_cycles.txt

ruby param_ils_2_3_run.rb -scenariofile example_minisat_hack/scenario-minisat-hack-L1.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_minisat_hack/help_minisat_hack_L1.txt

ruby param_ils_2_3_run.rb -scenariofile example_minisat_hack/scenario-minisat-hack-perf-time.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_minisat_hack/help_minisat_hack_perf-time.txt

ruby param_ils_2_3_run.rb -scenariofile example_minisat_hack/scenario-minisat-hack-weights.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_minisat_hack/help_minisat_hack_weights.txt

ruby param_ils_2_3_run.rb -scenariofile example_minisat_hack/scenario-minisat-hack-energy.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_minisat_hack/help_minisat_hack_energy.txt