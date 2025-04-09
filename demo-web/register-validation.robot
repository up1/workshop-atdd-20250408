*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
ข้อมูลอายุเกิน 60 ปี
    เปิดหน้า register
    Input Text    id=age    65
    Wait Until Element Contains    xpath=//*[@test_id="age_error"]  อายุไม่เกิน 60 ปี

ช่องกรอกชื่อ (ภาษาไทย) แต่กรอกภาษาอังกฤษ
    เปิดหน้า register
    Input Text    id=name    John
    Wait Until Element Contains    xpath=//*[@test_id="name_error"]  กรุณากรอกภาษาไทยเท่านั้น

*** Keywords ***
เปิดหน้า register
    Open Browser    https://moonlit-cascaron-30db71.netlify.app  
    ...  browser=chrome
    ...  options=add_experimental_option("detach", True)
    Maximize Browser Window