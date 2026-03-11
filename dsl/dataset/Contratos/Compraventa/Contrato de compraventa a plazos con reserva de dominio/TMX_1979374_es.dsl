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
    FirstPayment: money
    SecondPayment: money
    ThirdPayment: money
    PromissoryNotes: movable

article 1 Generated
    fact Seller owns Property
    fact asset SaleContract is present
    obligation Buyer must pay PurchasePrice to Seller.
    obligation Buyer must transfer PromissoryNotes to Seller.
    prohibition Buyer must not transfer Property.
    rule PaymentObligationRule
        If asset SaleContract is present
        then Buyer must pay PurchasePrice to Seller.
    procedure PaymentSchedule:
        Buyer pays FirstPayment to Seller.
        Buyer pays SecondPayment to Seller.
        Buyer pays ThirdPayment to Seller.