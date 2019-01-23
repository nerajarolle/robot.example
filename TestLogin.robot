*** Settings ***
Documentation     Testing Opening and Closing browsers
Suite Setup       GoToHomepage
Suite Teardown    Close All Browsers
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:8080/login?from=%2F
${username}       Alessandro
${password}       suomi8000
@{CREDENTIALS}    Alessandro    suomi8000
&{USERPASS}       Username=Alessandro    Password=suomi8000
@{LOGINOBJECTNAMES}    j_username    j_password    Submit

*** Test Cases ***
TestLogin
    [Tags]    Test2
    Open Browser    ${url}    firefox
    Input Text    name=@{LOGINOBJECTNAMES}[0]    &{USERPASS}[Username]
    Input Password    name=@{LOGINOBJECTNAMES}[1]    &{USERPASS}[Password]
    Click Button    name=@{LOGINOBJECTNAMES}[2]
    Close Browser
    Log To Console    %{username} from %{computername}

TestLogin2
    [Setup]    Log To Console    Test Starting...
    Login
    [Teardown]    Log To Console    Test completed!

*** Keywords ***
Login
    Input Text    name=@{LOGINOBJECTNAMES}[0]    &{USERPASS}[Username]
    Input Password    name=@{LOGINOBJECTNAMES}[1]    &{USERPASS}[Password]
    Click Button    name=@{LOGINOBJECTNAMES}[2]

GoToHomepage
    Open Browser    ${url}    chrome
