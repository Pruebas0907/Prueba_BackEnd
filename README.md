# Prueba_BackEnd
 Automatización de pruebas de API REST usando Karate DSL para la API de ServeRest (https://
 serverest.dev/). Este proyecto cubre pruebas de usuarios (registro, consulta, modificación, eliminación).

# Tecnologías usadas
- Karate DSL - https://github.com/karatelabs/karate
- Java 11+
- JUnit 5
- Maven
 
# Instalación

**Extrae Maven**
- Descarga Maven desde https://maven.apache.org/download.cgi
- Descarga el archivo: apache-maven-3.9.6-bin.zip
- Extrae el contenido en una carpeta, por ejemplo: C:\Program Files\Apache\Maven\apache-maven-3.9.6

**Configura la variable de entorno MAVEN_HOME**
- Pulsa Win + S, busca "variables de entorno" y abre "Editar las variables de entorno del sistema"
- En la ventana que se abre, haz clic en "Variables de entorno..."
- En la sección Variables del sistema, haz clic en "Nueva..."
- Ingresa:
  * Nombre de la variable: MAVEN_HOME
  * Valor de la variable: C:\Program Files\Apache\Maven\apache-maven-3.9.6 (O la ruta donde lo hayas extraído)

**Agrega Maven al PATH**
- En la misma ventana de Variables del sistema, busca la variable Path y haz clic en "Editar..."
- Haz clic en "Nuevo" y escribe: %MAVEN_HOME%\bin
- Acepta todas las ventanas con "Aceptar" para guardar los cambios.

**Verifica en la terminal**
- Abre una nueva terminal (¡importante que sea nueva!) y escribe: mvn -v
   * Si todo está bien, verás algo como: Apache Maven 3.9.6
                                         Maven home: C:\Program Files\Apache\Maven\apache-maven-3.9.6
                                         Java version: 17.0.10, vendor: Eclipse Adoptium

**Instalar JAVA - PASO 1**
- Ve a la siguiente página oficial: https://adoptium.net/en-GB/temurin/releases/?version=11
- Elige la siguiente configuración:
    * Version: 11 (LTS)
    * Operating System: Windows
    * Architecture: x64
    * Package type: MSI Installer (más fácil)
- Haz clic en "Latest release" y luego en "MSI" para descargar.
- Ejecuta el instalador (OpenJDK11U-jdk_x64_windows_hotspot_*.msi) y sigue los pasos de instalación.

**PASO 2**
- Pulsa Win + S, escribe "variables de entorno" y selecciona "Editar las variables de entorno del sistema"
- En la ventana que se abre:
    * Haz clic en "Variables de entorno…"
    * En Variables del sistema, haz clic en "Nueva..."
    Crear JAVA_HOME:
    * Nombre de variable: JAVA_HOME
    * Valor de variable: la ruta donde se instaló Java, por ejemplo: C:\Program Files\Eclipse Adoptium\jdk-11.0.22.7-hotspot
- Luego, en la misma ventana:
    * Busca la variable Path
    * Haz clic en "Editar..."
    * Haz clic en "Nuevo" y escribe: %JAVA_HOME%\bin
- Acepta todas las ventanas con "Aceptar"

**PASO 3**
- Abre una nueva terminal y escribe: java -version
- Deberías ver algo así: java version "11.0.22" 2024-01-16 LTS
                         Eclipse Adoptium

**TERMINAL BASH**
- git clone https://github.com/tu-usuario/Pruebas_BackEnd.git
- cd Pruebas_BackEnd
- mvn clean install

# Ejecución
- Ejecutar todos los tests: mvn test

# Validaciones implementadas
- Validación de esquemas JSON con #string , #regex , #number , etc.
- Validación de mensajes de error y estados HTTP.
- Validación de arrays con match each y esquemas reutilizables.
 
# Escenarios cubiertos
- Registro exitoso y fallido de usuarios
- Consulta de usuario por ID
- Listado de usuarios y validación de su esquema
- Modificación de usuario por ID
- Eliminación de usuario
