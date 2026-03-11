law ConvenioReconocimientoAdeudo
authority private
enacted 2024-05-15

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Creditor: Creditor Person, natural person
    Debtor: Debtor Person, natural person

objects
    DebtAmount: money
    MonthlyPayment: money
    MaintenanceFees: money
    PaymentReceipt: service

article 1 Generated
    fact liability DebtRecognition is present
    fact asset CondominiumUnit is present
    obligation Debtor must pay DebtAmount to Creditor.
    obligation Debtor must pay MonthlyPayment to Creditor.
    obligation Creditor must provide PaymentReceipt to Debtor.
    rule LatePaymentInterestRule
        If Debtor fails to pay MonthlyPayment to Creditor
        then Debtor must perform MoratoryInterest to Creditor.
    rule BreachPenaltyRule
        If Debtor fails to pay MonthlyPayment to Creditor
        then Debtor must perform PenaltyFee to Creditor.
    procedure PaymentProcedure:
        Debtor pays MonthlyPayment to Creditor.
        Creditor provides PaymentReceipt to Debtor.