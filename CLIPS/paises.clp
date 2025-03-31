(deftemplate Pais
  (slot Nombre)
  (multislot Bandera))

(deffacts Paises
  (Pais (Nombre Argentina) (Bandera Blanco Celeste))
  (Pais (Nombre Brasil) (Bandera Verde Amarillo Azul Blanco))
  (Pais (Nombre Alemania) (Bandera Negro Rojo Amarillo))
  (Pais (Nombre España) (Bandera Rojo Amarillo))
  (Pais (Nombre Francia) (Bandera Azul Blanco Rojo))
  (Pais (Nombre Italia) (Bandera Verde Blanco Rojo)))

(deffunction subset (?list1 ?list2)
  (if (eq (length$ ?list1) 0) 
      then (return TRUE))
  (if (member$ (nth$ 1 ?list1) ?list2)
      then (return (subset (rest$ ?list1) ?list2))
      else (return FALSE)))

(defrule Buscar-Paises
  (declare (salience 10))
  ?f <- (ColoresABuscar $?colores)
  ?p <- (Pais (Nombre ?nombre) (Bandera $?bandera))
  (test (subset $?colores $?bandera))
  =>
  (printout t ?nombre crlf))

(deffacts Consulta (ColoresABuscar Blanco Amarillo))