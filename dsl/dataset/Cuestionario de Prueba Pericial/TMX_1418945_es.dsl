law CuestionarioPruebaPericial
authority judicial
enacted 2024-02-15

vocabulary
    verb provide: provide

parties
    RequestingParty: RequestingParty Corp, legal person
    CourtAppointedExpert: CourtAppointedExpert Person, natural person
    DamagedPropertyOwner: DamagedPropertyOwner Person, natural person
    AdjacentBuildingOwner: AdjacentBuildingOwner Person, natural person

objects
    DamagedHouse: nonmovable
    AdjacentBuilding: nonmovable
    StructuralDamages: service
    RepairCosts: money
    ExpertReport: service

article 1 Generated
    fact asset JudicialProceeding is present
    fact certification ExpertDesignation is present
    obligation CourtAppointedExpert must provide ExpertReport to RequestingParty.
    rule ExpertExaminationRule
        If asset JudicialProceeding is present and certification ExpertDesignation is present
        then CourtAppointedExpert must provide ExpertReport to RequestingParty.
    procedure ExpertEvaluationProcedure:
        CourtAppointedExpert transfers DamagedHouse to RequestingParty.
        CourtAppointedExpert provides StructuralDamages to RequestingParty.
        CourtAppointedExpert pays RepairCosts to RequestingParty.
        CourtAppointedExpert provides ExpertReport to RequestingParty.