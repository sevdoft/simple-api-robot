*** Settings ***
Library    HttpRequest

*** Test Cases ***
Test Plus Endpoint With Valid Inputs
    ${response}    Get Request    http://localhost:5000/plus/10/5
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal As Strings    ${response.content}    15

Test Plus Endpoint With Invalid Inputs
    ${response}    Get Request    http://localhost:5000/plus/abc/def
    Should Be Equal As Strings    ${response.status_code}    200
    Should Be Equal As Strings    ${response.content}    error_msg: inputs must be numbers
