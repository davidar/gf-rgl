concrete NounSom of Noun = CatSom ** open ResSom, Prelude in {

  flags optimize=all_subs ;

  lin

--2 Noun phrases

-- : Det -> CN -> NP
  DetCN det cn = useN cn ** {
    s = sTable ;
    st = det.st ;
    a = getAgr det.n (gender cn) } where {
      sTable : Case => Str = \\c =>
         let nfc : {nf : NForm ; c : Case} =
             case <det.isNum,c,cn.hasMod,det.st,det.n> of {
                -- Numbers
                <True,_,_,_,_> => {nf=Numerative ; c=c} ;

                -- special form for fem. nouns
                <_,Nom,False,Indefinite,Sg> => {nf=NomSg ; c=c} ;

                -- If cn has modifier, Nom ending attaches to the modifier
                <_,Nom,True,_,_> => {nf=Def det.n ; c=Abs} ;

                -- Definite
                <_,_,False,Definite,n> => {nf=Def n ; c=c} ;

                <_,_,False,Indefinite,n>  => {nf=Indef n ; c=c} ;

                _ => {nf=Def det.n ; c=c} -- TODO check
             } ;
          art = gda2da cn.gda ! det.n ;
          num = case det.isNum of {True => Sg ; _ => det.n} ;
          dt : {pref,s : Str} =
            case <nfc.nf,cn.isPoss,andB det.isPoss cn.shortPoss> of {
              <Numerative,_,_> => {s = [] ; pref = det.s ! art ! nfc.c} ; -- determiner comes before CN
              <_,      True,_> => {pref = [] ; s = det.sp ! gender cn ! nfc.c} ; -- CN has undergone ComplN2 and is already quantified
              <_,_,      True> => {pref = [] ; s = BIND ++ det.shortPoss ! art} ;
              _                => {pref = [] ; s = det.s ! art ! nfc.c}
            } ;
        in dt.pref -- if det is numeral
        ++ cn.s ! nfc.nf
        ++ dt.s -- non-numeral det
        ++ cn.mod ! det.st ! num ! c
    } ;

  -- : PN -> NP ;
  UsePN pn = pn ** {
    s = \\c => pn.s ;
    isPron = False ;
    st = Definite ;
    empty = [] ;
    } ;

  -- : Pron -> NP ;
  UsePron pron = pron ** {st = Definite} ;

  -- : Predet -> NP -> NP ; -- only the man
  PredetNP predet np = np ** {
    s = \\c => predet.s ++ np.s ! c ---- ?
    } ;


-- A noun phrase can also be postmodified by the past participle of a
-- verb, by an adverb, or by a relative clause


  -- : NP -> V2  -> NP ;    -- the man seen
  -- PPartNP np v2 = np ** {
  --   s = \\c => v2.s ! ??? ++ np.s ! c } ; ----

  -- : NP -> Adv -> NP ;    -- Paris today ; boys, such as ..
  --AdvNP,ExtAdvNP = \np,adv -> np ** {} ; --adverbs are complicated

  -- : NP -> RS  -> NP ;    -- Paris, which is here
  RelNP np rs = np ** {
    s = \\c => objpron np ! c ++ rs.s ! npgender np ! c ;
    isPron = False ;
    } ;

-- Determiners can form noun phrases directly.

  -- : Det -> NP ;
  DetNP det = emptyNP ** {
    s = det.sp ! Masc ; ---- Any way to decide for gender here?
    a = getAgr det.n Masc ;
    isPron = False ;
    } ;

  -- MassNP : CN -> NP ;
  MassNP cn = useN cn ** {
    s = table { Nom => cn.s ! NomSg ++ cn.mod ! Indefinite ! Sg ! Nom ;
                c   => cn.s ! Indef Sg ++ cn.mod ! Indefinite ! Sg ! c }
    } ;


--2 Determiners

-- The determiner has a fine-grained structure, in which a 'nucleus'
-- quantifier and an optional numeral can be discerned.

  -- : Quant -> Num -> Det ;
  DetQuant quant num = let indep = Hal in quant ** {
    s = \\da,c =>
            case num.isNum of {
               True => num.s ! indep ++ quant.s ! num.da ! c ++ num.thousand ;
               False => num.s ! indep ++ quant.s ! da ! c ++ num.thousand } ;

    sp = \\g,c => case <num.n,g> of { -- TODO check what happens when num.isNum
          <Sg,Masc> => num.s ! indep ++ quant.sp ! SgMasc ! c ++ num.thousand ;
          <Sg,Fem> => num.s ! indep ++ quant.sp ! SgFem ! c ++ num.thousand ;
          -- Independent form uses plural morpheme, not gender-flipped allomorph
          <Pl,_> => num.s ! indep ++ quant.sp ! PlInv ! c ++ num.thousand } ;
    isNum = num.isNum ;
    n = num.n
    } ;
    -- d = case <num.isNum,quant.st> of {
    --       <True,_> => Numerative ;
    --       <False,Definite> => Def num.n quant.v ;
    --       <False,Indefinite> => Indef num.n } ;

  -- : Quant -> Num -> Ord -> Det ;  -- these five best
  DetQuantOrd quant num ord =
    let theseFive = DetQuant quant num in theseFive ** {
      s = \\g,c  => theseFive.s ! g ! c  ++ ord.s ;
      sp = \\g,c => theseFive.sp ! g ! c ++ ord.s
      } ;

-- Whether the resulting determiner is singular or plural depends on the
-- cardinal.

-- All parts of the determiner can be empty, except $Quant$, which is
-- the "kernel" of a determiner. It is, however, the $Num$ that determines
-- the inherent number.

  NumSg = baseNum ;
  NumPl = baseNum ** {n = Pl} ;

  -- : Card -> Num ;
  NumCard card = card ** {isNum = True} ;

  -- : Digits  -> Card ;
--  NumDigits dig = { s = dig.s ! NCard ; n = dig.n } ;

  -- : Numeral -> Card ;
  NumNumeral num = num ; -- ** {s = num.s ! NCard};

{-
  -- : AdN -> Card -> Card ;
  AdNum adn card = card ** { s = adn.s ++ card.s } ;

  -- : Digits  -> Ord ;
  OrdDigits digs = digs ** { s = digs.s ! NOrd } ;
-}
  -- : Numeral -> Ord ;
  OrdNumeral num = num ** {s = num.ord} ;

{-
  -- : A       -> Ord ;
  OrdSuperl a = {  } ;

-- One can combine a numeral and a superlative.

  -- : Numeral -> A -> Ord ; -- third largest
  OrdNumeralSuperl num a = num ** {  } ;
-}

  -- : Quant
  DefArt = defQuant "a" "kan" "tan" "kuwan" False ;

  -- : Quant
  IndefArt = indefQuant ** {sp = \\gn,c => "1"} ; -- TODO sp forms

  -- : Pron -> Quant
  PossPron pron =
    let p = pron.poss ;
     in DefArt ** {
          shortPoss = p.short ;
          isPoss = True ;
          s = \\da,c => let casevow = case c of {Nom => "u" ; Abs => "a"}
                         in BIND ++ p.s ! da ++ BIND ++ casevow ;

          sp = \\gn,c => let prefix = case gn of {SgFem => "t" ; _ => "k"} ;
                             casevow = case c of {Nom => "u" ; Abs => "a"}
                          in prefix ++ BIND ++ p.sp ! gn ++ BIND ++ casevow ;
        } ;

--2 Common nouns

  -- : N -> CN
  -- : N2 -> CN ;
  UseN,UseN2 = ResSom.useN ;

  -- : N2 -> NP -> CN ;    -- Sahra hooyadeed
  ComplN2 n2 np = let cn = useN n2 in cn ** {s = \\nf =>
    let num = case nf of {
                    Def n  => n ;
                    Indef n => n ;
                    _ => Sg } ;
        art = gda2da cn.gda ! num ;
        qnt = PossPron (pronTable ! np.a) ;
        det = case cn.shortPoss of {
                True => qnt.shortPoss ! art ;
                _ => qnt.s ! sg n2.gda ! Abs } ;
        noun = case np.isPron of {
                 True  => (pronTable ! np.a).sp ! Abs ; -- long subject pronoun
                 False => np.s ! Abs }
     in noun ++ cn.s ! Def num ++ BIND ++ det ;
     isPoss = True} ;

{-
  -- : N3 -> NP -> N2 ;    -- distance from this city (to Paris)
  ComplN3 n3 np =
    let compl = applyPost n3.c3 np ;
    in n3 ** {s = compl ++ n3.s } ;
-}

  -- : N3 -> N2 ;          -- distance (from this city)
  Use2N3 n3 = lin N2 n3 ** { c2 = n3.c3 } ;

  -- : N3 -> N2 ;          -- distance (to Paris)
  Use3N3 n3 = lin N2 n3 ;
  -- : AP -> CN -> CN
  AdjCN ap cn = cn ** {
    s = table { NomSg => cn.s ! Indef Sg ; -- When an adjective is added, noun loses case marker.
                x     => cn.s ! x } ;
    mod = \\st,n,c =>
            cn.mod ! st ! n ! Abs -- If there was something before, it is now in Abs
         ++ andConj st cn.hasMod  -- If the sentence is already modified, any new modifier needs to be introduced with conjunction
         ++ ap.s ! AF n c ;
    hasMod = True
    } ;

  -- : CN -> RS  -> CN ;
  RelCN cn rs = cn ** {
    mod = \\st,n,c => --what to do with subject case if there's both adj and RS?
            cn.mod ! st ! n ! Abs
         ++ andConj st cn.hasMod
         ++ rs.s ! gender cn ! c ;
    hasMod = True ;
    } ;

{-
  -- : CN -> Adv -> CN ;
  AdvCN cn adv = cn ** {  } ;

-- Nouns can also be modified by embedded sentences and questions.
-- For some nouns this makes little sense, but we leave this for applications
-- to decide. Sentential complements are defined in VerbSom.

  -- : CN -> SC  -> CN ;   -- question where she sleeps
  SentCN cn sc = cn ** { } ;


--2 Apposition

-- This is certainly overgenerating.

  -- : CN -> NP -> CN ;    -- city Paris (, numbers x and y)
  ApposCN cn np = cn ** { s =  } ;
-}

--2 Possessive and partitive constructs

  -- : PossNP  : CN -> NP -> CN ;
  PossNP cn np = cn ** { -- guriga Axmed, not Axmed gurigiisa
    mod = \\st,n,c => cn.mod ! st ! n ! c ++ objpron np ! Abs
    } ;
{-
  -- : CN -> NP -> CN ;     -- glass of wine / two kilos of red apples
  PartNP cn np = cn ** {  } ;



-- This is different from the partitive, as shown by many languages.

  -- : Det -> NP -> NP ;
  CountNP det np = np **
    { } ; -- Nonsense for DefArt or IndefArt

--3 Conjoinable determiners and ones with adjectives

  -- : DAP -> AP -> DAP ;    -- the large (one)
  AdjDAP dap ap = dap ** { } ;

  -- : Det -> DAP ;          -- this (or that)
  DetDAP det = det ;
-}

oper
  andConj : State -> Bool -> Str = \st,hasMod ->
    case <st,hasMod> of {
      <Indefinite,True> => "oo" ;
      <Definite,True>   => "ee" ;
      _                 => []
    } ;
}
