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
    PurchasePrice: money

article 1 Generated
    fact Seller owns Property
    fact asset SaleContract is present
    obligation Seller must transfer Property to Buyer.
    obligation Buyer must pay PurchasePrice to Seller.
    rule PropertyTransferRule
        If asset SaleContract is present
        then Seller must transfer Property to Buyer.
    rule PaymentRule
        If asset SaleContract is present
        then Buyer must pay PurchasePrice to Seller.
    procedure SaleProcedure:
        Seller transfers Property to Buyer.
        Buyer pays PurchasePrice to Seller.