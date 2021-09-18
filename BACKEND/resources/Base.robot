*** Settings ***
Library        RequestsLibrary
Library        Collections
Library        OperatingSystem
Library        ../resources/libs/mongo.py

Resource       ../resources/routes/Signup.robot
Resource       routes/Sessions.robot
Resource       ../resources/Helpers.robot
Resource       ../resources/routes/Equipos.robot

*** Variables ***
${BASE_URL}    https://rocklov-thiago-api.herokuapp.com