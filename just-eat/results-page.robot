*** Settings ***
Library           SeleniumLibrary
Resource          ../browser/browser.robot

*** Variables ***
${RESTAURANT_SELECTOR}    css:[data-test-id="restaurant"]
${UNIFIED_SEARCH_INPUT_SELECTOR}    css:[data-test-id="dishsearch-unified-input-box"]
${SEARCH_REFINED_BUTTON_SELECTOR}    css:[data-test-id="dishsearch-submit-button"]
${RESTAURANT_NAME_SELECTOR}    css:[data-test-id="restaurant_name"]
${LOCATION_SELECTOR}    class:c-dishSearch-locationHeader-title

*** Keywords ***
Restaurant Count Should Be
    [Arguments]    ${expected count}
    ${count}=    Get Element Count    css:[data-test-id="restaurant"]
    Should Be Equal As Integers    ${count}    ${expected count}

Restaurant Count Should Be Greater Than
    [Arguments]    ${expected count}
    ${count}=    Get Element Count    css:[data-test-id="restaurant"]
    Should Be True    ${count}>${expected count}

Refined Search For
    [Arguments]    ${query}
    Input Text    ${UNIFIED_SEARCH_INPUT_SELECTOR}    ${query}
    Click Button    ${SEARCH_REFINED_BUTTON_SELECTOR}

Results Should Contain Restaurant
    [Arguments]    ${restaurant name}
    ${names}=    Get WebElements    ${RESTAURANT_NAME_SELECTOR}
    ${result}=    Wait Until Keyword Succeeds    3x    200ms    Get Restaurant By Name    ${restaurant name}
    ${found_name}=    Get Text    ${result}
    Should Be Equal    ${restaurant name}    ${found_name}

Open Restaurant Page
    [Arguments]    ${name}
    Refined Search For    ${name}
    ${restaurant}=    Get Restaurant By Name    ${name}
    Click Element    ${restaurant}

Get Restaurant By Name
    [Arguments]    ${name}
    ${names}=    Get WebElements    ${RESTAURANT_NAME_SELECTOR}
    FOR    ${element}    IN    @{names}
        ${text}=    Get Text    ${element}
        ${found}=    Set Variable If    '${text}'=='${name}'    ${element}
        Exit For Loop If    ${found}
    END
    [Return]    ${found}

Search Location Should Be Set To
    [Arguments]    ${expected location}
    ${element}=    Get WebElement    ${LOCATION_SELECTOR}
    ${actual location}=    Get Text    ${element}
    Should Contain    ${actual location}    ${expected location}
