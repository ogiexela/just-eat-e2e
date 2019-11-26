*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Suite Setup       Open Just Eat Home Page
Suite Teardown    Close Browser
Library           SeleniumLibrary
Resource          ../just-eat/home-page.robot
Resource          ../just-eat/results-page.robot
Resource          ../just-eat/menu-page.robot

*** Variables ***
${JUST EATS URL}    http://www.just-eats.co.uk
${BROWSER}        firefox

*** Test Cases ***
Senario: Search For restaurants in an area
    Given I want food in    AR51 1AA
    When I search for restaurants
    Then I should see some restaurants in    AR51 1AA

Senario: Search For Restaurant in area
    Given I am in    AR51 1AA
    When I search for    Demo - Patisserie Valerie Brasserie Menu Final
    Then I should see restaurant for    Demo - Patisserie Valerie Brasserie Menu Final

Senario: Open Restaurant Menu
    Given I am in    AR51 1AA
    And I found restaurant    Demo - Patisserie Valerie Brasserie Menu Final
    Then I should be able to see their menu

*** Keywords ***
I am in
    [Arguments]    ${location}
    Search Location Should Be Set To    ${location}

I search for
    [Arguments]    ${query}
    Refined Search For    ${query}

I should see restaurant for
    [Arguments]    ${name}
    Results Should Contain Restaurant    ${name}

I want food in
    [Arguments]    ${location}
    Search Restaurants By Postal Code    ${location}

I found restaurant
    [Arguments]    ${name}
    Refined Search For    ${name}
    Open Restaurant Page    ${name}

I search for restaurants
    Submit Restaurants Search

I should be able to see their menu
    Menu Should Be Open

I should see some restaurants in
    [Arguments]    ${location}
    Search Location Should Be Set To    ${location}
    Restaurant Count Should Be Greater Than    0
