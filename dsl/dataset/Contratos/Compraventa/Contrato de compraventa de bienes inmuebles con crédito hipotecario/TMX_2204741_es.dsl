law SaleContract
authority private
enacted 2024-02-02

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Seller: Seller Corp, legal person
    Buyer: Buyer Person, natural person
    Bank: Bank Corp, legal person

objects
    Property: nonmovable
    SalePrice: money
    DownPayment: money
    MortgageCredit: money
    MonthlyPayment: money
    PromissoryNotes: movable

article 1 Generated
    fact Seller owns Property
    fact asset SaleContract is present
    fact liability MortgageDebt is present
    obligation Seller must transfer Property to Buyer.
    obligation Buyer must pay SalePrice to Seller.
    obligation Buyer must transfer Property to Seller.
    prohibition Buyer must not transfer Property.
    rule DeliveryRule
        If asset SaleContract is present
        then Seller must transfer Property to Buyer.
    rule WarrantyRule
        If asset PropertyDelivery is present
        then Seller must perform DefectRepair to Buyer.
    procedure SaleExecution:
        Seller transfers Property to Buyer.
        Buyer transfers Property to Seller.
        Buyer pays SalePrice to Seller.
        Seller transfers Property to Buyer.
        Buyer transfers Property to Seller.