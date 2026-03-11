law ConstitutiveDeed
authority private
enacted 2023-10-25

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Society: Society Corp, legal person
    Partners: Partners Person, natural person
    AdministrationCommittee: AdministrationCommittee Person, natural person
    PartnerAdministrator: PartnerAdministrator Person, natural person

objects
    SocialCapital: money
    SocialParts: movable
    ConsultationServices: service
    PoliticalConsultation: service
    LegalServices: service
    MarketingServices: service

article 1 Generated
    fact asset SocietyConstitution is present
    fact asset SocialCapital is present
    fact certification MexicanNationality is present
    obligation Partners must pay SocialCapital to Society.
    obligation Partners must perform WarrantyObligations to Society.
    prohibition Partners must not transfer SocialParts.
    rule TransferRestrictionRule
        If asset SocialParts is present
        then Partners must not transfer SocialParts.
    procedure SocietyConstitution:
        Partners pays SocialCapital to Society.