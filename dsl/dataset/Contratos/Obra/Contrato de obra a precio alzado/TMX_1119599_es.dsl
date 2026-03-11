law ContratoObraPrecio
authority private
enacted 2024-01-29

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Owner: Owner Person, natural person
    ContractorCompany: ContractorCompany Corp, legal person
    ContractorRepresentative: ContractorRepresentative Person, natural person

objects
    ConstructionWork: service
    ConstructionPayment: money
    Property: nonmovable
    MonthlyPayment: money
    DelayPenalty: money
    ContractExpenses: money

article 1 Generated
    fact Owner owns Property
    fact certification RegistryInscription is present
    obligation ContractorCompany must provide ConstructionWork to Owner.
    obligation Owner must pay MonthlyPayment to ContractorCompany.
    obligation ContractorCompany must pay ContractExpenses to ContractorCompany.
    rule MonthlyPaymentRule
        If certification MonthlyWorkCertification is present
        then Owner must pay MonthlyPayment to ContractorCompany.
    rule OwnerWithdrawalRule
        If asset ConstructionContract is present
        then Owner may provide ConstructionWork to ContractorCompany.
    rule ContractorBreachRule
        If ContractorCompany fails to provide ConstructionWork to Owner
        then Owner may demand ConstructionPayment from ContractorCompany.
    procedure MonthlyPaymentProcess:
        Owner pays MonthlyPayment to ContractorCompany.