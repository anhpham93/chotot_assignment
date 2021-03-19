*** Settings ***
Library     SeleniumLibrary

*** Variables ***

${LOGIN_SDT}                       xpath://input[@type="tel"]
${LOGIN_PASSWORD}                  xpath://input[@type="password"]
${LOGIN_LOG_IN_BUTTON}             xpath://button[@type="submit"]
${LOGIN_FORGOT_PWD}                xpath://a[@href="/forget-password"]
${ERROR_MSG}                       xpath://*[contains(@class,"error")]

*** Keywords ***
Enter SDT
    [Arguments]   ${sdt}
    Input Text    ${LOGIN_SDT}    ${sdt}

Enter Password
    [Arguments]   ${password}
    Input Text    ${LOGIN_PASSWORD}    ${password}

Click Log In Button
    Click Button    ${LOGIN_LOG_IN_BUTTON}

Login Button Should Be Disabled
    Element Should Be Disabled    ${LOGIN_LOG_IN_BUTTON}

Verify Text Place Holder of SDT Field
    [Arguments]   ${expText}
    ${actText}=    Get Element Attribute    ${LOGIN_SDT}     placeholder
    Should Be Equal    ${expText}    ${actText}

Verify Text Place Holder of Password Field
    [Arguments]   ${expText}
    ${actText}=   Get Element Attribute    ${LOGIN_PASSWORD}     placeholder
    Should Be Equal    ${expText}    ${actText}

Page Should Contain Error
    Page Should Contain Element    ${ERROR_MSG}
