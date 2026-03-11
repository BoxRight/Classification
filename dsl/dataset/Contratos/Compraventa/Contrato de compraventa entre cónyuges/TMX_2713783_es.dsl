law SaleContract
authority private
enacted 2024-07-23

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Spouse1Seller: Spouse1Seller Person, natural person
    Spouse2Buyer: Spouse2Buyer Person, natural person

objects
    RealEstateProperty: nonmovable
    PurchasePrice: money
    InitialPayment: money
    RemainingPayment: money
    MonthlyInstallment: money

article 1 Generated
    fact Spouse1Seller owns RealEstateProperty
    fact asset MarriageRelation is present
    obligation Spouse1Seller must transfer RealEstateProperty to Spouse2Buyer.
    obligation Spouse2Buyer must pay PurchasePrice to Spouse1Seller.
    obligation Spouse1Seller must transfer RealEstateProperty to Spouse2Buyer.
    rule BreachPenaltyRule
        If Spouse2Buyer fails to pay PurchasePrice to Spouse1Seller
        then Spouse2Buyer must pay PurchasePrice to Spouse1Seller.
    procedure PaymentProcedure:
        Spouse2Buyer pays InitialPayment to Spouse1Seller.
        Spouse2Buyer pays MonthlyInstallment to Spouse1Seller.