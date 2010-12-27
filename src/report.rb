module Humboldt
  
  class Report
    attr_reader :results
    
    def initialize(script)
      @script = script
      @results = {}
    end
    
    def gather(source)
      @script.users.each do |user_name|
      end
    end
  end

end
