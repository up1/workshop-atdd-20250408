*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PRODUCT_URL}    https://www.lazada.co.th/products/kirei-kirei-original-200-ml-12-i2997678-s3581788.html


*** Test Cases ***
ทำการเพิ่มสินค้าเข้าตะกร้า
    ดูรายละเอียดสินค้า Kirei Kirei Foaming Hand Soap Original Refill 200 ml
    เพิ่มสินค้าลงตะกร้า


*** Keywords ***
ดูรายละเอียดสินค้า Kirei Kirei Foaming Hand Soap Original Refill 200 ml
    Open Browser    ${PRODUCT_URL}    browser=chrome
    ...  options=add_experimental_option("detach", True)
    Maximize Browser Window


เพิ่มสินค้าลงตะกร้า
    # Wait Until Element Is Visible    xpath=//*[@id="webim-container"]/div/div
    # Execute JavaScript	   document.getElementById("webim-container").style.display = "none";

    Wait Until Element Is Visible    id=container
    Wait Until Element Is Visible    id=module_add_to_cart
    Click Element    id=module_add_to_cart
    Wait Until Page Contains      เพิ่มสินค้าลงรถเข็นสำเร็จ
