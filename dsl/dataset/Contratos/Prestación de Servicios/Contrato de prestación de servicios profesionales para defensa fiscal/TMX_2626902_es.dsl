law ServiceContract
authority private
enacted 2023-10-16

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Client: Client Corp, legal person
    ServiceProvider: ServiceProvider Person, natural person

objects
    ProfessionalFees: money
    FiscalDefenseServices: service
    ConfidentialInformation: service

article 1 Generated
    fact certification ProfessionalLicense is present
    fact asset ServiceContractRelation is present
    obligation ServiceProvider must provide FiscalDefenseServices to Client.
    obligation Client must pay ProfessionalFees to ServiceProvider.
    obligation ServiceProvider must provide ConfidentialInformation to Client.
    rule ServiceObligationRule
        If asset ServiceContractRelation is present
        then ServiceProvider must provide FiscalDefenseServices to Client.
    rule PaymentObligationRule
        If asset ServiceContractRelation is present
        then Client must pay ProfessionalFees to ServiceProvider.
    rule TerminationForBreachRule
        If Client fails to pay ProfessionalFees to ServiceProvider
        then ServiceProvider may perform ServiceContractRelation to Client.
    rule ConfidentialityObligationRule
        If asset ServiceContractRelation is present
        then ServiceProvider must provide ConfidentialInformation to Client.