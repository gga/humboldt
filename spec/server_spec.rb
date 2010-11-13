require 'src/server.rb'
require 'rinda/tuplespace'

RSpec::Matchers.define :be_running do
  match do |actual|
    client = DRbObject.new_with_uri(actual.url)
    begin
      client.write [:test]
      true
    rescue Exception => e
      false
    end
  end
end

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

end

describe 'humboldt server stop' do
  
  before(:each) do
    @it = Humboldt::Server.new
    @it.start!
  end
  
  it "should operate on demand" do
    @it.stop!
    @it.should_not be_running
  end

end