require_relative 'user'

module Humboldt
  
  def script(&body)
    return Script.new(body)
  end
  
  class Script
    
    attr_reader :users
    
    def initialize(body)
      @users = {}
      body.call(self)
    end
    
    def user(name, options = {}, &body)
      users[name] = User.new(name, options, &body)
    end
    
    def run(repo)
      @users.values.each do |u|
        u.count.times { u.start!(repo) }
      end
    end

  end

end
