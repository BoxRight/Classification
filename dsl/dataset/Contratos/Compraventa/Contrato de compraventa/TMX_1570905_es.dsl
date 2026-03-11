law SaleContract
authority private
enacted 2024-02-02

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

article 1 Generated
    fact Seller owns Property
    fact asset SaleContract is present
    obligation Seller must transfer Property to Buyer.
    obligation Buyer must pay SalePrice to Seller.
    obligation Seller must transfer Property to Buyer.
    procedure SaleCompletion:
        Buyer pays SalePrice to Seller.
        Seller transfers Property to Buyer.