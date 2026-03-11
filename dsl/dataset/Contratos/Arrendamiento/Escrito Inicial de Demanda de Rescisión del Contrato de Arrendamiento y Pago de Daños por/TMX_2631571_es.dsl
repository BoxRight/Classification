law LeaseContract
authority judicial
enacted 2023-11-20

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Tenant: Tenant Corp, legal person
    Landlord: Landlord Person, natural person
    LegalRepresentative: LegalRepresentative Person, natural person

objects
    CommercialProperty: nonmovable
    DamagesAmount: money
    RepairCosts: money
    RentReimbursement: money
    LegalCosts: money

article 1 Generated
    fact asset LeaseRelation is present
    fact liability HiddenDefects is present
    fact asset PropertyDamages is present
    obligation Landlord must perform PropertyDisclosure to Tenant.
    claim Tenant may demand DamagesAmount from Landlord.
    claim Tenant may demand RepairCosts from Landlord.
    claim Tenant may demand RentReimbursement from Landlord.
    rule HiddenDefectsLiability
        If asset LeaseRelation is present and liability HiddenDefects is present
        then Landlord must pay DamagesAmount to Tenant.

scenario lease_and_hidden_defects_timeline:
    at lease_contract_signing
    at discovery_of_hidden_defects
    at notification_to_landlord
    at landlord_non_response
    at filing_lawsuit