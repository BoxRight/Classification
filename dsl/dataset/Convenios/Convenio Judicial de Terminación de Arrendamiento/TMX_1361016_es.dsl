law ConvenioJudicialTerminación
authority judicial
enacted 2024-02-14

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person

objects
    RentalProperty: nonmovable
    PropertyKeys: movable
    OverdueRent: money

article 1 Generated
    fact asset LeaseAgreement is present
    fact liability OverdueRent is present
    prohibition Landlord must not pay OverdueRent.
    obligation Tenant must transfer PropertyKeys to Landlord.
    obligation Tenant must transfer RentalProperty to Landlord.
    rule PropertyDeliveryRule
        If asset LeaseTerminationAgreement is present
        then Tenant must transfer RentalProperty to Landlord.
    procedure LeaseTerminationProcess:
        Tenant transfers PropertyKeys to Landlord.
        Tenant transfers RentalProperty to Landlord.