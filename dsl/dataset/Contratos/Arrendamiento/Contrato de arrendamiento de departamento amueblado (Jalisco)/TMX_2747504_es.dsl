law LeaseContract
authority private
enacted 2024-10-31

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    Guarantor: Guarantor Person, natural person

objects
    FurnishedApartment: nonmovable
    MonthlyRent: money
    FurnitureInventory: movable
    CondominiumFees: money
    PublicServices: service
    LiabilityInsurance: service

article 1 Generated
    fact asset LeaseRelation is present
    fact Landlord owns FurnishedApartment
    fact liability GuarantorLiability is present
    obligation Tenant must pay MonthlyRent to Landlord.
    obligation Tenant must pay CondominiumFees.
    obligation Tenant must transfer FurnitureInventory.
    obligation Landlord must transfer FurnishedApartment to Tenant.
    prohibition Tenant must not transfer FurnishedApartment.
    rule RentPaymentRule
        If asset LeaseRelation is present
        then Tenant must pay MonthlyRent to Landlord.
    rule GuarantorLiabilityRule
        If Tenant fails to pay MonthlyRent to Landlord
        then Guarantor must pay MonthlyRent to Landlord.
    rule InspectionRightRule
        If asset LeaseRelation is present
        then Landlord may transfer FurnishedApartment.
    procedure PropertyInspection:
        Landlord transfers FurnishedApartment.