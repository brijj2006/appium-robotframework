# install and configure mobile automation on Mac OS

### Installation of Appium and Robot Framework

The installation of Appium and Robot Framework can be done using the terminal of macOS.  

***Pre-requisites***  
To install Appium and RobotFramework, following packages should be installed :  
```
Homebrew
Node.js
Java Development Kit
Phyton 3  
Xcode
Android Studio

Mac comes with pre-installed Python. The common problem is with some of the broken packages.  
Better to install newer version of Python apart from the one which is pre-installed.
```

If you don’t have Xcode and Android Studio installed yet, install them. Xcode can be downloaded in the App Store of macOS.  
Android Studio can be downloaded on the Android Developer website.

```
Xcode is an expensive resource and consumes around 18-20 GB once installed so remember to have good space in the hard disk. 
```

**install robotframework using the terminal**  
```
pip install robotframework
```

**install appium library for robotframework using the terminal**  
```
pip install robotframework-appiumlibrary
```

**install homebrew using the terminal**  
```
ruby -e “$(curl –fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

**install node and appium using the terminal**  
```
brew install node                                             # get node.js
sudo npm install -g appium --unsafe-perm=true --allow-root    # get appium
sudo npm install wd                                           # get appium client
```

**start and check status for appium server using the terminal**  
```
appium &                        # start appium
netstat -an | grep 4723         # check server status
```

**set path for Xcodebuild using the terminal**  
```
sudo xcode-select –s /Applications/Xcode.app/Contents/Developer/
```

**install tools to help appium using the terminal**  
```
cd /usr/local/lib/node_modules/
open .
Right click Folder “node_modules” to click “Get info”
```  
  
![image](https://user-images.githubusercontent.com/50976445/87912533-1d195900-caa0-11ea-84d1-a65d3cada101.png)  

**setting up the appium-xcuitest-driver using the terminal**  
some of the external dependencies are required for appium to work  
```
brew install ideviceinstaller
brew install carthage or brew reinstall carthage
npm install -g ios-deploy
npm install -g deviceconsole
sudo gem install xcpretty
brew install libimobiledevice –-HEAD
sudo npm install appium-doctor -g
sudo npm install appium-webdriveragent
```  

All the above commands should get installed without errors. If there are errors, try executing with sudo.  
After installing the tools, one must set the home path for Java and Android. The path must be set to the file ***.bash_profile***  
  
![image](https://user-images.githubusercontent.com/50976445/87913547-df1d3480-caa1-11ea-8dc9-215448be40d5.png)  

**run the below command to check if all the necessary appium dependencies are installed properly**
```
appium-doctor
```  

If all settings are correct, one can continue. If something is not set correctly, fix the issues first.  
  
![image](https://user-images.githubusercontent.com/50976445/87913242-4f778600-caa1-11ea-9371-a8b08d6cd0aa.png)  

Once the Appium is configured correctly, it is time to set up the certificates for Apple in Xcode. This is needed to install the XCTest runner on iOS devices, which is needed to trigger the test cases on the device.  

**setting the WebDriverAgent**  
```
cd /usr/local/lib/node_modules/appium/node_modules/appium-webdriveragent
./Scripts/bootstrap.sh -d
open -a Xcode WebDriverAgent.xcodeproj
```  
  
![image](https://user-images.githubusercontent.com/50976445/87914085-b9dcf600-caa2-11ea-858b-32446b95e862.png)  

**set Xcode for building iPhone (set iPhone to run automated test via Appium)**  

Navigate to Xcode and open the target WebDriverAgentLib and sign this with your Developer Account. Do the same for WebDriverAgentRunner. Build the project to validate if the signing was successful.

***WebDriverAgentLib***  

![image](https://user-images.githubusercontent.com/50976445/87915241-73889680-caa4-11ea-8d4f-6c81c11df084.png)  

***WebDriverAgentRunner***  

![image](https://user-images.githubusercontent.com/50976445/87915461-ceba8900-caa4-11ea-95a1-f4c6ec7c16a0.png)  

There might be an error in Provisioning Profile & Signing Certificate.  
***hack to resolve the error***    
```
click on Build Settings
change the Product Bundle Identifier from it’s default to any other name
go back to General, the errors in the previous step should now be resolved
```

![image](https://user-images.githubusercontent.com/50976445/87915854-4092d280-caa5-11ea-970a-2cd4e9c07b82.png)  


**With all the steps completed, build on any of the WebDriverAgentRunner, then the app should open in the simulator**  

![image](https://user-images.githubusercontent.com/50976445/87916578-36250880-caa6-11ea-90df-cfe4d0b4cfe9.png)  

**quick checks to see if the device is ready for testing**  
```
netstat -an | grep 4723     #check if the appium server is up and running
appium-doctor               #check if all dependencies of appium are working fine
```

***good to go for appium robotframework automated tests***


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
 
### project folder structure

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

## snapshot for the project structure

![image](https://user-images.githubusercontent.com/50976445/87889533-ae6ada00-ca64-11ea-9e1f-3ea47558631f.png)

## snapshot of the test run

![image](https://user-images.githubusercontent.com/50976445/87890066-58e3fc80-ca67-11ea-845f-91d30cf8fdf8.png)

## snapshots for results/logs 

***report :***  

![image](https://user-images.githubusercontent.com/50976445/87890310-8e3d1a00-ca68-11ea-9b4e-187e3a388e98.png)  

***log :***  

![image](https://user-images.githubusercontent.com/50976445/87890215-0f47e180-ca68-11ea-9641-59924cd18722.png)  

***log  with screenshot :***   

![image](https://user-images.githubusercontent.com/50976445/87890249-41594380-ca68-11ea-851c-ff53cc7cef61.png)  

***end of the document***


