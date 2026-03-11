law ConstitutiveDeed
authority private
enacted 2024-02-06

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

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
    Donations: money
    ReligiousServices: service
    RealEstateProperty: nonmovable
    MovableAssets: movable

article 1 Generated
    fact asset ReligiousAssociationLegalExistence is present
    fact certification MexicanNationality is present
    fact asset MembershipRelation is present
    fact liability UnpaidFees is present
    obligation Members must pay MembershipFees to ReligiousAssociation.
    obligation Members must perform AssemblyAttendance to GeneralAssembly.
    obligation BoardOfDirectors must perform PeriodicReporting to GeneralAssembly.
    privilege ReligiousAssociation may provide ReligiousServices to Members.
    privilege GeneralAssembly may perform MemberExclusion to Members.
    rule MembershipPaymentObligationRule
        If asset MembershipRelation is present
        then Members must pay MembershipFees to ReligiousAssociation.
    rule MemberExclusionRule
        If liability UnpaidFees is present
        then GeneralAssembly may perform MemberExclusion to Members.
    rule CriminalConvictionExclusionRule
        If certification CriminalConvictionAgainstAssociation is present
        then GeneralAssembly may perform MemberExclusion to Members.
    rule AssemblyAttendanceRule
        If asset MembershipRelation is present
        then Members must perform AssemblyAttendance to GeneralAssembly.
    rule BoardReportingRule
        If asset ReligiousAssociationLegalExistence is present
        then BoardOfDirectors must perform PeriodicReporting to GeneralAssembly.