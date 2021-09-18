*** Settings ***
Resource        ../resources/Base.robot

*** Test Cases ***
Login Sucessfuly
    &{payload}    Get Json    sessions    user_login.json

    ${response}    POST Login    ${payload}
    
    Status Should Be    200    ${response}

    ${token}    Set Variable    ${response.json()}[user_token]
    Length Should Be    ${token}    24
