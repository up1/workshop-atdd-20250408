*** Settings ***
Library    SeleniumLibrary
Suite Setup    เปิดหน้า register
Test Teardown    ไปยังหน้า register
Suite Teardown    Close All Browsers

*** Test Cases ***
ข้อมูลอายุเกิน 60 ปี  
    Input Text    id=age    65
    Wait Until Element Contains    xpath=//*[@test_id="age_error"]  อายุไม่เกิน 60 ปี

ช่องกรอกชื่อ (ภาษาไทย) แต่กรอกภาษาอังกฤษ
    Input Text    id=name    John
    Wait Until Element Contains    xpath=//*[@test_id="name_error"]  กรุณากรอกภาษาไทยเท่านั้น

*** Keywords ***
ไปยังหน้า register
    Go To    https://moonlit-cascaron-30db71.netlify.app  

เปิดหน้า register
    Open Browser    https://moonlit-cascaron-30db71.netlify.app  
    ...  browser=chrome
    ...  options=add_experimental_option("detach", True)
    Maximize Browser Window