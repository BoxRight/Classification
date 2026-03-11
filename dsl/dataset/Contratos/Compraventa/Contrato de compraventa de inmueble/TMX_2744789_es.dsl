law SaleContract
authority private
enacted 2024-10-23

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
    fact certification LegalCapacity is present
    fact certification LegalCapacity is present
    fact certification LicitResourcesOrigin is present
    fact certification EnvironmentalCompliance is present
    fact certification RightOfFirstRefusalComplied is present
    obligation Seller must transfer Property to Buyer.
    obligation Buyer must pay PurchasePrice to Seller.
    obligation Seller must transfer Property to Buyer.
    procedure PropertySaleProcedure:
        Seller transfers Property to Buyer.
        Buyer pays PurchasePrice to Seller.
        Seller transfers Property to Buyer.