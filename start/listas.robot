*** Settings ***
Documentation     Conhecendo listas
Library           Collections

*** Variables ***
@{AVENGERS}        Hulk    Thor    Ironman    Cap
@{JUSTICE}         Superman    Wonder Woman    Batman    Arrow

*** Test Cases ***
Minha lista
    ${index}    Get Index From List    ${AVENGERS}    Ironman
    Set List Value    ${AVENGERS}    ${index}    Homen de Ferro

    ${index_thor}    Get Index From List    ${AVENGERS}    value