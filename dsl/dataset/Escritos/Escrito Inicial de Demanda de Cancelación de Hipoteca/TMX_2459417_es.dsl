law DemandaCancelaciónHipoteca
authority judicial
enacted 2024-02-06

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Plaintiff1: Plaintiff1 Person, natural person
    Plaintiff2: Plaintiff2 Person, natural person
    BankingInstitution: BankingInstitution Corp, legal person
    PropertyRegistryDirector: PropertyRegistryDirector Person, natural person

objects
    MortgagedProperty: nonmovable
    MonthlyPayment: money
    ExcessiveInterest: money
    MortgageGuarantee: service
    MortgageCancellation: service

article 1 Generated
    fact Plaintiff1 owns MortgagedProperty
    fact liability MortgageObligation is present
    fact asset PaymentCompletion is present
    fact liability ExcessiveInterest is present
    prohibition BankingInstitution must not pay ExcessiveInterest.
    obligation BankingInstitution must provide MortgageCancellation to Plaintiff1.
    claim Plaintiff1 may demand MortgageCancellation from BankingInstitution.
    rule UsuryProhibitionRule
        If liability ExcessiveInterest is present
        then BankingInstitution must not pay ExcessiveInterest.
    rule MortgageCancellationRule
        If asset PaymentCompletion is present and liability ExcessiveInterest is present
        then BankingInstitution must provide MortgageCancellation to Plaintiff1.