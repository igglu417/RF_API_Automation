*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}      https://reqres.in
${endpoint}     /api/users

*** Keywords ***


*** Test Cases ***
POST_TestCase
    create session  mysession_post   ${base_url}
    ${body}     create dictionary  name= Ikhlas_Postman  job= leader
    ${header}  create dictionary  Content-Type=application/json
    ${response}     post request     mysession_post  ${endpoint}     data=${body}    headers=${header}

#    log to console  ${response.status_code}
#    log to console  ${response.content}

    ${status_code}  convert to string  ${response.status_code}
    should be equal  ${status_code}     201

    ${content}  convert to string   ${response.content}
    should contain      ${content}      Ikhlas_Postman
