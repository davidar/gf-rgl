concrete StructuralSom of Structural = CatSom **
  open Prelude, ResSom, (N=NounSom), ParadigmsSom in {

-------
-- Ad*
{-
lin almost_AdA = mkAdA "" ;
lin almost_AdN = ss "" ;
lin at_least_AdN = ss "" ;
lin at_most_AdN = ss "" ;
lin so_AdA = ss "" ;
lin too_AdA = ss "" ;
lin very_AdA = mkAdA "" ;

lin as_CAdv = { s = "" ; p = [] } ;
lin less_CAdv = { s = "" ; p = [] } ;
lin more_CAdv = { s = "" ; p = [] } ;

lin how_IAdv = ss "" ;
lin how8much_IAdv = ss "" ;
lin when_IAdv = ss "" ;
lin where_IAdv = ss "" ;
lin why_IAdv = ss "" ;

lin always_AdV = ss "" ;

lin everywhere_Adv = ss "" ;
lin here7from_Adv = ss "" ;
lin here7to_Adv = ss "" ;
lin here_Adv = ss "" ;
lin quite_Adv = ss "" ;
lin somewhere_Adv = ss "" ;
lin there7from_Adv = ss "" ;
lin there7to_Adv = ss "" ;
lin there_Adv = ss "" ;

-}
-------
-- Conj

lin and_Conj = {s2 = table {Definite => "ee" ; Indefinite => "oo"} ; s1 = [] ; n = Pl} ;
lin or_Conj = {s2 = \\_ => "ama" ; s1 = [] ; n = Sg} ; -- mise with interrogatives
-- lin if_then_Conj = mkConj
-- lin both7and_DConj = mkConj "" "" pl ;
-- lin either7or_DConj = mkConj "" "" pl ;
--
-- lin but_PConj = ss "" ;
-- lin otherwise_PConj = ss "" ;
-- lin therefore_PConj = ss "" ;


-----------------
-- *Det and Quant
{-
lin how8many_IDet = R.indefDet "" pl ;

lin all_Predet = { s = "" } ;
lin not_Predet = { s = "" } ;
lin only_Predet = { s = "" } ;
lin most_Predet = { s = "" } ;

lin every_Det = R.defDet [] pl **
                 { s = mkVow } ;
lin few_Det = R.indefDet "" pl ;
lin many_Det = R.indefDet "" pl ;
lin much_Det = R.indefDet "" sg ;
lin somePl_Det = R.indefDet "" pl ;
lin someSg_Det = R.indefDet "" sg ;

lin no_Quant = mkPrep no_Quant
-}
lin that_Quant = defQuant "aas" "kaas" "taas" "kuwaas" True ;
lin this_Quant = defQuant "an" "kan" "tan" "kuwan" True ;
--lin which_IQuant = defQuant
{-

-----
-- NP

lin everybody_NP = defNP "" N.NumPl ;
lin everything_NP = defNP "" N.NumSg ;
lin nobody_NP = mkVerb; ""
lin nothing_NP = defNP "" N.NumSg ;
lin somebody_NP = defNP "" N.NumSg ;
lin something_NP = defNP "" N.NumSg ;

oper
 defNP : Str -> Num -> NP = {} ;
-}

-------
-- Prep

lin above_Prep = mkPrep (mkPrep ka) [] [] "dul" ;
-- lin after_Prep = mkPrep "" ;
-- lin before_Prep = mkPrep "" ;
-- lin behind_Prep = mkPrep ""  ;
-- lin between_Prep = mkPrep ""  ;
-- lin by8agent_Prep = mkPrep ;
-- lin by8means_Prep = mkPrep ;
-- lin during_Prep = mkPrep ;
-- lin except_Prep = mkPrep ;
-- lin for_Prep = mkPrep ;
-- lin from_Prep = mkPrep "" ;
-- lin in8front_Prep = mkPrep ""  ;
lin in_Prep = mkPrep ku ;
lin on_Prep = mkPrep ku ;
-- lin part_Prep = mkPrep ;
-- lin possess_Prep = mkPrep ;
-- lin through_Prep = mkPrep ;
-- lin to_Prep = mkPrep ;
-- lin under_Prep = mkPrep ""   ;
lin with_Prep = mkPrep la ;
-- lin without_Prep = mkPrep ;


-------
-- Pron

-- Pronouns are closed class, no constructor in ParadigmsSom.
    it_Pron = he_Pron ** {s = \\_ => [] ; sp = \\_ => [] ; a = Impers} ;
    i_Pron = pronTable ! Sg1 ;
    youPol_Pron,
    youSg_Pron = pronTable ! Sg2 ;
    he_Pron = pronTable ! Sg3 Masc ;
    she_Pron = pronTable ! Sg3 Fem ;
    we_Pron = pronTable ! Pl1 Incl ;
    youPl_Pron = pronTable ! Pl2 ;
    they_Pron = pronTable ! Pl3 ;
{-
lin whatPl_IP = ;
lin whatSg_IP = ;
lin whoPl_IP = ;
lin whoSg_IP = ;

-}

-------
-- Subj

-- lin although_Subj = mkSubj "" False ;
-- lin because_Subj  = mkSubj "" False ;
-- lin if_Subj = mkSubj "" True ;
lin that_Subj = {s = "in"} ;
-- lin when_Subj = mkSubj "" False ;


------
-- Utt

lin language_title_Utt = ss "af soomaali" ;
lin no_Utt = ss "maya" ;
lin yes_Utt = ss "haa" ;


-------
-- Verb

lin have_V2 = mkV2 have_V noPrep ;
lin can8know_VV = can_VV ; -- can (capacity)
lin can_VV = mkV "kar" ;   -- can (possibility)
{-lin must_VV = mkV "" ;
lin want_VV = mkV "" ;


------
-- Voc

lin please_Voc = ss "" ;
-}
}
