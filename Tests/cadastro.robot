*** Settings *** 

Resource     ${EXECDIR}/Resources/base.robot

*** Test Cases ***
Teste Cadastro novo usuario

    &{user}               Create Dictionary     
    ...    name=leonardo arantes
    ...    email=leonardo@hotmail.com
    ...    password=pwd123

    Remove User By Email  ${user}[email]

    Start Session
    Go To signup
    Register User         ${user}
    Notice should be     Boas vindas ao Mark85, o seu gerenciador de tarefas.

Duplicated User
    [Tags]    Duplicated

    &{user}        Create Dictionary     
    ...    name=Vo Werine    
    ...    email=Vo.Werine@hotmail.com    
    ...    password=pwd123

    Remove User By Email            ${user}[email]

    Start Session
    Go To signup
    Register User                   ${user} 
    Register User                   ${user}
    Notice should be        Oops! Já existe um cadastro com e-mail informado.


# Nome deve ser obrigatorio
# 
# Email deve ser obrigatorio
# 
# Senha deve ser obrigatorio