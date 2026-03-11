law ServiceContract
authority private
enacted 2024-02-05

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Lender: Lender Person, natural person
    Client: Client Person, natural person

objects
    LegalServices: service
    ProfessionalFees: money
    Expenses: money

article 1 Generated
    fact asset ServiceContract is present
    obligation Lender must provide LegalServices to Client.
    obligation Client must pay ProfessionalFees to Lender.
    obligation Client must pay Expenses to Lender.
    obligation Lender must provide LegalServices to Client.
    rule ServiceProvisionRule
        If asset ServiceContract is present
        then Lender must provide LegalServices to Client.