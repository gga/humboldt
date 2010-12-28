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
  Given the script
    """
    script do |s|
      s.user :fact do
        def fact(i) ; i == 1 ? i : i * fact(i - 1) ; end
        fact(50)
      end
    end
    """
  And   a running server
  When  the script is executed
  And   results are gathered
  Then  nothing is reported