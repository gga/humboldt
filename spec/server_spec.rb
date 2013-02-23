require 'rinda/tuplespace'

require_relative 'spec_helper'

describe 'humboldt server' do
  
  after(:each) do
    @it.stop! if @it
  end
  
  it "should start on demand" do
    @it = Humboldt::Server.new(:port => 42424)
    @it.start!
    @it.should be_running
  end
  
  it "should pick a default port if one is not provided" do
    Humboldt::Server.new.port.should == 9001
  end
  
  it "should allow the port to be specified" do
    Humboldt::Server.new(:port => 9090).port.should == 9090
  end
  
  it "should generate a URL for the server machine" do
    Humboldt::Server.new.url.should == "druby://localhost:9001"
  end

end

describe 'humboldt server stop' do
  subject { Humboldt::Server.new }

  before(:each) do
    subject.start!
  end
  
  it "should operate on demand" do
    subject.stop!
    subject.should_not be_running
  end

end
