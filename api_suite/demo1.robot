*** Settings ***
Library   RequestsLibrary

*** Test Cases ***
TC1 Get 
    Create Session    alias=petshop    url=http://petstore.swagger.io/v2
    ${response}  GET On Session    alias=petshop   url=pet/101
    Log    ${response}
    Log    ${response.json()}
    Log    ${response.json()}[id]

    #${expected_id}   Convert To Integer    101
    #Should Be Equal    ${response.json()}[id]    ${expected_id}

    ${actual_id}   Convert To String    ${response.json()}[id]
    Should Be Equal    ${actual_id}    101

    Log    ${response.json()}[name]
    ${actaul_name}  Convert To String    ${response.json()}[name]
    Should Be Equal    ${actaul_name}    doggie

    Should Contain    ${response.json()}[name]    doggie

    ${response_body}   Convert To String    ${response.json()}
    Should Contain    ${response_body}    doggie
    Status Should Be    200