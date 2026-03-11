law CódigoFiscalFederación
authority administrative

vocabulary
    verb provide: provide

parties
    Notary: Notary Corp, legal person
    Grantors: Grantors Corp, legal person
    TaxAuthorities: TaxAuthorities Corp, legal person
    Society: Society Corp, legal person

objects
    RegistrationRequest: service
    LiquidationNotice: service
    CancellationNotice: service
    OfficialNotice: service

article 1 Generated
    fact certification ConstitutionDeed is present
    fact certification MergerDeed is present
    fact certification SpinOffDeed is present
    fact certification LiquidationDeed is present
    obligation Notary must provide RegistrationRequest to Grantors.
    obligation Grantors must provide RegistrationRequest to TaxAuthorities.
    obligation Grantors must provide LiquidationNotice to TaxAuthorities.
    obligation Grantors must provide CancellationNotice to TaxAuthorities.
    rule ConstitutionCertificationRule
        If certification ConstitutionDeed is present
        then Grantors must provide RegistrationRequest to TaxAuthorities.
    rule LiquidationCertificationRule
        If certification LiquidationDeed is present
        then Grantors must provide LiquidationNotice to TaxAuthorities.
    rule CancellationCertificationRule
        If certification LiquidationDeed is present
        then Grantors must provide CancellationNotice to TaxAuthorities.
    rule NotaryNoticeRule
        If Grantors fails to provide RegistrationRequest to TaxAuthorities
        then Notary must provide OfficialNotice to TaxAuthorities.