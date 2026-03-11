law SaleContract
authority private
enacted 2024-11-26

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Seller: Seller Person, natural person
    Buyer: Buyer Person, natural person

objects
    RealEstate: nonmovable
    PurchasePrice: money
    PropertyDocuments: service

article 1 Generated
    fact Seller owns RealEstate
    fact asset SaleContract is present
    fact certification PropertyRegistration is present
    obligation Buyer must pay PurchasePrice to Seller.
    obligation Seller must transfer RealEstate to Buyer.
    obligation Seller must provide PropertyDocuments to Buyer.
    obligation Buyer must transfer RealEstate to Buyer.
    rule PaymentDefaultRule
        If Buyer fails to pay PurchasePrice to Seller
        then Buyer must pay PurchasePrice to Seller.
    rule ContractResolutionBuyerDefault
        If Buyer fails to pay PurchasePrice to Seller
        then Seller may demand RealEstate from Seller.
    rule ContractResolutionSellerDefault
        If Seller fails to transfer RealEstate to Buyer
        then Buyer may demand PurchasePrice from Buyer.
    procedure PropertyTransfer:
        Buyer pays PurchasePrice to Seller.
        Seller transfers RealEstate to Buyer.