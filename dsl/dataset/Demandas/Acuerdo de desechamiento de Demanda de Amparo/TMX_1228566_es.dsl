law LeyAmparo,Reglamentaria
authority judicial

vocabulary
    verb provide: provide

parties
    PlaintiffAmparo: PlaintiffAmparo Person, natural person
    CivilJudge: CivilJudge Corp, legal person
    DistrictJudge: DistrictJudge Corp, legal person
    Executor: Executor Corp, legal person
    CommercialPlaintiff: CommercialPlaintiff Person, natural person
    CommercialDefendant: CommercialDefendant Corp, legal person
    ThirdPartyCompany: ThirdPartyCompany Corp, legal person

objects
    AmparoDemand: service
    PaymentObligation: money
    SeizedAssets: movable

article 1 Generated
    fact certification CommercialJudgment is present
    obligation PlaintiffAmparo must provide AmparoDemand to DistrictJudge.
    rule DismissalRule
        If PlaintiffAmparo fails to provide AmparoDemand to DistrictJudge
        then DistrictJudge must provide AmparoDemand to PlaintiffAmparo.
    procedure AmparoDismissalProcedure:
        PlaintiffAmparo provides AmparoDemand to DistrictJudge.
        DistrictJudge provides AmparoDemand to PlaintiffAmparo.

scenario amparo_dismissal_scenario:
    at amparo_filed
    at lack_of_standing_determined
    at amparo_dismissed