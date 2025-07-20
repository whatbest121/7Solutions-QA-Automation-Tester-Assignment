*** Settings ***
Library     SeleniumLibrary
Library    Browser
Resource    ../resources/variables.robot
Resource    ../resources/keywords.robot
    
*** Test Cases ***
E2E test system payment valid
    Verify Dathbord TC_NC_01_and_TC_NC_02
    Verify Input payment valid TC_NC_05
    Verify Button payment TC_NC_12
    Verify payment page TC_NC_15
    Verify button add slip payment page TC_NC_18_and_TC_NC_26