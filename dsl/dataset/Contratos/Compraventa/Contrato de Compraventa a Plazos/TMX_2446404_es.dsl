law InstallmentSaleContract
authority private
enacted 2024-02-14

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Seller: Seller Person, natural person
    Buyer: Buyer Person, natural person

objects
    Property: nonmovable
    PrecioTotal: money
    PagoCuota: money
    PenaltyFee: money

article 1 Generated
    fact Seller owns Property
    fact asset ContratoCompraventa is present
    obligation Seller must transfer Property to Buyer.
    obligation Buyer must pay PagoCuota to Seller.
    obligation Seller must transfer Property to Buyer.
    rule EntregaPosesionRule
        If asset ContratoCompraventa is present
        then Seller must transfer Property to Buyer.
    procedure ProcesoCompraventa:
        Seller transfers Property to Buyer.
        Seller transfers Property to Buyer.
        Buyer pays PagoCuota to Seller.
        Seller transfers Property to Buyer.