law ServiceContract
authority private
enacted 2023-06-28

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Contratante: Contratante Person, natural person
    Lender: Lender Person, natural person

objects
    LegalServices: service
    PercentageFee: money
    FixedCompensation: money
    PenaltyAmount: money

article 1 Generated
    fact certification ProfessionalLicense is present
    fact asset ServiceContractRelation is present
    obligation Lender must provide LegalServices to Contratante.
    obligation Lender must perform Confidentiality to Contratante.
    prohibition Lender must not perform AssignmentOfRights.
    rule SuccessfulOutcomePaymentRule
        If asset FavorableResult is present
        then Contratante must pay PercentageFee to Lender.
    rule UnsuccessfulOutcomePaymentRule
        If liability UnfavorableResult is present
        then Contratante must pay FixedCompensation to Lender.