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
    Automobile: movable
    PurchasePrice: money
    VehicleDocumentation: movable

article 1 Generated
    obligation Seller must transfer Automobile to Buyer.
    obligation Buyer must pay PurchasePrice to Seller.
    obligation Seller must transfer VehicleDocumentation to Buyer.
    obligation Seller must transfer Automobile to Buyer.
    obligation Seller must transfer Automobile to Buyer.
    obligation Buyer must transfer Automobile to Buyer.
    rule PaymentRule
        If asset SalesContract is present
        then Buyer must pay PurchasePrice to Seller.
    rule NotificationRule
        If asset SalesContract is present
        then Seller must transfer VehicleDocumentation to Buyer.
    procedure VehicleTransfer:
        Buyer pays PurchasePrice to Seller.
        Seller transfers Automobile to Buyer.
        Seller transfers VehicleDocumentation to Buyer.