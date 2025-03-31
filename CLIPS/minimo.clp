
(deftemplate lista
   (multislot valores (type INTEGER)))

(defrule encontrar-minimo
   (lista (valores $?lista))
   =>
   (bind ?minimo (nth$ 1 ?lista))
   (foreach ?num ?lista
      (if (< ?num ?minimo) then
         (bind ?minimo ?num)))
   (printout t "El mínimo valor en la lista es: " ?minimo crlf))

(deffacts elementos (lista (valores 9 7 6 1 3 4 8 2 16 32)))
