law SaleContract
authority private
enacted 2024-02-02

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Seller: Seller Corp, legal person
    Buyer: Buyer Person, natural person

objects
    Property: nonmovable
    PurchasePrice: money
    FirstPayment: money
    SecondPayment: money
    ThirdPayment: money
    PenaltyFee: money

article 1 Generated
    fact Seller owns Property
    fact asset PurchaseContract is present
    obligation Seller must transfer Property to Buyer.
    obligation Buyer must pay FirstPayment to Seller.
    obligation Buyer must pay SecondPayment to Seller.
    obligation Buyer must pay ThirdPayment to Seller.
    prohibition Buyer must not transfer Property.
    rule PaymentBreachRescission
        If Buyer fails to pay PurchasePrice to Seller
        then Seller may demand Property from Seller.
    rule PenaltyRule
        If Buyer fails to pay PurchasePrice to Seller
        then Buyer must pay PenaltyFee to Seller.
    procedure PaymentSchedule:
        Buyer pays FirstPayment to Seller.
        Buyer pays SecondPayment to Seller.
        Buyer pays ThirdPayment to Seller.
    procedure NotarizationProcess:
        Seller transfers Property to Buyer.