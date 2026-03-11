law SaleContract
authority private
enacted 2024-08-15

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Seller: Seller Person, natural person
    Buyer: Buyer Person, natural person

objects
    Vehicle: movable
    PurchasePrice: money
    VehicleDocuments: service

article 1 Generated
    fact certification LicitResourceOrigin is present
    obligation Seller must transfer Vehicle to Buyer.
    obligation Buyer must pay PurchasePrice to Seller.
    obligation Seller must provide VehicleDocuments to Buyer.
    rule BreachRescissionRule
        If Seller fails to transfer Vehicle to Buyer
        then Buyer may pay PurchasePrice to Seller.
    rule BuyerBreachRescissionRule
        If Buyer fails to pay PurchasePrice to Seller
        then Seller may transfer Vehicle to Buyer.
    rule HiddenDefectsRule
        If asset HiddenDefects is present
        then Seller must transfer Vehicle to Buyer.
    procedure VehicleSaleProcedure:
        Buyer pays PurchasePrice to Seller.
        Seller transfers Vehicle to Buyer.
        Seller provides VehicleDocuments to Buyer.
        Seller transfers Vehicle to Buyer.