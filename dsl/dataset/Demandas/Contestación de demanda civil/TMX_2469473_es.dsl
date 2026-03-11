law CódigoProcedimientosCiviles
authority judicial

vocabulary
    verb transfer: transfer

parties
    Defendants: Defendants Person, natural person
    Plaintiffs: Plaintiffs Person, natural person
    LegalRepresentative: LegalRepresentative Person, natural person
    PropertyRegistryDirector: PropertyRegistryDirector Corp, legal person

objects
    CopropertyProperties: nonmovable
    SaleProceeds: money
    PropertyAppraisal: service
    PartitionPlan: service

article 1 Generated
    fact Defendants owns CopropertyProperties
    fact Plaintiffs owns CopropertyProperties
    rule IndivisiblePropertyRule
        If asset IndivisibleProperty is present and asset NoAgreementOnAdjudication is present
        then Court must transfer CopropertyProperties to ThirdParty.