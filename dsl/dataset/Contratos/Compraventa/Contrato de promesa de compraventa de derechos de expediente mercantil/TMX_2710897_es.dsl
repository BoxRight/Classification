law ContratoPromesaCompraventa
authority private
enacted 2024-07-08

vocabulary
    verb pay: pay
    verb provide: provide

parties
    PromitenteVendedor: PromitenteVendedor Person, natural person
    PromitenteComprador: PromitenteComprador Person, natural person

objects
    DerechosExpediente: service
    PrecioTotal: money
    PagoInicial: money
    PagoIntermedio: money
    PagoFinal: money
    MandatoEspecial: service
    InformacionProgreso: service
    DocumentacionAdicional: service

article 1 Generated
    obligation PromitenteVendedor must provide DerechosExpediente to PromitenteComprador.
    obligation PromitenteComprador must pay PagoInicial to PromitenteVendedor.
    obligation PromitenteComprador must pay PagoIntermedio to PromitenteVendedor.
    obligation PromitenteComprador must pay PagoFinal to PromitenteVendedor.
    obligation PromitenteVendedor must provide DerechosExpediente to PromitenteComprador.
    obligation PromitenteVendedor must provide MandatoEspecial to PromitenteComprador.
    obligation PromitenteVendedor must provide InformacionProgreso to PromitenteComprador.
    obligation PromitenteVendedor must provide DocumentacionAdicional to PromitenteComprador.
    rule RescisionPorIncumplimientoVendedor
        If PromitenteVendedor fails to provide DerechosExpediente to PromitenteComprador
        then PromitenteComprador may demand PagoInicial from PromitenteVendedor.
    rule RescisionPorIncumplimientoComprador
        If PromitenteComprador fails to pay PagoInicial to PromitenteVendedor
        then PromitenteVendedor may pay PagoInicial to PromitenteVendedor.