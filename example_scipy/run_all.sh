#!/bin/bash

ruby param_ils_2_3_run.rb -scenariofile example_scipy/scenario-scipy.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_scipy/help_scipy_time.txt

ruby param_ils_2_3_run.rb -scenariofile example_scipy/scenario-scipy-branches.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_scipy/help_scipy_branches.txt

ruby param_ils_2_3_run.rb -scenariofile example_scipy/scenario-scipy-cache-references.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_scipy/help_scipy_cache-references.txt

ruby param_ils_2_3_run.rb -scenariofile example_scipy/scenario-scipy-cycles.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_scipy/help_scipy_cycles.txt

ruby param_ils_2_3_run.rb -scenariofile example_scipy/scenario-scipy-L1.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_scipy/help_scipy_L1.txt

ruby param_ils_2_3_run.rb -scenariofile example_scipy/scenario-scipy-perf-time.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_scipy/help_scipy_perf-time.txt

ruby param_ils_2_3_run.rb -scenariofile example_scipy/scenario-scipy-weights.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_scipy/help_scipy_weights.txt

ruby param_ils_2_3_run.rb -scenariofile example_scipy/scenario-scipy-energy.txt  -numRun 1  -maxEvals 100000 -maxIts 10000 -approach basic -validN 30 > example_scipy/help_scipy_energy.txt