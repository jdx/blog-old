Feature: Articles
  In order to read articles
  As a reader
  I should be able to see articles on the home page

  Scenario: Reading article from home page
    When there is a post named "Python vs Ruby"
    And I am on the home page
    And I follow "Python vs Ruby"
    Then I should see "Ruby is better"

  Scenario: Future post
    When there is a post named "Python vs Ruby" scheduled to be posted tomorrow
    And I am on the home page
    Then I should not see "Ruby is better"

  Scenario: Draft post
    When there is a draft post named "Python vs Ruby"
    And I am on the home page
    Then I should not see "Ruby is better"
