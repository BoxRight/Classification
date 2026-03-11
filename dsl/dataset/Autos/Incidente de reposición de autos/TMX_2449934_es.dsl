law IncidenteReposiciónAutos
authority judicial
enacted 2024-04-17

vocabulary
    verb provide: provide

parties
    Petitioner: Petitioner Person, natural person
    Defendant: Defendant Person, natural person
    Judge: Judge Person, natural person
    CourtSecretary: CourtSecretary Person, natural person

objects
    CaseFile: service
    InitialDemand: service
    EvidenceDocuments: service

article 1 Generated
    fact certification CaseFileLost is present
    fact certification LegalProceedingsInitiated is present
    claim Petitioner may demand CaseFile from Judge.
    obligation CourtSecretary must provide CaseFile to Petitioner.
    rule FileReconstructionRule
        If certification CaseFileLost is present
        then Judge must provide CaseFile to Petitioner.