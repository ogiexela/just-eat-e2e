*** Settings ***
Library           SeleniumLibrary

*** Keywords ***
Open Browser To
    [Arguments]    ${url}    ${browser type}
    Open Browser    ${url}    ${browser type}
    Maximize Browser Window
