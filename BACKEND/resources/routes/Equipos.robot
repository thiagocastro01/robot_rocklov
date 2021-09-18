*** Settings ***
Documentation     Implementação da rota /equipos
Resource          ../Base.robot

*** Keywords ***
POST Equipo
    [Arguments]    ${equipo}    ${token}    
    &{headers}     Create Dictionary    user_token=${token}
    
    ${image}=      Get Binary File      ${EXECDIR}/BACKEND/resources/fixtures/equipos/images/${equipo}[thumb]
    &{thumbnail}   Create Dictionary    thumbnail=${image}
    ${response}    POST
    ...            ${BASE_URL}/equipos
    ...            data=${equipo}[payload]
    ...            headers=${headers}
    ...            files=${thumbnail}
    ...            expected_status=any

    [Return]       ${response}

GET Unique Equipo
    [Arguments]    ${token}    ${equipo_id}
    &{headers}    Create Dictionary    user_token=${token}

    ${response}    GET
    ...            ${base_url}/equipos/${equipo_id}
    ...            headers=${headers}
    ...            expected_status=any

    [Return]       ${response}

Delete Equipo
    [Arguments]    ${token}    ${equipo_id}
    &{headers}    Create Dictionary    user_token=${token}

    ${response}    DELETE
    ...            ${base_url}/equipos/${equipo_id}
    ...            headers=${headers}
    ...            expected_status=any

    [Return]       ${response}