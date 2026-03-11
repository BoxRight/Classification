law AutoAplazamientoAudiencia
authority judicial
enacted 2024-05-07

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Judge: Judge Corp, legal person
    Complainant: Complainant Person, natural person
    ResponsibleAuthority: ResponsibleAuthority Corp, legal person

objects
    CertifiedCopy: service
    ConstitutionalHearing: service
    Fine: money

article 1 Generated
    fact certification DocumentRequested is present
    obligation ResponsibleAuthority must provide CertifiedCopy to Complainant.
    rule FineImpositionRule
        If ResponsibleAuthority fails to provide CertifiedCopy to Complainant
        then Judge must pay Fine to ResponsibleAuthority.
    procedure HearingPostponementProcedure:
        ResponsibleAuthority fail CertifiedCopy to Complainant.
        Judge provides ConstitutionalHearing.
        Judge pays Fine to ResponsibleAuthority.