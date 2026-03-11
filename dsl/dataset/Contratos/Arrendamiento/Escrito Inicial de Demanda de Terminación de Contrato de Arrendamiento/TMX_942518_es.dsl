law LeaseContract
authority judicial
enacted 2024-02-13

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    CivilJudge: CivilJudge Corp, legal person

objects
    CommercialPremises: nonmovable
    MonthlyRent: money

article 1 Generated
    fact Landlord owns CommercialPremises
    fact asset LeaseRelation is present
    fact liability RentDebt is present
    obligation Tenant must pay MonthlyRent to Landlord.
    claim Landlord may demand CommercialPremises from Tenant.
    rule LeaseTerminationRule
        If asset LeaseRelation is present and Tenant fails to pay MonthlyRent to Landlord
        then Landlord may demand CommercialPremises from Tenant.