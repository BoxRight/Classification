law ServiceContract
authority private
enacted 2023-04-21

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Contratante: Contratante Person, natural person
    Lender: Lender Person, natural person

objects
    NursingServices: service
    Honorarios: money

article 1 Generated
    fact certification ProfessionalNursingCertification is present
    obligation Lender must provide NursingServices to Contratante.
    obligation Contratante must pay Honorarios to Lender.
    prohibition Lender must not perform ConfidentialInformation.
    prohibition Lender must not perform ContractRights.
    rule PenaltyRule
        If Lender fails to provide NursingServices to Contratante
        then Lender must perform PenaltyPayment to Contratante.
    rule RescissionRule
        If Lender fails to perform ContractObligations to Contratante
        then Contratante may perform ContractRescission to Lender.
    rule ConfidentialityBreachRule
        If Lender fails to perform ConfidentialityObligation to Contratante
        then Contratante may demand DamagesCompensation from Lender.