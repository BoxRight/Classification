law ContratoServiciosProfesionales
authority private
enacted 2024-02-05

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Client: Client Person, natural person
    Professional: Professional Person, natural person

objects
    MedicalServices: service
    ProfessionalFees: money
    MonthlyPayments: money
    ConfidentialInformation: service

article 1 Generated
    fact certification ProfessionalLicense is present
    fact certification MexicanNationality is present
    fact certification MexicanNationality is present
    obligation Professional must provide MedicalServices to Client.
    obligation Professional must provide ConfidentialInformation to Client.
    obligation Client must pay ProfessionalFees to Professional.
    prohibition Professional must not provide ConfidentialInformation.
    rule ServiceObligationRule
        If asset ContractValidity is present
        then Professional must provide MedicalServices to Client.
    rule PaymentObligationRule
        If asset ServiceCompletion is present
        then Client must pay ProfessionalFees to Professional.
    rule ConfidentialityBreachPenalty
        If Professional fails to provide ConfidentialInformation to Client
        then Professional must perform PenaltyPayment to Client.
    procedure ServiceProvision:
        Professional provides MedicalServices to Client.
        Client pays ProfessionalFees to Professional.