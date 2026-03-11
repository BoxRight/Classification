law SaleContract
authority private
enacted 2024-02-02

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Seller: Seller Corp, legal person
    Buyer: Buyer Corp, legal person

objects
    CommercialPremises: nonmovable
    SalePrice: money
    InitialPayment: money
    MonthlyInstallments: money
    FinalPayment: money
    PromissoryNotes: movable

article 1 Generated
    fact Seller owns CommercialPremises
    fact asset SaleContract is present
    obligation Seller must transfer CommercialPremises to Buyer.
    obligation Buyer must pay InitialPayment to Seller.
    obligation Buyer must pay MonthlyInstallments to Seller.
    obligation Buyer must pay FinalPayment to Seller.
    obligation Buyer must transfer PromissoryNotes to Seller.
    privilege Seller may transfer CommercialPremises to Buyer.
    rule RetroRightRule
        If asset SaleContract is present
        then Seller may transfer CommercialPremises to Buyer.
    procedure PaymentProcedure:
        Buyer pays InitialPayment to Seller.
        Buyer transfers PromissoryNotes to Seller.
        Buyer pays MonthlyInstallments to Seller.
        Buyer pays FinalPayment to Seller.