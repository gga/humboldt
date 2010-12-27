module Humboldt
  
  def script(&body)
    return Script.new(body)
  end
  
  class Script
    
    def initialize(body)
      @users = {}
      body.call(self)
    end
    
    def user(name, options = {}, &body)
    end
    
    def users
      @users.keys
    end
    
    def run
    end

  end

end
