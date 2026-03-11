law SaleContract
authority private
enacted 2024-07-15

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Seller: Seller Person, natural person
    Buyer: Buyer Person, natural person

objects
    Property: nonmovable
    PurchasePrice: money
    SecurityDeposit: money
    Compensation: money

article 1 Generated
    fact Seller owns Property
    fact asset SaleContract is present
    obligation Seller must transfer Property to Buyer.
    obligation Buyer must pay PurchasePrice to Seller.
    obligation Buyer must pay SecurityDeposit to Seller.
    obligation Seller must transfer Property to Buyer.
    procedure SaleCompletion:
        Buyer pays SecurityDeposit to Seller.
        Buyer pays PurchasePrice to Seller.
        Seller transfers Property to Buyer.
        Seller pays SecurityDeposit to Buyer.
    procedure BreachProcedure:
        Buyer fail PurchasePrice to Seller.