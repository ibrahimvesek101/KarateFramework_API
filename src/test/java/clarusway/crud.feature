Feature: Fake Api CRUD

  Scenario: Fake Api GET
    Given url "http://localhost:3000/nephew"
    And method GET
    And print response[0].first_name
    And assert response[0].first_name == "Semra Betul"


  Scenario: Fake API GET with params
    * url "http://localhost:3000/"
    * path "nephew"
    * method GET
    * assert response[0].id == 1


  Scenario Outline: with scenario Outline number= <id>
    Given url "http://localhost:3000/nephew"
    And path number
    When method GET
    And print response
    Then status 200

    Examples:
      | number |
      | 1      |
      | 3      |
      | 4      |

  Scenario Outline: with scenario Outline cvc id_<no>
    Given url "http://localhost:3000/nephew"
    And path no
    When method GET
    And print response
    Then status 200

    Examples:
      | read ('../data/data.csv') |

  Scenario: POST new nephew
    Given url "http://localhost:3000/nephew"
    * def myBody =
      """
      {
  "first_name": "Joseph",
  "last_name": "K",
  "gender": "Male",
  "hobby": "Traveling with a robot vacuum cleaner"
}
      """

    And request myBody
    Then method post
    And print response[4].first_name

