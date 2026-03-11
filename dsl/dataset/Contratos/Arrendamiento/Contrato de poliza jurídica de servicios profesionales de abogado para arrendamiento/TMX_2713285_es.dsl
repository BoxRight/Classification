law ContratoPolizaJurídica
authority private
enacted 2024-07-18

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Lawyer: Lawyer Person, natural person
    Tenant: Tenant Person, natural person

objects
    Property: nonmovable
    LegalServices: service
    ProfessionalFees: money
    LeaseContract: movable

article 1 Generated
    fact certification LawyerAuthorization is present
    fact Landlord owns Property
    fact asset LeaseRelation is present
    fact certification TaxCompliance is present
    fact certification ProfessionalCredentials is present
    obligation Lawyer must provide LegalServices to Landlord.
    obligation Landlord must pay ProfessionalFees to Lawyer.
    obligation Lawyer must provide LegalServices to Landlord.
    obligation Landlord must transfer LeaseContract to Lawyer.
    rule PolicyActivationRule
        If asset WrittenNotification is present
        then Lawyer must provide LegalServices to Landlord.
    rule TerminationRule
        If asset WrittenNotice is present
        then Landlord may transfer LeaseContract to Lawyer.