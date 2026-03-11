law ServiceContract
authority private
enacted 2024-02-14

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Client: Client Corp, legal person
    ServiceProvider: ServiceProvider Corp, legal person

objects
    LegalServices: service
    MonthlyPayment: money
    ConfidentialInformation: service

article 1 Generated
    fact asset ServiceContract is present
    fact certification LegalConstitution is present
    fact certification LegalConstitution is present
    obligation ServiceProvider must provide LegalServices to Client.
    obligation Client must pay MonthlyPayment to ServiceProvider.
    prohibition ServiceProvider must not fail ConfidentialInformation.
    rule ServiceObligationRule
        If asset ServiceContract is present
        then ServiceProvider must provide LegalServices to Client.