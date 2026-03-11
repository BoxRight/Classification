law AutoAdmisiónDemanda
authority judicial
enacted 2017-12-20

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    CourtSecretary: CourtSecretary Person, natural person
    HousingRentalJudge: HousingRentalJudge Person, natural person

objects
    CivilLawsuit: service
    HousingRentalDispute: service
    LegalNotification: service

article 1 Generated
    fact certification LawsuitFiled is present
    fact certification LawsuitAdmitted is present
    fact certification HousingRentalDispute is present
    obligation Defendant must provide CivilLawsuit to HousingRentalJudge.
    rule DefendantResponseRule
        If certification LawsuitAdmitted is present
        then Defendant must provide CivilLawsuit to HousingRentalJudge.
    procedure HousingRentalLitigationProcess:
        Plaintiff provides CivilLawsuit to HousingRentalJudge.
        HousingRentalJudge provides CivilLawsuit to Plaintiff.
        CourtSecretary provides LegalNotification to Defendant.