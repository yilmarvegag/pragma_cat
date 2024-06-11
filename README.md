# Pragma Cat App

Pragma Cat App es una aplicación de Flutter que muestra una lista de razas de gatos. Los usuarios pueden buscar razas específicas y obtener más detalles sobre cada raza.

## Características

- Mostrar una lista de razas de gatos.
- Buscar razas de gatos por nombre.
- Ver detalles de una raza de gato específica, incluyendo su imagen y varias características.

## Tecnologías Utilizadas

- [Flutter](https://flutter.dev/)
- [Bloc](https://bloclibrary.dev/#/) para la gestión de estado.
- [Dart](https://dart.dev/) como lenguaje de programación.
- [Cat API](https://thecatapi.com/) para obtener datos de razas de gatos.

## Requisitos

- Flutter SDK
- Dart SDK

## Instalación

### 1. Clona el repositorio:

   ```bash
   git clone https://github.com/tu_usuario/pragma_cat_app.git
   ```

### 2. Navega al directorio del proyecto:

    cd pragma_cat_app
    

### 3. Instala las dependencias

    flutter pub get
    
### 4.Ejecución de la Aplicación
    
    flutter run




## Estructura del Proyecto

- lib/
    - data/: Implementaciones de repositorios y fuentes de datos.
    - domain/: Entidades y repositorios.
    - presentation/: Pantallas, widgets y lógica de presentación (Bloc).
    - main.dart: Punto de entrada de la aplicación.

## Bloc Architecture

La aplicación utiliza el patrón Bloc para la gestión del estado. Los principales bloques utilizados son:

- CatListBloc: Maneja la carga y filtrado de la lista de razas de gatos.
- CatImageBloc: Maneja la carga de imágenes de las razas de gatos.

## Pruebas
Para ejecutar las pruebas, usa el siguiente comando:

    flutter test

## Licencia
Este proyecto está licenciado bajo la Licencia MIT. Consulta el archivo [LICENSE](https://es.wikipedia.org/wiki/Licencia_MIT) para más detalles.

## Contacto
Para preguntas o ayuda, contacta a [yilmarvegag](yilmarvegag@outlook.com)

