#Configuring all the resources
*** Settings ***
Library                     AppiumLibrary
Library                     Collections
Library                     String

*** Variables ***

${appium_host}              http://0.0.0.0:4723/wd/hub
${platform_name}            ios
${platform_version}         13.6
${udid}                     407E676A-F8FB-4917-90BB-FCF60DD7ABDA
${app}                      Settings
${device_name}              iPhone 8
${startX}                   160
${endX}                     0
${startY}                   190
${endY}                     350
${apple_id}                 example@example.com