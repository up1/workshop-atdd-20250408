*** Settings ***
Library           AppiumLibrary
Test Teardown     Close Application

*** Test Cases ***
Test Case Name
    Open Application    http://127.0.0.1:4723    
    ...    platformName=Android    
    ...    appium:automationName=UiAutomator2    
    ...    appium:appPackage=com.demo.registerapp    
    ...    appium:deviceName=R58M36QKSJK    
    ...    appium:ensureWebviewsHavePages=${True}    
    ...    appium:nativeWebScreenshot=${True}    
    ...    appium:newCommandTimeout=${3600}    
    ...    appium:connectHardwareKeyboard=${True}

    # Input name
    ${el1} =    Set Variable     android=new UiSelector().resourceId("nameField")
    Click Element    ${el1}
    Input Text    ${el1}    somkiat
    Hide Keyboard

    # Click register button
    ${el2} =    Set Variable     class=android.widget.Button
    Click Element    ${el2}

    # Check error message
    ${error_name_message} =    Set Variable     android=new UiSelector().resourceId("nameMessage")
    Click Element    ${error_name_message}
    Element Should Contain Text    ${error_name_message}  กรุณากรอกภาษาไทยเท่านั้น