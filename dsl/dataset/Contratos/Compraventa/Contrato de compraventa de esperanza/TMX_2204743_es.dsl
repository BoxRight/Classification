law SaleContract
authority private
enacted 2024-02-02

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Vendedora: Vendedora Person, natural person
    Compradora: Compradora Person, natural person

objects
    FincaRustica: nonmovable
    Cosecha: movable
    PrecioTotal: money
    AnticipoFirma: money
    PagoEntrega: money
    PenaltyFee: money

article 1 Generated
    fact Vendedora owns FincaRustica
    fact asset ContratoEsperanza is present
    obligation Vendedora must transfer Cosecha to Compradora.
    obligation Compradora must pay PrecioTotal to Vendedora.
    obligation Vendedora must pay AnticipoFirma to Vendedora.
    obligation Vendedora must transfer Cosecha to Vendedora.
    rule PagoAnticipoRule
        If asset ContratoEsperanza is present
        then Compradora must pay AnticipoFirma to Vendedora.