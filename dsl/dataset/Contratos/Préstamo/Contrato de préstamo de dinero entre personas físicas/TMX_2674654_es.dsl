law ContratoPréstamoDinero
authority private
enacted 2024-04-22

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Prestamista: Prestamista Person, natural person
    Prestatario: Prestatario Person, natural person

objects
    LoanAmount: money
    MonthlyPayment: money
    InterestPayment: money
    PenaltyPayment: money
    EarlyTerminationPenalty: money
    Guarantee: nonmovable

article 1 Generated
    fact asset LoanRelation is present
    fact collateral GuaranteeProvided is present
    obligation Prestamista must pay LoanAmount to Prestatario.
    obligation Prestatario must pay LoanAmount to Prestamista.
    obligation Prestatario must pay MonthlyPayment to Prestamista.
    obligation Prestatario must pay InterestPayment to Prestamista.
    obligation Prestatario must transfer Guarantee to Prestamista.
    rule LoanDeliveryRule
        If asset LoanRelation is present
        then Prestamista must pay LoanAmount to Prestatario.
    rule RepaymentRule
        If asset LoanRelation is present
        then Prestatario must pay LoanAmount to Prestamista.
    rule MonthlyPaymentRule
        If asset LoanRelation is present
        then Prestatario must pay MonthlyPayment to Prestamista.
    rule GuaranteeRule
        If asset LoanRelation is present
        then Prestatario must transfer Guarantee to Prestamista.
    procedure LoanProcess:
        Prestamista pays LoanAmount to Prestatario.
        Prestatario pays MonthlyPayment to Prestamista.
        Prestatario pays LoanAmount to Prestamista.
    procedure EarlyTerminationProcess:
        Prestatario pays EarlyTerminationPenalty to Prestamista.