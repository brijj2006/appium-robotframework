# appium-robotframework
 appium-robotframework integration to test ios and andriod apps
 
 ***ios test scenario :***  
 ```
 navigate to iPhone Settings app  
 sign in to iPhone  
 enter Apple ID  
 cancel and return to Settings app  
 perform verifications and take screenshots
 ```
 
 ***andriod test scenario :***  
 ```
 navigate to android Calculator app  
 perform addition operation : 3 + 4 = 7
 verfiy result as 7
 perform verifications and take screenshots
 ```
 
## steps to execute the testSuite
 
 Open Terminal and go to the directory where testScripts are located, then execute the command ->  
 
 ***run ios test :***    
 ```
robot --outputdir ../../reports smokeTest.robot
```
***run andriod test :***  
```
robot --outputdir ../../reports smokeTest_android.robot
```
 
## project folder structure

#### reports

* location : ***reports***  
* screenshots are saved as ***.png*** files  
* html report is saved as ***report.html***  
* detailed step by step log is saved as ***log.html***  

#### settings

* location : ***settings***
* global varibales and libraries are defined here : ***settings/settings.robot***
* resource files for the project are defined here : ***settings/resource.robot***

#### testSuites

* project keywords, locators and testScripts are defined here : ***testSuites***  

#### keywords

* Common keywords that can be reused in the testSuites : ***testSuites/Keywords/common_keywords.robot***  
* application specific keywords : ***testSuites/Keywords/homepage_keywords.robot***  

#### locators

* locators for identifying the elements on ios are defined here : ***testSuites/locators/app_locators.robot***  

#### testScripts

* ios test script location : ***testSuites/testScripts/smokeTest.robot***  
* andriod test script location : ***testSuites/testScripts/smokeTest_android.robot***  

## screenshot of the project structure

![image](https://user-images.githubusercontent.com/50976445/87889533-ae6ada00-ca64-11ea-9e1f-3ea47558631f.png)

## snapshot of the test run

![image](https://user-images.githubusercontent.com/50976445/87890066-58e3fc80-ca67-11ea-845f-91d30cf8fdf8.png)


 
