law LeyDelNotariado
authority administrative

vocabulary
    verb provide: provide

parties
    Notary: Notary Corp, legal person
    AppearingPerson: AppearingPerson Person, natural person
    RepresentedPerson: RepresentedPerson Person, natural person

objects
    NotarialDeed: service
    PersonalData: service

article 1 Generated
    fact certification NotarialCertification is present
    fact certification MigratoryStatus is present
    fact certification MexicanNationality is present
    obligation Notary must provide PersonalData to NotarialDeed.
    obligation AppearingPerson must provide PersonalData to Notary.
    rule ForeignMigratoryStatus
        If certification ForeignNationality is present
        then AppearingPerson must provide PersonalData to Notary.
    rule NaturalizedMexicanDocumentation
        If certification NaturalizedMexican is present
        then AppearingPerson must provide PersonalData to Notary.
    procedure NotarialDataCertification:
        AppearingPerson provides PersonalData to Notary.
        AppearingPerson provides PersonalData to Notary.
        Notary provides PersonalData to NotarialDeed.