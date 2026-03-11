law ServiceContract
authority private
enacted 2024-10-24

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    ElCliente: ElCliente Corp, legal person
    ElPrestador: ElPrestador Corp, legal person

objects
    ServerRentalServices: service
    MonthlyPayment: money
    DataServers: movable
    Encryptors: movable

article 1 Generated
    fact asset ExtendedContract is present
    obligation ElPrestador must provide ServerRentalServices to ElCliente.
    obligation ElCliente must pay MonthlyPayment to ElPrestador.
    obligation ElPrestador must perform MaintenanceSupport to ElCliente.
    rule ContractExtensionRule
        If asset ExtendedContract is present
        then ElPrestador must provide ServerRentalServices to ElCliente.
    rule PaymentObligationRule
        If asset ExtendedContract is present
        then ElCliente must pay MonthlyPayment to ElPrestador.