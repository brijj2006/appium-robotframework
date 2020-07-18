*** Settings ***
#Importing all the resource files
Resource    ../../settings/resource.robot

#Setting up Suite and Test Setup/Teardown
Suite Setup         Open App
Suite Teardown      Close App
Test Setup          Reset App

*** Test Cases ***
Application_Test
    [Documentation]             Go to iPhone Settings app > SignIn to iPhone > Enter Apple ID > Cancel and return to Settings app

    verify homepage
    Swipe                       ${startx}   ${starty}   ${endX}   ${endY}
    Capture Page Screenshot
    Click Text                  ${sign-in_text}
    Wait Until Page Contains    ${sign-in_header_text}
    Capture Page Screenshot
    Clear Text                  ${apple-id_text-field}
    Input Text                  ${apple-id_text-field}    example@example.com
    Capture Page Screenshot
    Wait Until Page Contains    ${cancel_text}
    Click Text                  ${cancel_text}
    verify homepage
    Capture Page Screenshot