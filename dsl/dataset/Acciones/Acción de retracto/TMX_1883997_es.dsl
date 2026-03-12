law RetractoAction
authority judicial
enacted 2021-07-06

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Tenant: Tenant Person, natural person
    Landlord: Landlord Person, natural person
    Buyer: Buyer Person, natural person

objects
    LeasedProperty: nonmovable
    MonthlyRent: money
    Damages: money

article 1 Generated
    fact asset LeaseRelation is present
    fact Landlord owns LeasedProperty
    obligation Tenant must pay MonthlyRent to Landlord.
    privilege Tenant may transfer LeasedProperty to Buyer.
    obligation Landlord must transfer LeasedProperty to Tenant.
    rule RetractoRightRule
        If asset LeaseRelation is present and Landlord fails to transfer LeasedProperty to Tenant
        then Tenant may transfer LeasedProperty to Buyer.
    rule DamagesRule
        If Landlord fails to transfer LeasedProperty to Tenant
        then Landlord must pay Damages to Tenant.