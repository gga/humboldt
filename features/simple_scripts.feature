Feature: Simple scripts
  In order to make the easiest possible use of humboldt
  a variety of very simple scripts should do sensible things.

  Scenario: Empty script
  Given an empty script
  And   a running server
  When  the script is executed
  And   results are gathered
  Then  nothing is reported
  
  Scenario: Simple script
  Given a factorial script
  And   a running server
  When  the script is executed
  And   results are gathered
  Then  nothing is reported
  
  Scenario: When a user is set to repeat, then results will be gathered
  Given a factorial script
  And   a running server
  When  the script is loaded
  And   there will be 5 'fact' users
  And   the user 'fact' will repeat 10 times
  And   the script is executed
  And   results are gathered
  Then  results are reported for the script
  And   10 results are reported for the user 'fact'