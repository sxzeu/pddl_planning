; Domain description
; Describe the relations and transitions that can occur
; This one describes the Tower of Hanoi puzzle
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
    (ismeet ?person1 ?person2) ; person1 and person2 is meet?
    (beast ?person) ;person is beast
    (alive ?person) 
    (killer ?person)
    (asleep ?person)
    (killed ?person1)      
    (information ?obj)
    (isweapon ?obj)
    (know ?person1 ?obj)
    (eat ?person1 ?person2)
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
  )
  
  ; Define an action to give an object from one person to another person
  (:action give
    :parameters (?person1 ?person2 ?loc ?obj)
    ; Only conjunction or atomic preconditions are supported
    :precondition (and
      (ismeet ?person1 ?person2)
      (have ?person1 ?obj)
      (alive ?person1)
      (alive ?person2)
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

  ; Define an action is two object at same place
  (:action meet
    :parameters (?person1 ?person2 ?loc)
    :precondition(and
      (at ?person1 ?loc)
      (at ?person2 ?loc)
      (alive ?person1)
      (alive ?person2)
      (not (ismeet ?person1 ?person2))
      (not (ismeet ?person2 ?person1))
    )
    :effect(and
      (ismeet ?person1 ?person2)
      (ismeet ?person2 ?person1)
    )
  )

  ; 
  (:action eat-alive
      :parameters (?person1 ?person2 ?loc)
      :precondition (and 
        (beast ?person1)
        (alive ?person2)
        (ismeet ?person1 ?person2)
      )
      :effect (and 
        (not(alive ?person2))
        (eat ?peron1 ?person2)
      )
  )
  
  (:action sleep
      :parameters (?person1 ?loc)
      :precondition (and 
        (alive ?person1)
        (not (alive red))
        (not (alive granny))
      )
      :effect (and
        (asleep ?person1)
      )
  )
  
  (:action kill
      :parameters (?person1 ?person2 ?loc ?weapon)
      :precondition (and 
        (asleep ?person2)
        (meet ?person1 ?person2 ?loc)
        (have ?person1 ?weapon)
        (isweapon ?weapon)
        (not(alive red))
        (not(alive granny)))
      )
      :effect (and 
        (not (alive ?person2))
      )
  )

  (:action save
      :parameters (?person1 ?person2 ?loc)
      :precondition (and 
        (not(alive ?person2))
        (at ?person2 ?loc)
      )
      :effect (and 
        (alive ?person2)
      )
  )
  
  (:action tell 
      :parameters (?person1 ?person2 ?loc ?obj)
      :precondition (and
        (know ?person1 ?obj)
        (meet ?person1 ?person2 ?loc)
        (alive ?person1)
        (alive ?person2)
       )
      :effect (and 
        (know ?person2 ?obj)
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
  


  ; Other transitions can be defined here
)