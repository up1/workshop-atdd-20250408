*** Settings ***
Documentation     Test suite for validating the registration form.
Library           SeleniumLibrary

*** Variables ***
${URL}            https://moonlit-cascaron-30db71.netlify.app/
${BROWSER}        Chrome

*** Test Cases ***
Validate Age Field with Age Over 60
    [Documentation]    Verify that entering an age over 60 prompts the correct validation message.
    Open Browser To Registration Page
    Input Text    id=age    61
    # Click Button    id=submit
    Element Should Contain    id=age-error    อายุไม่ควรเกิน 60 ปี
    [Teardown]    Close Browser

Validate Name Field with Non-Thai Characters
    [Documentation]    Verify that entering non-Thai characters in the name field prompts the correct validation message.
    Open Browser To Registration Page
    Input Text    id=name    John123
    # Click Button    id=submit
    Element Should Contain    id=name-error    โปรดป้อนชื่อเป็นภาษาไทยเท่านั้น
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Registration Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # Wait Until Page Contains Element    id=registration-form    10s
