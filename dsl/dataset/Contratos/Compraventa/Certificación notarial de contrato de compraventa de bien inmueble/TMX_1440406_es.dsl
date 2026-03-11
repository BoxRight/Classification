law SaleContract
authority administrative
enacted 2024-04-24

vocabulary
    verb provide: provide

parties
    Seller: Seller Person, natural person
    Buyer: Buyer Person, natural person
    Notary: Notary Person, natural person

objects
    RealEstateProperty: nonmovable
    SalesContract: service
    PersonalData: service

article 1 Generated
    fact certification NotarialCertification is present
    fact Seller owns RealEstateProperty
    fact certification IdentityVerification is present
    obligation Notary must provide SalesContract to Seller.
    obligation Seller must provide SalesContract to Notary.
    obligation Buyer must provide SalesContract to Notary.
    claim Seller may demand PersonalData from Notary.
    claim Buyer may demand PersonalData from Notary.
    procedure NotarialCertificationProcedure:
        Seller provides SalesContract to Notary.
        Buyer provides SalesContract to Notary.
        Notary provides SalesContract to Seller.