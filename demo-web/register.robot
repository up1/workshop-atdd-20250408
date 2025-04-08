*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
ทำการตรวจสอบหน้า register แสดงผลได้อย่างถูกต้อง
    เปิดหน้า register
    ตรวบสอบ input ต่าง ๆ ในหน้า ต้องแสดงได้อย่างถูกต้อง

*** Keywords **
ตรวบสอบ input ต่าง ๆ ในหน้า ต้องแสดงได้อย่างถูกต้อง
    Wait Until Element Contains    xpath=//*[@test_id="header_name_register"]
    ...    สมัครสมาชิก
    Wait Until Element Contains    xpath=//*[@id="root"]/div/div/form/div[1]/label
    ...    ชื่อ (ภาษาไทย)
    
    Element Should Be Visible   xpath=//*[@id="root"]/div/div/form/button
    Element Should Be Enabled    xpath=//*[@id="root"]/div/div/form/button
    Wait Until Element Contains    xpath=//*[@id="root"]/div/div/form/button
    ...    สมัครสมาชิก
        

เปิดหน้า register
    Open Browser    https://moonlit-cascaron-30db71.netlify.app  
    ...  browser=chrome
    ...  options=add_experimental_option("detach", True)
    # Set Window Size    800    600
    Maximize Browser Window
    
