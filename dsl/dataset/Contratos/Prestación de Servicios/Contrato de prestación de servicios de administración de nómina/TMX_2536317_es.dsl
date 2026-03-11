law ServiceContract
authority private
enacted 2024-02-05

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Company: Company Corp, legal person
    ServiceProvider: ServiceProvider Person, natural person

objects
    PayrollAdministrationServices: service
    MonthlyFees: money
    ConfidentialInformation: service
    WorkMaterials: service

article 1 Generated
    fact asset ServiceContract is present
    obligation ServiceProvider must provide PayrollAdministrationServices to Company.
    obligation Company must pay MonthlyFees to ServiceProvider.
    prohibition ServiceProvider must not provide ConfidentialInformation.
    obligation ServiceProvider must provide WorkMaterials to Company.
    obligation Company must perform NecessaryDocumentation to ServiceProvider.
    rule ServiceProvisionRule
        If asset ServiceContract is present
        then ServiceProvider must provide PayrollAdministrationServices to Company.
    rule PaymentRule
        If asset ServiceContract is present
        then Company must pay MonthlyFees to ServiceProvider.
    procedure PayrollAdministration:
        Calculate and pay employer-employee contributions.