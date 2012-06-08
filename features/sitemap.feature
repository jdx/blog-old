Feature: Sitemap
  In order to get a list of recent articles
  As a reader
  I should be able to see the sitemap

  Scenario: Draft articles are hidden
    When there is a post named "Python vs Ruby"
    And there is a draft post named "DRAFT POST"
    And I visit the sitemap
    Then I should see "python-vs-ruby"
    And I should not see "draft-post"
