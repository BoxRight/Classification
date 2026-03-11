law InitialComplaint
authority judicial
enacted 2024-02-15

vocabulary
    verb pay: pay

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person

objects
    ParcelLand: nonmovable
    AnnualRent: money
    RefundAmount: money
    LegalInterest: money

article 1 Generated
    fact asset LeaseContract is present
    fact asset ConciliationAgreement is present
    obligation Defendant must pay RefundAmount to Plaintiff.
    obligation Defendant must pay LegalInterest to Plaintiff.
    rule BreachInterestRule
        If asset ConciliationAgreement is present and Defendant fails to pay RefundAmount to Plaintiff
        then Defendant must pay LegalInterest to Plaintiff.
    procedure ContractTermination:
        Plaintiff transfers ParcelLand to Defendant.
        Defendant pays RefundAmount to Plaintiff.

scenario lease_termination_scenario:
    at lease_contract_signed
    at mutual_termination_agreed
    at conciliation_agreement_signed
    at land_returned_by_plaintiff
    at payment_breach_by_defendant