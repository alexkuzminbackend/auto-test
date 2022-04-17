Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

Background:
  * def setup = callonce read('classpath:common.feature')
  * configure headers = { Authorization: '#("Basic " + setup.token)' }
  * configure ssl = true
  * url Janus

Scenario: get all cases
  Given path 'case'
  When method get
  Then status 200

Scenario: create case and get by id
  Given path 'case'
  And request read('create-case.json')
  When method post
  Then status 200

  * def id = response.id

  # get by id
  Given path 'case', id
  When method get
  Then status 200
  And match response contains { id: '#(id)' }

  # reassign
  Given path 'case', id, 'reassign'
  And request {"assignee": "3245df06-c688-456b-9921-08a8ffbff640","reason": "reassign-planned-absenc-3245df06-c688-456b-9921-08a8ffbff640"}
  When method post
  Then status 200
  And match response contains { id: '#(id)', "assignee": "3245df06-c688-456b-9921-08a8ffbff640" }

  # set summary
  Given path 'case', id, 'summary'
  And request { "summary": "summary ENG-893" }
  When method post
  Then status 200
  And match response contains { id: '#(id)', "assignee": "3245df06-c688-456b-9921-08a8ffbff640" }

  # get by id + verify assignee && summary
  Given path 'case', id
  When method get
  Then status 200
  And match response contains { id: '#(id)', "assignee": "3245df06-c688-456b-9921-08a8ffbff640", "summary": "summary ENG-893"  }