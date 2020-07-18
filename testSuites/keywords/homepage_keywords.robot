*** Settings ***
#Importing all the resource files
Resource    ../../settings/resource.robot

#keywords related to the homepage of the application
*** Keywords ***
verify homepage
    Wait Until Page Contains    ${sign-in_text}