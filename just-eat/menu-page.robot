*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${MENU_SELECTOR}    menu

*** Keywords ***
Menu Should Be Open
    Page Should Contain Element    ${MENU_SELECTOR}
