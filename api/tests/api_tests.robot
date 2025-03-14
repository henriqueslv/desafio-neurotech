*** Settings ***
Resource             ../resources/api_resources.robot
Library              RequestsLibrary

*** Test Cases ***
Valid zip code
    Create Session ViaCep
    Enter valid zip code and validate status 200 and neighborhood

Invalid zip code
    Create Session ViaCep
    Enter invalid zip code and Validate status 200 and body error true

Invalid format zip code
    Create Session ViaCep
    Enter invalid format zip code and validate status 400



    
