law LeyFederalMonumentos
authority legislative

vocabulary
    verb provide: provide

parties
    PropertyOwner: PropertyOwner Person, natural person
    Acquirer: Acquirer Person, natural person
    Inah: Inah Corp, legal person
    Inbal: Inbal Corp, legal person
    Notary: Notary Person, natural person

objects
    HistoricMonument: nonmovable
    ArtisticMonument: nonmovable
    RestorationAuthorization: service
    ConservationService: service

article 1 Generated
    fact certification HistoricMonumentDeclaration is present
    fact certification ArtisticMonumentDeclaration is present
    fact PropertyOwner owns HistoricMonument
    obligation PropertyOwner must provide ConservationService to HistoricMonument.
    obligation Notary must provide ConservationService to Acquirer.
    rule HistoricMonumentConservationRule
        If certification HistoricMonumentDeclaration is present
        then PropertyOwner must provide ConservationService to HistoricMonument.
    rule NotarialNotificationRule
        If certification HistoricMonumentDeclaration is present
        then Notary must provide ConservationService to Acquirer.