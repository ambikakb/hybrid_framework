*** Settings ***
Documentation   This resource filr contains configureation
...   and reusable scripts

Library  SeleniumLibrary

*** Variables ***
${BROWSER_NAME}    chrome
${URL}   https://opensource-demo.orangehrmlive.com/

*** Keywords ***
Launch Browser And Naviagte To Url
    Open Browser    browser=${BROWSER_NAME}
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=${URL}

Capture Screenshot And Close Browser
    Run Keyword And Ignore Error    Capture Page Screenshot
    Close Browser
