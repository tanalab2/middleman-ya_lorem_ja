Feature: Lorem generating helper
  Scenario: Lorem Helper
    Given the Server is running at "reload_resource"
    Then going to "/word.html" should not raise an exception
    Then I should see "#word" contents have over "2" chars
    Then I should see "#words5" contents have over "10" chars
    Then I should see "#sentence" contents have over "#{2*6}" chars
    Then I should see "#sentence" contents have "1" sentences
    Then I should see "#sentences3" contents have over "6" chars
    Then I should see "#sentences3" contents have "3" sentences
    Then I should see "#paragraph" contents have "1" paragraphs
    Then I should see "#paragraphs3" contents have "3" paragraphs
    Then I should see "#date" contents match "\d{4}年\d{2}月\d{2}日"
    Then I should see "#image" contents match "^http://placehold.it/20x20"
    Then I should see "#resource_name" contents match "chuumon_no_ooi_ryouriten"

    Then I should see "#k-resource_name" contents match "kazehakase"
    Then I should see "#k-word" contents have over "2" chars
    Then I should see "#k-words5" contents have over "10" chars
    Then I should see "#k-sentence" contents have over "#{2*6}" chars
    Then I should see "#k-sentence" contents have "1" sentences
    Then I should see "#k-sentences3" contents have over "6" chars
    Then I should see "#k-sentences3" contents have "3" sentences
    Then I should see "#k-paragraph" contents have "1" paragraphs
    Then I should see "#k-paragraphs3" contents have "3" paragraphs
    Then I should see "#k-date" contents match "\d{4}年\d{2}月\d{2}日"
    Then I should see "#k-image" contents match "^http://placehold.it/20x20"
