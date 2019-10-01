------------------------------ MODULE Building ------------------------------
CONSTANT PEOPLE

VARIABLE register,
         in,
         out
         
Init ==
    /\ register = {}
    /\ in = {}
    /\ out = {}
    
Register(p) ==
    /\ p \in PEOPLE \ register
    /\ register' = register \cup {p}
    /\ out' = out \cup {p}
    /\ in' = in
    
Enter(p) ==
    /\ p \in PEOPLE /\ p \in register /\ p \in out
    /\ in' = in \cup {p}
    /\ out' = out \ {p}
    /\ register' = register
    
Leave(p) == 
    /\ p \in in
    /\ out' = out \cup {p}
    /\ in' = in \ {p}
    /\ register' = register
    
Next == 
    \E p \in PEOPLE :
        \/ Register(p)
        \/ Enter(p)
        \/ Leave(p)
        
Spec == Init /\ [][Next]_<<register,in,out>>


TypeOK ==
    /\ register \subseteq PEOPLE
    /\ register = in \cup out
    /\ in \cap out = {}
    
THEOREM Spec => TypeOK
    =============================================================================
\* Modification History
\* Last modified Tue Oct 01 13:21:41 BST 2019 by student
\* Created Tue Oct 01 12:43:02 BST 2019 by student

