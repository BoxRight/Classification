law ServiceContract
authority private
enacted 2023-04-21

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Company: Company Corp, legal person
    ServiceProvider: ServiceProvider Person, natural person

objects
    ProfessionalServices: service
    ProfessionalFees: money
    ConfidentialInformation: service
    Documentation: service
    ExpenseReimbursement: money
    PenaltyFee: money

article 1 Generated
    fact asset ServiceContract is present
    fact certification TaxCompliance is present
    obligation ServiceProvider must provide ProfessionalServices to Company.
    obligation Company must pay ProfessionalFees to ServiceProvider.
    prohibition ServiceProvider must not provide ConfidentialInformation.
    obligation Company must provide Documentation to ServiceProvider.
    obligation Company must pay ExpenseReimbursement to ServiceProvider.
    rule ServiceObligationRule
        If asset ServiceContract is present
        then ServiceProvider must provide ProfessionalServices to Company.