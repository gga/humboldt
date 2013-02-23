require 'rinda/tuplespace'

module Humboldt
  
  class Server
    
    attr_reader :port
    
    def initialize(options = {})
      @port = options[:port] || 9001
    end
    
    def url
      "druby://localhost:#{@port}"
    end
    
    def start!
      @pid = fork do
        @blackboard = Rinda::TupleSpace.new
        DRb.start_service(url, @blackboard)
        @blackboard.read [:quit]
      end
    end
    
    def stop!
      DRb.start_service
      DRbObject.new_with_uri(url).write [:quit]
      join @pid
      @pid = nil
    rescue Exception
      # It's expected that this will throw.
      @pid = nil
    end

    def running?
      @pid != nil
    end
    
  end
  
end
