*** Settings ***
Documentation   This file contains Testcase related to invalid login
Resource    ../resource/base/common_functionalities.resource

Test Setup   Launch Browser And Naviagte To Url
Test Teardown   Close Browser

Test Template   Valid Login Test


*** Test Cases ***
TC1  Admin  admin123  Dashboard

*** Keywords ***
Valid Login Test
    [Arguments]  ${username}  ${password}  ${expected}
    Input Text    name=username    ${username}
    Input Password    name=password    ${password}
    Click Element    xpath=//*[@type='submit']
    Element Should Contain    xpath=//*[contains(@class,'topbar-header-breadcrumb-module')]    ${expected}

    [Teardown]   Close Browser