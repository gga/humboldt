Feature: Simple scripts
  In order to make the easiest possible use of humboldt
  a variety of very simple scripts should do sensible things.

  Scenario: Empty script
  Given an empty script
  And   a running server
  When  the script is executed
  And   results are gathered
  Then  nothing is reported