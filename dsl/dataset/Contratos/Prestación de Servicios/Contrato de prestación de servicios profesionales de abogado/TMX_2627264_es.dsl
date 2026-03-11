law ServiceContract
authority private
enacted 2024-02-05

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Contratante: Contratante Person, natural person
    Lender: Lender Person, natural person

objects
    LegalServices: service
    ProfessionalFees: money
    CriminalDefense: service
    LegalRepresentation: service

article 1 Generated
    fact asset ContractualRelation is present
    fact certification ProfessionalLicense is present
    obligation Lender must provide CriminalDefense to Contratante.
    obligation Contratante must pay ProfessionalFees to Lender.
    prohibition Lender must not perform ConfidentialInformation.
    prohibition Lender must not perform ContractRights.
    rule ServiceProvisionRule
        If asset ContractualRelation is present
        then Lender must provide LegalServices to Contratante.
    rule PaymentRule
        If asset ContractualRelation is present
        then Contratante must pay ProfessionalFees to Lender.
    rule BreachPenaltyRule
        If Lender fails to provide LegalServices to Contratante
        then Lender must perform PenaltyPayment to Contratante.