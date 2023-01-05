# #this is from local of professor, i'm just code to have a material 

# Feature: Verify reusability

# Background: Initialize stuff
#     Given url 'http://localhost:3000'
#     * signinToken = call read('login.feature') {email: "abc789.xyz@gmail.com", password: "Abc1"}
#     #* def authtoken = 'eyJHGFGFGD4465464545.Adsdasdada1eee'
#     * def authtoken = signinToken.token

# Scenario: Verify protected endpoint /posts
#     Given path 'posts'
#     And header Content-type = 'application/json; charset=UTF-8'
#     And header x-access-token = authtoken
#     When method get
#     Then status 200
#     And print response

# Scenario: Verify protected endpoint /albums
#     Given path 'albums '
#     And header Content-type = 'application/json; charset=UTF-8'
#     And header x-access-token = authtoken
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
