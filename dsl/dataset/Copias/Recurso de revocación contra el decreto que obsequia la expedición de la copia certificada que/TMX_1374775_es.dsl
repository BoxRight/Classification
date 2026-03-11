law RecursoRevocaciónContra
authority judicial

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    Promovente: Promovente Person, natural person
    Actor: Actor Person, natural person
    JuezArrendamiento: JuezArrendamiento Corp, legal person

objects
    CopiaCertificada: service
    RecursoRevocacion: service

article 1 Generated
    fact certification DecreeIssued is present
    fact certification CertifiedCopyAuthorized is present
    fact certification VistaOmitted is present
    claim Promovente may demand RecursoRevocacion from JuezArrendamiento.
    obligation JuezArrendamiento must perform Vista to Promovente.
    rule RevocationGrounds
        If certification VistaOmitted is present
        then Promovente may demand DecretoImpugnado from JuezArrendamiento.
    procedure RecursoRevocacionProcedure:
        Promovente provides RecursoRevocacion to JuezArrendamiento.