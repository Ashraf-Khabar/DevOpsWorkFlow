*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/home_page.robot
Resource    ../test_data/test_data.robot
Resource    ../locators/after_search_page.robot

*** Variables ***
${item_to_look_For}    Google Pixel - Black


*** Test Cases ***
Open The Store
    Open Browser    ${host}    ${browser}
    Maximize Browser Window
    Sleep    ${delay}

Search For Element In The Store 
    [Documentation]    Search For Element In The Store
    Input Text    ${search_bar}    ${item_to_look_For}    
    Sleep    ${long_delay}

    ${result}=    Run Keyword And Return Status    Element Should Contain   ${name_of_item}    ${item_to_look_For}   
    Log To Console    ${result}
    IF    ${result} == ${True}    
        Pass Execution    message : element founded.
    ELSE
        Log To Console    error : element not found.
        Fail
    END
    Sleep    ${delay}
    Close All Browsers