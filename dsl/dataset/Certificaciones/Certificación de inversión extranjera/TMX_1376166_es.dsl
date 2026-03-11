law LeyInversiónExtranjera
authority administrative
enacted 1993-12-27

vocabulary
    verb provide: provide

parties
    Notary: Notary Corp, legal person
    ForeignInvestor: ForeignInvestor Person, natural person
    MexicanCompany: MexicanCompany Corp, legal person
    ForeignCompany: ForeignCompany Corp, legal person
    Rnie: Rnie Corp, legal person

objects
    RnieRegistration: service
    RegistrationApplication: service
    AnnualRenewal: service

article 1 Generated
    fact certification ForeignInvestmentParticipation is present
    fact certification Rnieregistration is present
    obligation ForeignInvestor must provide RnieRegistration to Rnie.
    obligation Notary must provide RnieRegistration to ForeignInvestor.
    obligation Notary must provide RegistrationApplication to Rnie.
    rule RegistrationObligationRule
        If certification ForeignInvestmentParticipation is present
        then ForeignInvestor must provide RnieRegistration to Rnie.
    rule AnnualRenewalRule
        If certification Rnieregistration is present
        then ForeignInvestor must provide AnnualRenewal to Rnie.
    procedure ForeignInvestmentCertification:
        Notary provides RnieRegistration to ForeignInvestor.
        Notary provides RegistrationApplication to Rnie.