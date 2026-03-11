law DemandaAmparoDirecto
authority judicial
enacted 2023-03-15

vocabulary
    verb transfer: transfer

parties
    Appellant: Appellant Person, natural person
    ThirdPartyInjured: ThirdPartyInjured Person, natural person
    ResponsibleAuthority: ResponsibleAuthority Corp, legal person
    MinorChild: MinorChild Person, natural person

objects
    ChildCustody: service
    DefinitiveSentence: service

article 1 Generated
    fact asset ParentalRelation is present
    fact asset ParentalRelation is present
    fact liability ConstitutionalViolation is present
    obligation ResponsibleAuthority must perform ConstitutionalAnalysis to Appellant.
    claim MinorChild may demand ParticipationInProceedings from ResponsibleAuthority.
    claim Appellant may demand SharedCustodyConsideration from ResponsibleAuthority.
    rule ConstitutionalProtectionRule
        If asset ConstitutionalViolation is present
        then FederalCourt must perform ConstitutionalProtection to Appellant.
    rule SuperiorInterestRule
        If asset CustodyDecision is present
        then ResponsibleAuthority must perform SuperiorInterestAnalysis to MinorChild.
    rule SharedCustodyEvaluationRule
        If asset ParentalConflict is present
        then ResponsibleAuthority must perform SharedCustodyEvaluation to MinorChild.
    procedure AmparoDirectoProcedure:
        Appellant performs AmparoFiling to FederalCourt.
        FederalCourt performs CaseSubstantiation to Appellant.
        FederalCourt performs ConstitutionalProtectionDecision to Appellant.