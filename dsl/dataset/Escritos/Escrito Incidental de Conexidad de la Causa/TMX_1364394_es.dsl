law CódigoNacionalProcedimientos
authority judicial

vocabulary
    verb provide: provide

parties
    Actor: Actor Person, natural person
    Defendant: Defendant Person, natural person
    Judge: Judge Person, natural person

objects
    LeaseContract: service
    RealEstateProperty: nonmovable
    TerminationLawsuit: service
    ExtensionLawsuit: service
    ConnectionIncident: service

article 1 Generated
    fact certification LegalPersonality is present
    fact asset LeaseTerminationCase is present
    fact asset LeaseExtensionCase is present
    fact asset ConnectionOfCauses is present
    claim Actor may demand ConnectionIncident from Judge.
    rule ConnectionRule
        If asset SameParties is present and asset SameActions is present and asset SameFacts is present and asset SameInstance is present and asset SameMatter is present
        then Actor may demand ConnectionIncident from Judge.
    procedure ConnectionIncidentProcedure:
        Actor provides TerminationLawsuit to Demandado.
        Demandado provides ExtensionLawsuit to Actor.
        Actor provides ConnectionIncident to Judge.