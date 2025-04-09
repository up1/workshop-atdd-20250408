*** Settings ***
Library    SeleniumLibrary
Suite Setup    เปิดหน้า register
Test Teardown    ไปยังหน้า register
Suite Teardown    Close All Browsers
Test Template     Flow to validate register form

*** Test Cases ***
#-------------------------------------------------------------------------------------
#  Test case                       |     Field Name   | Input Value  | Expected Result
#-------------------------------------------------------------------------------------
ข้อมูลอายุเกิน 60 ปี                            age    65         อายุไม่เกิน 60 ปี
ช่องกรอกชื่อ (ภาษาไทย) แต่กรอกภาษาอังกฤษ        name   John  กรุณากรอกภาษาไทยเท่านั้น

*** Keywords ***
Flow to validate register form
    [Arguments]    ${field}    ${input}   ${expected result}
    Input Text    id=${field}    ${input}
    Wait Until Element Contains    xpath=//*[@test_id="${field}_error"]  ${expected result}


ไปยังหน้า register
    Go To    https://moonlit-cascaron-30db71.netlify.app  

เปิดหน้า register
    Open Browser    https://moonlit-cascaron-30db71.netlify.app  
    ...  browser=chrome
    ...  options=add_experimental_option("detach", True)
    Maximize Browser Window