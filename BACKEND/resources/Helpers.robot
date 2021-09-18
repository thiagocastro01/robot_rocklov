*** Settings ***
Documentation        Aqui teremos as KWs de ajuda
Resource    ../resources/Base.robot

*** Keywords ***
Get Json
    [Arguments]   ${route}        ${file_name}
    ${fixture}    Get File        ${CURDIR}/fixtures/${route}/${file_name}
    ${json}       Evaluate        json.loads($fixture)
    [Return]      ${json}

Get Token
    [Arguments]    ${email}    ${password}
    &{payload}    Create Dictionary    email=${email}    password=${password}

    ${response}    POST Login    ${payload}
    ${user_token}    Set Variable    ${response.json()}[user_token]

    [Return]    ${user_token} 