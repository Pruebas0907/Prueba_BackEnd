Feature: Buscar usuario por ID

  Background:
    * def resultado = call read('classpath:usuarios/POST_usuario.feature')
    * def userId = resultado.userId
    * url 'https://serverest.dev'
    * def emailRegex = '^[\\w.-]+@[\\w.-]+\\.\\w{2,}$'
    * def idRegex = '^[a-zA-Z0-9]{16}$'

  Scenario: Buscar usuario existente
    Given path '/usuarios', userId
    When method GET
    Then status 200
    And match response == 
    """
    {
      nome: '#string',
      email: '#string',
      password: '#string',
      administrador: '#string',
      _id: '#bool'
    }
    """
    And match response._id == userId
    And match response.email == '#regex ' + emailRegex
    And match response._id == '#regex ' + idRegex
    
  Scenario Outline: Errores buscar usuario
    Given path '/usuarios', "<idInvalido>"
    When method GET
    Then status 400
    And match response == { <msg> }

    Examples:
        | idInvalido        | msg                                                        |
        | 1234567890123456  | "message": "Usuário não encontrado"                        |
        | 12345678901234567 | "id": "id deve ter exatamente 16 caracteres alfanuméricos" |
        | 1                 | "id": "id deve ter exatamente 16 caracteres alfanuméricos" |
