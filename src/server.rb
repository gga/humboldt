require 'rinda/tuplespace'

module Humboldt
  
  class Server
    
    attr_reader :port
    
    def initialize(options = {})
      @port = options[:port] || 9001
    end
    
    def url
      "druby://#{`hostname`.chomp}:#{@port}"
    end
    
    def start!
      @blackboard = Rinda::TupleSpace.new
      DRb.start_service(url, @blackboard)
      fork do
        @blackboard.read [:quit]
      end
    end
    
  end
  
end