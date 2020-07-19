#Configuring all the resources
*** Settings ***
Library                     AppiumLibrary
Library                     Collections
Library                     String

*** Variables ***
${appium_host}              http://0.0.0.0:4723/wd/hub
${platform_name}            Android
${platform_version}         6.0
${udid}                     192.168.56.105:5555
${device_name}              Google Nexus 5
${appPackage}               com.android.calculator
${appActivity}              com.android.calculator.Calculator

*** Test Cases ***
Application_Test
    [Documentation]                     Test Calculator functionality of the Andriod app

    Open Application                    ${appium_host}  platformName=${platform_name}    udid=${udid}    deviceName=${device_name}   platformVersion=${platform_version}   appPackage=${appPackage}     appActivity=${appActivity}
    wait until page contains element    xpath=//android.widget.Button[@text()='3']     timeout=5
    click element                       xpath=//android.widget.Button[@text()='3']
    click element                       xpath=//android.widget.Button[@text()='+']
    click element                       xpath=//android.widget.Button[@text()='4']
    Capture Page Screenshot
    click element                       xpath=//android.widget.Button[@text()='=']
    element attribute should match      xpath=//android.widget.EditText[@index='0']     text        7
    Capture Page Screenshot

    [Teardown]  Close Application