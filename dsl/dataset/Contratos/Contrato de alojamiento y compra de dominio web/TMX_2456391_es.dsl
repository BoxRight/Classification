law ContratoAlojamientoCompra
authority private
enacted 2024-01-29

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Client: Client Corp, legal person
    Proveedor: Proveedor Corp, legal person

objects
    HostingServices: service
    DomainRegistration: service
    InternetConnection: service
    TechnicalSupport: service
    ContractPayment: money
    PenaltyFee: money
    WebsiteContent: service
    BackupCopies: service

article 1 Generated
    fact asset ServiceContract is present
    obligation Proveedor must provide HostingServices to Client.
    obligation Proveedor must provide InternetConnection to Client.
    obligation Proveedor must provide DomainRegistration to Client.
    obligation Proveedor must provide TechnicalSupport to Client.
    obligation Client must pay ContractPayment to Proveedor.
    obligation Proveedor must provide BackupCopies to Client.
    prohibition Proveedor must not provide WebsiteContent.
    rule BreachTerminationRule
        If Client fails to pay ContractPayment to Proveedor
        then Proveedor may provide HostingServices to Client.
    rule ConfidentialityBreachRule
        If Proveedor fails to provide WebsiteContent to Client
        then Proveedor must pay PenaltyFee to Client.