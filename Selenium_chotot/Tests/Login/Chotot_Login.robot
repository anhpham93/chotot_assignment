*** Settings ***
Library     SeleniumLibrary

Resource    ${EXECDIR}/Selenium_chotot/PageObjects/Common.robot
Resource    ${EXECDIR}/Selenium_chotot/PageObjects/Home_Page.robot
Resource    ${EXECDIR}/Selenium_chotot/PageObjects/Login_Page.robot

Resource    ${EXECDIR}/Resources/TestData/Login.robot

Suite Setup     Open Brower and Navigating to Home Page
Test Setup      Go To Login Page
Test Teardown   Back To Home Page
Suite Teardown  Close All Browsers

Force Tags      login

*** Test Cases ***
Verify Text Field Label
    Verify Text Place Holder of SDT Field    Nhập SĐT của bạn
    Verify Text Place Holder of Password Field        Nhập mật khẩu của bạn

Verify Text Field Label
    Verify Text Place Holder of SDT Field         Nhập SĐT của bạn
    Verify Text Place Holder of Password Field    Nhập mật khẩu của bạn

Verify Login With Invalid Password
    [Template]    Login With Invalid Password
    ${PWD_NOT_ENOUGH}       ${ERR_PWD_NOT_ENOUGH}
    ${PWD_INVALID}          ${ERR_PWD_INVALID}

Verify Login With Empty User/Password
    [Template]    Login With Empty SDT or Password
    ${SDT_VALID}       ${EMPTY}
    ${EMPTY}           ${PWD_VALID}
    ${EMPTY}           ${EMPTY}

Login With Valid Credentials
    Enter SDT    ${SDT_VALID}
    Enter Password    ${PWD_VALID}
    Click Log In Button
    Wait Until Page Contains    ${USER_NAME}
    Page Should Contain    ${USER_NAME}

*** Keywords ***
Go To Login Page
    Navigate To Login Page
    Wait Until Page Contains    Chào bạn quay lại

Back To Home Page
    Go To    ${siteUrl}

Open Brower and Navigating to Home Page
    Open Browser to the Home Page
    Go To    ${siteUrl}

Login With Invalid Password
    [Arguments]   ${password}    ${errMsg}
    Enter SDT    ${SDT_VALID}
    Enter Password    ${password}
    Click Log In Button
    Error Msg Should Be Show    ${errMsg}

Login With Invalid SDT
    [Arguments]   ${sdt}    ${errMsg}
    Enter SDT    ${sdt}
    Error Msg Should Be Show    ${errMsg}

Login With Empty SDT or Password
    [Arguments]   ${sdt}   ${password}
    # Go To Login Page
    Enter SDT    ${sdt}
    Enter Password    ${password}
    Login Button Should Be Disabled
    # Back To Home Page

Error Msg Should Be Show
    [Arguments]     ${errMsg}
    Wait Until Page Contains Element    ${ERROR_MSG}
    Page Should Contain     ${errMsg}
