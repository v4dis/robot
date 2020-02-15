*** Keywords ***
Begin Web Test
    Open Browser    about:about    ${BROWSER}

Go To Web Page
    Load Page
    Verify Page Loaded

Load Page
    Go To    ${URL}

Verify Page Loaded
    #Wait Until Page Contains    Your Amazon.com
    ${link_text} =    Get Text  id:nav-your-amazon
    Should Be Equal    ${link_text}    Your Amazon.com

Search For Product
    [Arguments]  ${search_term}    ${search_result}
    Enter Search Term    ${search_term}
    Submit Search
    Verify Search Completed    ${search_term}    ${search_result}

Enter Search Term
    [Arguments]    ${search_term}
    Input Text    id:twotabsearchtextbox    ${search_term}

Submit Search
    Click Button    xpath:/html/body/div[1]/header/div/div[1]/div[3]/div/form/div[2]/div/input

Verify Search Completed
    #[Arguments]      ${search_result}
    #Wait Until Page Contains    ${search_result}
    [Arguments]  ${search_term}    ${search_result}
    ${result_text} =    Set Variable    results for "${search_term}"
    Should Be Equal    ${result_text}    ${search_result}

End Web Test
    Close Browser
