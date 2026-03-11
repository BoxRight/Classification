law LeyDelNotariado
authority administrative

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    Notary: Notary Corp, legal person
    Grantors: Grantors Person, natural person
    CityOfMexico: CityOfMexico Corp, legal person
    UrbanDevelopmentOffice: UrbanDevelopmentOffice Corp, legal person

objects
    PublicDeed: service
    MovableProperty: movable
    IdentificationDocuments: service

article 1 Generated
    fact certification NotaryIdentification is present
    fact certification DocumentVerification is present
    fact certification GrantorComprehension is present
    obligation Notary must perform ReadingRightInformation to Grantors.
    obligation Notary must provide PublicDeed to Grantors.
    obligation Notary must perform LegalExplanation to Grantors.
    obligation Notary must perform PenaltyWarning to Grantors.
    prohibition Notary must not perform DefinitiveAuthorization.
    rule NotaryCertificationRequirements
        If asset PublicDeedExecution is present
        then Notary must perform CertificationProcedure to Grantors.
    rule CityPropertyAuthorizationRule
        If asset CityPropertyTransaction is present
        then Notary must not perform DefinitiveAuthorization.
    procedure NotaryCertificationProcedure:
        Notary performs ReadingRightInformation to Grantors.
        Notary provides PublicDeed to Grantors.
        Notary performs LegalExplanation to Grantors.
        Notary performs PenaltyWarning to Grantors.
        Grantors provides PublicDeed to Notary.
        Notary provides PublicDeed to Grantors.