extends Node
#Varuiable Genero
var genero:int = 0
#Variables estadisticas de Juego
var Dinero = 100
var Felicidad = 5
var Empleados = 10
var Ganancias = 1000
var LoseText:String
var NpcActual = 1

#Dialogos
var dialogues = [
	{
		"id": 1,
		"text": "Hay trabajadores discutiendo por quien sabe que, es la 5ta vez esta semana. Uno de ellos se te acerca y dice que su compañero no lo respeta, que él no entiende que esos dibujos en su pared son “ARTE”. Más tarde el susodicho compañero aparece y exige que alejen a ese tipo de su cubículo o renunciará. Esto escaló muy rápido, necesitas hacer algo.",
		"npc": 1,
		"optiones": [
			{"text": "Educar a estos palurdos sobre el arte.", "felicidad": 0, "dinero": 0, "empleados": -3, "consecuencia": "Uff, alguien no estará muy feliz con esta decisión"},
			{"text": "Que se joda el arte, trabaja.", "felicidad": -1, "dinero": +15, "empleados": 0, "consecuencia": "Wow, eso si es tener los pantalones bien puestos, te has ganado el respeto de tus empleados"},
			{"text": "Actuar de intermediario para intentar solucionar el asunto.", "felicidad": +2, "dinero": +30, "empleados": -3, "consecuencia": "Decides crear la “convocatoria anual de discusión de arte” para fomentar el arte en tus empleados, claro, nadie presta atención, pero el sujeto que reclamó está feliz y todos los demás obtienen otro feriado en el calendario, eres genial manejando situaciones"}
		]
	},
	{
		"id": 2,
		"text": "Sana Banana, encargada de recursos humanos te pide vacaciones, sabes que será un caos. Sana no solo es la más competente de rh, si no que es la única.",
		"npc": 2,
		"optiones": [
			{"text": "Dar vacaciones y encargarte de todo, tú solito.", "felicidad": 0, "dinero": 0, "empleados": -3,"consecuencia": "Se viene un laaargo mes, aunque al menos ahorrarás, prepárate"},
			{"text": "Dar vacaciones y contratar un reemplazo.Al final de cuentas Sana se lo merece.", "felicidad": 0, "dinero": -5, "empleados": +2, "consecuencia": " Sientes que has hecho lo correcto"},
			{"text": "Conseguir un pasante y sobreexplotarlo", "felicidad": +3, "dinero": +200, "empleados": +1, "consecuencia": "El pasante ha logrado lo imposible, ha sido un espectáculo visual sin precedentes de torpeza humana como jamás lo habías visto. Luego de terminar con el extintor en esa impresora que incineró con agua, te preguntas ¿qué hice?.  Solo dices “oh no hermano"}
		]
	},
	{
		"id": 3,
		"text": "En las buenas, en las malas y las peores las parejas pueden surgir, lamentablemente esto es el trabajo y las relaciones entre empleados están prohibidas aunque…",
		"npc": 2,
		"optiones": [
			{"text": "Hacer la vista gorda?", "felicidad": 0, "dinero": 0, "empleados": -5, "consecuencia": "El amor es más grande que todo, no debes interferir y tu cuerpo lo sabe"},
			{"text": "NO, está estrictamente prohibido, el que perdona murió en la cruz...", "felicidad": 0, "dinero": +3, "empleados": +2, "consecuencia": "Has destruido una relación que podía florecer, o quizás salvaste a alguien de una relación completamente tóxica, ¿Héroe o villano? nunca lo sabremos"},
			{"text": "Hacer una muy pobre charla sobre esto", "felicidad": +3, "dinero": +200, "empleados": +10, "consecuencia": "La pobre charla que hiciste termino por ganarte el odio de la empresa"}
		]
	},
	{
		"id": 4,
		"text": "Tus empleados necesitan energías, lamentablemente inyectarles adrenalina suena muy ilegal. Si tan solo hubiera una manera de mejorar los ánimos.",
		"npc": 3,
		"optiones": [
			{"text": "Comprar cafetera", "felicidad": 0, "dinero": 0, "empleados": -5, "consecuencia": "Eso es, eres un genio de la legalidad y de la eficiencia, te ganaste un café"},
			{"text": "¡Reuniones en la mañana! ¡Eso es! Todos aman perder el tiempo.", "felicidad": 0, "dinero": -3, "empleados": +2, "consecuencia": "Bueno los bostezos no suenan muy animosos pero al menos te queda la fé"},
			{"text": "Hacer la Entrada mas Tarde", "felicidad": +3, "dinero": -50, "empleados": 0, "consecuencia": "Todos estan contentos, pero se tendra que pagar algunos autos privados para aquellos que no puedan irse tarde"}
		]
	},
	{
		"id": 5,
		"text": "Tus empleados te comunican por correo que quieren implementar un nuevo método de trabajo, es un modelo muy reciente y no se ha comprobado su efectividad ¿aceptas su propuesta?",
		"npc": 4,
		"optiones": [
			{"text": "Aceptar", "felicidad": 0, "dinero": 0, "empleados": -5, "consecuencia": "Tus riesgos dieron frutos!! Además tus empleados confían más"},
			{"text": "Rechazar", "felicidad": -2, "dinero": 0, "empleados": -2, "consecuencia": "Quedarse en el mismo lugar sólo lleva a la monotonía; aunque ahora a tus empleados les caes un poco mal"},
			{"text": "Pensarlo", "felicidad": 0, "dinero": 0, "empleados": 0, "consecuencia": "Pensarlo no hara que llegue a ningun lado, solo perdiste el tiempo"}
		]
	},
		{
		"id": 6,
		"text": "Viene ESE cliente que siempre llega con sus reclamos… otra vez llega gritando tanto que no se le entiende nada",
		"npc": 1,
		"optiones": [
			{"text": "Ya basta de este abuso, se termina tu trato con el cliente!!", "felicidad": 0, "dinero": -100, "empleados": +1, "consecuencia": "Minutos después recuerdas que aguantaste años de gritos por que era tu principal inversor, UPSI"},
			{"text": "A veces solo toca hacer tu trabajo y ya, por odioso que sea.", "felicidad": -2, "dinero": +50, "empleados": 0, "consecuencia": "Una vez más, el cliente más millonario y odioso se va feliz con sus problemas solucionados… aunque no deja de gritar, puede que necesite una visita al médico"},
			{"text": "Que se encargue Sana", "felicidad": -1, "dinero": 0, "empleados": 0, "consecuencia": "Ahora Sana te odia un poco"}
		]
	},
		{
		"id": 7,
		"text": "Es el día de las bromas, llega la hora de tomar una importante decisión ¿Quién caerá presa de tu increíble broma? ",
		"npc": 3,
		"optiones": [
			{"text": "Sana", "felicidad": +1, "dinero": 0, "empleados": 0, "consecuencia": "No hay nada tan satisfactorio como jugar bromas a tus amistades, para tu suerte, Sana también lo ve así, hasta jura devolverte la broma."},
			{"text": "¿Bromas? Aquí solo se viene a trabajar", "felicidad": -2, "dinero": 0, "empleados": 0, "consecuencia": "Felicidades, eres oficialmente el grinch del día de las bromas, creo que es obvio que eso no fue del agrado de nadie, aun así, estas orgulloso de no perder tiempo y dinero en esas cosas de gente “feliz”, que se creen."},
			{"text": "Importa la broma, mas no la víctima", "felicidad": 0, "dinero": 0, "empleados": -5, "consecuencia": "Estás preparando la mejor broma de todos los tiempos, tal que la leyenda sea pasada a los futuros empleados, y sus familias, y a la familia de sus familias, esto será épico…  O lo sería si no hubieras pasado todo el día preparando tu broma y gastado un buen dineral en materiales"}
		]
	},
	{
		"id": 8,
		"text": "Tus manipuladores emocionales favoritos te miran directo a los ojos rogando por comida, aunque claro, sus platos están llenos, alguien debería enseñarles modales a tus mascotas… pero son tan lindos.",
		"npc": 0,
		"optiones": [
			{"text": "Comprar comida premium", "felicidad": +1, "dinero": -20, "empleados": 0, "consecuencia": "Hiciste lo que debías, no es fácil ser dueño de tales criaturas sin fondo en sus estómagos. Tus mascotas emiten ruidos de felicidad mientras tu billetera emite ruidos de dolor (todo sea por amor)"},
			{"text": "Lo siento bebés, no esta vez", "felicidad": -1, "dinero": 0, "empleados": 0, "consecuencia": "Cometiste el pecado de no seguir malcriando tus mascotas y el castigo divino llegó a la mañana siguiente, ahora debes comprar nuevas cortinas, papel higiénico y nuevas macetas, de ser posible no de cerámica esta vez"},
			{"text": "Darle de tu comida", "felicidad": -2, "dinero": -10, "empleados": 0, "consecuencia": "Tus mascotas te miran con confusión, no parecen entender tu comida y se acercan felizmente a probar…y no parecen gustarle para  nada !!"}
		]
	},
	{
		"id": 9,
		"text": "Se viene una reunión con unos publicistas e inversionistas, la primera desde que asumiste tu cargo. De pronto, te entran nervios de tomar este gran paso.",
		"npc": 4,
		"optiones": [
			{"text": "Preparar un guion", "felicidad": +1, "dinero": -20, "empleados": 0, "consecuencia": "Buena idea. Al presentarte a la reunión con un guion, no olvidaste tratar los puntos relevantes de la reunión. A pesar de tu gran presentación, los inversionistas se ven que no pueden confiar en la profesionalidad de alguien que lee en una reunión importante. Auch para el bolsillo de la empresa"},
			{"text": "Tomar un relajante o algo ¡Rápido!", "felicidad": -2, "dinero": -20, "empleados": -5, "consecuencia": "Eso es, las drogas son la respuesta ante cualquier duda. La reunión va espectacular, hablas con una sabiduría y el atractivo en tu voz sin precedentes deja a todos atónitos. Tu único inconveniente, es que acabas de despertar de ese maravilloso sueño de una buena reunión, faltaste a la real, perdiste posibles inversionistas y por sobre todos los males, te duele el cuello"},
			{"text": "Confiar en tus capacidades", "felicidad": +2, "dinero": +40, "empleados": +3, "consecuencia": "Maravilloso, espléndido, espectacular, grandioso, todas estas las palabras definen a la perfección tu increíble discurso, el que no dejo a nadie indiferente en la sala. Los inversionistas se ven encantados contigo y tus empleados también"}
		]
	},
	{
		"id": 10,
		"text": "El invierno puede ser un asco, o al menos, no sentir tus dedos si se siente del asco; no hay nada ni nadie que caliente tu preciado lugar de trabajo ¿Qué hacer?",
		"npc": 0,
		"optiones": [
			{"text": "Comprar calefacción", "felicidad": +2, "dinero": -30, "empleados": +1, "consecuencia": "Al fin, algo que combata este terrible frío, todos felices, todos calentitos, y yo que me alegro, lo único que aún se siente desolado y vacío, es tu billetera."},
			{"text": "En mis tiempos no llorábamos por la temperatura", "felicidad": -2, "dinero": 0, "empleados": -5, "consecuencia": "En mis tiempos no llorábamos por la temperatura Así se habla campeón. Nada de oír llantos sobre estas lluvias y tormentas, todo esto es normal, es más, deberían estar agradecidos de que caiga agua en la ciudad, al fin y al cabo, es de lo más sano. Qué generación más frágil de empleados, generación de cristal"},
			{"text": "Ofrecer cafe en la empresa", "felicidad": +2, "dinero": 0, "empleados": 0, "consecuencia": "A pesar de que aun este helado, los empleados los agradecen"}
		]
	},
	{
		"id": 11,
		"text": "Tu bandeja de correos está repleta, no puedes creer la cantidad de pendientes que tienes, no crees ser capaz de pronunciar ese número. ¿Qué hacer? ",
		"npc": 1,
		"optiones": [
			{"text": "Leer todo con cuidado", "felicidad": 0, "dinero": +50, "empleados": 0, "consecuencia": "Entre toda esa publicidad de tiendas, príncipes de países inexistentes y una tal “María” que dice estar a menos de 10 km de ti; encontraste oro puro, un trato con un inversionista que estaba a la espera de ser firmado por ti, esto es un montón de dinero caído del cielo, aleluya."},
			{"text": "Leer solo cinco y el resto mañana", "felicidad": 0, "dinero": -100, "empleados":-1, "consecuencia": "Genial!, eres el seleccionado ganador de 1 millón de pesos de una tienda reconocida, y aunque el correo termina en “.ru” claro que les enviaste tu número de tarjeta y los números esos que van atrás para que puedan depositarte tu premio"},
			{"text": "No tengo tiempo para esto", "felicidad": 0, "dinero": 0, "empleados": 0, "consecuencia": "Un genio una vez dijo “yo solo sé, que nada sé”, pero en tu inmensa sabiduría tu aseguras que sabes algo, sabes que todo este correo por leer es problema del tú de mañana"}
		]
	},
	{
		"id": 12,
		"text": "Intercambio de regalos¡¡ las dinámicas como esta mejoran el ambiente laboral. Ahora, la pregunta es ¿Cuánto se gasta? ",
		"npc": 2,
		"optiones": [
			{"text": "Una minucia, un detallito", "felicidad": 0, "dinero": -20, "empleados": +5, "consecuencia": "Una minucia, un detallito Claro que no eres tacaño, solo eres un estratega con su enfoque claro, ser millonario, y los millonarios no tienen su dinero por andar regalándolo, este es un pequeño regalo para tu amigo secreto, pero un gran salto a la riqueza"},
			{"text": "Ni mucho ni poco", "felicidad": 0, "dinero": -40, "empleados": +10, "consecuencia": "Ni mucho ni poco Trata a los demás como te gustaría a ti que te traten, un detalle lindo, decoroso o algo funcional, lo importante es que le guste al otro, no tanto su costo "},
			{"text": "CERO", "felicidad": +5, "dinero": -100, "empleados": +10, "consecuencia": "Por su puesto, el jefe debe encargarse de demostrar su estatus con su regalo en esta actividad que se hiso con el fin de demostrar cercanía entre partes, bien hecho fiera, maquina, torbellino, campeón, tigresa"}
		]
	},
	{
		"id": 13,
		"text": "No lo dudas, lo viste con tus propios ojos, un empleado jugando solitario en horas laborales",
		"npc": 0,
		"optiones": [
			{"text": "Echarlo", "felicidad": 0, "dinero": 0, "empleados": -7, "consecuencia": "después de todo es la respuesta lógica, un ejemplo para que los demás vean que no estás dispuesto a tolerar tonteras y que se anden con cuidado, te sientes bien, además la gente te mira con un poco más de respeto… o miedo, no sé, ¿no es igual?"},
			{"text": "Aquí no ha pasado nada", "felicidad": 0, "dinero": 0, "empleados": -1, "consecuencia": "Por ahora…"},
			{"text": "¿Qué es esta porquería?", "felicidad": -5, "dinero": 0, "empleados": +1, "consecuencia": "Como osa jugar una sencilles tal, ¡¡y en tu oficina!!, no puede más con el insulto a tu persona y decides decirle que juegue sudoku o buscaminas. Decides instalar un cartel que todos puedan ver en la oficina que dice ¡Prohibido el solitario en esta oficina!, en el cartel hay un bufón crucificado "}
		]
	},
	{
		"id": 14,
		"text": "Necesitamos innovaciones, un buen cambio de aires siempre viene a mejor, seguro que si ",
		"npc": 5,
		"optiones": [
			{"text": "Cambiar muebles y pintura", "felicidad": +2, "dinero": 0, "empleados": +1, "consecuencia": "Cambiar muebles y pintura proceso tortuoso, lento y tedioso, pero satisfactorio, al fin y al cabo, es una gran inversión que da sus frutos, realmente la gente parece más contenta"},
			{"text": "Cambiar solo tu oficina", "felicidad": -2, "dinero": 0, "empleados": +1, "consecuencia": "El espacio personal es lo más importante, no caerá bien a los demás, pero, lo que es tu, te lo gozas tanto como gastas en remodelaciones"},
			{"text": "Contratar más empleados", "felicidad": +2, "dinero": 0, "empleados": +1, "consecuencia": "Quizás no la opción más lógica, pero cada persona es un mundo, traer muchos mundos definitivamente es una buena forma de cambiar el ambiente. Tu plan resulta una estrategia extraña, pero efectiva, más sueldos por pagar, pero, aun así, más oportunidades de ganancias y más felicidad en tus muchachines, si hasta da orgullo."}
		]
	},
	{
		"id": 15,
		"text": "El verano se acerca, lo que significa que muchos tomaran sus días de vacaciones, y lamentablemente eso es mucho MUCHO más trabajo para todos, sobre todo para Recursos humanos ",
		"npc": 4,
		"optiones": [
			{"text": "Contratar reemplazos", "felicidad":-1, "dinero": 0, "empleados": +1, "consecuencia": "Todos más relajados gracias a los reemplazos, motivas a todos gracias a que saben que el trabajo será bien distribuido, bien hecho, la productividad ha subido y te regresa con creces lo que usaste para contratar a los reemplazos "},
			{"text": "Contratar practicantes", "felicidad": +2, "dinero": 0, "empleados": +1, "consecuencia": "Tu, yo y medio mundo sabe que esto no puede salir bien, pero puede, PUEDE, que no salga mal, un rendimiento mediocre es mejor que grandes pérdidas"},
			{"text": "Claro que podemos con todo eso", "felicidad": -1, "dinero": 0, "empleados": +1, "consecuencia": "Claro que podemos con todo eso Mala jugada. Jefe malo, nunca más. No trabajadores mal, caca eso (- ganancias"}
		]
	},
	{
		"id": 16,
		"text": "Algún graciosillo ha hecho de las suyas y se escapa al baño a jugar en una consola portátil en horas de trabajo ",
		"npc": 2,
		"optiones": [
			{"text": "Es exactamente lo que yo haría en su lugar", "felicidad": +1, "dinero": 0, "empleados": +1, "consecuencia": "No puedes culparlo, además, todos conocen el sabio proverbio chino que dice “最聪明的人在工作时间去洗手间，只有傻瓜在空闲时间去洗手间。” O como decimos por este lado del charco “Los más sabios van al baño en horario laboral, solo el necio va en hora libre”"},
			{"text": "DESPEDIDO", "felicidad": 0, "dinero": 0, "empleados": +1, "consecuencia": "Después de todo este es tu lugar de trabajo y el que te da de comer cada semana fruto del esfuerzo y el de todos los que en el aportan, que no aportes significa que no eres parte de la manada, la ley de la naturaleza laboral claro está."},
			{"text": "Reprenderlo", "felicidad": 0, "dinero": 0, "empleados": +1, "consecuencia": "Pese a la oportunidad que le has otorgado al susodicho, volvió a sus actitudes. Dicen que los adictos recaen con facilidad, eres testigo de eso ahora. Decides que no quieres lidiar con eso ahora"}
		]
	},
	{
		"id": 17,
		"text": "Se ha pactado un gran trato con un inversionista, esto traerá muchas ganancias, es un gran panorama digno de celebrarse",
		"npc": 3,
		"optiones": [
			{"text": "Celebrar, cena a pedido para todos hoy, tu invitas", "felicidad": 0, "dinero": 0, "empleados": +1, "consecuencia": "Claro que hay que celebrar, la felicidad se siente en el aire, no paras de sonreír y de pedir pizzas con una cuenta que parece no acabarse"},
			{"text": "Negocios son negocios", "felicidad": 0, "dinero": 0, "empleados": +1, "consecuencia": "Decides que las ganancias del trabajo se traducirán en mejores sueldos…  más adelante. "},
			{"text": "Fiesta organizada", "felicidad": 0, "dinero": 0, "empleados": +1, "consecuencia": "Cada uno de tus empleados traerá un aporte pequeño, esto es trabajo en equipo después de todo, por tu parte compras el festín principal "}
		]
	},
	{
		"id": 18,
		"text": "El gobierno ha aprobado una ley que, a la larga exige que instaures un nuevo programa de capacitación que afecta a casi todos tus empleados, es inaudito. ",
		"npc": 2,
		"optiones": [
			{"text": "Pagar los cursos poco a poco", "felicidad": +7, "dinero": +50, "empleados": +1, "consecuencia": "Resulta que pagar de a poco y capacitar a todos a medida que pasa el tiempo, no ha salido de tu presupuesto regular de actividades, y con la nueva reforma implementada con velocidad, tu negocio se ha posicionado como un adelantado en regulaciones El negocio goza de mayor fama, tanto así que ven en tu oficina una gran oportunidad de inversión "},
			{"text": "Pagar la capacitación a todos", "felicidad": 0, "dinero": +50, "empleados": +1, "consecuencia": "Pagar la capacitación a todos Tratar de hacer todo rápido no es realista, algo siempre sale mal, y es así como te saliste mucho del presupuesto, tu negocio se estabilizará, seguro, pero ahora mismo hacen falta unos recortes. El departamento de Dulces y helados para el almuerzo es el primero en caer "},
			{"text": "¿Y a mí qué?", "felicidad": 0, "dinero": -1000, "empleados": 0, "consecuencia": "Creíste ser más veloz y listo que la ley, pero lo triste de ser más veloz que las mentes más brillantes del gobierno, es que ahora te quedas solo en la oscuridad. No hay negocio que puedas concretar, todos revisan que no estas regularizado ni actualizado, tu negocio va directo a la quiebra, no hay vuelta atrás"}
		]
	},
	{
		"id": 19,
		"text": "Manifestaciones por toda la ciudad contra la injusticia social, moral y vegetal, dejan a cientos de empresas y negocios completamente congelados por un tiempo",
		"npc": 1,
		"optiones": [
			{"text": "Generar una Junta y un Plan", "felicidad": +1, "dinero": +85, "empleados": -6, "consecuencia": "Trabajar en un plan para cuando todo acabe organizarse resulta difícil, pero no imposible, estructurar un buen plan de contingencia resulta agotador"},
			{"text": "Apoyar como negocio las manifestaciones","felicidad": -3, "dinero": -85, "empleados": -5, "consecuencia": "buena fama para el negocio, la gente empieza a fijarse en ti, en tu negocio, por otro lado, inversionistas se ven encantados de trabajar con alguien que tiene la confianza de la gente, te ha salido buena jugada."},
			{"text": "No hacer nada", "felicidad": -4, "dinero": 16, "empleados": +4, "consecuencia": "Nadie te juzgara si no lo haces, pero debes tener cuidado de quienes te metes"}
		]
	},
	{
		"id": 20,
		"text": "Te has congestionado, quizás no sea nada… ¿verdad? ",
		"npc": 2,
		"optiones": [
			{"text": "Ir a la oficina", "felicidad": -4, "dinero": 71, "empleados": -2, "consecuencia": "Bueno, que es lo peor que podría pasar? Quizás estornudas sobre alguien y ese alguien se contagie y estornude a otros dos que se propague a otros dos y esos otros dos que escupan, tosan o lo que sea sobre otros dos que dos dos DOS… Al narrador anterior le consumió la paranoia de lo hipotético"},
			{"text": "Faltar", "felicidad": -4, "dinero": -84, "empleados": 4, "consecuencia": "Ser precavido nunca está demás, además, un poco de desorganización que pasa la factura un par de días, no es nada en comparación a la posible epidemia de faltas que acabas de evitar"},
			{"text": "Ir al doctor", "felicidad": 5, "dinero": -4, "empleados": 0, "consecuencia": "Algunos te dirían flojo, o loco por ir al médico solo por un resfrío, pero tú sabes que la preocupación es la clave del éxito en la vida del empresario, de tu salud vives, literalmente, así que pagar un médico y remedios no es lo peor del mundo."}
		]
	},
	{
		"id": 21,
		"text": "Buscando publicitar el negocio te encuentras con muchas alternativas en línea que se ven bien, hay que escoger solo una, el presupuesto no daría para más ",
		"npc": 3,
		"optiones": [
			{"text": "Lo mejor de lo mejor", "felicidad": 5, "dinero": -94, "empleados": -10, "consecuencia": "Pagas un servicio que hace promesas muy jugosas, nadie podría culparte, cualquiera lo hubiera hecho, pero el premium pack para megaempresas para tu modesta Pyme resulta no ser la mejor de las ideas. Generas ganancias, sí, pero la mayoría de lo que produces este mes se va en las facturas por publicidad"},
			{"text": "Algo moderado en precio", "felicidad": -4, "dinero": -58, "empleados": 0, "consecuencia": "Bueno, bonito y barato, las tres B que todo producto o servicio debería tener en la vida. Todo fue tan bien que hasta cubriste los gastos del marketing en solo un mes."},
			{"text": "Tomar la opción más barata", "felicidad": 4, "dinero": -27, "empleados": 0, "consecuencia": "Bueno, era de esperarse, supongo"}
		]
	},
	{
		"id": 22,
		"text": "La nueva red social tin ton ocupa demasiado de tu tiempo, ya sea en casa, en la oficina o incluso en el baño, no paras de ver. Es preocupante ",
		"npc": 2,
		"optiones": [
			{"text": "¡Mi precioso! ¡No se metan con mi precioso!", "felicidad": 1, "dinero": -15, "empleados": -10, "consecuencia": "En vista de que nadie tomará tu teléfono y se embarcará en una encrucijada hasta el volcán más cercano para deshacerse de él, tu vicio sigue, tu capacidad de atención se ve terriblemente afectada y tu productividad baja. No ha sido tu mejor momento, y aunque fuiste a terapia y te trataste, hubo un tiempo en que solo generaste pérdidas "},
			{"text": "Desinstalar", "felicidad": -4, "dinero": 94, "empleados": -5, "consecuencia": "Decides cortar por lo sano, miras tu teléfono y le dices “no eres tú, soy yo, no puedo con todo tu increíble potencial y tus videos de 15 segundos que de alguna manera me tienen horas solo pensando en ti, no pienso en nada más”, tu dedo, tembloroso e indeciso presiona la opción de desinstalar y … y… ya no puedo, esto es muy triste, llamen a alguien"},
			{"text": "Enfoque positivo", "felicidad": 3, "dinero": 90, "empleados": -4, "consecuencia": "Decidiste que, al igual que la gente que se trata por la ira, concentrarás lo que te afecta a un enfoque positivo dándole una vuelta de tuerca. Comienzas a seguir a muchas empresas, ves muchos comerciales, que para tu fortuna suelen ser divertidos, además esta vez, tomas nota, sabes que debe tener tu siguiente anuncio, recolectaste mucha información en base a comentarios, reacciones y cantidad de visitas, al final sacaste provecho de todo "}
		]
	},
	{
		"id": 23,
		"text": "Algunos computadores y otros aparatos electrónicos empiezan a fallar ¿Una baja en el voltaje? ¿un corte general se avecina? Sea lo que sea deberías actuar ya ",
		"npc": 3,
		"optiones": [
			{"text": "Llamar a la gran empresa de electricidad", "felicidad": -3, "dinero": -10, "empleados": 4, "consecuencia": "Un gran poder conlleva una gran responsabilidad. Como tú no sabes nada sobre electricidad más que prender y apagar la tele, decides que tu poder económico puede contratar grandes empresas. Todos en la oficina se van temprano hoy y el problema se soluciona en una sola tarde, no has perdido mucho en productividad. Problema solucionado"},
			{"text": "Encargarte tú", "felicidad": -4, "dinero": 13, "empleados": -3, "consecuencia": "Tus conocimientos sobre corriente eléctrica son equivalentes a lo que sabes sobre mecánica cuántica, suena genial y muchos lo han nombrado, pero realmente se ve como magia para ti. Como era de esperarse, no logras solucionar el problema, te dio la corriente, y aunque nada sucedió, llamaste a un servicio que se encargue"},
			{"text": "No pasa nada por una pequeña falla", "felicidad": -4, "dinero": 46, "empleados": -4, "consecuencia": "Ignorar los problemas no hace que no estén ahí. Horas con bajones de voltaje intermitentes causaron que se quemen muchas computadoras de la oficina, o, en otras palabras, una gran pérdida"}
		]
	},
	{
		"id": 24,
		"text": "Hay muchos documentos por hacer, se ha acumulado documentación que necesita tu revisión y aprobación ",
		"npc": 5,
		"optiones": [
			{"text": "Revisarla toda ", "felicidad": 1, "dinero": -78, "empleados": 5, "consecuencia": "Este es un trabajo colosal, pero tu trabajo, al fin y al cabo, además, seguro tu responsabilidad hasta inspira a tus colegas viendo que la empresa crece gracias a ti"},
			{"text": "Beber café para inspirarte primero", "felicidad": -1, "dinero": -73, "empleados": 1, "consecuencia": "Genial idea, si no fuera porque bebiste el café sobre el papeleo, haciendo que ahora los empleados tengan la titánica tarea, junto a ti, de recuperar esos archivos desde sus correos, volver a imprimirlos y volver a ordenarlos por tiempo. Prometes beber café en botella desde ahora"},
			{"text": "Delegar varios documentos", "felicidad": -1, "dinero": -77, "empleados": 3, "consecuencia": "Ser jefe es genial, te da superpoderes como hacer que otros hagan tu trabajo, y tú sabes eso muy bien. Como era de esperarse, el trabajo que realizan es mediocre y puede que ciertos documentos hayan sido firmados a tu nombre sin una revisión real, pero al menos no lo hiciste tú"}
		]
	},
	{
		"id": 25,
		"text": "Quieres tener la mejor preparación para ser la mejor versión de jefe jamás pensada. Pero ¿cómo lograrlo? ",
		"npc":4,
		"optiones": [
			{"text": "¿Será algo urgente? (Atender)", "felicidad": -2, "dinero": 26, "empleados": 10, "consecuencia": "Hechas un ojo y te encuentras con mensajes de tu pareja, que ha ido a buscar tu hijo. Hoy en clases le enseñaron a hacer manualidades como decoraciones con papel lustre y demás materiales comunes. El punto es que te han hecho una carta y un dibujo alrededor de un bello corazón"},
			{"text": "Seguro no pasa nada (No atender)", "felicidad": -2, "dinero": -98, "empleados": -2, "consecuencia": "Tu familia está consciente de todo lo que duro que trabajas, seguro no son ellos, y si fuese una emergencia llamaría, fuese quien fuera. Por lo que no vale la pena contestar. Asombrado por tu propia lógica irrebatible, vuelves al trabajo"},
			{"text": "tirar el telefono por la ventana", "felicidad": -2, "dinero": 100, "empleados": 6, "consecuencia": "Aqui nadie me hackea, un problema menos"}
		]
	},
	{
		"id": 26,
		"text": "Es hora del almuerzo en el trabajo y una vez más, comes la deliciosa comida cacera que has preparado en casa, nada como el sabor que se logra en el hogar. Notas en la cocina, que alguien está preocupado, ha olvidado su comida y no sabe qué hacer, también olvido su billetera. ",
		"npc": 3,
		"optiones": [
			{"text": "Compartir la mitad de tu comida", "felicidad": 3, "dinero": 23, "empleados": -6, "consecuencia": "Te parte el alma, pero decidiste, en un acto de valentía, honestidad y humildad, compartir lo que tienes con los menos afortunados, eres todo un ejemplo a seguir. Deberían darte humildad + 10 o algo"},
			{"text": "Comprarle algo por internet", "felicidad": -4, "dinero": -25, "empleados": 5, "consecuencia": "Eres muy buena gente como para dejarle sin comida, pero tampoco es para tanto, así que compras algo y a otra cosa mariposa"},
			{"text": "Darle permiso que vaya a buscar sus cosas", "felicidad": 2, "dinero": -23, "empleados": -2, "consecuencia": "Pérdida de tiempo, eso es lo que ha sido, pero, por otro lado, dejar a una persona sin su comida es un poquito feo, por lo que un poco menos de productividad no duele tanto."}
		]
	}
	
	
	
]

#debufoactual
var DefDinero 
var DefFelicidad 
var DefEmpleados

#region plantilla
#	{
#		"id": 5,
#		"text": "",
#		"npc": 1,
#		"optiones": [
#			{"text": "sample", "felicidad": 0, "dinero": 0, "empleados": -5, "consecuencia": "sample"},
#			{"text": "sample", "felicidad": -3, "dinero": 0, "empleados": 2, "consecuencia": "sample"},
#			{"text": "sample", "felicidad": +200, "dinero": +3, "empleados": +10, "consecuencia": "Sample"}
#		]
#	}
#endregion
