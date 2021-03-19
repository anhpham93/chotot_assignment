*** Settings ***
Documentation       Creates the session for settup brower drivers

Library     Collections
Library     OperatingSystem

*** Variables ***
${bin_path}    ${EXECDIR}/Resources/bin

*** Keywords ***
Setup Browser Drivers
  ${system}=    Evaluate    platform.system()    platform
  Log To Console    \nI am running on ${system}
  Append To Environment Variable    PATH     ${bin_path}/${system}/
  Set Environment Variable  webdriver.chrome.driver  ${bin_path}/${system}/chromedriver
