*** Settings ***
Resource          ../resources/Base.robot

*** Test Cases ***
Add New user
    ${payload}    Get Json      signup    new_user.json
    Remove User By email        ${payload['email']}
    ${response}    POST User    ${payload}
    Status Should Be    200     ${response}

Duplicated Email
    ${payload}    Get Json      signup    duplicated_email.json
    
    ${response}    POST User    ${payload}
    
    ${response}    POST User    ${payload}
    Status Should Be    409     ${response}