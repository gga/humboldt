include Humboldt

When /^the script is loaded$/ do
  @script = eval(@script_text)
end

When /^the script is executed$/ do
  When "the script is loaded"
  @script.run
end

When /^results are gathered$/ do
  @report = Humboldt::Report.new(@script)
  @report.gather(@server)
end