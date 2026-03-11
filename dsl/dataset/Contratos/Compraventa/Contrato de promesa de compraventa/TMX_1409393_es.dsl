law ContratoPromesaCompraventa
authority private
enacted 2024-02-05

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Seller: Seller Person, natural person
    Buyer1: Buyer1 Person, natural person
    Buyer2: Buyer2 Person, natural person

objects
    Property: nonmovable
    Construction: nonmovable
    PenaltyPayment: money
    LatePayment: money
    PurchasePrice: money

article 1 Generated
    fact Seller owns Property
    fact asset PromiseContract is present
    obligation Seller must transfer Property to Buyer1.
    obligation Buyer1 must pay PurchasePrice to Seller.
    obligation Seller must transfer Construction to Buyer1.
    rule BreachPenaltyRule
        If asset PromiseContract is present and Seller fails to transfer Property to Buyer1
        then Seller must pay PenaltyPayment to Buyer1.
    rule BuyerBreachPenaltyRule
        If asset PromiseContract is present and Buyer1 fails to pay PurchasePrice to Seller
        then Buyer1 must pay PenaltyPayment to Seller.
    rule LateDeliveryPenaltyRule
        If asset PromiseContract is present and Seller fails to transfer Construction to Buyer1
        then Seller must pay LatePayment to Buyer1.
    procedure SaleCompletionProcess:
        Seller transfers Construction to Buyer1.
        Seller transfers Property to Buyer1.
        Buyer1 pays PurchasePrice to Seller.