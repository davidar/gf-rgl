concrete SentenceSom of Sentence = CatSom ** open
  TenseX, ResSom, (AS=AdverbSom), Prelude in {

flags optimize=all_subs ;

lin

--2 Clauses

  -- : NP -> VP -> Cl
  PredVP = predVP ;

  -- : SC -> VP -> Cl ;         -- that she goes is good (Sayeed p. 94)
  --PredSCVP sc vp = ;

--2 Clauses missing object noun phrases
  -- : NP -> VPSlash -> ClSlash ;
  SlashVP = predVPSlash ;
{-
  -- : ClSlash -> Adv -> ClSlash ;     -- (whom) he sees today
  AdvSlash cls adv = cls ** insertAdv adv cls ;

--    SlashPrep : Cl -> Prep -> ClSlash ;         -- (with whom) he walks

  -- : NP -> VS -> SSlash -> ClSlash ; -- (whom) she says that he loves
--  SlashVS np vs ss = {} ;

-}
  --  : Temp -> Pol -> ClSlash -> SSlash ; -- (that) she had not seen
  UseSlash t p cls = {s = \\b =>
    let sent = cls.s ! b ! t.t ! t.a ! p.p in
    sent ** {beforeSTM = t.s ++ p.s ++ sent.beforeSTM}
    } ;

--2 Imperatives
  -- : VP -> Imp ;
 --ImpVP vp = { s = linVP vp } ;

--2 Embedded sentences

{-
  -- : S  -> SC ;
  EmbedS s = { } ;

  -- : QS -> SC ;
  EmbedQS qs = { } ;

  -- : VP -> SC ;
  EmbedVP vp = { s = linVP vp } ;

--2 Sentences

-}
  -- : Temp -> Pol -> Cl -> S ;
  UseCl t p cl = {s = \\b =>
    let cltyp = if_then_else ClType b Subord Statement ;
        sent = cl.s ! cltyp ! t.t ! t.a ! p.p in
    sent ** {beforeSTM = t.s ++ p.s ++ sent.beforeSTM} ;
    } ;

  -- : Temp -> Pol -> QCl -> QS ;
  UseQCl t p cl = {s = t.s ++ p.s ++ cl.s ! t.t ! t.a ! p.p} ;

  -- : Temp -> Pol -> RCl -> RS ;
  UseRCl t p cl = {s = \\g,c => t.s ++ p.s ++ cl.s ! g ! c ! t.t ! t.a ! p.p} ;

  -- AdvS : Adv -> S  -> S ;            -- then I will go home
  -- ExtAdvS : Adv -> S  -> S ;         -- next week, I will go home
  AdvS, ExtAdvS = advS ;

-- There's an SubjS already in AdverbSom -- should this be deprecated?
  -- : S -> Subj -> S -> S ;
  SSubjS s1 subj s2 = AdvS (AS.SubjS subj s2) s1 ;

  --  : S -> RS -> S ;              -- she sleeps, which is good
  -- RelS sent rs = advS {s = rs.s ! Sg3 Masc ++ SOFT_BIND ++ ","} sent ;

oper

  advS : Adverb -> S -> S = \a,s -> s ** {s = \\b => let ss = s.s ! b in
    ss ** {beforeSTM = linAdv a ++ ss.beforeSTM}} ;

}
