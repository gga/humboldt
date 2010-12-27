require 'src/report'

describe Humboldt::Report do
  
  before(:each) do
    @script = double('script')
    @server = double('server')
  end

  it "should have no results when first created" do
    @it = Humboldt::Report.new(@script)
    @it.results.should be_empty
  end
  
  it "should gather no results for a script with no users" do
    @it = Humboldt::Report.new(@script)
    @script.should_receive(:users).and_return([])
    @it.gather(@server)
    @it.results.should be_empty
  end

end
