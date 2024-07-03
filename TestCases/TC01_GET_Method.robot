*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     http://covid19.richdataservices.com/
${endpoint}     rds/api/catalog

*** Test Cases ***
Get_Covid_Details
    create session  mysession      ${base_url}
    ${response}     get on session  mysession  ${endpoint}
#    log to console  ${response.status_code}
#    log to console  ${response.content}
#    log to console  ${response.headers}

    # VALIDATIONS

    #STATUS CODE
    ${status_code} =    convert to string    ${response.status_code}
    # convert to string is used because the response.status_code is in INTEGER type
    should be equal  ${status_code}     200

    #Check the content of you response
    ${body}=  convert to string     ${response.content}
    # this case, the content is in JSON format
    should contain  ${body}    COVID 19

    #Verify headers
    # headers from response, are stored in dictionary format. Key : value pairs
    ${get_key}  get from dictionary  ${response.headers}     Content-Type
    should contain  ${get_key}  application/json
