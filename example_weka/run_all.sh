#!/bin/bash

ruby param_ils_2_3_run.rb -scenariofile example_weka/scenario-weka.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_weka/help_weka_time.txt

ruby param_ils_2_3_run.rb -scenariofile example_weka/scenario-weka-branches.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_weka/help_weka_branches.txt

ruby param_ils_2_3_run.rb -scenariofile example_weka/scenario-weka-cache-references.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_weka/help_weka_cache-references.txt

ruby param_ils_2_3_run.rb -scenariofile example_weka/scenario-weka-cycles.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_weka/help_weka_cycles.txt

ruby param_ils_2_3_run.rb -scenariofile example_weka/scenario-weka-L1.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_weka/help_weka_L1.txt

ruby param_ils_2_3_run.rb -scenariofile example_weka/scenario-weka-perf-time.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_weka/help_weka_perf-time.txt

ruby param_ils_2_3_run.rb -scenariofile example_weka/scenario-weka-weights.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_weka/help_weka_weights.txt

ruby param_ils_2_3_run.rb -scenariofile example_weka/scenario-weka-energy.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_weka/help_weka_energy.txt