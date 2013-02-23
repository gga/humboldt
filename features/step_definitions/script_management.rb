include Humboldt

When /^the script is loaded$/ do
  @script = eval(@script_text)
end

When /^the script is executed$/ do
  step %{the script is loaded}
  @repo = Repository.new(@server.url)
  @script.run(@repo)
end

When /^results are gathered$/ do
  @report = Humboldt::Report.new(@script)
  @report.gather(@server)
end

When /^the user '(\w+)' will repeat (\d+) times$/ do |user, repeats|
  @script.users[user.to_sym].repeats = repeats.to_i
end

When /^there will be (\d+) '(\w+)' users?$/ do |count, user|
  @script.users[user.to_sym].count = count.to_i
end
