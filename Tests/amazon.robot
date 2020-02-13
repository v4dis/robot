*** Settings ***
Documentation  Some basic documentation
Library  SeleniumLibrary

*** Test Cases ***
User can access amazon.com
    [Documentation] Some docs
    [Tags]        Test 1
    Open browser  about:chrome  chromium
    Go To         http://www.amazon.com
    Wait Until Page Contains  Your Amazon.com
    Close Browser

