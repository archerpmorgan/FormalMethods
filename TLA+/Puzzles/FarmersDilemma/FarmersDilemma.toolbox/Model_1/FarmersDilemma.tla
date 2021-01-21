--------------------------- MODULE FarmersDilemma ---------------------------

(************************************************************************************************)
(* This specification is intended to solve the Farmer's Dilemma riddle as explained here:       *)
(* https://www.popularmechanics.com/technology/a23689/riddle-of-the-week-1-the-farmers-dilemma/ *)

(* "store" is intended to mean the store side of the river, and likewise with "farm"            *)
(* "boat" represents which side of the river the farmer and boat are currently on.              *)

(* "There are two dissallowed pairings on any side, (fox,chicken) and the cheicken with corn"   *)
(************************************************************************************************)

EXTENDS Sequences, Integers, FiniteSets
VARIABLES store, farm, boat

passengers == {"chicken", "fox", "corn"}
danger     == {{"corn"}, {"fox"}} \* if either side has one of these values, we have a problem

TypeOK == /\ store \in SUBSET passengers
          /\ farm  \in SUBSET passengers
          /\ boat  \in {"store", "farm"}

Init == (boat = "store") 
     /\ (store = {"chicken", "fox", "corn"}) 
     /\ (farm = {})

\* what can possibly be brought to the other side
choices(x) == {{y}: y \in x} \union {{}}


StoreToFarm ==  /\ boat = "store"
                /\ boat' = "farm"
                /\ farm' \in ({farm \union y: y \in choices(store)} \ danger)
                /\ store' = passengers \ farm'

FarmToStore ==  /\ boat = "farm"
                /\ boat' = "store"
                /\ store' \in ({store \union y: y \in choices(farm)} \ danger)
                /\ farm' = passengers \ store'               
          
           
Next == FarmToStore \/ StoreToFarm  


(****************************************************************************)
(* We find a solution when we fail to satisfy the invariant predicate that *)
(* not everyone is at the farm.                                             *)
(****************************************************************************)
NotSolved == ~(farm \in SUBSET passengers /\ passengers \in SUBSET farm)
NobodyIsLost == (farm \union store) \in SUBSET passengers /\ passengers \in SUBSET (farm \union store) \* we don't lose anybody
ConstantSize == Cardinality(farm) + Cardinality(store) = 3

=============================================================================
\* Modification History
\* Last modified Wed Jan 20 17:56:01 PST 2021 by archermorgan
\* Created Wed Jan 20 11:51:18 PST 2021 by archermorgan
\* 
