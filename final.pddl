(define (problem red1)
  (:domain redriding)

  ; Objects are candidates to replace free variables
  (:objects red granny wolf hunter ax redhome woods graden grannyhome basket flower)

  ; The initial state describe what is currently true
  ; Everything else is considered false
  (:init
    ; Characters are at their initial places
    (at red redhome) (at granny grannyhome) (at wolf woods) (at hunter woods)
    (alive red) (alive granny) (alive wolf) (alive hunter)
    (predator wolf)
    (saver hunter)
    ; check is person
    (isperson red) (isperson granny) (isperson hunter)

    ; Red has a basket, hunter has ex, woods with flower
    (have red basket) (have graden flower) (have hunter ax)
    (isweapon ax)
  )

  ; The goal state describe what we desire to achieve
  (:goal (and
    ; Discs stacked on peg3
    (have granny basket)
    (asleep wolf grannyhome)
    (not (alive wolf))
    (save hunter red grannyhome)
    (save hunter granny grannyhome)
    )
  )
)
