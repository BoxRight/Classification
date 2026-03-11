law ContratoRentaVitalicia
authority private
enacted 2024-02-05

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Pensionista: Pensionista Person, natural person
    Debtor: Debtor Person, natural person
    DeudorHeirs: DeudorHeirs Person, natural person

objects
    Property: nonmovable
    MonthlyPayment: money
    NotarizationCosts: money

article 1 Generated
    fact Pensionista owns Property
    fact asset LifeAnnuityContract is present
    fact asset PensionistAlive is present
    fact asset DeudorDeceased is present
    obligation Pensionista must transfer Property to Debtor.
    obligation Debtor must pay MonthlyPayment to Pensionista.
    rule MonthlyPaymentRule
        If asset LifeAnnuityContract is present and asset PensionistAlive is present
        then Debtor must pay MonthlyPayment to Pensionista.
    rule HeirsPaymentRule
        If asset LifeAnnuityContract is present and asset DeudorDeceased is present and asset PensionistAlive is present
        then DeudorHeirs must pay MonthlyPayment to Pensionista.
    rule CostSharingRule
        If asset LifeAnnuityContract is present
        then Pensionista must pay NotarizationCosts.
    rule CostSharingRuleDeudor
        If asset LifeAnnuityContract is present
        then Debtor must pay NotarizationCosts.