law CódigoFiscalFederación
authority administrative

vocabulary
    verb provide: provide

parties
    Notary: Notary Corp, legal person
    Transferor: Transferor Person, natural person
    Acquirer: Acquirer Person, natural person

objects
    Cfdi: service
    RealEstate: nonmovable
    PublicDeed: service

article 1 Generated
    fact certification PropertyTransfer is present
    fact certification NotarialCertification is present
    obligation Transferor must provide Cfdi to Acquirer.
    obligation Notary must provide PublicDeed to Acquirer.
    rule CfdiObligationRule
        If certification PropertyTransfer is present
        then Transferor must provide Cfdi to Acquirer.
    rule NotarialCertificationRule
        If certification PropertyTransfer is present
        then Notary must provide PublicDeed to Acquirer.