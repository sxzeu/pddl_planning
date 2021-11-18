; Problem description
; Describe one scenario within the domain constraints
; This one describes the Tower of Hanoi with 3 discs
(define (problem red1)
  (:domain redriding)

  ; Objects are candidates to replace free variables
  (:objects red granny wolf redhome woods grannyhome basket)

  ; The initial state describe what is currently true
  ; Everything else is considered false
  (:init
    ; Characters are at their initial places
    (at red redhome) (at granny grannyhome) (at wolf woods)

    ; Red has a basket
    (have red basket) 

    ; is member alive?
    (alive red) (alive granny) (alive wolf)

  )

  ; The goal state describe what we desire to achieve
  (:goal (and
    ; Discs stacked on peg3
    (have granny basket)
  ))
)