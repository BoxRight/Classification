law EscritoIncidentalNulidad
authority judicial
enacted 2024-04-16

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    Defendant: Defendant Person, natural person
    RentalJudge: RentalJudge Corp, legal person
    CourtSecretary: CourtSecretary Corp, legal person

objects
    Property: nonmovable
    ComputationPeriod: service
    ExecutionOrder: service

article 1 Generated
    fact certification DefinitiveSentenceResJudicata is present
    fact liability PropertyVacationObligation is present
    obligation CourtSecretary must provide ExecutionOrder to Defendant.
    obligation Defendant must transfer Property.

scenario computation_nullity_scenario:
    at definitive_sentence_res_judicata
    at secretary_computes_vacation_period
    at lack_of_personal_notification
    at nullity_incident_filing