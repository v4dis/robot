*** Settings ***
Documentation  Global documentation
Library  SeleniumLibrary

*** Test Cases ***
User can access amazon.com
    [Documentation]  Local documentation about the test
    [Tags]  Test 1
    Open Browser    about:about    firefox
    Go To    http://amazon.com
    Wait Until Page Contains    Your Amazon.com
    Close Browser
