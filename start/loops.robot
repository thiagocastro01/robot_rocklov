*** Settings ***
Documentation        Laços de repetição

*** Variables ***
@{AVENGERS}        Hulk    Thor    Ironman    Cap
@{JUSTICE}         Superman    Wonder Woman    Batman    Arrow

*** Test Cases ***
Meu primeiro Loop
    FOR    ${vingador}    IN    @{AVENGERS}
        Log To Console    ${vingador}
    END