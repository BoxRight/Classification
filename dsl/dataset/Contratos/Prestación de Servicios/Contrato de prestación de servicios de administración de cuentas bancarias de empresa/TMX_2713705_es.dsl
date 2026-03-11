law ServiceContract
authority private
enacted 2024-07-23

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Company: Company Corp, legal person
    PrestadorServicios: PrestadorServicios Person, natural person

objects
    ProfessionalServices: service
    ProfessionalFees: money
    ConfidentialInformation: service
    DocumentacionEmpresa: service
    CuentasBancarias: service

article 1 Generated
    fact asset ContractualRelation is present
    obligation PrestadorServicios must provide ProfessionalServices to Company.
    obligation Company must pay ProfessionalFees to PrestadorServicios.
    prohibition PrestadorServicios must not provide ConfidentialInformation.