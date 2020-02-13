*** Settings ***
Documentation  Some basic documentation
Library  SeleniumLibrary

*** Keywords ***
start test
    Open browser  about:memory  firefox

navigate to amazon
    Go To         http://www.amazon.com

check page loaded
    Wait Until Page Contains  Your Amazon.com

make search query
    Input Text  id:twotabsearchtextbox  potato

click search button
    Click Button  xpath:/html/body/div[1]/header/div/div[1]/div[3]/div/form/div[2]/div/input

wait for it
    Wait Until Page Contains  results for "potato"

shut it down
    Close Browser

*** Test Cases ***
User can access amazon.com
    [Documentation]  Some docs about the test
    [Tags]  Test 1
    start test
    navigate to amazon
    check page loaded
    make search query
    click search button
    wait for it
    shut it down

