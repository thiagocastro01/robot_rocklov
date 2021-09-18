*** Settings ***
Documentation     Suite para testar a classe ContaLibrary
Library           ContaLibrary.py

*** Test Cases ***
Quando abro uma nova conta deve retornar saldo ZERADO
    Abrir Conta
    ${saldo_final}        Obter Saldo
    Should Be Equal    ${0.0}    ${saldo_final} 
