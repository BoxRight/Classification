law RecursoApelaciónContra
authority judicial
enacted 2024-04-26

vocabulary
    verb provide: provide

parties
    Defendant: Defendant Person, natural person
    JuezCivil: JuezCivil Corp, legal person
    Contraria: Contraria Person, natural person

objects
    RecursoApelacion: service
    IncidenteNulidad: service
    TestimonioApelacion: service

article 1 Generated
    fact certification AutoNoAdmisionIncidente is present
    fact asset JuicioUsucapion is present
    claim Defendant may demand RecursoApelacion from JuezCivil.
    obligation JuezCivil must provide RecursoApelacion to Defendant.
    rule AdmisionRecursoRule
        If certification AutoNoAdmisionIncidente is present
        then JuezCivil must provide RecursoApelacion to Defendant.
    procedure ProcedimientoApelacion:
        Demandado provides RecursoApelacion to JuezCivil.
        JuezCivil provides RecursoApelacion to Demandado.
        JuezCivil provides RecursoApelacion to Contraria.