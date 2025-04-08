*** Settings ***
Library           AppiumLibrary
Test Teardown     Close Application

*** Test Cases ***
Test Case Name
    Open Application    http://127.0.0.1:4723    
    ...    platformName=iOS    
    ...    appium:deviceName=iPhone 15 Pro    
    ...    appium:platformVersion=17.5    
    ...    appium:automationName=XCUITest    
    ...    appium:bundleId=dev.RegisterApp    
    ...    appium:connectionRetryTimeout=${60000}    
    ...    appium:noReset=${True}    
    ...    appium:includeSafariInWebviews=${True}    
    ...    appium:newCommandTimeout=${3600}    
    ...    appium:connectHardwareKeyboard=${True}


    # Input name
    ${el1} =    Set Variable     accessibility_id=nameTextField
    Click Element    ${el1}  
    Input Text    ${el1}    somkiat
    Hide Keyboard   key_name=Return

    # Click register button
    ${el2} =    Set Variable     accessibility_id=submitButton
    Click Element    ${el2}

    # Check error message
    ${error_name_message} =    Set Variable     accessibility_id=nameError
    Element Should Contain Text    ${error_name_message}  กรุณากรอกภาษาไทยเท่านั้น

