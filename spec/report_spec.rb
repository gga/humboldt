require_relative 'spec_helper'

describe Humboldt::Report do
  let(:script) { double('script') }
  let(:server) { double('server') }
  subject { Humboldt::Report.new(script) }

  it "should have no results when first created" do
    subject.results.should be_empty
  end
  
  it "should gather no results for a script with no users" do
    script.should_receive(:users).and_return([])
    subject.gather(server)
    subject.results.should be_empty
  end

end
