Then /^nothing is reported$/ do
  @report.results.should be_empty
end
