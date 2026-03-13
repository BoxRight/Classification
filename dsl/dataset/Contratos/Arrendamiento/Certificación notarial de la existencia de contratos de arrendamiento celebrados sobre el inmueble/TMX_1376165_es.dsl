law LeyDelNotariado
authority administrative

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Notary: Notary Corp, legal person
    Seller: Seller Person, natural person
    Tenant: Tenant Person, natural person

objects
    Property: nonmovable
    DamagesCompensation: money

article 1 Generated
    fact asset LeaseRelation is present
    fact asset PreferenceRight is present
    fact certification NotarialCertification is present
    obligation Seller must transfer Property to Notary.
    claim Tenant may demand Property from Seller.
    rule PreferenceRightRule
        If asset LeaseRelation is present
        then Tenant may demand Property from Seller.
    rule PreferenceRightViolation
        If asset LeaseRelation is present and Seller fails to transfer Property to Tenant
        then Seller must pay DamagesCompensation to Tenant.
    rule NotarialSanctionRule
        If asset LeaseRelation is present and Notary fails to transfer Property
        then Notary must transfer Property.