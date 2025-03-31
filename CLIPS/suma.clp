(deftemplate lista
   (multislot valores (type INTEGER)))

(defrule suma-valores
   (lista (valores $?lista))
   =>
   (bind ?aux 0)
   (foreach ?num ?lista
      (bind ?aux (+ ?aux ?num)))
   (printout t "La suma de los elementos es: " ?aux crlf))

(deffacts elementos (lista (valores 1 2 3 4 5 6)))