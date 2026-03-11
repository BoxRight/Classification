law LeyAgraria
authority judicial

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    Defendant: Defendant Person, natural person
    Plaintiff: Plaintiff Person, natural person
    EjidalCommissariat: EjidalCommissariat Corp, legal person
    CivilCourt: CivilCourt Corp, legal person
    AgrarianTribunal: AgrarianTribunal Corp, legal person

objects
    DisputedLands: nonmovable
    CivilSentence: service
    LegalCosts: money
    InheritanceDocuments: service

article 1 Generated
    fact Defendant owns DisputedLands
    fact certification AssemblyAuthorization is present
    privilege Defendant may transfer DisputedLands.
    prohibition CivilCourt must not provide CivilSentence.
    rule AgrarianCompetenceRule
        If asset AgrarianMatter is present
        then AgrarianTribunal must transfer DisputedLands.
    rule AssemblyAuthorizationRule
        If certification AssemblyAuthorization is present
        then EjidalCommissariat may transfer DisputedLands to Defendant.