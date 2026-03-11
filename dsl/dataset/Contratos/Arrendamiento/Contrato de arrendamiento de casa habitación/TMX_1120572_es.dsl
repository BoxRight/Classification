law LeaseContract
authority private
enacted 2024-01-29

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    Guarantor: Guarantor Person, natural person

objects
    Property: nonmovable
    MonthlyRent: money
    Deposit: money
    GuaranteeProperty: nonmovable

article 1 Generated
    fact Landlord owns Property
    fact Guarantor owns Property
    fact asset LeaseRelation is present
    fact collateral GuaranteePropertyCollateral is present
    obligation Tenant must pay MonthlyRent to Landlord.
    obligation Tenant must pay Deposit to Landlord.
    prohibition Tenant must not transfer Property.
    prohibition Tenant must not perform DangerousSubstances.
    obligation Tenant must perform PropertyMaintenance to Inmueble.
    obligation Guarantor must perform GuaranteeCompliance to Landlord.
    rule RentPaymentRule
        If asset LeaseRelation is present
        then Tenant must pay MonthlyRent to Landlord.