Feature: Actualizar usuario existente

  Background:
    * def resultado = call read('classpath:usuarios/POST_usuario.feature')
    * def userId = resultado.userId
    * url 'https://serverest.dev'
    * def uuid = java.util.UUID.randomUUID().toString()
    * def emailUnico = 'test' + uuid + '@teste.com'
    * def usuarioValido =
    """
    {
      "nome": "test nombre",
      "email": "#(emailUnico)",
      "password": "teste123",
      "administrador": "true"
    }
    """
    * def idRegex = '^[a-zA-Z0-9]{16}$'

  Scenario: Actualizar datos de usuario
    Given path '/usuarios', userId
    And request usuarioValido
    When method PUT
    Then status 200
    And match response == { message: 'Registro alterado com sucesso' }

  Scenario: Nuevo ID
    Given path '/usuarios/test',
    And request usuarioValido
    When method PUT
    Then status 201
    And match response == { message: 'Cadastro realizado com sucesso', _id: '#string' }
    And match response._id == "#regex " + idRegex
    

  Scenario: Actualizar datos de usuario
    Given path '/usuarios/test',
    And request usuarioValido
    When method PUT
    Then status 201
    And match response == { message: 'Cadastro realizado com sucesso', _id: '#string' }
    And match response._id == "#regex " + idRegex

    Given path '/usuarios/test',
    And request usuarioValido
    When method PUT
    Then status 400
    And match response == { message: 'Este email já está sendo usado' }
