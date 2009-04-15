Family members should be able to add rss, twitter, facebook and calendar feeds for their profile to consume.

Feature: Consume
  In order to keep in touch
  As a family member
  I want to unify my online presense

  Scenario: Add a facebook account
    Given I am on the consume page
    When I select "twiiter" as the account type
    Then I should see a form to enter my twitter user name and password

  Scenario: Add a RSS feed
    Given I am on the consume page
    When I select "rss" as the account type
    Then I should see a form to enter a url
