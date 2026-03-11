law CódigoProcedimientosCiviles
authority judicial

vocabulary
    verb transfer: transfer

parties
    Petitioner: Petitioner Person, natural person
    Deceased: Deceased Person, natural person
    InterestedParties: InterestedParties Person, natural person
    PublicProsecutor: PublicProsecutor Corp, legal person
    HealthSecretary: HealthSecretary Corp, legal person
    TreasurySecretary: TreasurySecretary Corp, legal person
    Judge: Judge Corp, legal person

objects
    SuccessionAssets: movable
    PetitionDocuments: movable
    CaseFile: movable

article 1 Generated
    fact asset TestamentarySuccession is present
    fact certification CaseRegistration is present
    obligation Judge must transfer CaseFile to Petitioner.
    obligation InterestedParties must transfer SuccessionAssets to Judge.
    claim PublicProsecutor may demand SuccessionAssets from Judge.
    rule NotificationRule
        If certification CaseRegistration is present
        then Judge must transfer SuccessionAssets to InterestedParties.