*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.kabum.com.br
${CEP}    50721180


*** Keywords ***
Start browser
    Open browser    browser=chrome
    Maximize Browser Window


Access kabum website    
    Go To    url=${URL}

Search for "${ITEM}" and select the first one
    Click Element    id=onetrust-accept-btn-handler 
    Input Text        id=input-busca    ${ITEM} 
    Press Keys        id=input-busca    ENTER
    ${produto} =     Get WebElements     css=.sc-27518a44-8.dsdRWH
    Scroll Element Into View    ${produto[0]}
    Click Element      ${produto[0]}

 Enter a zip code and validate the available shipping costs
    Scroll Element Into View   id=inputCalcularFrete 
    Click Element    id=inputCalcularFrete
    Input Text        id=inputCalcularFrete    ${CEP}   
    Click Element        id=botaoCalcularFrete    
    Wait Until Element Is Visible    id=listaOpcoesFrete     15s
    Element Should Be Visible    css=.sc-4253a8e4-1.ipyMwU

Close shipping screen
    Click Element    css=.sc-bBXrwG.kBHzWh

Buy notebook
    Click Element    css=.sc-a24aba34-2.iviqDc

Go to cart
    Wait Until Element Is Visible     css=.flex.flex-1.flex-col.gap-16 > section > button:first-of-type    15s
    Click Element     css=.flex.flex-1.flex-col.gap-16 > section > button:first-of-type

 Validate product in cart
    Wait Until Element Is Visible     id=sellersContainer     10s
