law DemandaDañoMoral
authority judicial
enacted 2020-11-10

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Plaintiff: Plaintiff Person, natural person
    DefendantPrimary: DefendantPrimary Person, natural person
    DefendantSecondary: DefendantSecondary Person, natural person
    BusinessEntity: BusinessEntity Corp, legal person

objects
    MoralDamagesCompensation: money
    IndirectDamagesAmount: money
    BusinessReputation: service
    ProfessionalHonor: service
    SentencePublication: service
    LegalCosts: money

article 1 Generated
    fact liability MoralDamagesClaim is present
    fact liability JointLiability is present
    fact certification LicitBusiness is present
    obligation DefendantPrimary must pay MoralDamagesCompensation to Plaintiff.
    obligation DefendantPrimary must pay IndirectDamagesAmount to Plaintiff.
    obligation DefendantPrimary must provide SentencePublication to Plaintiff.
    obligation DefendantPrimary must pay LegalCosts to Plaintiff.
    rule MoralDamageLiabilityRule
        If DefendantPrimary fails to provide BusinessReputation to Plaintiff
        then DefendantPrimary must pay MoralDamagesCompensation to Plaintiff.
    rule JointLiabilityRule
        If liability JointLiability is present
        then DefendantSecondary must pay MoralDamagesCompensation to Plaintiff.