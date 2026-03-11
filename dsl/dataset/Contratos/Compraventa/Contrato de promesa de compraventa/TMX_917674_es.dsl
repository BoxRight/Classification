law ContratoPromesaCompraventa
authority private
enacted 2024-02-05

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    PromitenteVendedora: PromitenteVendedora Person, natural person
    PromitenteCompradora: PromitenteCompradora Person, natural person

objects
    Property: nonmovable
    EscrituraDefinitiva: service
    PrecioTotal: money
    GastosTramitacion: money
    PenaltyFee: money

article 1 Generated
    fact PromitenteVendedora owns Property
    fact asset ContratoPomesaVenta is present
    obligation PromitenteVendedora must transfer Property to PromitenteCompradora.
    obligation PromitenteCompradora must transfer Property to PromitenteVendedora.
    obligation PromitenteVendedora must provide EscrituraDefinitiva to PromitenteCompradora.
    obligation PromitenteVendedora must pay GastosTramitacion to PromitenteCompradora.
    obligation PromitenteCompradora must pay GastosTramitacion to PromitenteVendedora.
    rule PenaIncumplimiento
        If PromitenteVendedora fails to transfer Property to PromitenteCompradora
        then PromitenteVendedora must pay PenaltyFee to PromitenteCompradora.
    rule PenaIncumplimientoComprador
        If PromitenteCompradora fails to transfer Property to PromitenteVendedora
        then PromitenteCompradora must pay PenaltyFee to PromitenteVendedora.