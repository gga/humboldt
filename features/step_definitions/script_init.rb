Given /^an? (\w+) script$/ do |type|
  @script_text = case type
  when 'empty'
    "script {}"
  when 'factorial'
    <<-EOS
script do |s|
  s.user :fact do
    def fact(i) ; i == 1 ? i : i * fact(i - 1) ; end
    fact(50)
  end
end
EOS
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