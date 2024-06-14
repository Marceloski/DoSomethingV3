Hola muy buenas tardes, este archivo detallara como revisar el software 
tanto para el ejecutable como para revision de codigo.

Previamente a la utilizacion del software y revision,godot tiene requisitos
minimos para ejecutarse y poderse ver el proyecto.
-Sistema operativo en Windows 10
-Disponible para OpenGL 3.3
-Python instalado
-4 GB
-sistema 64 bits

En primera instancia se realizaron varias alternativas para el uso y apertura
del proyecto,se subio a github, google drive y itch.io en los 
cuales es preferible github y google drive, donde todos los archivos
referentes al proyecto y el ejecutable pueden ser descargados desde la
misma carpeta. La capsula en estos medios posee el proyecto en una 
carpeta de nombre "Do Something", un ejecutable para el juego directo y 
un ejecutable para abrir el proyecto y realizar revisiones de codigo y
estructuracion.

Para realizar revision de la ultima version del juego, abrir ejecutable
"Do Something Juego", esta ejecutara el juego sin necesidad de comandos
adicionales en su version portable.

Para realizar revision de codigo y estructuracion del proyecto, abrir
"Godot 4.2" el cual abrira un Project Manager. desde aqui seguir paso a paso
-Hacer click en Import->Browse y se debe buscar la carpeta descargada
-Abrir proyecto.gd el cual es una imagen del logotipo de godot, abrira 
el proyecto con todas las pestañas desde la ultima modificacion.

-Finalmente realizar revision del proyecto, el cual esta estructurado en
3 tipos de carpetas:
Carpeta Scenas: Contiene Cada escena de nodos de cada parte del proyecto,
se debe hacer doble click desde la pestaña de los recursos en la esquina
inferior izquierda de cada archivo.tscn para ver todo lo relacionado a 
ella en el editor.

Carpeta Script: Contiene todos los scripts de cada uno de los nodos que
posean alguna funcion o logica dentro del programa, la mayoria de ellos
son scripts de funciones autocontenidas. Donde se destacan los scripts
main.gd,Siguiente.gd y DialogosManager.gd los gestores de la mayor cantidad
de logica en programa.Se debe revisar mediante doble click en la pestaña
inferior izquierda y en el centro alto de la pantalla con el boton "Script"

El resto de carpetas son los recursos o imagenes asociadas y requeridas
para el correcto funcionamiento del software, por tanto no deben ser
movidas.


No es recomendable para evaluar el codigo utilizar itch.io
por privacidad de la misma pagina. 

Mil Disculpas si no esta mayormente documentado, a solucionar si es posible.
