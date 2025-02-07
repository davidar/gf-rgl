resource MissingLat = open GrammarLat, Prelude in {

-- temporary definitions to enable the compilation of RGL API
oper AdNum : AdN -> Card -> Card = notYet "AdNum" ;
oper AdvCN : CN -> Adv -> CN = notYet "AdvCN" ;
oper AdvIAdv : IAdv -> Adv -> IAdv = notYet "AdvIAdv" ;
oper AdvIP : IP -> Adv -> IP = notYet "AdvIP" ;
oper AdvSlash : ClSlash -> Adv -> ClSlash = notYet "AdvSlash" ;
oper BaseAP : AP -> AP -> ListAP = notYet "BaseAP" ;
oper BaseRS : RS -> RS -> ListRS = notYet "BaseRS" ;
oper CleftAdv : Adv -> S -> Cl = notYet "CleftAdv" ;
oper CleftNP : NP -> RS -> Cl = notYet "CleftNP" ;
oper CompIP : IP -> IComp = notYet "CompIP" ;
oper ComplN2 : N2 -> NP -> CN = notYet "ComplN2" ;
oper ComplN3 : N3 -> NP -> N2 = notYet "ComplN3" ;
oper ConjAdv : Conj -> ListAdv -> Adv = notYet "ConjAdv" ;
oper ConjAP : Conj -> ListAP -> AP = notYet "ConjAP" ;
oper ConjRS : Conj -> ListRS -> RS = notYet "ConjRS" ;
oper ConsAP : AP -> ListAP -> ListAP = notYet "ConsAP" ;
oper ConsRS : RS -> ListRS -> ListRS = notYet "ConsRS" ;
oper DetQuantOrd : Quant -> Num -> Ord -> Det = notYet "DetQuantOrd" ;
oper EmbedQS : QS -> SC = notYet "EmbedQS" ;
oper EmbedS : S -> SC = notYet "EmbedS" ;
oper EmbedVP : VP -> SC = notYet "EmbedVP" ;
oper ExistIP : IP -> QCl = notYet "ExistIP" ;
oper ExistNP : NP -> Cl = notYet "ExistNP" ;
oper FunRP : Prep -> NP -> RP -> RP = notYet "FunRP" ;
oper GenericCl : VP -> Cl = notYet "GenericCl" ;
oper IdetCN : IDet -> CN -> IP = notYet "IdetCN" ;
oper IdetIP : IDet -> IP = notYet "IdetIP" ;
oper IdetQuant : IQuant -> Num -> IDet = notYet "IdetQuant" ;
oper IdRP : RP = notYet "IdRP" ;
oper ImpersCl : VP -> Cl = notYet "ImpersCl" ;
oper ImpPl1 : VP -> Utt = notYet "ImpPl1" ;
oper ImpVP : VP -> Imp = notYet "ImpVP" ;
oper NumDigits : Digits -> Card = notYet "NumDigits" ;
oper NumNumeral : Numeral -> Card = notYet "NumNumeral" ;
oper OrdDigits : Digits -> Ord = notYet "OrdDigits" ;
oper OrdNumeral : Numeral -> Ord = notYet "OrdNumeral" ;
oper OrdSuperl : A -> Ord = notYet "OrdSuperl" ;
oper PossPron : Pron -> Quant = notYet "PossPron" ;
oper PPartNP : NP -> V2 -> NP = notYet "PPartNP" ;
oper PredSCVP : SC -> VP -> Cl = notYet "PredSCVP" ;
oper PrepIP : Prep -> IP -> IAdv = notYet "PrepIP" ;
oper ProgrVP : VP -> VP = notYet "ProgrVP" ;
oper QuestCl : Cl -> QCl = notYet "QuestCl" ;
oper QuestIAdv : IAdv -> Cl -> QCl = notYet "QuestIAdv" ;
oper QuestIComp : IComp -> NP -> QCl = notYet "QuestIComp" ;
oper QuestSlash : IP -> ClSlash -> QCl = notYet "QuestSlash" ;
oper QuestVP : IP -> VP -> QCl = notYet "QuestVP" ;
oper ReflVP : VPSlash -> VP = notYet "ReflVP" ;
oper RelCl : Cl -> RCl = notYet "RelCl" ;
oper RelCN : CN -> RS -> CN = notYet "RelCN" ;
oper RelSlash : RP -> ClSlash -> RCl = notYet "RelSlash" ;
oper RelVP : RP -> VP -> RCl = notYet "RelVP" ;
oper SentCN : CN -> SC -> CN = notYet "SentCN" ;
oper SlashV2S : V2S -> S -> VPSlash = notYet "SlashV2S" ;
oper SlashV2V : V2V -> VP -> VPSlash = notYet "SlashV2V" ;
oper SlashV2VNP : V2V -> NP -> VPSlash -> VPSlash = notYet "SlashV2VNP" ;
oper SlashVS : NP -> VS -> SSlash -> ClSlash = notYet "SlashVS" ;
oper SlashVV : VV -> VPSlash -> VPSlash = notYet "SlashVV" ;
oper Use2N3 : N3 -> N2 = notYet "Use2N3" ;
oper UseQCl : Temp -> Pol -> QCl -> QS = notYet "UseQCl" ;
oper UseRCl : Temp -> Pol -> RCl -> RS = notYet "UseRCl" ;
oper UseSlash : Temp -> Pol -> ClSlash -> SSlash = notYet "UseSlash" ;
oper AddAdvQVP : QVP -> IAdv -> QVP = notYet "AddAdvQVP" ;
oper AdjDAP : DAP -> AP -> DAP = notYet "AdjDAP" ;
oper AdNum : AdN -> Card -> Card = notYet "AdNum" ;
oper AdvCN : CN -> Adv -> CN = notYet "AdvCN" ;
oper AdvIAdv : IAdv -> Adv -> IAdv = notYet "AdvIAdv" ;
oper AdvIP : IP -> Adv -> IP = notYet "AdvIP" ;
oper AdvQVP : VP -> IAdv -> QVP = notYet "AdvQVP" ;
oper AdvSlash : ClSlash -> Adv -> ClSlash = notYet "AdvSlash" ;
oper BaseAdV : AdV -> AdV -> ListAdV = notYet "BaseAdV" ;
oper BaseAP : AP -> AP -> ListAP = notYet "BaseAP" ;
oper BaseCN : CN -> CN -> ListCN = notYet "BaseCN" ;
oper BaseDAP : DAP -> DAP -> ListDAP = notYet "BaseDAP" ;
oper BaseIAdv : IAdv -> IAdv -> ListIAdv = notYet "BaseIAdv" ;
oper BaseRS : RS -> RS -> ListRS = notYet "BaseRS" ;
oper CompIP : IP -> IComp = notYet "CompIP" ;
oper ComplN2 : N2 -> NP -> CN = notYet "ComplN2" ;
oper ComplN3 : N3 -> NP -> N2 = notYet "ComplN3" ;
oper ComplSlashIP : VPSlash -> IP -> QVP = notYet "ComplSlashIP" ;
oper ConjAdv : Conj -> ListAdv -> Adv = notYet "ConjAdv" ;
oper ConjAdV : Conj -> ListAdV -> AdV = notYet "ConjAdV" ;
oper ConjAP : Conj -> ListAP -> AP = notYet "ConjAP" ;
oper ConjCN : Conj -> ListCN -> CN = notYet "ConjCN" ;
oper ConjDet : Conj -> ListDAP -> Det = notYet "ConjDet" ;
oper ConjIAdv : Conj -> ListIAdv -> IAdv = notYet "ConjIAdv" ;
oper ConjRS : Conj -> ListRS -> RS = notYet "ConjRS" ;
oper ConsAdV : AdV -> ListAdV -> ListAdV = notYet "ConsAdV" ;
oper ConsAP : AP -> ListAP -> ListAP = notYet "ConsAP" ;
oper ConsCN : CN -> ListCN -> ListCN = notYet "ConsCN" ;
oper ConsDAP : DAP -> ListDAP -> ListDAP = notYet "ConsDAP" ;
oper ConsIAdv : IAdv -> ListIAdv -> ListIAdv = notYet "ConsIAdv" ;
oper ConsRS : RS -> ListRS -> ListRS = notYet "ConsRS" ;
oper CountNP : Det -> NP -> NP = notYet "CountNP" ;
oper DetDAP : Det -> DAP = notYet "DetDAP" ;
oper DetQuantOrd : Quant -> Num -> Ord -> Det = notYet "DetQuantOrd" ;
oper EmbedQS : QS -> SC = notYet "EmbedQS" ;
oper EmbedS : S -> SC = notYet "EmbedS" ;
oper EmbedVP : VP -> SC = notYet "EmbedVP" ;
oper ExtAdvS : Adv -> S -> S = notYet "ExtAdvS" ;
oper ExtAdvVP : VP -> Adv -> VP = notYet "ExtAdvVP" ;
oper IdetCN : IDet -> CN -> IP = notYet "IdetCN" ;
oper IdetIP : IDet -> IP = notYet "IdetIP" ;
oper IdetQuant : IQuant -> Num -> IDet = notYet "IdetQuant" ;
oper ImpVP : VP -> Imp = notYet "ImpVP" ;
oper NumDigits : Digits -> Card = notYet "NumDigits" ;
oper NumNumeral : Numeral -> Card = notYet "NumNumeral" ;
oper OrdDigits : Digits -> Ord = notYet "OrdDigits" ;
oper OrdNumeral : Numeral -> Ord = notYet "OrdNumeral" ;
oper OrdNumeralSuperl : Numeral -> A -> Ord = notYet "OrdNumeralSuperl" ;
oper OrdSuperl : A -> Ord = notYet "OrdSuperl" ;
oper PartNP : CN -> NP -> CN = notYet "PartNP" ;
oper PossNP : CN -> NP -> CN = notYet "PossNP" ;
oper PossPron : Pron -> Quant = notYet "PossPron" ;
oper PPartNP : NP -> V2 -> NP = notYet "PPartNP" ;
oper PredSCVP : SC -> VP -> Cl = notYet "PredSCVP" ;
oper PrepIP : Prep -> IP -> IAdv = notYet "PrepIP" ;
oper QuestCl : Cl -> QCl = notYet "QuestCl" ;
oper QuestIAdv : IAdv -> Cl -> QCl = notYet "QuestIAdv" ;
oper QuestIComp : IComp -> NP -> QCl = notYet "QuestIComp" ;
oper QuestQVP : IP -> QVP -> QCl = notYet "QuestQVP" ;
oper QuestSlash : IP -> ClSlash -> QCl = notYet "QuestSlash" ;
oper QuestVP : IP -> VP -> QCl = notYet "QuestVP" ;
oper ReflVP : VPSlash -> VP = notYet "ReflVP" ;
oper RelCN : CN -> RS -> CN = notYet "RelCN" ;
oper RelS : S -> RS -> S = notYet "RelS" ;
oper SentCN : CN -> SC -> CN = notYet "SentCN" ;
oper SlashV2S : V2S -> S -> VPSlash = notYet "SlashV2S" ;
oper SlashV2V : V2V -> VP -> VPSlash = notYet "SlashV2V" ;
oper SlashV2VNP : V2V -> NP -> VPSlash -> VPSlash = notYet "SlashV2VNP" ;
oper SlashVS : NP -> VS -> SSlash -> ClSlash = notYet "SlashVS" ;
oper SlashVV : VV -> VPSlash -> VPSlash = notYet "SlashVV" ;
oper SSubjS : S -> Subj -> S -> S = notYet "SSubjS" ;
oper Use2N3 : N3 -> N2 = notYet "Use2N3" ;
oper Use3N3 : N3 -> N2 = notYet "Use3N3" ;
oper UseQCl : Temp -> Pol -> QCl -> QS = notYet "UseQCl" ;
oper UseRCl : Temp -> Pol -> RCl -> RS = notYet "UseRCl" ;
oper UseSlash : Temp -> Pol -> ClSlash -> SSlash = notYet "UseSlash" ;
oper VPSlashPrep : VP -> Prep -> VPSlash = notYet "VPSlashPrep" ;

}
