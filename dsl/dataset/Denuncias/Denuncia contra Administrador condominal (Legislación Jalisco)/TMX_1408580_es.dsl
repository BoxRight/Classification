law CódigoPenalPara
authority judicial

vocabulary
    verb provide: provide

parties
    Complainant: Complainant Person, natural person
    CondominiumAdministrator: CondominiumAdministrator Person, natural person
    ConstructionCommittee: ConstructionCommittee Corp, legal person
    ConstructionCompany: ConstructionCompany Corp, legal person
    UrbanDevelopmentSecretary: UrbanDevelopmentSecretary Corp, legal person
    GeneralProsecutor: GeneralProsecutor Corp, legal person

objects
    CondominiumInfrastructure: nonmovable
    ConstructionPermits: service
    FeasibilityReport: service
    CondominiumPatrimony: nonmovable

article 1 Generated
    fact certification ValidConstructionPermit is present
    fact liability IllegalConstruction is present
    fact asset CondominiumOwnership is present
    prohibition CondominiumAdministrator must not provide FeasibilityReport.
    obligation UrbanDevelopmentSecretary must provide ConstructionPermits to CondominiumAdministrator.
    procedure CriminalComplaintProcedure:
        Complainant provides FeasibilityReport to GeneralProsecutor.

scenario illegal_construction_scenario:
    at Administrator proposes construction with alleged permits
    at Construction begins without valid permits
    at Municipal supervisor identifies violation
    at Residents verify permits are falsified
    at Criminal complaint filed