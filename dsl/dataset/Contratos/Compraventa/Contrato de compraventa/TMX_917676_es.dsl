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
    obligation Seller must transfer Property to Buyer.
    rule SaleObligation
        If asset SaleContract is present
        then Seller must transfer Property to Buyer.
    rule WarrantyObligation
        If asset SaleContract is present
        then Seller must perform Warranty to Buyer.
    procedure PropertySaleProcedure:
        Buyer pays PurchasePrice to Seller.
        Seller transfers Property to Buyer.
        Seller transfers Property to Buyer.