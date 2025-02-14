# lpg Wrapper for ParamILS
# Define a method to build the parameter string
def build_param_string(params)
  # Define mappings from parameter names to command-line flags
  flag_mappings = {
    'luby' => '-luby',
    'rnd-init' => '-no-rnd-init',
    'gc-frac' => '-gc-frac',
    'rinc' => '-rinc',
    'var-decay' => '-var-decay',
    'cla-decay' => '-cla-decay',
    'rnd-freq' => '-rnd-freq',
    'rnd-seed' => '-rnd-seed',
    'phase-saving' => '-phase-saving',
    'ccmin-mode' => '-ccmin-mode',
    'rfirst' => '-rfirst',
    'pre' => '-pre',
    'verb' => '-verb',
    'rcheck' => '-no-rcheck',
    'asymm' => '-no-asymm',
    'elim' => '-elim',
    'simp-gc-frac' => '-simp-gc-frac',
    'sub-lim' => '-sub-lim',
    'cl-lim' => '-cl-lim',
    'grow' => '-grow',
    'RESTARTS' => '-RESTARTS',
    'LUBYFACTOR' => '-LUBYFACTOR',
    'FIXEDPERIOD' => '-FIXEDPERIOD',
    'PHASE' => '-PHASE',
    'CLADECAY' => '-CLADECAY',
    'INITCONFLICTBOUND' => '-INITCONFLICTBOUND',
    'VARDECAY' => '-VARDECAY',
    'CONFLICTBOUNDINCFACTOR' => '-CONFLICTBOUNDINCFACTOR',
    'SIMP' => '-SIMP',
    'CLEANING' => '-CLEANING',
    'lbd-cut' => '-lbd-cut',
    'lbd-cut-max' => '-lbd-cut-max',
    'cp-increase' => '-cp-increase',
    'P' => '-P',
    'I' => '-I',
    'K' => '-K',
    'M' => '-M',
    'V' => '-V',
    'N' => '-N',
    'U' => '-U',
    'B' => '-B',
    'num-decimal-places' => '-num-decimal-places',
    'level' => 'level',
    'wbits' => 'wbits',
    'memLevel' => 'memLevel',
    'strategy' => 'strategy',
    'search_steps' => '-search_steps',
    'restarts' => '-restarts',
    'repeats' => '-repeats',
    'noise' => '-noise',
    'static_noise' => '-static_noise',
    'lowmemory' => '-lowmemory',
    'method' => '--method',
    'jac' => '--jac',
    'tol' => '--tol',
    'disp' => '--disp',
    'maxiter' => '--maxiter'
  }

  # Build the parameter string
  param_string = []
  #if a param in params start with a - remove it

  params.each do |key, value|
    key = key.gsub(/^--?/, '')
    if flag_mappings.key?(key)
      if ['P', 'I', 'K', 'M', 'V', 'N', 'U', 'B', 'num-decimal-places', 'static_noise', 'lowmemory', 'search_steps', 'restarts', 'repeats', 'noise'].include?(key)
        case value.downcase
        when 'true'
          param_string << flag_mappings[key]
        when 'false', 'none'
          # Skip these values
          next
        else
          param_string << "#{flag_mappings[key]} #{value}"
        end
      elsif ['method', 'jac', 'tol', 'disp', 'maxiter'].include?(key)
        if %w[none false].include?(value.downcase) || value.nil?
          # Skip these values
          next
        else
          param_string << "#{flag_mappings[key]}=#{value}"
        end
      else
        if value.downcase == 'true'
          param_string << flag_mappings[key]
        elsif value.downcase == 'false'
          param_string << "-no-#{flag_mappings[key][1..]}" unless flag_mappings[key].include?('no-')
        else
          param_string << "#{flag_mappings[key]}=#{value}"
        end
      end
    else
      #print error message
      STDERR.puts "Warning: Ignoring unknown parameter '#{key}'"
    end
  end

  param_string.join(' ')
end




# Ensure correct usage.
if ARGV.length < 5
    puts "lpg_wrapper.rb is a wrapper for lpg."
    puts "Usage: ruby lpg_wrapper.rb <instance_relname> <instance_specifics> <cutoff_time> <cutoff_length> <seed> <params to be passed on>."
    exit -1
  end
  
  # Parse command-line arguments.
  input_file = ARGV[0]
  instance_specifics = ARGV[1] # Unused, but available for future customization.
  timeout = ARGV[2].to_i
  cutoff_length = ARGV[3].to_i
  seed = ARGV[4].to_i
  
  # Process parameters passed after the standard arguments.
  # Extract and parse parameters
  raw_params = ARGV[5...ARGV.length]
  params = {}

  raw_params.each_slice(2) do |key, value|
    params[key.gsub(/^--?/, '')] = value
  end

  # Build parameter string
  paramstring = build_param_string(params)
  # Construct the command to execute lpg.
  #print the params
  STDERR.puts "params: #{paramstring}"
  cmd = "./run_custom.sh '/home/jim/magpie/examples/lpg/necessary/run_single.sh #{input_file} #{paramstring}'"

  # Create a temporary file for capturing output.
  tmp_file = "example_lpg/lpg_output#{rand}.txt"
  exec_cmd = "#{cmd} 1> #{tmp_file} 2> #{tmp_file}"
  STDERR.puts "Calling: #{exec_cmd}"
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)



  # Execute the command
  system(exec_cmd)

  # End time
  end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  # Calculate runtime with millisecond precision
  runtime = (end_time - start_time).round(3)
  
  # Print the command to STDERR for debugging.
  print "runtime: #{runtime}\n"
  
  # Execute the command.

  
  # Parse the output to extract information for ParamILS.
  solved = "CRASHED"
 
  perf=0
  File.open(tmp_file) do |file|
    file.each_line do |line|
      if line =~ /completed successfully/
        solved = "SAT"
        
      end
      if line =~ /Custom Metric:\s+(\d+)/
        perf = $1.to_i # Extract the number and convert it to an integer
        puts "Custom Metric: #{perf}"
      end
    end
  end
  #print the runtime
  File.delete(tmp_file)
  puts "runtime: #{runtime}"
  puts "perf: #{perf}"
  # Output the result in the format expected by ParamILS.
  puts "Result for ParamILS: #{solved}, #{runtime || timeout}, 0,  #{perf}, #{seed} "
  # Clean up the temporary file.
  # File.delete(tmp_file)
  
  # # Output the result in the format expected by ParamILS.
  # puts "Result for ParamILS: #{solved}, #{runtime || timeout}, 0, 0, #{seed}"
  