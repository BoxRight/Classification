law CódigoNacionalProcedimientos
authority judicial

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    Tenant: Tenant Person, natural person
    Landlord: Landlord Person, natural person
    CourtSecretary: CourtSecretary Corp, legal person
    LeaseJudge: LeaseJudge Corp, legal person

objects
    LeasedProperty: nonmovable
    ExecutionOrder: service
    VacateComputation: service
    PersonalNotification: service

article 1 Generated
    fact certification DefinitiveSentenceExecutory is present
    fact certification ExecutionOrderIssued is present
    fact certification PersonalNotificationMade is present
    obligation Tenant must transfer LeasedProperty to Landlord.
    rule VacateComputationRule
        If certification PersonalNotificationMade is present
        then CourtSecretary must provide VacateComputation to Tenant.

scenario computation_nullity_scenario:
    at definitive_sentence_becomes_executory
    at secretary_computes_vacate_term_incorrectly
    at tenant_challenges_computation