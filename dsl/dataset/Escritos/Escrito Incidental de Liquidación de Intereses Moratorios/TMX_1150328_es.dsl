law EscritoIncidentalLiquidación
authority judicial
enacted 2024-04-10

vocabulary
    verb pay: pay

parties
    Petitioner: Petitioner Corp, legal person
    Defendant: Defendant Corp, legal person
    Judge: Judge Corp, legal person

objects
    OrdinaryInterest: money
    MoratoryInterest: money
    PrincipalAmount: money
    DebtCertificate: service

article 1 Generated
    fact liability DebtObligation is present
    fact asset CreditRight is present
    fact certification DebtCertificate is present
    obligation Defendant must pay OrdinaryInterest to Petitioner.
    obligation Defendant must pay MoratoryInterest to Petitioner.
    rule OrdinaryInterestCalculation
        If liability DebtObligation is present
        then Defendant must pay OrdinaryInterest to Petitioner.
    rule MoratoryInterestCalculation
        If liability DebtObligation is present
        then Defendant must pay MoratoryInterest to Petitioner.
    procedure InterestLiquidationIncident:
        Petitioner performs LiquidationRequest to Judge.