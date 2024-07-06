*** Settings ***
Library    SeleniumLibrary
Resource    ../locators/home_page.robot
Resource    ../test_data/test_data.robot
Resource    ../locators/after_search_page.robot
Resource    ../locators/after_click_on_item_page.robot


*** Test Cases ***
Open The Store
    Open Browser    ${host}    ${browser}
    Maximize Browser Window
    Sleep    ${delay}

Add Element To The Cart
    ${elemnt_card}=    Catenate    SEPARATOR=    ${elemnt_card}    [2]
    Sleep    ${delay}
    Click Element    ${elemnt_card}
    Sleep    ${delay}
    ${name_of_product}=    Get Text    ${product_name}
    Sleep    ${delay}
    Click Element    ${add_to_card}
    Sleep    ${delay}
    Click Element    ${continue_shopping}
    Sleep    ${delay}

    # verification if the item is added
    Click Element    ${my_cart}
    Sleep    ${delay}
    Page Should Contain    ${name_of_product}
    Sleep    ${delay}

    Close All Browsers