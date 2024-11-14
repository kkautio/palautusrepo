*** Settings ***
Resource    resource.robot
Test Setup    Input New Command And Create User

*** Test Cases ***
Register With Valid Username And Password
    Input Credentials  kalle  kalle123
    Output Should Contain  Registration successful

Register With Already Taken Username And Valid Password
    Input Credentials  kalle  kalle456
    Output Should Contain  Username already taken

Register With Too Short Username And Valid Password
    Input Credentials  ka  kalle123
    Output Should Contain  Username too short

Register With Enough Long But Invalid Username And Valid Password
    Input Credentials  "123.456"  kalle123
    Output Should Contain  Invalid username format

Register With Valid Username And Too Short Password
    Input Credentials  kalle  k
    Output Should Contain  Password too short

Register With Valid Username And Long Enough Password Containing Only Letters
    Input Credentials  kalle  123
    Output Should Contain  Invalid password format


*** Keywords ***
Input New Command And Create User
    Input New Command
    Create User  kalle  kalle123
