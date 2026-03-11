law SaleContract
authority private
enacted 2024-02-21

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Buyer: Buyer Corp, legal person
    Seller: Seller Person, natural person

objects
    Etiquetas: movable
    PrecioTotal: money
    PenaRetraso: money
    ReditosMora: money

article 1 Generated
    fact asset ContratoCompraventa is present
    fact certification OpinionCumplimientoFiscal is present
    obligation Seller must transfer Etiquetas to Buyer.
    obligation Buyer must pay PrecioTotal to Seller.
    obligation Seller must transfer Etiquetas to Buyer.
    claim Buyer may demand Etiquetas from Seller.
    rule PenaRetrasoEntrega
        If Seller fails to transfer Etiquetas to Buyer
        then Seller must pay PenaRetraso to Buyer.
    rule MoraPago
        If Buyer fails to pay PrecioTotal to Seller
        then Buyer must pay ReditosMora to Seller.
    rule RescisionIncumplimiento
        If Buyer fails to pay PrecioTotal to Seller
        then Seller may perform ContratoCompraventa to Buyer.
    rule GarantiaCalidad
        If asset ContratoCompraventa is present
        then Seller must transfer Etiquetas to Buyer.
    rule DerechoReemplazo
        If Seller fails to transfer Etiquetas to Buyer
        then Buyer may demand Etiquetas from Seller.
    procedure EntregaEtiquetas:
        Vendedor transfers Etiquetas to Comprador.