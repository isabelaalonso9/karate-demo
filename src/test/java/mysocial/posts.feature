Feature: Verify posts api for mysocial

Background: Initialize stuff
    Given url 'https://jsonplaceholder.typicode.com'

Scenario: Verify /posts works
    Given path 'posts'
    And param userId = 1
    And header x-transaction-id = 'abc-1234'
    When method get
    Then status 200
    And assert response.length == 10
    And match response[0] == {"userId": '#number', "id": '#number', "title": '#string', "body": '#string' }
    And match response[*] contains {"userId": 1, "id": 1, "title": '#string', "body": '#string' }

Scenario: Verify /posts/{uid} works
        Given def postId = 1
        And path 'posts'
        And path postId
        When method get
        Then status 200
        And match response ==
        """
            {
                "userId": '#number',
                "id": '#(postId)',
                "title": "#string",
                "body": '#string'
            }
        """

Scenario: Verify that a new post can be created
    Given path 'posts'
    And header Content-type = 'application/json; charset=UTF-8'
    And request 
    """
        {
            title: 'foo',
            body: 'bar',
            userId: 1,
        }
    """
    When method post
    Then status 201
    And match response == { id: 101, title: 'foo', body: 'bar', userId: 1 }


Scenario: Verify update on /posts/{uid} works
    Given def postId = 1
    And path 'posts'
    And path postId
    And request
    """
    {
        title: "foo1",
        body: 'bar1',
        userId: 11,
    }
    """    
    When method put
    Then status 200
    And match response == { id: '#(postId)', title: 'foo1', body: 'bar1', userId: 11 }

Scenario: Verify delete on /posts/{uid} works
    Given def postId = 1
    And path 'posts'
    And path postId
    When method delete
    Then status 200


# Scenario: Verify /posts works with query parameter
#     Given path 'posts'
#     And param userId = 1
#     And header x-transaction-id = 'abc-1234'
#     When method get
#     Then status 200
#     And assert response.length == 10


# Scenario: Verify /posts/{uid} works
#     Given path 'posts/1'
#     And param userId = 1
#     When method get
#     Then status 200
#     And assert response.length == 10

