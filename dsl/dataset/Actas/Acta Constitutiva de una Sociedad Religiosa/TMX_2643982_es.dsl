law ConstitutiveDeed
authority private
enacted 2024-02-06

vocabulary
    verb pay: pay
    verb provide: provide

parties
    ReligiousAssociation: ReligiousAssociation Corp, legal person
    Founders: Founders Person, natural person
    Members: Members Person, natural person
    GeneralAssembly: GeneralAssembly Corp, legal person
    BoardOfDirectors: BoardOfDirectors Corp, legal person
    SurveillanceCommittee: SurveillanceCommittee Corp, legal person
    HonorJusticeCommittee: HonorJusticeCommittee Corp, legal person

objects
    MembershipFees: money
    ReligiousServices: service

article 1 Generated
    fact asset ReligiousAssociationLegalExistence is present
    fact certification MexicanNationality is present
    fact asset MembershipRelation is present
    fact liability UnpaidFees is present
    obligation Members must pay MembershipFees to ReligiousAssociation.
    obligation Members must pay MembershipFees to GeneralAssembly.
    obligation BoardOfDirectors must pay MembershipFees to GeneralAssembly.
    privilege ReligiousAssociation may provide ReligiousServices to Members.
    privilege GeneralAssembly may pay MembershipFees to Members.
    rule MembershipPaymentObligationRule
        If asset MembershipRelation is present
        then Members must pay MembershipFees to ReligiousAssociation.
    rule MemberExclusionRule
        If liability UnpaidFees is present
        then GeneralAssembly may pay MembershipFees to Members.
    rule CriminalConvictionExclusionRule
        If certification CriminalConvictionAgainstAssociation is present
        then GeneralAssembly may pay MembershipFees to Members.
    rule AssemblyAttendanceRule
        If asset MembershipRelation is present
        then Members must pay MembershipFees to GeneralAssembly.
    rule BoardReportingRule
        If asset ReligiousAssociationLegalExistence is present
        then BoardOfDirectors must pay MembershipFees to GeneralAssembly.