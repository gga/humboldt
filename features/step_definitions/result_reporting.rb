Then /^nothing is reported$/ do
  @report.results.should be_empty
end

Then /^results are reported for the script$/ do
  @report.results.should_not be_empty
end

Then /^(\d+) results are reported for the user 'fact'$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
