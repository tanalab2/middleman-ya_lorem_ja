Feature: Lorem generating helper

  Scenario: Lorem Helper
    Given the Server is running at "test-app"
    Then going to "/word.html" should not raise an exception
    Then I should see "#word" contents have over "2" chars
    Then I should see "#words5" contents have over "10" chars
    Then I should see "#sentence" contents have over "12" chars
    Then I should see "#sentences3" contents have over "6" chars
    Then I should see "#paragraph" contents have "1" lines
    Then I should see "#paragraphs3" contents have "3" lines
    
    
