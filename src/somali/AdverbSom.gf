concrete AdverbSom of Adverb = CatSom ** open ResSom, ParamSom, ParadigmsSom, Prelude in {

lin

  -- : A -> Adv ;
  --PositAdvAdj adj = { } ;

  -- : CAdv -> A -> NP -> Adv ; -- more warmly than John
  -- ComparAdvAdj cadv a np = { } ;

--    ComparAdvAdjS : CAdv -> A -> S  -> Adv ; -- more warmly than he runs

  -- : Prep -> NP -> Adv ;
  PrepNP prep np = prep ** {s = [] ; np = nplite np} ;

-- Adverbs can be modified by 'adadjectives', just like adjectives.

    --AdAdv  : AdA -> Adv -> Adv ;             -- very quickly
  AdAdv ada adv = adv ** {berri = ada.s ++ adv.berri} ;
-- Like adverbs, adadjectives can be produced by adjectives.

  -- : A -> AdA ;                 -- extremely
--  PositAdAAdj a = { } ;
-- Subordinate clauses can function as adverbs.

    -- : Subj -> S -> Adv ;
  SubjS subj s = let subs = s.s ! True in
    mkAdv (subs.beforeSTM ++ subj.s ++ subs.stm ++ subs.afterSTM) ;

-- Comparison adverbs also work as numeral adverbs.

    --AdnCAdv : CAdv -> AdN ;                  -- less (than five)
    --AdnCAdv cadv = {s = } ;
} ;
