law EvictionDemand
authority judicial
enacted 2024-01-23

vocabulary
    verb transfer: transfer

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    Judge: Judge Person, natural person
    LegalAdvisor: LegalAdvisor Person, natural person

objects
    RentalProperty: nonmovable
    MonthlyRent: money
    PropertyImprovements: service

article 1 Generated
    fact liability RentDebt is present
    fact asset LeaseAgreement is present
    fact asset PropertyImprovements is present
    fact asset VerbalCompensationAgreement is present
    claim Plaintiff may demand RentalProperty from Defendant.
    privilege Defendant may transfer RentalProperty to Plaintiff.
    rule LackOfStandingDefense
        If asset VerbalCompensationAgreement is present
        then Defendant may transfer RentalProperty to Plaintiff.
    procedure EvictionDefenseProcedure:
        Defendant transfers RentalProperty to Plaintiff.