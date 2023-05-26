*** Settings *** 

Library        Browser
Library        Resources/libs/mongo.py    

*** Test Cases ***
Teste Cadastro

    New Browser     browser=chromium    headless=False
    New Page        http://localhost:3000/signup

    Get Text        css=form h1    equal     Faça seu cadastro

    &{user}        Create Dictionary name=leonardo arantes    email=leonardo@hotmail.com    password=pwd123

    #Remove User By Email       leonardo@hotmail.com

    Register User        ${user}

    ${notice}       Set Variable     css=.notice p
    ${message}      Set Variable     Boas vindas ao Mark85, o seu gerenciador de tarefas.

    Wait For Elements State     ${notice}     visible    5
    Get Text    ${notice}    equal    ${message}

Duplicated User
    [Tags]    Duplicated

*** Keywords ***
Register user
    [Arguments]    ${user}

        Fill Text       css=input[name=name]     &{user}[name]
        Fill Text       css=input[name=email]    &{user}[email]
        Fill Text       css=input[name=password] &{user}[password]
    
        Click           css=button[type=submit] >> text=Cadastrar