require 'benchmark'

module Humboldt
  
  class User
    
    attr_reader :name
    attr_accessor :repeats, :count
    
    def initialize(name, options = {}, &body)
      @name = name
      @count = options[:count] || 0
      @repeats = options[:times] || 0
      @body = body
    end

    def start!(results)
      @pid = fork do
        run results
      end
    end
    
    def run(results)
      @body.call
      
      @repeats.times do
        timing = time { @body.call }
        results.time :user, @name, *timing
      end
    end
    
    def time
      start = Time.now
      timing = Benchmark.measure { yield }
      finish = Time.now
      [start, finish, timing.real]
    end

  end

end
