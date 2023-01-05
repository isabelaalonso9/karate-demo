Feature: Verify posts api for mysocial

Background: Initialize stuff

Scenario: Verify /posts works
    # how to run the tests on different environments?
    Given url postService
    When method get
    Then status 200
    #And match response == '#array'
    And match each response == {"userId": '#number', "id": '#number', "title": '#string', "body": '#string' }

