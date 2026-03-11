law LeaseContract
authority private
enacted 2024-11-21

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person

objects
    Quirofano: nonmovable
    RentalPayment: money
    AdditionalEquipment: movable

article 1 Generated
    fact Landlord owns Quirofano
    fact certification MedicalLicense is present
    fact certification Nom016Compliance is present
    obligation Tenant must pay RentalPayment to Landlord.
    obligation Landlord must transfer Quirofano to Tenant.
    obligation Landlord must transfer Quirofano to Tenant.
    obligation Tenant must transfer Quirofano to Landlord.
    prohibition Tenant must not fail Quirofano.
    rule PaymentObligation
        If asset QuirofanoRentalAgreement is present
        then Tenant must pay RentalPayment to Landlord.
    rule DamageLiability
        If Tenant fails to transfer Quirofano to Landlord
        then Tenant must pay RentalPayment to Landlord.