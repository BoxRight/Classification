law LeyImpuestoValor
authority administrative

vocabulary
    verb pay: pay

parties
    Notary: Notary Corp, legal person
    Seller: Seller Person, natural person
    Buyer: Buyer Person, natural person
    TaxAuthorities: TaxAuthorities Corp, legal person

objects
    ImmovableProperty: nonmovable
    Land: nonmovable
    ResidentialConstruction: nonmovable
    NonResidentialConstruction: nonmovable
    VatTax: money
    ParkingSpace: nonmovable
    StorageUnit: nonmovable

article 1 Generated
    fact certification VatExemptionLand is present
    fact certification VatExemptionResidential is present
    fact certification VatExemptionAccessoryResidential is present
    fact certification VatExemptionNewResidential is present
    fact certification PeriodicTaxDeclarations is present
    obligation Notary must pay VatTax to TaxAuthorities.
    obligation Seller must pay VatTax to Buyer.
    rule VatRetentionExemptionRule
        If certification PeriodicTaxDeclarations is present
        then Notary may fail VatTax to TaxAuthorities.