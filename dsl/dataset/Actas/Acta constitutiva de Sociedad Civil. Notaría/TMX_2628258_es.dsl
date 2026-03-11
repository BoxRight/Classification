law ConstitutiveDeed
authority private
enacted 2023-10-24

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Associates: Associates Person, natural person
    CivilSociety: CivilSociety Corp, legal person
    AdministrationCommittee: AdministrationCommittee Corp, legal person
    ManagingPartner: ManagingPartner Person, natural person

objects
    SocialCapital: money
    SocialContributions: money
    NotarialServices: service
    LegalServices: service
    FinancialServices: service
    AccountingServices: service
    SocialRights: movable

article 1 Generated
    fact asset SocietyConstitution is present
    obligation Associates must pay SocialContributions to CivilSociety.
    obligation CivilSociety must provide NotarialServices to ThirdParties.
    prohibition Associates must not transfer SocialRights.
    rule CapitalContributionRule
        If asset SocietyConstitution is present
        then Associates must pay SocialContributions to CivilSociety.
    procedure SocietyConstitution:
        Associates pays SocialContributions to CivilSociety.