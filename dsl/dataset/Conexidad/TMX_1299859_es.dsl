law FormularioConexidad
authority judicial
enacted 2017-10-30

vocabulary
    verb provide: provide

parties
    Defendant: Defendant Person, natural person
    Plaintiff: Plaintiff Person, natural person
    Judge: Judge Person, natural person

objects
    ConexityException: service
    LawsuitConsolidation: service

article 1 Generated
    fact certification PendingLawsuit is present
    fact certification SameParties is present
    fact certification SameActions is present
    fact certification SameCause is present
    fact certification NoImpediments is present
    privilege Defendant may provide ConexityException to Judge.
    rule ConexityExceptionRule
        If certification PendingLawsuit is present and certification SameParties is present and certification SameActions is present and certification NoImpediments is present
        then Judge must provide LawsuitConsolidation to Defendant.