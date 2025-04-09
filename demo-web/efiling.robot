*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Flow login
    เข้ามายังหน้ายื่นแบบและชำระภาษีทุกประเภทแบบ
    ทำการตรวจสอบการประกาศแจ้งข่าวสาร
    ดูรายละเอียดช่วงเวลาการให้บริการชำระภาษี
    E-Payment เปิดให้บริการ 06.00 - 22.00 น.
    ทำการปิดการแจ้งข่าวสาร
    ทำการยื่นแบบ online

*** Keywords ***
ทำการยื่นแบบ online
    Click Element    xpath=//*[@id="top"]/div/div[2]/button[1]
    
    Switch Window   NEW
    Wait Until Element is Visible   id=username
    Wait Until Element is Visible   id=passwordField
    Click Element    xpath=/html/body/ef-root/ef-login/div[2]/div[2]/div/div/div[3]/div[2]/form/button

ทำการปิดการแจ้งข่าวสาร
    Switch Window  Main
    Click Element    xpath=//*[@id="announceModal"]/div/div/div[1]/button

E-Payment เปิดให้บริการ 06.00 - 22.00 น.
    Switch Window   NEW
    Wait Until Element is Visible    xpath=/html/body/section/section/div/div/div[2]/div[6]/div[1]/div
    Wait Until Element Contains    xpath=/html/body/section/section/div/div/div[2]/div[6]/div[1]/div/h5
    ...    E-Payment
    
    Wait Until Element Contains    xpath=/html/body/section/section/div/div/div[2]/div[6]/div[1]/div/div
    ...    เปิดให้บริการ 06.00 - 22.00 น.

ดูรายละเอียดช่วงเวลาการให้บริการชำระภาษี
    Wait Until Element is Visible    xpath=//*[@id="announceModal"]/div/div/div[2]/div/div[3]/span/a[1]
    Click Element    xpath=//*[@id="announceModal"]/div/div/div[2]/div/div[3]/span/a[1]

ทำการตรวจสอบการประกาศแจ้งข่าวสาร
    Wait Until Element is Visible    id=announceModal   

เข้ามายังหน้ายื่นแบบและชำระภาษีทุกประเภทแบบ
    Open Browser    https://efiling.rd.go.th/rd-cms/
    ...  browser=chrome
    ...  options=add_experimental_option("detach", True)
    Maximize Browser Window