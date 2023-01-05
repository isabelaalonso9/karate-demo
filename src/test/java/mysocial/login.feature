# #this is from local of professor, i'm just code to have a material 
# Feature: Authentication

# Background: Initialize stuff
#     Given url 'http://localhost:3000'

# Scenario: test register api
#     * print 'hello'
# @login

# Scenario: Verify protected endpoint /posts
#     Given path 'login'
#     And header Content-type = 'application/json; charset=UTF-8'
#     And request {email: '#(email)', password: '#(password)' }
#     When method get
#     Then status 200
#     And print response

Feature: Verify posts api for mysocial

Background: Initialize stuff
    Given url 'https://jsonplaceholder.typicode.com'

#outline = template
Scenario Outline: Verify /posts/<postId> works
    Given path 'posts'
    And path <postId>
    When method get
    Then status 200
    And match response contains
    """
        {
            "userId": '#number',
            "id": <postId>,
            "body": '#string'
        }
    """

Examples:
    |  postId  | 
    |     1    |
    |     2    |
    |     3    |
