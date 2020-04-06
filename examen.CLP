(deffacts montacargas
(montacargas 0 0)
(planta 0 0)
(planta 1 300)
(planta 2 500)
(planta 2 300)
(planta 3 0)
(planta 4 0)
)

(defrule coger-carga
(planta ?x ?y)
?f<-(montacargas ?planta  ?peso)
(test (= ?x ?planta))
(test (<= ?peso 650))
=>
;(retract ?f)
(assert(montacargas ?x ?y))
)
