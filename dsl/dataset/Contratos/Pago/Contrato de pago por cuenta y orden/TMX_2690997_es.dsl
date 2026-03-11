law ContratoPagoPor
authority private
enacted 2024-05-30

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Client: Client Person, natural person
    AgenteDePago: AgenteDePago Corp, legal person

objects
    FondosPago: money
    Comision: money
    GastosAdicionales: money
    DocumentacionPagos: service
    RegistroPagos: service
    PagosTerceros: service

article 1 Generated
    fact asset ContratoPagoVigente is present
    obligation AgenteDePago must provide PagosTerceros to Client.
    obligation AgenteDePago must provide RegistroPagos to Client.
    obligation AgenteDePago must provide DocumentacionPagos to Client.
    obligation Client must pay FondosPago to AgenteDePago.
    obligation Client must pay Comision to AgenteDePago.
    obligation Client must pay GastosAdicionales to AgenteDePago.
    rule ObligacionesAgente
        If asset ContratoPagoVigente is present
        then AgenteDePago must provide PagosTerceros to Client.
    rule ObligacionesCliente
        If asset ContratoPagoVigente is present
        then Client must pay FondosPago to AgenteDePago.