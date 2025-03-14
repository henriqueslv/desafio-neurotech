# Projeto de Automação de Testes - Robot Framework

Este repositório contém os testes automatizados utilizando **Robot Framework** para testar aplicações Web e APIs. 

## Pré-requisitos

- **Robot Framework**: Certifique-se de ter o Robot Framework instalado no seu ambiente. Caso não tenha, instale-o com o seguinte comando:

  ```bash
  pip install robotframework
## Bibliotecas adicionais:

- SeleniumLibrary para testes Web:

  ```bash
  pip install robotframework-seleniumlibrary
- RequestsLibrary para testes de API:
  
  ```bash
  pip install install robotframework-requests

  pip install robotframework-jsonlibrarys  
## Executando os Testes

- Testes Web:

  ```bash
  robot web\tests\web_tests.robot

- Testes de API:

  ```bash
  robot api\tests\api_tests.robot