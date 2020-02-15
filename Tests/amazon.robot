*** Settings ***
Documentation  Some basic documentation
Library  SeleniumLibrary
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***
${BROWSER} =  chrome
${URL} =  http://amazon.com
# ${SEARCH_TERM} =  art work

*** Keywords ***
Begin Web Test
    Open browser  about:about  ${BROWSER}

Go To Web Page
    Go To         ${URL}

check page loaded
    ${link_text} =  Get text  id:nav-your-amazon
    Should Be Equal  ${link_text}  Your Amazon.com
    #Wait Until Page Contains  Your Amazon.com

make search query
    [Arguments]  ${search_term}  ${search_result}
    Enter Search Term  ${search_term}
    click search button
    Verify Search Completed  ${search_result}

enter search term
    [Arguments]  ${search_term}
    Input Text  id:twotabsearchtextbox  ${search_term}

click search button
    Click Button  xpath:/html/body/div[1]/header/div/div[1]/div[3]/div/form/div[2]/div/input

verify search completed
    [Arguments]  ${search_result}
    Wait Until Page Contains  ${search_result}

End Web Test
    Close Browser

*** Test Cases ***
User can access amazon.com
    [Documentation]  Some docs about the test
    [Tags]  Test 1
    Go To Web Page
    check page loaded

User can conduct search
    [Documentation]  Check that user can search
    [Tags]  Test2
    Go To Web Page
    check page loaded
    make search query   ceramic horse      results for "ceramic horse"

User can conduct another search
    [Documentation]  Another search
    [Tags]  Test3
    Go To Web Page
    check page loaded
    make search query   merry mantle      results for "merry mantle"
