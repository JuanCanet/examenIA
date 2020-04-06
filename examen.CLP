(deffacts montacargas
(montacargas 0 0)
(planta 0 0 0)
(planta 1 300 3)
(planta 2 500 3)
(planta 2 300 4)
(planta 3 0 0)
(planta 4 0 0)
)


(defrule mover-montacargas
(planta ?x ?y ?z)
?f<-(montacargas ?planta ?peso)
(test (= ?x ?planta))
(test (= ?y 0))
=>
;(retract ?f)
(assert(montacargas ?x ?y))
)

(defrule coger-carga
(planta ?x ?y ?z)
?f<-(montacargas ?planta ?peso)
(test (= ?x ?planta))
(test (<= (+ ?peso ?y) 650))
=>
;(retract ?f)
(assert(montacargas ?x ?y))
(assert(planta ?x 0 ?z))
)

(defrule dejar-carga
(planta ?x ?y ?z)
?f<-(montacargas ?planta ?peso)
(test (= ?x ?planta))
(test (= ?y 0))
=>
;(retract ?f)
(assert(montacargas ?x ?y))
)
