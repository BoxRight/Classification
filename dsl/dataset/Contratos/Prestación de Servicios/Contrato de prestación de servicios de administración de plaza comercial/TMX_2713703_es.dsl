law ServiceContract
authority private
enacted 2024-07-23

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Administration: Administration Corp, legal person
    Professional: Professional Person, natural person

objects
    ProfessionalFees: money
    CommercialPlaza: nonmovable
    AdministrationServices: service
    MaintenanceFees: money
    RentalIncome: money

article 1 Generated
    fact Administration owns CommercialPlaza
    fact certification ProfessionalLicense is present
    fact asset ServiceContract is present
    obligation Professional must provide AdministrationServices to Administration.
    obligation Administration must pay ProfessionalFees to Professional.
    obligation Professional must pay MaintenanceFees to Administration.
    obligation Professional must pay RentalIncome to Administration.
    prohibition Professional must not perform ConfidentialInformation.
    rule ServiceProvisionRule
        If asset ServiceContract is present
        then Professional must provide AdministrationServices to Administration.
    rule PaymentRule
        If asset ServiceContract is present
        then Administration must pay ProfessionalFees to Professional.
    rule TerminationForNonpaymentRule
        If Administration fails to pay ProfessionalFees to Professional
        then Professional may demand ContractTermination from Administration.