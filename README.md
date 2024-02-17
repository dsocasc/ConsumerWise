# ConsumerWise
## Que es ?
ConsumerWise resumidamente es una aplicación intuitiva que te ayuda a tomar decisiones sobre tu consumo electricidad. Con análisis detallado y visualización de datos,ConsumerWise te permite monitorear y comprender tu huella ambiental, fomentando un estilo de vida más consciente y sostenible.
## Funcionamiento
Nuestra aplicacion de divide en dos partes: el servidor implemetando con una API creada en python y la interfaz grafica creada con flutter
El servidor recibe peticiones por parte de un cliente, que es la interfaz de la aplicacion.   
Por esta razon usamos una serie de librerias y ejecutamos el servidor haciendo `uvicorn main:app --reload`.   
```console
pip install fastapi
```   
```console
pip install uvicorn
```
Una vez hecho esto lanzamos lanzamos la parte de flutter desde el main.dart
