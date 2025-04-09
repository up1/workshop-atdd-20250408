*** Settings ***
Library    Browser

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
    Click    xpath=//*[@id="top"]/div/div[2]/button[1]
    
    Switch Page    NEW
    Wait For Elements State    id=username
    Wait For Elements State    id=passwordField
    Click    xpath=/html/body/ef-root/ef-login/div[2]/div[2]/div/div/div[3]/div[2]/form/button

ทำการปิดการแจ้งข่าวสาร
    Click    xpath=//*[@id="announceModal"]/div/div/div[1]/button

E-Payment เปิดให้บริการ 06.00 - 22.00 น.
    Switch Page    NEW
    Wait For Elements State    xpath=/html/body/section/section/div/div/div[2]/div[6]/div[1]/div
    Get Text    xpath=/html/body/section/section/div/div/div[2]/div[6]/div[1]/div/h5    ==    E-Payment
    
    Get Text    xpath=/html/body/section/section/div/div/div[2]/div[6]/div[1]/div/div    *=    เปิดให้บริการ 06.00 - 22.00 น.
    Close Page

ดูรายละเอียดช่วงเวลาการให้บริการชำระภาษี
    Wait For Elements State    xpath=//*[@id="announceModal"]/div/div/div[2]/div/div[3]/span/a[1]
    Click    xpath=//*[@id="announceModal"]/div/div/div[2]/div/div[3]/span/a[1]

ทำการตรวจสอบการประกาศแจ้งข่าวสาร
    Wait For Elements State    id=announceModal   

เข้ามายังหน้ายื่นแบบและชำระภาษีทุกประเภทแบบ
    New Browser    chromium    headless=False
    New Page    https://efiling.rd.go.th/rd-cms/