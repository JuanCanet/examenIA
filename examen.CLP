(deffacts montacargas
(montacargas 0 0 0)
(planta 0 0 0)
(planta 1 300 3)
(planta 2 500 3)
(planta 2 300 4)
(planta 3 0 0)
(planta 4 0 0)
)


(defrule mover-montacargas-arriba
?f<-(montacargas ?planta ?peso ?destino)
(test (< ?planta 4))
(test (>= ?planta 0))
=>
(assert(montacargas (+ ?planta 1) ?peso ?destino))
)

(defrule mover-montacargas-abajo
?f<-(montacargas ?planta ?peso ?destino)
(test (= ?planta 4))
=>
(assert(montacargas 0 ?peso ?destino))
)

(defrule coger-carga
(planta ?x ?y ?z)
?f<-(montacargas ?planta ?peso ?destino)
(test (= ?x ?planta))
(test (<= (+ ?peso ?y) 650))
(test (> ?z 0))
(test (> ?y 0))
=>
(assert(montacargas ?x ?y ?z))
(assert(planta ?x 0 0))
)

(defrule dejar-carga
(planta ?x ?y ?z)
?f<-(montacargas ?planta ?peso ?destino)
(test (= ?x ?planta))
(test (= ?x ?destino))
(test (> ?destino 0))
(test (> ?peso 0))
=>
(assert(montacargas ?x 0 0))
(assert(planta ?x (+ ?y ?peso) 0))
)

(defrule finalizar
(planta ?x ?y ?z)
?f<-(montacargas ?planta ?peso ?destino)
(test (= ?z 800))
=>
(halt)
)