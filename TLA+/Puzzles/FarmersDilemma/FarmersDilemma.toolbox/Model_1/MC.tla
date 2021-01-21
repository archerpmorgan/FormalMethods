---- MODULE MC ----
EXTENDS FarmersDilemma, TLC

\* Constant expression definition @modelExpressionEval
const_expr_1611194165821163000 == 
 {   {1, 3} \union y: y \in {{2}, {}} }\ {{2,3}, {1,2}}    



----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1611194165821163000>>)
----

=============================================================================
\* Modification History
\* Created Wed Jan 20 17:56:05 PST 2021 by archermorgan
