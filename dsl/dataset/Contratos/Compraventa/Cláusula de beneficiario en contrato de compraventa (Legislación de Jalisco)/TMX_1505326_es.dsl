law SaleContract
authority private
enacted 2024-01-17

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Buyer: Buyer Person, natural person
    Beneficiary: Beneficiary Person, natural person
    CivilRegistry: CivilRegistry Corp, legal person
    PublicPropertyRegistry: PublicPropertyRegistry Corp, legal person

objects
    RealEstateProperty: nonmovable
    DeathCertificate: service
    TaxPayment: money
    PublicDocument: service

article 1 Generated
    fact Buyer owns RealEstateProperty
    fact certification MarriageOrBirthCertificate is present
    obligation Beneficiary must provide DeathCertificate to PublicPropertyRegistry.
    obligation Beneficiary must pay TaxPayment to PublicPropertyRegistry.
    obligation Beneficiary must provide PublicDocument to PublicPropertyRegistry.
    procedure BeneficiaryPropertyRegistration:
        Beneficiary provides DeathCertificate to PublicPropertyRegistry.
        Beneficiary pays TaxPayment to PublicPropertyRegistry.
        Beneficiary provides PublicDocument to PublicPropertyRegistry.