*** Settings ***
Library           SeleniumLibrary
Resource          ../browser/browser.robot

*** Variables ***
${JUST_EAT_URL}    http://www.just-eats.co.uk
${BROWSER_TYPE}    chrome
${POSTAL_CODE_INPUT_SELECTOR}    css:[data-test-id="address-box-input"]
${SEARCH_LOCATION_BUTTON_SELECTOR}    css:[data-test-id="find-restaurants-button"]

*** Keywords ***
Open Just Eat Home Page
    Open Browser To    ${JUST_EAT_URL}    ${BROWSER_TYPE}

Search Restaurants By Postal Code
    [Arguments]    ${postal code}
    Input Text    ${POSTAL_CODE_INPUT_SELECTOR}    ${postal code}

Submit Restaurants Search
    Click Button    ${SEARCH_LOCATION_BUTTON_SELECTOR}
