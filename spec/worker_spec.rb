module Humboldt
  
  class Worker
    
    def initialize(blackboard)
      @blackboard = blackboard
    end

    def run
      # Warm up the worker by working once
      work
      
      @blackboard.repeats.times do
        work
      end
    end

  end

end

class TestWorker < Humboldt::Worker
  
  attr_reader :repeats
  
  def initialize(blackboard)
    super(blackboard)
    @repeats = 0
  end

  def work  
    @repeats += 1
  end

end

describe Humboldt::Worker do
  
  before(:each) do
    @bb = double('blackboard')
    @it = TestWorker.new(@bb)
  end
  
  it "should execute as many times as specified by the blackboard, plus once for warm-up" do
    repeat_count = 4
    @bb.should_receive(:repeats).and_return(repeat_count)
    @it.run
    @it.repeats.should == repeat_count + 1
  end

end