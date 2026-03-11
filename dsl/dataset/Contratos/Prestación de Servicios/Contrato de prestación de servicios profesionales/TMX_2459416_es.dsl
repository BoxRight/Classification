law ServiceContract
authority private
enacted 2023-04-21

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Client: Client Corp, legal person
    ServiceProvider: ServiceProvider Person, natural person

objects
    ProfessionalServices: service
    MonthlyFee: money
    ConfidentialInformation: service
    IntellectualPropertyRights: service

article 1 Generated
    fact certification LegalConstitution is present
    fact certification ProfessionalCompetence is present
    obligation ServiceProvider must provide ProfessionalServices to Client.
    obligation Client must pay MonthlyFee to ServiceProvider.
    obligation ServiceProvider must provide ConfidentialInformation to Client.
    rule ServiceProvisionRule
        If asset ServiceContract is present
        then ServiceProvider must provide ProfessionalServices to Client.
    rule PaymentRule
        If asset ServiceContract is present
        then Client must pay MonthlyFee to ServiceProvider.
    rule ConfidentialityRule
        If asset ServiceContract is present
        then ServiceProvider must not provide ConfidentialInformation.
    rule TerminationBreachRule
        If ServiceProvider fails to provide ProfessionalServices to Client
        then Client may perform ContractTermination to ServiceProvider.
    rule TerminationNoticeRule
        If asset ServiceContract is present
        then Client may perform ContractTerminationNotice to ServiceProvider.