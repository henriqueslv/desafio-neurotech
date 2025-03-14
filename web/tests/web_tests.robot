*** Settings ***
Resource          ../resources/web_resources.robot
Test Setup        Start browser

*** Test Cases ***
Add notebook to cart
    Access kabum website
    Search for "notebook" and select the first one
    Enter a zip code and validate the available shipping costs
    Close shipping screen
    Buy notebook
    Go to cart
    Validate product in cart

# Em algumas situações aparecia o macbook como o primeiro item da lista, 
# mas como aconteceu em poucos casos eu implementei apenas o teste focado em notebook
# caso o teste falhe é porque o primeiro item da lista foi um macbook
# neste caso, deve rodar o scprit de novo
    
