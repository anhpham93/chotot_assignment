*** Settings ***
Resource      ${EXECDIR}/Resources/Initialize.robot
Library       SeleniumLibrary
Suite Setup   Setup All

*** Keywords ***
Setup All
  Set Selenium Timeout    20 seconds
  Setup Browser Drivers
