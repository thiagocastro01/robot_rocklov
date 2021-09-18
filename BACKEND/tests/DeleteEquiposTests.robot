*** Settings ***
Documentation    Get Equipo Tests

Resource    ../resources/Base.robot

*** Test Cases ***
Delete a equipo
    ${token}          Get Token      thiagofelipe@gmail.com    pwd123
    ${equipo}         Get Json       equipos              violino.json

    Remove Equipo    ${equipo}[payload][name] 
    ${result}       POST Equipo      ${equipo}    ${token}   
    ${equipo_id}    Set Variable     ${result.json()}[_id]

    ${response}      Delete Equipo   ${token}    ${equipo_id}
    ${response2}     GET Unique Equipo    ${token}    ${equipo_id}
    
    Status Should Be    204    ${response}
    Status Should Be    404    ${response2} 

Equipo Not Found
    ${equipo_id}    Get Mongo Id
    ${token}        Get Token       thiagofelipe@gmail.com    pwd123

    ${response}     Delete Equipo    ${token}    ${equipo_id}

    Status Should Be    204    ${response}