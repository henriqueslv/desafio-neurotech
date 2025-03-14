*** Settings ***
Library     RequestsLibrary
Library    Collections


*** Variables ***
${BASE_URL}                     https://viacep.com.br/ws
${CEP}                          50721180
${INVALID_CEP}                  00000000
${INVALID_FORMAT_CEP}           00000
${EXPECTED_NEIGHBORHOOD}        Cordeiro
${EXPECTED_ERRO}                true





*** Keywords ***

Create Session ViaCep
    Create Session    viacep       ${BASE_URL} 
Enter valid zip code and validate status 200 and neighborhood
    ${response}=    GET On Session    viacep    /${CEP}/json/  
    Status Should Be    200    ${response}  
    ${json_response}=    Evaluate    ${response.text}  
    ${neighborhood_exists}=    Run Keyword And Return Status    Dictionary Should Contain Key    ${json_response}    bairro
    ${neighborhood}=    Get From Dictionary    ${json_response}    bairro  
    Should Be Equal As Strings    ${neighborhood}    ${EXPECTED_NEIGHBORHOOD}  

Enter invalid zip code and Validate status 200 and body error true
    ${response}=    GET On Session    viacep    /${INVALID_CEP}/json/  
    Status Should Be    200    ${response}  
    ${json_response}=    Evaluate    ${response.text}  
    ${neighborhood_exists}=    Run Keyword And Return Status    Dictionary Should Contain Key    ${json_response}    erro
    ${erro}=    Get From Dictionary    ${json_response}    erro  
    Should Be Equal As Strings    ${erro}    ${EXPECTED_ERRO}  

Enter invalid format zip code and validate status 400
    ${response}=    GET On Session    viacep    /${INVALID_FORMAT_CEP}/json/  
    Status Should Be    400    ${response}
