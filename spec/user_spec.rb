require_relative 'spec_helper'

describe Humboldt::User do
  let(:repeats) { 4 }
  let(:repo) { double('blackboard') }

  subject { Humboldt::User.new(:test, :times => repeats) { @count += 1 } }
  
  before(:each) do
    repo.stub(:time)
    @count = 0
  end

  it "should default the repeats to 0" do
    Humboldt::User.new(:test).repeats.should == 0
  end
  
  it "should default the count to 0" do
    Humboldt::User.new(:test).count == 0
  end
  
  it "should execute as many times as specified, plus once more for warm-up" do
    subject.run(repo)
    @count.should == repeats + 1
  end
  
  it "should record times for each specified execution of the user" do
    repo.should_receive(:time).with(:user, :test, kind_of(Time), kind_of(Time), kind_of(Float)).exactly(repeats)
    subject.run(repo)
  end

end
