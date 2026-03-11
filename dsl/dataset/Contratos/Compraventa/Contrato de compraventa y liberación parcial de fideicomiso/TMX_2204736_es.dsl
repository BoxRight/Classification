law SaleContract
authority private
enacted 2024-01-17

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Fiduciary: Fiduciary Corp, legal person
    Purchaser: Purchaser Person, natural person
    Notary: Notary Person, natural person

objects
    PropertyLot: nonmovable
    PurchasePrice: money
    TrustCertificate: service

article 1 Generated
    fact Purchaser owns PropertyLot
    fact asset TrustRelation is present
    fact certification PropertyTitle is present
    obligation Fiduciary must transfer PropertyLot to Purchaser.
    obligation Purchaser must pay PurchasePrice to Fiduciary.
    obligation Purchaser must perform TransactionCosts to ThirdParties.
    procedure SaleAndTrustReleaseProcedure:
        Purchaser pays PurchasePrice to Fiduciary.
        Fiduciary transfers PropertyLot to Purchaser.
        Fiduciary provides TrustCertificate to Purchaser.