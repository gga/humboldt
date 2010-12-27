require 'src/script'

describe "Humboldt::script" do
  include Humboldt
  
  it "should create a Script object when loaded" do
    @it = script {}
    @it.should be_a_kind_of(Humboldt::Script)
  end
  
  it "should evaluate the original body when loaded" do
    run = false
    @it = script { run = true }
    run.should be_true
  end
  
  it "should provide a run method" do
    @it = script {}
    lambda {
      @it.run
    }.should_not raise_exception
  end

end
