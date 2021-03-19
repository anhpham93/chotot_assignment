*** Settings ***
Library     SeleniumLibrary

*** Variables ***

${LOGIN_BUTTON}                    xpath://a[contains(@href,"https://accounts.chotot.com?continue")]

*** Keywords ***
Navigate To Login Page
    Click Element    ${LOGIN_BUTTON}
