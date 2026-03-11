law CódigoNacionalProcedimientos
authority judicial

vocabulary
    verb provide: provide

parties
    Defendant: Defendant Person, natural person
    Plaintiff: Plaintiff Person, natural person
    RentalJudge: RentalJudge Corp, legal person

objects
    RevocationAppeal: service
    JudicialOrder: service
    PersonalityIncident: service

article 1 Generated
    fact certification RentalCase is present
    fact liability JudicialOrderViolation is present
    claim Defendant may demand RevocationAppeal from RentalJudge.
    obligation RentalJudge must provide PersonalityIncident to Defendant.
    rule RevocationGroundsRule
        If liability JudicialOrderViolation is present and certification RentalCase is present
        then Defendant may demand RevocationAppeal from RentalJudge.
    rule IncidentAdmissionRule
        If certification PersonalityLegitimationIssue is present
        then RentalJudge must provide PersonalityIncident to Defendant.
    procedure RevocationAppealProcedure:
        Defendant provides RevocationAppeal to RentalJudge.