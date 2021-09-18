*** Settings ***
Documentation        Implementação da rota /sessions
Resource        ../Base.robot

*** Keywords ***
POST Login
    [Arguments]    ${payload}
    ${response}    POST
    ...            ${BASE_URL}/sessions
    ...            json=${payload}
    ...            expected_status=any
    [Return]    ${response}