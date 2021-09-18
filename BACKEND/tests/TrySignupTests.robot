*** Settings ***
Resource          ../resources/Base.robot
Test Template     Try Signup

*** Test Cases ***    scenario            message
Empty Name            empty_name          required name
Empty Email           empty_email         required email
Empty password        empty_pass          required password
Without Name          without_name        required name
Without Email         without_email       required email
Without password      without_pass        required password
Wrong Email           wrong_email         wrong email

*** Keywords ***
Try Signup
    [Arguments]        ${scenario}    ${error_msg}
    ${attempt}    Get Json      signup    attempt.json

    ${response}    POST User    ${attempt["${scenario}"]}
    Status Should Be    412     ${response}

    Should Be Equal    ${error_msg}    ${response.json()}[error]