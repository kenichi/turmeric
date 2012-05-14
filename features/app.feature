Feature: Basic app testing
  As a developer
  I want cucumber to test my site
  So I can use it to drive development

  Scenario: Root page is alive
    When I go to the home page
    Then I should see "hello world!" within "body"
