law ServiceContract
authority private
enacted 2024-02-14

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    Client: Client Corp, legal person
    PrestadorServicios: PrestadorServicios Corp, legal person

objects
    ContratoServicios: service
    Entregables: service
    PagoServicios: money
    ConfidentialInformation: service

article 1 Generated
    fact asset ContratoTerminacion is present
    obligation PrestadorServicios must provide Entregables to Client.
    obligation Client must provide ConfidentialInformation to PrestadorServicios.
    obligation PrestadorServicios must provide ConfidentialInformation to Client.
    prohibition Client must not provide ConfidentialInformation.
    prohibition PrestadorServicios must not provide ConfidentialInformation.
    rule EntregaSieteDias
        If asset ContratoTerminacion is present
        then PrestadorServicios must provide Entregables to Client.
    procedure ProcesoTerminacion:
        Client provides ContratoServicios to PrestadorServicios.
        PrestadorServicios provides Entregables to Client.