*** Settings ***
Resource          web_resources.robot
Test Setup        Start browser

*** Test Cases ***
Test Case
    Access kabum website
    Search for "notebook" and select the first one
    Enter a zip code and validate the available shipping costs
    Close shipping screen
    Buy notebook
    Go to cart
    Validate product in cart

    
