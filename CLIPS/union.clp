(deftemplate lista
    (multislot valores (type SYMBOL)))

(deffacts datos-iniciales
    (lista (valores B C A D E E B C E))
    (lista (valores E E B C A F E)))

(defrule calcular-union
    ?f1 <- (lista (valores $?lista1))
    ?f2 <- (lista (valores $?lista2))
    (not (procesado))
    =>
    (bind ?unicos (create$))
    
    (foreach ?elem ?lista1
        (if (not (member$ ?elem ?unicos))
            then
            (bind ?unicos (create$ ?unicos ?elem))))
    
    (foreach ?elem ?lista2
        (if (not (member$ ?elem ?unicos))
            then
            (bind ?unicos (create$ ?unicos ?elem))))
    
    (printout t "La unión de los elementos es: (union")
    (foreach ?item ?unicos
        (printout t " " ?item))
    (printout t ")" crlf)
    
    (assert (procesado)))