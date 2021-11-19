(define (problem red1)
  (:domain redriding)

  ; Objects are candidates to replace free variables
  (:objects red granny wolf redhome woods graden grannyhome basket flower)

  ; The initial state describe what is currently true
  ; Everything else is considered false
  (:init
    ; Characters are at their initial places
    (at red redhome) (at granny grannyhome) (at wolf woods)
    (alive red) (alive granny) (alive wolf)
    (predator wolf)

    ; Red has a basket, hunter has ex, woods with flower
    (have red basket) (have graden flower)
  )

  ; The goal state describe what we desire to achieve
  (:goal (and
    ; Discs stacked on peg3
    (have red flower)
    (at red grannyhome)
    (asleep wolf grannyhome)
    
    )
  )
)
