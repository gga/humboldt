require 'rinda/tuplespace'

module Humboldt
  
  class WorkerBlackboard
    
    def initialize(id, blackboard)
      @id = id
      @blackboard = blackboard
    end
    
    def repeats
      @blackboard.take([:repeat, @id, nil])[2]
    end

  end

end

describe Humboldt::WorkerBlackboard do
  
  before(:each) do
    @server = Rinda::TupleSpace.new
    @id = 1
    @it = Humboldt::WorkerBlackboard.new(@id, @server)
  end
  
  it "should extract the repeats for the specific worker from the blackboard" do
    @server.write [:repeat, @id, 42]
    @it.repeats.should == 42
  end
  
  it "should ignore repeats for other workers" do
    @server.write [:repeat, @id, 42]
    @server.write [:repeat, @id + 1, 43]
    @it.repeats.should == 42
  end

end
