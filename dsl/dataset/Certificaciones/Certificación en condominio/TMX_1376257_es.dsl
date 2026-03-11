law LeyPropiedadCondominio
authority administrative

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Notary: Notary Corp, legal person
    Buyer: Buyer Person, natural person
    CondominiumOwner: CondominiumOwner Person, natural person
    Administrator: Administrator Person, natural person
    GeneralAssembly: GeneralAssembly Corp, legal person
    Procuraduria: Procuraduria Corp, legal person

objects
    CondominiumUnit: nonmovable
    CommonAreas: nonmovable
    MaintenanceFees: money
    AdministrationFees: money
    ExtraordinaryFees: money
    ReserveFund: money
    ConstitutionDeed: service
    CondominiumRegulations: service

article 1 Generated
    fact CondominiumOwner owns CondominiumUnit
    fact asset CondominionRegime is present
    fact liability MaintenanceFeeDebt is present
    fact certification NotarialCertification is present
    obligation Notary must provide ConstitutionDeed to Buyer.
    obligation Notary must provide CondominiumRegulations to Buyer.
    obligation CondominiumOwner must pay MaintenanceFees to GeneralAssembly.
    obligation CondominiumOwner must pay AdministrationFees to GeneralAssembly.
    privilege CondominiumOwner may transfer CommonAreas to CondominiumOwner.
    prohibition CondominiumOwner must not transfer CondominiumUnit.
    procedure NotarialCertification:
        Notary provides ConstitutionDeed to Buyer.
        Notary provides CondominiumRegulations to Buyer.