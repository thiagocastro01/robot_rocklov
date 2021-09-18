*** Settings ***
Documentation        Implementação da rota /signup
Resource        ../Base.robot

*** Keywords ***
POST User
    [Arguments]    ${payload}
    ${response}    POST
    ...            ${BASE_URL}/signup
    ...            json=${payload}
    ...            expected_status=any
    [Return]    ${response}