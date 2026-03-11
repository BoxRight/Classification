law RecursoApelaciónContra
authority judicial
enacted 2018-05-29

vocabulary
    verb provide: provide

parties
    Appellant: Appellant Person, natural person
    CivilJudge: CivilJudge Corp, legal person
    SuperiorCourt: SuperiorCourt Corp, legal person

objects
    AppealMotion: service
    JudicialAuto: service
    AppealTestimony: service

article 1 Generated
    fact certification PendingUsucapionCase is present
    fact certification DismissedPersonalityIncident is present
    claim Appellant may demand AppealMotion from CivilJudge.
    rule AppealAdmissionRule
        If certification DismissedPersonalityIncident is present
        then Appellant may demand AppealMotion from CivilJudge.
    procedure AppealProcedure:
        Appellant provides AppealMotion to CivilJudge.
        Appellant provides AppealMotion to SuperiorCourt.