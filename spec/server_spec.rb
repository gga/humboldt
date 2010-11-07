require 'src/server.rb'
require 'rinda/tuplespace'

describe 'humboldt server startup' do
  
  it "should pick a default port if one is not provided" do
    Humboldt::Server.new.port.should == 9001
  end
  
  it "should allow the port to be specified" do
    Humboldt::Server.new(:port => 9090).port == 9090
  end
  
  it "should start a tuplespace server at the given port" do
    @it = Humboldt::Server.new
    @it.start!
    @client = DRbObject.new_with_uri(@it.url)
    @client.write [:test]
  end

end