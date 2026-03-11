law ServiceContract
authority private
enacted 2024-01-03

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Client: Client Corp, legal person
    Lender: Lender Person, natural person

objects
    ServiciosAsistenciaTecnica: service
    ContraprestacionMensual: money
    ConfidentialInformation: movable
    Creaciones: movable
    DocumentosMateriales: movable

article 1 Generated
    fact asset ContractRelation is present
    obligation Lender must provide ServiciosAsistenciaTecnica to Client.
    obligation Client must pay ContraprestacionMensual to Lender.
    obligation Lender must transfer ConfidentialInformation to Client.
    obligation Lender must transfer Creaciones to Client.
    prohibition Lender must not transfer Creaciones.
    rule PaymentRule
        If asset ContractRelation is present
        then Client must pay ContraprestacionMensual to Lender.
    rule TerminationRule
        If asset ContractRelation is present
        then Client may provide ServiciosAsistenciaTecnica to Lender.
    rule DocumentReturnRule
        If Client fails to provide ServiciosAsistenciaTecnica to Lender
        then Lender must transfer DocumentosMateriales to Client.