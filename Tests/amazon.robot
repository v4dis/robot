*** Settings ***
Documentation  Some basic documentation
Library  SeleniumLibrary

*** Test Cases ***
User can access amazon.com
    [Documentation]  Some docs about the test
    [Tags]  Test 1
    Open browser  about:memory  firefox
    Go To         http://www.amazon.com
    Wait Until Page Contains  Your Amazon.com
    Close Browser
