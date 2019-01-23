*** Settings ***
Documentation     Testing Opening and Closing browsers
Library           SeleniumLibrary

*** Test Cases ***
TestChrome
    OpenBrowser    http:\\elisa.fi    chrome
    LocationShouldContain    elisa
    CloseBrowser

TestFirefox
    OpenBrowser    http:\\firefox.com    firefox
    LocationShouldContain    mozilla
    CloseBrowser
    Log To Console    Completed Successfully!

TestMicrosoftEdge
    OpenBrowser    http:\\microsoft.com    edge
    CloseBrowser
