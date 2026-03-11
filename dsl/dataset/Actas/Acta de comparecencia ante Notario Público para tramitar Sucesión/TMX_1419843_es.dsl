law ActaComparecenciaAnte
authority administrative
enacted 2018-09-20

vocabulary
    verb transfer: transfer

parties
    Notary: Notary Corp, legal person
    Heirs: Heirs Person, natural person
    Deceased: Deceased Person, natural person
    Executor: Executor Person, natural person
    FamilyCourt: FamilyCourt Corp, legal person
    Judge: Judge Person, natural person

objects
    Inheritance: nonmovable
    Testament: movable
    CourtFile: movable
    JudicialAuthorization: movable

article 1 Generated
    fact certification NotarialFaith is present
    fact Heirs owns Inheritance
    fact certification JudicialAuthorization is present
    obligation Heirs must transfer CourtFile to Notary.
    privilege Notary may transfer Inheritance to Heirs.
    rule ExtrajudicialSuccessionRule
        If certification JudicialAuthorization is present
        then Notary may transfer Inheritance to Heirs.
    procedure NotarialSuccessionProcedure:
        Heirs transfers Inheritance to Notary.
        Heirs transfers CourtFile to Notary.