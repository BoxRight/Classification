law LeyAmparo,Reglamentaria
authority judicial

vocabulary
    verb provide: provide

parties
    DistrictJudge: DistrictJudge Corp, legal person
    Secretary: Secretary Corp, legal person
    ResponsibleAuthorities: ResponsibleAuthorities Corp, legal person
    ThirdPartyInterested: ThirdPartyInterested Corp, legal person
    FederalPublicProsecutor: FederalPublicProsecutor Corp, legal person

objects
    ConstitutionalHearing: service
    AmparoLawsuit: service
    InitialDemandDocument: service
    JustificationReports: service
    SignatureAuthenticity: service

article 1 Generated
    fact certification AmparoProceeding is present
    fact certification DocumentAuthenticity is present
    obligation DistrictJudge must provide ConstitutionalHearing.

scenario hearing_suspension_scenario:
    at constitutional_hearing_scheduled
    at signature_falsity_objected
    at hearing_suspended
    at continuation_scheduled