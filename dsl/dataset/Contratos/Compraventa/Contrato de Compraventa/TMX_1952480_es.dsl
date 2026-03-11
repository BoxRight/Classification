law SaleContract
authority private
enacted 2024-01-17

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Seller: Seller Person, natural person
    Buyer: Buyer Person, natural person
    Witness1: Witness1 Person, natural person
    Witness2: Witness2 Person, natural person
    Expert: Expert Person, natural person

objects
    Property: nonmovable
    SalePrice: money
    Penalty: money

article 1 Generated
    fact Seller owns Property
    fact certification PropertyCertificate is present
    fact certification TaxExemptionCertificate is present
    obligation Seller must transfer Property to Buyer.
    obligation Buyer must pay SalePrice to Seller.
    rule BreachPenaltyRule
        If Seller fails to transfer Property to Buyer
        then Seller must pay Penalty to Buyer.
    rule BuyerBreachPenaltyRule
        If Buyer fails to pay SalePrice to Seller
        then Buyer must pay Penalty to Seller.