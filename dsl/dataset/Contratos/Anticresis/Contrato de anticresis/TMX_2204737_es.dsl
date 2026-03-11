law ContratoAnticresis
authority private
enacted 2022-02-16

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    DebtorAnticresista: DebtorAnticresista Person, natural person
    CreditorAnticresista: CreditorAnticresista Person, natural person

objects
    ImmovableProperty: nonmovable
    DebtAmount: money
    PropertyFruits: money
    UsufructRight: service

article 1 Generated
    fact liability DebtObligation is present
    fact DebtorAnticresista owns ImmovableProperty
    fact asset UsufructPossession is present
    obligation DebtorAnticresista must provide UsufructRight to CreditorAnticresista.
    obligation CreditorAnticresista must pay PropertyFruits to DebtorAnticresista.
    prohibition CreditorAnticresista must not transfer ImmovableProperty.
    obligation CreditorAnticresista must transfer ImmovableProperty to DebtorAnticresista.
    rule DebtPaymentWithFruits
        If asset UsufructPossession is present
        then CreditorAnticresista must pay PropertyFruits to DebtAmount.
    rule EarlyDebtPaymentRestitution
        If liability DebtFullyPaid is present
        then CreditorAnticresista must provide UsufructRight to DebtorAnticresista.
    rule DelayedRestitutionPenalty
        If CreditorAnticresista fails to provide UsufructRight to DebtorAnticresista
        then CreditorAnticresista must perform PenaltyPayment to DebtorAnticresista.