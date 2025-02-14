#!/bin/bash

ruby param_ils_2_3_run.rb -scenariofile example_lpg/scenario-lpg.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_lpg/help_lpg_time.txt

ruby param_ils_2_3_run.rb -scenariofile example_lpg/scenario-lpg-branches.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_lpg/help_lpg_branches.txt

ruby param_ils_2_3_run.rb -scenariofile example_lpg/scenario-lpg-cache-references.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_lpg/help_lpg_cache-references.txt

ruby param_ils_2_3_run.rb -scenariofile example_lpg/scenario-lpg-cycles.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_lpg/help_lpg_cycles.txt

ruby param_ils_2_3_run.rb -scenariofile example_lpg/scenario-lpg-L1.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_lpg/help_lpg_L1.txt

ruby param_ils_2_3_run.rb -scenariofile example_lpg/scenario-lpg-perf-time.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_lpg/help_lpg_perf-time.txt

ruby param_ils_2_3_run.rb -scenariofile example_lpg/scenario-lpg-weights.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_lpg/help_lpg_weights.txt

ruby param_ils_2_3_run.rb -scenariofile example_lpg/scenario-lpg-energy.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_lpg/help_lpg_energy.txt