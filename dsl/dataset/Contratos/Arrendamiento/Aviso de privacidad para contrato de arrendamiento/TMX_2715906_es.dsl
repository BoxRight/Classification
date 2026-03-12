law LeaseContract
authority private
enacted 2024-08-08

vocabulary
    verb perform: perform
    verb provide: provide

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person

objects
    PersonalData: service

article 1 Generated
    fact asset LeaseRelation is present
    fact certification DataConsent is present
    obligation Landlord must provide PersonalData to Tenant.
    claim Tenant may demand PersonalData from Landlord.
    claim Tenant may demand PersonalData from Landlord.
    claim Tenant may demand PersonalData from Landlord.
    claim Tenant may demand PersonalData from Landlord.
    rule DataCollectionRule
        If asset LeaseRelation is present
        then Landlord must provide PersonalData to Tenant.
    rule DataProtectionRule
        If certification DataConsent is present
        then Landlord must provide PersonalData to Tenant.
    rule ArcoRightsRule
        If asset LeaseRelation is present
        then Tenant may demand PersonalData from Landlord.
    procedure DataCollectionProcedure:
        Landlord provides PersonalData to Tenant.
        Landlord provides PersonalData to Tenant.
        Landlord provides PersonalData to Tenant.