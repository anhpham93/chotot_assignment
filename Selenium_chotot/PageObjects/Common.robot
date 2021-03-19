*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Open Browser to the Home Page
    ###----------------------------------------------------------------------------------------------------------###
    [Documentation]   Opens the browser and navigates to the home page
    ###----------------------------------------------------------------------------------------------------------###
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Run Keyword If    ${headless}==${true}    Call Method    ${chrome_options}    add_argument  --headless
    Call Method    ${chrome_options}    add_argument  --remote-debugging-port\=${remote_debug_port}
    ${options}=   Call Method    ${chrome_options}       to_capabilities
    open browser    url=${siteUrl}    browser=${BROWSER}    desired_capabilities=${options}
    Run Keyword If    ${headless}==${true}      Set Window Size   1366   768
    Run Keyword If    ${headless}==${false}     Maximize Browser Window
    ${width}  ${height}=    Get Window Size
    Log   Display Resolution:${width}x${height}
