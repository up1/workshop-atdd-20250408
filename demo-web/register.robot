*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
ทำการตรวจสอบหน้า register แสดงผลได้อย่างถูกต้อง
    [Tags]    register   done   somkiat
    เปิดหน้า register
    ตรวบสอบ input ต่าง ๆ ในหน้า ต้องแสดงได้อย่างถูกต้อง

Register success
    [Tags]    register   testing
    เปิดหน้า register
    กรอกชื่อ สมเกียรติ อายุ 40 ปี
    กรอกเบอร์โทรศัพท์ 0999999999 และ email somkiat@xxx.com
    กรอก password ที่มีความยาวมากกว่า 7 ตัวอักษร
    กรอกที่อยู่ 123/4 หมู่ 5 ตำบลท่าช้าง อำเภอเมือง จังหวัดสระบุรี

*** Keywords **
กรอกชื่อ ${name} อายุ ${age} ปี
    Input Text   id=name   ${name}
    Input Text   id=age   ${age}
    

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
    ...  browser=${BROWSER}
    ...  options=add_experimental_option("detach", True)
    # Set Window Size    800    600
    Maximize Browser Window
    
*** Variables ***
${BROWSER}   chrome
