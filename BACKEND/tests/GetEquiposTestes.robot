*** Settings ***
Documentation    Get Equipo Tests

Resource    ../resources/Base.robot

*** Test Cases ***
Get Unique
    ${token}          Get Token      tfelipe@gmail.com    pwd123
    ${equipo}         Get Json       equipos              piano.json

    Remove Equipo    ${equipo}[payload][name] 
    ${result}    POST Equipo      ${equipo}    ${token}   
    ${equipo_id}    Set Variable    ${result.json()}[_id]

    ${response}    GET Unique Equipo    ${token}    ${equipo_id}

    Status Should Be    200    ${response}

    Should Be Equal    ${equipo}[payload][name]         ${response.json()}[name]
    Should Be Equal    ${equipo}[payload][category]     ${response.json()}[category]
    Should Be Equal    ${equipo}[payload][price]        ${response.json()}[price]

Equipo Not Found
    ${equipo_id}    Get Mongo Id
    ${token}        Get Token       tfelipe@gmail.com    pwd123

    ${response}     GET Unique Equipo    ${token}    ${equipo_id}

    Status Should Be    404    ${response}