*** Settings ***
Library     SeleniumLibrary
Resource    variables.robot

*** Keywords ***
Verify Dathbord TC_NC_01_and_TC_NC_02
    ${full_text}=    Get Text     xpath=//span[contains(text(), "รหัสสมาชิก")]    
    ${member_id}=    Evaluate    "${full_text}".split(":")[1].strip()
    Click Button    xpath=//button[.//span[normalize-space(text())="เติมนกแคช"]]
    Wait Until Element Contains    xpath=//p[@data-testid="page-title"]    เติมนกแคช    5s
    Wait Until Element Contains    xpath=//span[@data-testid="nok-cash-card-user-id"]    ${member_id}    5s

Verify Input payment valid TC_NC_05
    Input Text    data-testid="nok-cash-amount-input"    ${input}
    ${raw_text}=     Get Text    xpath=//span[@data-testid="total-amount"]
    ${amount_int}=   Evaluate    int(float("${raw_text}"))
    Should Be Equal As Integers    ${amount_int}    305

Verify Button payment TC_NC_12
    Wait Until Element Is Visible    xpath=//button[@data-testid="nok-cash-top-up-button"]    10s
    Click Button    xpath=//button[@data-testid="nok-cash-top-up-button"]
    Wait Until Page Contains    ชำระเงิน    10s

Verify payment page TC_NC_15
    Wait Until Page Contains    ชำระเงิน    10s
    ${raw_text}=    Get Text    xpath=//div[contains(@class, "slip-payment-container_payment_detail_summary_container__lU4Ss")]//span[contains(@class, "slip-payment-container_payment_detail_summary_amount__n7LLM")]
    ${amount_int}=    Evaluate    int("${raw_text}")
    Should Be Equal As Integers    ${amount_int}    305

Verify button add slip payment page TC_NC_18_and_TC_NC_26
    Choose File    id=slip-payment    /full/path/to/slip.jpg
    Wait Until Element Is Visible    xpath=//button[@data-testid="payment-submit-button"]    10s
    Click Button     xpath=//button[@data-testid="payment-submit-button"]
    Wait Until Page Contains    แนบสลิปสำเร็จ    10s



    


    
    
    

    
