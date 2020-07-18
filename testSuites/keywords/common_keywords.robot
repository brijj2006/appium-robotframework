*** Settings ***
#Importing all the resource files
Resource    ../../settings/resource.robot

#Common keywords that can be reused in the testSuites
*** Keywords ***
Open App
    Open Application    ${appium_host}  platformName=${platform_name}  deviceName=${device_name}  app=${app}  udid=${udid}    platformVersion=${platform_version}

Close App
    Close Application

Reset App
    Reset Application