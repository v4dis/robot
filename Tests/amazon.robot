*** Settings ***
Documentation  Global documentation
Library  SeleniumLibrary
Test Setup    Begin Web Test
Test Teardown    End Web Test

*** Variables ***
${BROWSER} =    firefox
${URL} =    http://amazon.com
${SEARCH_TERM} =    ferrari 458

*** Keywords ***
Begin Web Test
    Open Browser    about:about    ${BROWSER}

Go To Web Page
    Load Page
    Verify Page Loaded

Load Page
    Go To    ${URL}

Verify Page Loaded
    Wait Until Page Contains    Your Amazon.com

Search For Product
    Enter Search Term
    Submit Search
    Verify Search Completed

Enter Search Term
    Input Text    id:twotabsearchtextbox    ${SEARCH_TERM}

Submit Search
    Click Button    xpath:/html/body/div[1]/header/div/div[1]/div[3]/div/form/div[2]/div/input

Verify Search Completed
    Wait Until Page Contains    results for "Ferrari 458"

End Web Test
    Close Browser

*** Test Cases ***
User can access amazon.com
    [Documentation]  Local documentation about the test
    [Tags]  Test 1
    Go To Web Page


User can conduct a search
    [Documentation]  Local documentation about the test
    [Tags]  Test 2
    Go To Web Page
    Search For Product


