law ConstitutiveDeed
authority private
enacted 2024-01-29

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Association: Association Corp, legal person
    Associates: Associates Person, natural person
    BoardOfDirectors: BoardOfDirectors Corp, legal person
    Director: Director Person, natural person
    President: President Person, natural person
    Secretary: Secretary Person, natural person
    Assembly: Assembly Corp, legal person

objects
    MembershipFees: money
    Donations: money
    AssociationPatrimony: money
    SocialObjectActivities: service

article 1 Generated
    fact asset AssociationConstitution is present
    fact asset VariablePatrimony is present
    obligation Associates must pay MembershipFees to Association.
    obligation Associates must perform AssemblyAttendance to Assembly.
    prohibition Association must not perform PoliticalPropaganda.
    claim Associates may demand VotingRights from Assembly.
    rule LiquidationRule
        If asset AssociationDissolution is present
        then Assembly must perform LiquidatorAppointment to Association.
    procedure AssemblyConvocationProcedure:
        Director performs ConvocationNotice to Associates.