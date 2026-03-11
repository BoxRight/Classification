law LeaseContract
authority private
enacted 2024-09-03

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Landlord: Landlord Person, natural person
    Tenant: Tenant Person, natural person
    Guarantor: Guarantor Person, natural person

objects
    HotelProperty: nonmovable
    MonthlyRent: money
    Deposit: money
    InsurancePolicy: service
    PermitsAndLicenses: service

article 1 Generated
    fact asset LeaseRelation is present
    fact Landlord owns HotelProperty
    fact asset DepositDelivered is present
    fact certification PropertyClearOfLiens is present
    fact certification HotelZoning is present
    obligation Tenant must pay MonthlyRent to Landlord.
    obligation Tenant must transfer HotelProperty.
    obligation Landlord must transfer HotelProperty to Tenant.
    obligation Tenant must transfer HotelProperty to Landlord.
    obligation Tenant must provide InsurancePolicy.
    obligation Tenant must provide PermitsAndLicenses.
    prohibition Tenant must not transfer HotelProperty.
    prohibition Tenant must not transfer HotelProperty.
    rule RentPaymentObligation
        If asset LeaseRelation is present
        then Tenant must pay MonthlyRent to Landlord.
    procedure ContractExecution:
        Landlord transfers HotelProperty to Tenant.
        Tenant transfers HotelProperty.
        Tenant pays MonthlyRent to Landlord.
        Tenant transfers HotelProperty to Landlord.