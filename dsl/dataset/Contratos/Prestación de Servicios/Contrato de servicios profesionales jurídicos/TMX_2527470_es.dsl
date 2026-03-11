law ContratoServiciosProfesionales
authority private
enacted 2023-02-27

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Client: Client Corp, legal person
    ServiceProvider: ServiceProvider Person, natural person

objects
    LegalServices: service
    MonthlyFees: money
    ConfidentialInformation: service
    IntellectualProperty: service

article 1 Generated
    fact asset ServiceContract is present
    fact certification ProfessionalLicense is present
    obligation ServiceProvider must provide LegalServices to Client.
    obligation Client must pay MonthlyFees to ServiceProvider.
    obligation ServiceProvider must provide ConfidentialInformation to Client.
    claim Client may demand IntellectualProperty from ServiceProvider.
    rule ServiceObligationRule
        If asset ServiceContract is present
        then ServiceProvider must provide LegalServices to Client.
    rule ConfidentialityRule
        If asset ServiceContract is present
        then ServiceProvider must provide ConfidentialInformation to Client.
    rule IntellectualPropertyRule
        If asset ServiceContract is present
        then Client may demand IntellectualProperty from ServiceProvider.