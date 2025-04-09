*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
DEmo insecure
    Open Browser    https://nervgh.github.io/pages/angular-file-upload/examples/simple/    chrome
    # ...  options=add_experimental_option("detach", True);add_argument("--allow-running-insecure-content")
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@type='file2']