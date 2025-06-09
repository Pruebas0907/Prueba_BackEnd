Feature: Listar usuarios

  Background:
    * url 'https://serverest.dev'
    * def emailRegex = '^[\\w.-]+@[\\w.-]+\\.\\w{2,}$'
    * def idRegex = '^[a-zA-Z0-9]{16}$'

  Scenario: Obtener usuarios
    Given path '/usuarios'
    When method GET
    Then status 200
    And match response == { usuarios: '#[]', quantidade: '#number' }
    * def usuarioSchema =
    """
    {
      nome: '#string',
      email: '#string',
      password: '#string',
      administrador: '#string',
      _id: '#string'
    }
    """
    And match each response.usuarios == usuarioSchema
    * def usuarios = response.usuarios
    * eval
    """
    for (var i = 0; i < usuarios.length; i++) {
      if (!usuarios[i].email.matches(emailRegex)) karate.fail('Email inválido: ' + usuarios[i].email);
      if (!usuarios[i]._id.matches(idRegex)) karate.fail('_id inválido: ' + usuarios[i]._id);
    }
    """