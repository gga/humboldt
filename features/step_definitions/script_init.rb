Given /^an? (\w+) script$/ do |type|
  @script_text = case type
  when 'empty'
    "script {}"
  else
    ['empty'].should_include(type)
  end
end

Given /^the script$/ do |text|
  @script_text = text
end

Given /a running server$/ do
  @server = Humboldt::Server.new
  @server.start!
end