Feature: crear gestor


  Background:
    Given url link + link2
    # llamar la clase
    * def DataGenerator = Java.type('Utils.DataGenerate')
    # Generador de datos -> llamado del metodo
    * def randomName = DataGenerator.name()
    * def randomJob = DataGenerator.job()

  Scenario: leer gestores
    # ingresamos la URL del servicio
    Given path + 'users?page=2'
    # definimos el metodo de la solicitud
    When method GET
    # validar que la respuesta contenga el id=7
    * match response.data[0].id == 1
    # validar que la respuesta sea una cadena []
    * match response.data == '#[]'
    # validar que el status code sea = 200
    Then status 200

    Scenario: crear gestor
      #create user
      Given path  + 'users'
      And request
      """
      {
      "name": "#(randomName)",
      "job": "#(randomJob)"
      }
      """
      When method POST
      Then status 201
      And def userId = response.id
      And print 'El valor de userId es:', userId
      # * match response.name == "morpheus"
      * match response.createdAt == '#present'

      #delete user
      Given path  + 'users' + userId
      When method DELETE
      Then status 204
