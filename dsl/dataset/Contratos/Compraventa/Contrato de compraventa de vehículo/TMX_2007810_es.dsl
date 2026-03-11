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
    Vehicle: movable
    PurchasePrice: money
    VehicleDocuments: movable

article 1 Generated
    fact asset SaleContract is present
    obligation Seller must transfer Vehicle to Buyer.
    obligation Buyer must pay PurchasePrice to Seller.
    obligation Seller must transfer VehicleDocuments to Buyer.
    rule PenaltyRule
        If Seller fails to transfer Vehicle to Buyer
        then Seller must perform PenaltyPayment to Buyer.
    rule PenaltyRuleBuyer
        If Buyer fails to pay PurchasePrice to Seller
        then Buyer must perform PenaltyPayment to Seller.
    rule CancellationRule
        If asset VehicleNotDelivered is present
        then Buyer may cancel Cancellation to Seller.
    procedure VehicleSaleProcedure:
        Buyer pays PurchasePrice to Seller.
        Seller transfers Vehicle to Buyer.
        Seller transfers VehicleDocuments to Buyer.
        Buyer transfers Vehicle to Buyer.