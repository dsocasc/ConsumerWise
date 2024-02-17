# ConsumerWise
## Que es ?
ConsumerWise resumidamente es una aplicación intuitiva que te ayuda a tomar decisiones sobre tu consumo electricidad, agua y más. Con análisis detallado y visualización de datos, ConsumerWise te permite monitorear y comprender tu huella ambiental, fomentando un estilo de vida más consciente y sostenible.
## Preparacion del entorno para poder ejecutar la aplicacion
### Primer Paso: Creacion de una API en python
Para implementar esta aplicacion hemos creado una **API** en python utilizando para ello **fastAPI**.  
Por esta razon fue necesaria la instalacion de esta y de uvicorn, libreria para comprobar el funcionamiento de la API.  
```console
pip install fastapi
```   
```console
pip install uvicorn
```
En un principio como no la subimos a ningun sitio, al hacer `uvicorn main:app --reload` solo podiamos visualizarla a través de `localhost` y la `IP de loopback` de la propia maquina  

