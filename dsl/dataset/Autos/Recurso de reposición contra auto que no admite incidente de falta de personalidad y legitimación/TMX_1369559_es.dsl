law CódigoNacionalProcedimientos
authority judicial

vocabulary
    verb provide: provide

parties
    Defendant: Defendant Person, natural person
    Actor: Actor Person, natural person
    JuezArrendamiento: JuezArrendamiento Corp, legal person

objects
    RecursoReposicion: service
    IncidentePersonalidad: service
    AutoInadmision: service

article 1 Generated
    fact certification JuicioArrendamientoInmobiliario is present
    fact certification AutoInadmision is present
    claim Defendant may demand RecursoReposicion from JuezArrendamiento.
    rule ReposicionRule
        If certification AutoInadmision is present
        then Defendant may demand RecursoReposicion from JuezArrendamiento.
    procedure RecursoReposicionProcedure:
        Demandado provides IncidentePersonalidad to JuezArrendamiento.
        JuezArrendamiento provides AutoInadmision to Demandado.
        Demandado provides RecursoReposicion to JuezArrendamiento.