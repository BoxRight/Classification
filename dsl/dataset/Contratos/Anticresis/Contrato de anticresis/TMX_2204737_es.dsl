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
    PropertyFruits: money
    UsufructRight: service
    RentPayment: money

article 1 Generated
    fact asset AnticresisRelation is present
    fact asset UsufructGranted is present
    fact liability DebtObligation is present
    fact DebtorAnticresista owns ImmovableProperty
    fact asset DebtFullyPaid is present
    obligation CreditorAnticresista must pay PropertyFruits to DebtorAnticresista.
    prohibition CreditorAnticresista must not transfer ImmovableProperty.
    obligation CreditorAnticresista must transfer ImmovableProperty to DebtorAnticresista.
    rule AnticresisConstitution
        If liability DebtObligation is present
        then DebtorAnticresista must provide UsufructRight to CreditorAnticresista.
    rule FruitCollectionRule
        If asset UsufructGranted is present
        then CreditorAnticresista may pay PropertyFruits.
    rule AccountRenderingRule
        If asset UsufructGranted is present
        then CreditorAnticresista must pay PropertyFruits to DebtorAnticresista.
    rule EarlyDebtPaymentRestitution
        If asset DebtFullyPaid is present
        then CreditorAnticresista must provide UsufructRight to DebtorAnticresista.
    rule LateRestitutionPenalty
        If asset DebtFullyPaid is present and daysBetween DebtFullyPaid RestitutionDate > 30
        then CreditorAnticresista must pay percentage PropertyFruits 130 to DebtorAnticresista.
    rule PropertyCareObligation
        If asset UsufructGranted is present
        then CreditorAnticresista must transfer ImmovableProperty to DebtorAnticresista.
    rule DeteriorationLiability
        If CreditorAnticresista fails to transfer ImmovableProperty
        then CreditorAnticresista transfers ImmovableProperty.