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
    GestoriaServices: service
    MonthlyFees: money
    LegalAdvisory: service
    AdministrativeProcedures: service
    DocumentsMaterials: movable
    ConfidentialInformation: movable
    ExpenseReimbursement: money

article 1 Generated
    fact asset ServiceContract is present
    obligation ServiceProvider must provide GestoriaServices to Company.
    obligation Company must pay MonthlyFees to ServiceProvider.
    obligation ServiceProvider must pay MonthlyFees to Company.
    obligation Company must transfer DocumentsMaterials to ServiceProvider.
    obligation ServiceProvider must transfer DocumentsMaterials to Company.
    prohibition ServiceProvider must not fail ConfidentialInformation.
    prohibition ServiceProvider must not fail GestoriaServices.
    obligation Company must pay ExpenseReimbursement to ServiceProvider.
    rule BreachTerminationRule
        If ServiceProvider fails to provide GestoriaServices to Company
        then Company may perform ServiceContract to ServiceProvider.
    procedure ServiceDelivery:
        Company transfers DocumentsMaterials to ServiceProvider.
        ServiceProvider provides GestoriaServices to Company.
        Company pays MonthlyFees to ServiceProvider.
        ServiceProvider pays MonthlyFees to Company.
    procedure ContractTermination:
        ServiceProvider transfers DocumentsMaterials to Company.