*** Settings ***
Library    SeleniumLibrary
Suite Setup        Log    This is the Test Suite Set up
Suite Teardown     Log    This is the Test Suite Tear Down
Test Setup         Log    This is the Test Case Set Up    
Test Teardown      Log    This is the Test Case Tear Down                  

Default Tags      Sanity  

*** Test Cases ***

MyFirstTest
    Log    HelloWorld..... 
    

FirstSeleniumTest
    Open Browser    https://www.google.com    chrome
    Set Browser Implicit Wait    5
    Input Text      name = q                  Automation Step by Step
    Click Button    name = btnK        
    Sleep    2    
    Close Browser
    Log    Test Completed
    
SampleLoginTest
    [Documentation]    This is a test to open and Close a browser with a link
    Open Browser    ${URL}        chrome
    Set Browser Implicit Wait    5
    LOGINKW 
    Click Element     id = welcome  
    Click Element     link = Logout
    Sleep    2   
    Close Browser 
    [Tags]    Smoke
    Log     Test Finished
    Log     This test was performed by %{username} on %{os} operating system
            
*** Variables ***

${URL}    https://opensource-demo.orangehrmlive.com/    
@{CREDENTIALS}    Admin    admin123    
&{LoginDetails}    username=Admin    password=admin123


*** Keywords ***

LOGINKW
    Input Text        id=txtUsername    @{CREDENTIALS}[0]
    Input Password    id=txtPassword    &{LoginDetails}[password]
    Click Element     id = btnLogin
        