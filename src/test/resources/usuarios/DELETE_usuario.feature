Feature: Eliminar usuario

  Background:
    * def resultado = call read('classpath:usuarios/POST_usuario.feature')
    * def userId = resultado.userId
    * url 'https://serverest.dev'
    #Este usuario puede variar en este caso es el usuario con el que figura el mensaje
    * def userId_Cart = "0uxuPY0cbmQhpEz1"

  Scenario Outline: Eliminar usuario existente
    Given path '/usuarios', <user>
    When method DELETE
    Then status 200
    And match response == { message: "<msg>" }

    Examples:
        | user   | msg                           |
        | userId | Registro excluído com sucesso |
        | "test" | Nenhum registro excluído      |

  Scenario: Eliminar usuario existente
    Given path '/usuarios', userId_Cart
    When method DELETE
    Then status 400
    And match response == { message: 'Não é permitido excluir usuário com carrinho cadastrado', idCarrinho: '#string' }
