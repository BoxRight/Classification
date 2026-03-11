law LeaseContract
authority private
enacted 2024-01-29

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    Guarantor: Guarantor Person, natural person

objects
    LocalComercial: nonmovable
    MonthlyRent: money
    Deposit: money
    Penalty: money
    Utilities: service
    InsurancePolicy: service

article 1 Generated
    fact asset LeaseRelation is present
    fact Landlord owns LocalComercial
    obligation Tenant must pay MonthlyRent to Landlord.
    obligation Tenant must transfer LocalComercial to Landlord.
    obligation Tenant must provide Utilities.
    obligation Tenant must provide InsurancePolicy to Landlord.
    rule LatePaymentInterest
        If Tenant fails to pay MonthlyRent to Landlord
        then Tenant must pay Penalty to Landlord.
    rule NonVacationPenalty
        If Tenant fails to transfer LocalComercial to Landlord
        then Tenant must pay Penalty to Landlord.
    rule GuarantorObligation
        If Tenant fails to pay MonthlyRent to Landlord
        then Guarantor must pay MonthlyRent to Landlord.
    procedure LeaseTermination:
        Arrendatario transfers LocalComercial to Arrendador.
        Arrendador pays Deposit to Arrendatario.