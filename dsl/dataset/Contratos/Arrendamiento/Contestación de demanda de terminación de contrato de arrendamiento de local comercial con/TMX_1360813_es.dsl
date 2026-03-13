law LeaseContract
authority judicial
enacted 2024-01-23

vocabulary
    verb provide: provide

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person

objects
    CommercialLease: service

article 1 Generated
    fact liability LeaseTerminationClaim is present
    fact asset CommercialLeaseRelation is present
    claim Defendant may demand CommercialLease from Plaintiff.
    rule LeaseDefenseRule
        If liability LeaseTerminationClaim is present
        then Defendant may provide CommercialLease to Plaintiff.
    procedure LeaseDefenseProcedure:
        Defendant performs LeaseContestation to Plaintiff.
        Defendant performs EvidenceSubmission.