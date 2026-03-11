law AutoAdmisorioRecurso
authority judicial
enacted 2024-01-11

vocabulary
    verb provide: provide

parties
    Petitioner: Petitioner Person, natural person
    Judge: Judge Corp, legal person
    TribunalColegiado: TribunalColegiado Corp, legal person
    MinisterioPublico: MinisterioPublico Corp, legal person
    MagistradoPresidente: MagistradoPresidente Person, natural person

objects
    RecursoQueja: service
    InformeJustificado: service
    Expediente: service
    AutoImpugnado: service

article 1 Generated
    fact certification RecursoQuejaInterpuesto is present
    fact certification ExpedienteFormado is present
    fact certification AutoImpugnado is present
    obligation Judge must provide InformeJustificado to TribunalColegiado.
    obligation TribunalColegiado must provide RecursoQueja to Petitioner.
    rule RequerimientoInforme
        If certification ExpedienteFormado is present
        then Judge must provide InformeJustificado to TribunalColegiado.