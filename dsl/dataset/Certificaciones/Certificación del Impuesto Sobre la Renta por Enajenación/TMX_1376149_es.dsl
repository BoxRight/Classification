law LeyDelImpuesto
authority administrative

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Notary: Notary Corp, legal person
    Seller: Seller Person, natural person
    TaxAuthority: TaxAuthority Corp, legal person

objects
    PrimaryResidence: nonmovable
    ProvisionalTaxPayment: money
    TaxCalculation: service
    SupportingDocuments: movable

article 1 Generated
    fact asset PropertySale is present
    fact certification PrimaryResidence is present
    obligation Notary must provide TaxCalculation to Seller.
    obligation Notary must pay ProvisionalTaxPayment to TaxAuthority.
    obligation Seller must transfer SupportingDocuments to Notary.
    rule ExemptionLimitRule
        If certification PrimaryResidence is present
        then Seller must pay ProvisionalTaxPayment to TaxAuthority.
    procedure TaxCertificationProcess:
        Seller transfers PrimaryResidence to Notary.
        Seller transfers SupportingDocuments to Notary.
        Notary provides TaxCalculation to Seller.
        Notary pays ProvisionalTaxPayment to TaxAuthority.
        Notary transfers SupportingDocuments to TaxAuthority.