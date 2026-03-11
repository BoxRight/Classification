law SaleContract
authority private
enacted 2024-07-02

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Seller: Seller Person, natural person
    Buyer: Buyer Person, natural person

objects
    Property: nonmovable
    SalePrice: money
    DownPayment: money
    PenaltyAmount: money
    ConventionalPenalty: money

article 1 Generated
    fact Seller owns Property
    fact asset SaleContract is present
    obligation Seller must transfer Property to Buyer.
    obligation Buyer must pay SalePrice to Seller.
    obligation Seller must transfer Property to Buyer.
    rule PenaltyRetentionRule
        If Buyer fails to pay SalePrice to Seller
        then Seller may demand PenaltyAmount from Buyer.
    rule ConventionalPenaltyRule
        If Buyer fails to pay SalePrice to Seller
        then Buyer must pay ConventionalPenalty to Seller.
    rule SellerBreachPenaltyRule
        If Seller fails to transfer Property to Buyer
        then Seller must pay ConventionalPenalty to Buyer.
    procedure SaleCompletion:
        Buyer pays SalePrice to Seller.
        Seller transfers Property to Buyer.
        Seller transfers Property to Buyer.
    procedure BreachResolution:
        Buyer fail SalePrice to Seller.