:- dynamic tiene_habilidad/1.
:- dynamic tiene_interes/1.
:- dynamic tiene_personalidad/1.
:- dynamic prefiere_condicion/1.

carrera(ingenieria_de_sistemas) :-
    tiene_habilidad(matematicas),
    tiene_habilidad(pensamiento_logico),
    tiene_interes(tecnologia),
    tiene_personalidad(analitico).

carrera(medicina) :-
    tiene_habilidad(biologia),
    tiene_interes(salud),
    tiene_personalidad(empatico),
    prefiere_condicion(trabajo_en_equipo).

carrera(derecho) :-
    tiene_habilidad(argumentacion),
    tiene_interes(leyes),
    tiene_personalidad(diplomatico),
    prefiere_condicion(interaccion_social).

carrera(arquitectura) :-
    tiene_habilidad(creatividad),
    tiene_habilidad(dibujo),
    tiene_interes(construccion),
    tiene_personalidad(innovador).

carrera(psicologia) :-
    tiene_interes(comportamiento_humano),
    tiene_habilidad(escucha_activa),
    tiene_personalidad(empatico),
    prefiere_condicion(interaccion_social).

carrera(administracion_de_empresas) :-
    tiene_habilidad(liderazgo),
    tiene_interes(gestion),
    tiene_personalidad(organizado),
    prefiere_condicion(toma_decisiones).

carrera(ingenieria_civil) :-
    tiene_habilidad(matematicas),
    tiene_interes(construccion),
    tiene_personalidad(meticuloso),
    prefiere_condicion(liderazgo).

carrera(ingenieria_industrial) :-
    tiene_habilidad(matematicas),
    tiene_habilidad(liderazgo),
    tiene_interes(optimizacion),
    tiene_personalidad(analitico).

carrera(economia) :-
    tiene_habilidad(matematicas),
    tiene_interes(finanzas),
    tiene_personalidad(pensamiento_critico),
    prefiere_condicion(analisis_datos).

carrera(contabilidad) :-
    tiene_habilidad(matematicas),
    tiene_interes(numeros),
    tiene_personalidad(meticuloso).

carrera(diseno_grafico) :-
    tiene_habilidad(creatividad),
    tiene_interes(diseno),
    tiene_personalidad(innovador).

carrera(marketing) :-
    tiene_habilidad(creatividad),
    tiene_habilidad(liderazgo),
    tiene_interes(publicidad),
    tiene_personalidad(extrovertido).

carrera(biologia) :-
    tiene_interes(investigacion),
    tiene_habilidad(biologia),
    tiene_personalidad(observador).

carrera(fisica) :-
    tiene_interes(investigacion),
    tiene_habilidad(fisica),
    tiene_personalidad(analitico).

carrera(quimica) :-
    tiene_interes(investigacion),
    tiene_habilidad(quimica),
    tiene_personalidad(detallista).

carrera(educacion) :-
    tiene_interes(ensenanza),
    prefiere_condicion(interaccion_social),
    tiene_personalidad(empatico).

carrera(turismo) :-
    tiene_interes(viajes),
    prefiere_condicion(interaccion_social),
    tiene_personalidad(extrovertido).

carrera(relaciones_internacionales) :-
    tiene_habilidad(argumentacion),
    tiene_interes(culturas),
    prefiere_condicion(interaccion_social),
    tiene_personalidad(diplomatico).

preguntar(Pregunta, Hecho) :-
    format('~w (si/no): ', [Pregunta]),
    read(Respuesta),
    (Respuesta == si -> assertz(Hecho); true).

hacer_preguntas :-
    preguntar('¿Tienes liderazgo?', tiene_habilidad(liderazgo)),
    preguntar('¿Te interesa la construcción?', tiene_interes(construccion)),
    preguntar('¿Prefieres trabajar con datos?', prefiere_condicion(analisis_datos)),
    preguntar('¿Te gustan los números?', tiene_interes(numeros)),
    preguntar('¿Eres innovador?', tiene_personalidad(innovador)),
    preguntar('¿Te interesa la publicidad?', tiene_interes(publicidad)),
    preguntar('¿Eres extrovertido?', tiene_personalidad(extrovertido)),
    preguntar('¿Te gusta investigar?', tiene_interes(investigacion)),
    preguntar('¿Eres detallista?', tiene_personalidad(detallista)),
    preguntar('¿Te interesa enseñar?', tiene_interes(ensenanza)),
    preguntar('¿Te gustan los viajes?', tiene_interes(viajes)),
    preguntar('¿Te interesan otras culturas?', tiene_interes(culturas)),
    preguntar('¿Eres diplomático?', tiene_personalidad(diplomatico)),
    preguntar('¿Tienes habilidad en matemáticas?', tiene_habilidad(matematicas)),
    preguntar('¿Tienes pensamiento analítico?', tiene_personalidad(analitico)),
    preguntar('¿Te interesa la optimización de procesos?', tiene_interes(optimizacion)),
    preguntar('¿Te interesan las finanzas?', tiene_interes(finanzas)),
    preguntar('¿Tienes creatividad?', tiene_habilidad(creatividad)),
    preguntar('¿Te interesa el diseño?', tiene_interes(diseno)),
    preguntar('¿Tienes habilidad en biología?', tiene_habilidad(biologia)),
    preguntar('¿Tienes habilidad en física?', tiene_habilidad(fisica)),
    preguntar('¿Tienes habilidad en química?', tiene_habilidad(quimica)),
    preguntar('¿Te consideras empático?', tiene_personalidad(empatico)),
    preguntar('¿Te gusta la interacción social?', prefiere_condicion(interaccion_social)),
    preguntar('¿Tienes habilidades de argumentación?', tiene_habilidad(argumentacion)),
    preguntar('¿Eres una persona observadora?', tiene_personalidad(observador)),
    preguntar('¿Eres meticuloso?', tiene_personalidad(meticuloso)).

recomendar_carrera :-
    findall(Carrera, carrera(Carrera), Carreras), (
        Carreras \= [] ->
            format('Carreras recomendadas: ~w~n', [Carreras])
        ;
            write('No se encontraron carreras recomendadas.'), nl
    ),
    retractall(tiene_habilidad(_)),
    retractall(tiene_interes(_)),
    retractall(tiene_personalidad(_)),
    retractall(prefiere_condicion(_)).
