Feature: Registrar usuarios

  Background:
    * url 'https://serverest.dev'
    * def uuid = java.util.UUID.randomUUID().toString()
    * def emailUnico = 'fulano' + uuid + '@teste.com'
    * def usuarioValido =
    """
    {
      "nome": "Fulano da Silva",
      "email": "#(emailUnico)",
      "password": "teste123",
      "administrador": "true"
    }
    """
  Scenario: Registrar usuario con email ya registrado
    #Primer registro
    Given path '/usuarios'
    And request usuarioValido
    When method POST
    Then status 201
    And match response == { message: 'Cadastro realizado com sucesso', _id: '#string' }

    # Intentar registrarlo de nuevo
    Given path '/usuarios'
    And request usuarioValido
    When method POST
    Then status 400
    And match response == { message: 'Este email já está sendo usado' }

  #Se ejecuta de segundo para usar el _id en otros .feature
  Scenario: Registrar un nuevo usuario con datos válidos
    Given path '/usuarios'
    And request usuarioValido
    When method POST
    Then status 201
    And match response == { message: 'Cadastro realizado com sucesso', _id: '#string' }
    * def userId = response._id
    * eval karate.log('ID creado: ' + userId)
    * eval function() { return { userId: userId } }



    
