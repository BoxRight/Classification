law ContratoCompraventaAutomóvil
authority private
enacted 2024-01-23

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Seller: Seller Person, natural person
    Buyer: Buyer Person, natural person

objects
    Auto: movable
    PrecioAuto: money
    Factura: movable
    TarjetaCirculacion: movable

article 1 Generated
    fact asset ContratoCompraventa is present
    obligation Seller must transfer Auto to Buyer.
    obligation Buyer must pay PrecioAuto to Seller.
    obligation Seller must transfer Factura to Buyer.
    rule EntregaRegla
        If asset ContratoCompraventa is present
        then Seller must transfer Auto to Buyer.
    rule PagoRegla
        If asset ContratoCompraventa is present
        then Buyer must pay PrecioAuto to Seller.
    procedure CompraventaProceso:
        Buyer pays PrecioAuto to Seller.
        Seller transfers Auto to Buyer.
        Seller transfers Factura to Buyer.