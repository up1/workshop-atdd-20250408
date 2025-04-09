*** Settings ***
Library   SeleniumLibrary

*** Test Cases ***
ทำการ upload 3 files success
    ไปยังหน้า upload files
    ทำการเลือก 3 files เพื่อทำการ upload
    Upload 1st file
    Upload 2nd file
    Upload 3rd file


*** Keywords ***
Upload 3rd file
    Click Element   xpath=//tr[3]/td[5]/button[1]
    Wait Until Element Is Visible    xpath=//*[@style="width: 100%;"]

Upload 2nd file
    Click Element   xpath=//tr[2]/td[5]/button[1]
    Wait Until Element Is Visible    xpath=//*[@style="width: 67%;"]

Upload 1st file
    Click Element   xpath=//tr[1]/td[5]/button[1]
    Wait Until Element Is Visible    xpath=//*[@style="width: 33%;"]

ทำการเลือก 3 files เพื่อทำการ upload    
    Choose File    xpath=//div[1]/input[2]    ${CURDIR}/files/1.txt
    Choose File    xpath=//div[1]/input[2]    ${CURDIR}/files/2.txt
    Choose File    xpath=//div[1]/input[2]    ${CURDIR}/files/3.txt


ไปยังหน้า upload files
    Open Browser    https://nervgh.github.io/pages/angular-file-upload/examples/simple/    
    ...    chrome
    ...    options=add_experimental_option("detach", True);add_argument("--allow-running-insecure-content")
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]
    Wait Until Element Is Visible    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/p
    Wait Until Element Contains    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/p
    ...    Queue length: 0