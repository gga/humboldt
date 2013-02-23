require_relative 'spec_helper'

describe Humboldt::Script do
  include Humboldt
  
  let(:repo) { double('results') }
  
  it "should create a Script object when loaded" do
    script {}.should be_a_kind_of(Humboldt::Script)
  end
  
  it "should evaluate the original body when loaded" do
    run = false
    script { run = true }
    run.should be_true
  end
  
  it "should provide a run method" do
    lambda { script {}.run(repo) }.should_not raise_exception
  end
  
  it "should create a user with the given name" do
    it = script {}
    it.user :test
    it.users[:test].should_not be_nil
  end
  
  it "should start enough users when run" do
    it = script {}
    it.user :test, :count => 5
    it.users[:test].should_receive(:start!).exactly(5)
    it.run repo
  end

end
