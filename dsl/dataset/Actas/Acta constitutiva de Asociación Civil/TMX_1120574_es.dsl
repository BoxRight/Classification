law ConstitutiveDeed
authority private
enacted 2024-01-29

vocabulary
    verb pay: pay
    verb provide: provide

parties
    FoundingMembers: FoundingMembers Person, natural person
    CivilAssociation: CivilAssociation Corp, legal person
    ActiveMembers: ActiveMembers Person, natural person
    ForeignMembers: ForeignMembers Person, natural person
    HonoraryMembers: HonoraryMembers Person, natural person
    BoardMembers: BoardMembers Person, natural person
    SurveillanceCouncil: SurveillanceCouncil Person, natural person

objects
    MembershipFees: money
    Donations: money
    SocialAssets: money
    MembershipCredential: service
    ReportsAndServices: service

article 1 Generated
    fact asset MembershipRelation is present
    fact asset BoardPosition is present
    fact asset SurveillanceRole is present
    fact liability PaymentObligation is present
    obligation ActiveMembers must pay MembershipFees to CivilAssociation.
    obligation ActiveMembers must provide ReportsAndServices to CivilAssociation.
    privilege ActiveMembers may provide MembershipCredential to CivilAssociation.
    privilege ForeignMembers may provide ReportsAndServices to CivilAssociation.
    privilege HonoraryMembers may provide ReportsAndServices to CivilAssociation.
    rule MembershipPaymentRule
        If asset MembershipRelation is present
        then ActiveMembers must pay MembershipFees to CivilAssociation.