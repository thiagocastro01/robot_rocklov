*** Settings ***
Resource        ../resources/Base.robot

*** Test Cases ***
Add New Equipo
    ${token}          Get Token      tfelipe@gmail.com    pwd123
    ${equipo}        Get Json       equipos       fender.json

    Remove Equipo    ${equipo}[payload][name] 

    ${response}       POST Equipo    ${equipo}    ${token}    
    Log    ${response.content}
    Status Should Be    200