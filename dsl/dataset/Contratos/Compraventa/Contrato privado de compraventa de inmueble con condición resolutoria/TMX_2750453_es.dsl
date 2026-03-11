law ContratoPrivadoCompraventa
authority private
enacted 2024-11-08

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Seller: Seller Person, natural person
    Buyer: Buyer Person, natural person

objects
    Property: nonmovable
    SalePrice: money

article 1 Generated
    fact Seller owns Property
    fact certification LegalCapacity is present
    fact certification LegalCapacity is present
    fact asset SaleContract is present
    fact certification LawfulResources is present
    obligation Seller must transfer Property to Buyer.
    obligation Buyer must pay SalePrice to Seller.
    obligation Buyer must perform ResolutoryCondition to Seller.
    obligation Seller must transfer Property to Buyer.
    obligation Buyer must perform LawfulOriginProof to Seller.
    rule ResolutoryConditionRule
        If Buyer fails to perform ResolutoryCondition to Seller
        then Buyer must transfer Property to Seller.
    rule PriceRestitutionRule
        If Buyer fails to perform ResolutoryCondition to Seller
        then Seller must pay SalePrice to Buyer.
    rule BreachResolutionRule
        If Buyer fails to pay SalePrice to Seller
        then Seller may demand ContractResolution from Buyer.
    procedure ContractExecution:
        Buyer pays SalePrice to Seller.
        Buyer performs ResolutoryCondition to Seller.
        Buyer performs Notification to Seller.
        Seller performs Receipt to Buyer.
        Seller transfers Property to Buyer.
        Seller transfers Property to Buyer.
    procedure ContractResolution:
        Buyer transfers Property to Seller.
        Seller pays SalePrice to Buyer.