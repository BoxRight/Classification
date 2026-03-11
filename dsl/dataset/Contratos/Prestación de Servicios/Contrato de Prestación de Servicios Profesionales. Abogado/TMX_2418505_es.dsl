law ServiceContract
authority private
enacted 2024-04-22

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Company: Company Corp, legal person
    ServiceProvider: ServiceProvider Person, natural person

objects
    LegalServices: service
    ProfessionalFees: money
    ConfidentialInformation: service
    Documentation: service
    Expenses: money

article 1 Generated
    fact asset ServiceContract is present
    fact certification ProfessionalLicense is present
    fact certification TaxCompliance is present
    obligation ServiceProvider must provide LegalServices to Company.
    obligation Company must pay ProfessionalFees to ServiceProvider.
    prohibition ServiceProvider must not provide ConfidentialInformation.
    obligation Company must provide Documentation to ServiceProvider.
    obligation Company must pay Expenses to ServiceProvider.
    rule ExpenseReimbursement
        If asset ServiceContract is present and asset TravelRequired is present
        then Company must pay Expenses to ServiceProvider.