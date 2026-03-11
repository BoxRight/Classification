law ContratoReconocimientoAdeudo
authority private
enacted 2024-04-19

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Creditor: Creditor Person, natural person
    Debtor: Debtor Person, natural person

objects
    DebtAmount: money
    FiduciaryRights: service
    FirstPayment: money
    SecondPayment: money
    ThirdPayment: money
    FourthPayment: money

article 1 Generated
    fact liability DebtRecognition is present
    fact collateral FiduciaryGuarantee is present
    fact asset ContractValidity is present
    obligation Debtor must pay FirstPayment to Creditor.
    obligation Debtor must pay SecondPayment to Creditor.
    obligation Debtor must pay ThirdPayment to Creditor.
    obligation Debtor must pay FourthPayment to Creditor.
    obligation Debtor must provide FiduciaryRights to Creditor.
    privilege Creditor may provide FiduciaryRights to Debtor.
    rule BreachConsequenceRule
        If Debtor fails to pay DebtAmount to Creditor
        then Creditor may provide FiduciaryRights to Debtor.
    procedure PaymentSchedule:
        Debtor pays FirstPayment to Creditor.
        Debtor pays SecondPayment to Creditor.
        Debtor pays ThirdPayment to Creditor.
        Debtor pays FourthPayment to Creditor.
    procedure GuaranteeExecution:
        Creditor provides FiduciaryRights to Debtor.