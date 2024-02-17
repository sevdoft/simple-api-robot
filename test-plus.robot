*** Settings ***
Library           RequestsLibrary

*** Keywords ***
${BASE_URL}   http://127.0.0.1:7777

Get Plus
    [Arguments]    ${num1}    ${num2}
    ${response}=     GET    ${BASE_URL}/plus/${num1}/${num2}

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    [return]    ${response.content}

*** Test Cases ***
Test Plus Endpoint With Valid Inputs
    ${response}    GET    ${BASE_URL}/plus/10/5
    Should Be Equal    ${response.status_code}    ${200}
    Should Be Equal As Strings    ${response.content}    15

Test Plus Endpoint With Invalid Inputs
    ${response}    GET    ${BASE_URL}/plus/abc/def
    Should Be Equal    ${response.status_code}    ${200}
    Should Be Equal As Strings    ${response.content}    error_msg: inputs must be numbers
