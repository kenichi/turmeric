Feature: Basic app testing
  As a developer
  I want cucumber to test my site
  So I can use it to drive development

  Scenario: Root page loads
    When I go to the home page
    Then I should see "hello world!" within "body"
    And I should not see "bar"

  @javascript
  Scenario: Root page loads in real browser
    When I go to the home page
    Then I should see "hello world!" within "body"
    And I should see "bar" within "#foo"
