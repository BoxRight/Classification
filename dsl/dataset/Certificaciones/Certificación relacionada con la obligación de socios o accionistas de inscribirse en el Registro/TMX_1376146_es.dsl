law CódigoFiscalFederación
authority legislative

vocabulary
    verb provide: provide

parties
    Notary: Notary Person, natural person
    LegalRepresentatives: LegalRepresentatives Person, natural person
    Partners: Partners Person, natural person
    Shareholders: Shareholders Person, natural person
    LegalEntities: LegalEntities Corp, legal person
    TaxAuthority: TaxAuthority Corp, legal person
    ForeignResidents: ForeignResidents Person, natural person

objects
    RfcRegistration: service
    TaxIdCertificate: service
    ShareholderRegistryBook: service
    AssemblyMinutes: service
    PublicDeed: service

article 1 Generated
    fact certification NotaryVerification is present
    fact certification Rfcregistration is present
    fact certification ForeignResidence is present
    fact certification NonProfitStatus is present
    obligation LegalRepresentatives must provide RfcRegistration to TaxAuthority.
    obligation Partners must provide RfcRegistration to TaxAuthority.
    obligation Shareholders must provide RfcRegistration to TaxAuthority.
    obligation Notary must provide TaxIdCertificate to LegalEntities.
    obligation LegalEntities must provide RfcRegistration to ShareholderRegistryBook.
    rule RfcRegistrationObligation
        If certification LegalEntityStatus is present
        then Partners must provide RfcRegistration to TaxAuthority.
    rule NonprofitExemption
        If certification NonProfitStatus is present
        then Partners may fail RfcRegistration to TaxAuthority.
    rule ForeignResidentExemption
        If certification ForeignResidence is present and certification TimelyNotification is present
        then ForeignResidents may fail RfcRegistration to TaxAuthority.
    rule NotaryNotificationRule
        If Partners fails to provide TaxIdCertificate to Notary
        then Notary must provide RfcRegistration to TaxAuthority.
    procedure NotaryVerificationProcess:
        Partners provides TaxIdCertificate to Notary.
        Notary provides TaxIdCertificate to LegalEntities.
        Notary provides PublicDeed to LegalEntities.