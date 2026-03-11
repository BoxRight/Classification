law AcuerdoAdmisiónDemanda
authority judicial
enacted 2023-07-28

vocabulary
    verb provide: provide

parties
    Plaintiff: Plaintiff Person, natural person
    CivilJudge: CivilJudge Corp, legal person
    CourtClerk: CourtClerk Corp, legal person
    RegistryDirector: RegistryDirector Corp, legal person
    DistrictJudge: DistrictJudge Corp, legal person
    FederalProsecutor: FederalProsecutor Corp, legal person
    InterestedThirdParties: InterestedThirdParties Corp, legal person
    ExhortedJudge: ExhortedJudge Corp, legal person

objects
    AmparoComplaint: service
    JustifiedReport: service
    CertifiedCopies: service
    FineAmount: money
    ConstitutionalHearing: service
    Notification: service

article 1 Generated
    fact certification AmparoCase is present
    obligation CivilJudge must provide JustifiedReport to DistrictJudge.
    obligation CourtClerk must provide JustifiedReport to DistrictJudge.
    obligation RegistryDirector must provide JustifiedReport to DistrictJudge.
    obligation CivilJudge must provide CertifiedCopies to DistrictJudge.
    obligation InterestedThirdParties must provide Notification to DistrictJudge.
    rule ReportDeadlineRule
        If certification AmparoCase is present
        then CivilJudge must provide JustifiedReport to DistrictJudge.
    rule AddressDesignationRule
        If certification AmparoCase is present
        then InterestedThirdParties must provide Notification to DistrictJudge.
    rule CessationNotificationRule
        If certification AmparoCase is present
        then Plaintiff must provide Notification to DistrictJudge.

scenario amparo_case_timeline:
    at Complaint filed
    at Case admitted
    at Reports due from authorities
    at Constitutional hearing scheduled