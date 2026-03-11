law ContratoAsunciónDeuda
authority private
enacted 2024-01-29

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Creditor: Creditor Person, natural person
    Debtor: Debtor Person, natural person
    Asunto: Asunto Person, natural person

objects
    Deuda: money

article 1 Generated
    fact liability DebtRelation is present
    fact asset CreditorRight is present
    fact certification DebtTransfer is present
    fact collateral OriginalGuarantees is present
    obligation Asunto must pay Deuda to Creditor.
    rule DebtAssumptionRule
        If certification DebtTransfer is present and liability DebtRelation is present
        then Asunto must pay Deuda to Creditor.
    procedure DebtAssumptionProcess:
        Debtor pays Deuda to Asunto.
        Asunto pays Deuda to Creditor.