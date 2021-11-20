(define (domain redriding) ; Domain name must match problem's

  ; Define what the planner must support to execute this domain
  ; Only domain requirements are currently supported
  (:requirements
    :strips                 ; basic preconditions and effects
    :negative-preconditions ; to use not in preconditions
    :equality               ; to use = in preconditions
    ; :typing               ; to define type of objects and parameters
  )

  ; Define the relations
  ; Question mark prefix denotes free variables
  (:predicates
    (have ?person ?obj)    ; ?person has ?obj
    (at ?person ?loc)      ; ?person is at ?loc
    (ismeet ?person1 ?person2 ?loc) ; person1 and person2 is meet?
    (alive ?person)
    (predator ?person)
    (asleep ?person ?loc)
    (isweapon ?obj)
    (save ?person1 ?person2 ?loc)
    (isperson ?person)
    (saver ?person)
  )

  ; Define a transition to move a person from one place to another
  (:action move
    :parameters (?person ?from ?to)
    ; Only conjunction or atomic preconditions are supported
    :precondition (and
      (at ?person ?from)
      (not (= ?from ?to)) ; Negative precondition and equality
      (alive ?person)
    )
    ; Only conjunction or atomic effects are supported
    :effect (and
      ; Note that adding the new relations is not enough
      (at ?person ?to)
      ; Remove the old relations, order is not important
      (not (at ?person ?from))
      )
    )
  ; Define an action to give an object from one person to another perso
   (:action give
    :parameters (?person1 ?person2 ?loc ?obj)
    ; Only conjunction or atomic preconditions are supported
    :precondition (and
      (at ?person1 ?loc)
      (at ?person2 ?loc)
      (have ?person1 ?obj)
      (not (have ?person2 ?obj)) ; Negative precondition and equality
    )
    ; Only conjunction or atomic effects are supported
    :effect (and
      ; Note that adding the new relations is not enough
      (have ?person2 ?obj)
      ; Remove the old relations, order is not important
      (not (have ?person1 ?obj))
    )
  )  
      (:action sleep
      :parameters (?person1 ?loc)
      :precondition (and 
        (at ?person1 ?loc)
        (not(alive red))
        (not(alive granny))
      )
      :effect (and
        (asleep ?person1 ?loc)
      )
  )
    (:action eat-alive
      :parameters (?person1 ?person2 ?loc)
      :precondition (and 
        (at ?person1 ?loc)
        (at ?person2 ?loc)
        (predator ?person1)
        (alive ?person2)
        (alive ?person1)
        (not (=?person1 ?person2))
      )
      :effect (and 
        (not(alive ?person2))
      )
    )
  (:action pick_flowers
      :parameters (?person1 ?loc)
      :precondition (and 
        (at ?person1 ?loc)
        (have ?loc flower)
      )
      :effect (and 
        (have ?person1 flower)
      )
  )
  (:action kill
      :parameters (?person1 ?person2 ?loc ?obj)
      :precondition (and
        (at ?person1 grannyhome)
        (at ?person1 ?loc)
        (asleep ?person2 grannyhome)
        (have ?person1 ?obj)
        (predator ?person2)
        (saver ?person1)
        (isweapon ?obj))
      :effect (and 
        (not(alive ?person2))
      )
  )
      (:action save
      :parameters (?person1 ?person2 ?loc)
      :precondition (and 
        (at hunter grannyhome)
        (isperson ?person2)
        (not (=?person1 ?person2))
        (not (alive wolf))
        (saver ?person1)
      )
      :effect (and 
        (alive ?person2)
        (save ?person1 ?person2 ?loc)
      )
  )

  ; Other transitions can be defined here
)
