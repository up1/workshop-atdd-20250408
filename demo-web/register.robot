*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
ทำการตรวจสอบหน้า register แสดงผลได้อย่างถูกต้อง
    เปิดหน้า register
    ตรวบสอบ input ต่าง ๆ ในหน้า ต้องแสดงได้อย่างถูกต้อง

*** Keywords **
เปิดหน้า register
    Open Browser    https://moonlit-cascaron-30db71.netlify.app  
    ...  browser=chrome
    ...  options=add_experimental_option("detach", True)
    # Set Window Size    800    600
    Maximize Browser Window
    
