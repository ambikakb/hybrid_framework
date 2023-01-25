*** Settings ***
Documentation   This file contains Testcase related to invalid login
Resource    ../resource/base/common_functionalities.resource

Library  DataDriver  file=../test_data/orange_data.xlsx   sheet_name=Addemployee

Test Setup   Launch Browser And Naviagte To Url
Test Teardown   Close Browser

Test Template   Add Valid Employee Test

*** Test Cases ***
TC_${test_case}

*** Keywords ***
Add Valid Employee Test
    [Arguments]   ${username}  ${password}  ${firstName}  ${middleName}  ${lastName}  ${expected}  ${expected_name}
    Input Text    name=username    ${username}
    Input Password    name=password   ${password}
    Click Element    xpath=//*[@type='submit']
    Click Element    xpath=//span[text()='PIM']
    Click Element    link=Add Employee
    Input Text    name=firstName    ${firstName}
    Input Text    name=middleName    ${middleName}
    Input Text    name=lastName    ${lastName}
    Sleep    5s
    Click Element    xpath=//button[normalize-space()='Save']

    Element Should Contain    xpath=//h6[contains(normalize-space(),'${firstName}')]   ${expected}
    Element Attribute Value Should Be    name=firstName    value    ${expected_name}

