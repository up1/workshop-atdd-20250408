*** Settings ***
Library   Browser

*** Test Cases ***
Example Test
    New Browser    browser=chromium    headless=false   args=["--start-maximized"]
    New Context     viewport=${NONE}
    New Page    http://157.245.145.87:8000
    Get Text    h2    contains    ฟอร์มสมัครสมาชิก