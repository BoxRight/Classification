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
    VehiclePlates: movable
    PenaltyFee: money

article 1 Generated
    fact asset SaleContract is present
    obligation Seller must transfer Vehicle to Buyer.
    obligation Buyer must pay PurchasePrice to Seller.
    obligation Seller must transfer VehiclePlates to Buyer.
    obligation Buyer must transfer Vehicle to Buyer.
    rule OwnershipChangeRule
        If asset SaleContract is present
        then Buyer must transfer Vehicle to Buyer.
    rule PenaltyRule
        If Buyer fails to transfer Vehicle to Buyer
        then Buyer must pay PenaltyFee to Seller.
    procedure VehicleSaleProcedure:
        Buyer pays PurchasePrice to Seller.
        Seller transfers Vehicle to Buyer.
        Seller transfers VehiclePlates to Buyer.
        Buyer transfers Vehicle to Buyer.