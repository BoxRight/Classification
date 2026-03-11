law CódigoCivilPara
authority judicial

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person

objects
    RentedProperty: nonmovable
    MonthlyRent: money
    WaterBill: money
    PropertyTax: money
    ElectricityBill: money

article 1 Generated
    fact Plaintiff owns RentedProperty
    fact asset VerbalLeaseContract is present
    fact liability UnpaidRent is present
    fact liability UnpaidUtilities is present
    obligation Defendant must pay MonthlyRent to Plaintiff.
    obligation Defendant must pay WaterBill to Plaintiff.
    obligation Defendant must pay PropertyTax to Plaintiff.
    obligation Defendant must pay ElectricityBill to Plaintiff.
    obligation Defendant must transfer RentedProperty to Plaintiff.
    rule LeasePaymentRule
        If asset VerbalLeaseContract is present
        then Defendant must pay MonthlyRent to Plaintiff.
    rule UtilityPaymentRule
        If asset VerbalLeaseContract is present
        then Defendant must pay WaterBill to Plaintiff.
    rule LeaseTerminationRule
        If Defendant fails to pay MonthlyRent to Plaintiff
        then Defendant must transfer RentedProperty to Plaintiff.
    procedure LeaseContractRecognition:
        Defendant pays MonthlyRent to Plaintiff.
        Defendant transfers RentedProperty to Plaintiff.
        Defendant transfers RentedProperty to Plaintiff.