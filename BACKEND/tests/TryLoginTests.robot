*** Settings ***
Resource        ../resources/Base.robot
Resource        ../resources/Helpers.robot

Test Template    try login

*** Test Cases ***        json_file                    status_code    message
Incorrect password        incorrect_password.json      401            Unauthorized 
user not found            user_not_found.json          401            Unauthorized
wrong email               wrong_email.json             412            wrong email
Empty email               empty_email.json             412            required email 
Empty password            empty_password.json          412            required password 
without email             without_email.json           412            required email 
without password          without_password.json        412            required password
*** Keywords ***
Try login
    [Arguments]    ${json_file}    ${status_code}    ${error_msg}
    &{payload}     Get Json      sessions    ${json_file}
    ${response}    POST Login    ${payload}
    
    Status Should Be    ${status_code}    ${response}
      
    Should Be Equal    ${error_msg}    ${response.json()}[error]