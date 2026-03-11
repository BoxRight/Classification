law CódigoNacionalProcedimientos
authority judicial

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    CivilJudge: CivilJudge Person, natural person

objects
    DangerousBuilding: nonmovable
    PlaintiffProperty: nonmovable
    RepairCosts: money
    LegalCosts: money

article 1 Generated
    fact Plaintiff owns DangerousBuilding
    fact liability DangerousStructure is present
    obligation Defendant must transfer DangerousBuilding to Plaintiff.
    obligation Defendant must transfer PlaintiffProperty to Plaintiff.
    obligation Defendant must pay LegalCosts to Plaintiff.
    rule DangerousBuildingDemolition
        If liability DangerousStructure is present
        then Defendant must transfer DangerousBuilding to Plaintiff.
    rule PropertyRepairObligation
        If liability DangerousStructure is present
        then Defendant must transfer PlaintiffProperty to Plaintiff.