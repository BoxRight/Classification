law ServiceContract
authority private
enacted 2024-02-21

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Company: Company Corp, legal person
    Professional: Professional Person, natural person

objects
    ProfessionalServices: service
    ProfessionalFees: money
    ConfidentialInformation: service
    Documentation: service
    Expenses: money

article 1 Generated
    fact asset ServiceContract is present
    fact certification ProfessionalCredentials is present
    obligation Professional must provide ProfessionalServices to Company.
    obligation Company must pay ProfessionalFees to Professional.
    prohibition Professional must not provide ConfidentialInformation.
    prohibition Company must not provide ConfidentialInformation.
    obligation Company must provide Documentation to Professional.
    obligation Company must pay Expenses to Professional.
    rule CopyrightGuaranteeRule
        If asset ServiceContract is present
        then Professional must perform CopyrightDefense to Company.
    procedure ServiceDeliveryProcedure:
        Company provides documentation.
        Company pays professional fees.