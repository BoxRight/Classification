law ConvenioConcertaciónTmx1.470.507
authority administrative
enacted 2024-02-14

vocabulary
    verb provide: provide

parties
    ElEstado: ElEstado Corp, legal person
    ElProductor: ElProductor Person, natural person

objects
    TituloPropiedad: service
    ConstanciasPosesion: service
    PruebasNecesarias: service
    TierrasParticulares: nonmovable

article 1 Generated
    fact ElProductor owns TierrasParticulares
    fact certification TituloFundatorio is present
    fact asset ConvenioVigente is present
    obligation ElEstado must provide TituloPropiedad to ElProductor.
    obligation ElProductor must provide ConstanciasPosesion to ElEstado.
    obligation ElProductor must provide PruebasNecesarias to ElEstado.
    rule UsucapionRule
        If certification TituloFundatorio is present and asset ConvenioVigente is present
        then ElEstado must provide TituloPropiedad to ElProductor.
    rule CollaborationRule
        If asset ConvenioVigente is present
        then ElProductor must provide ConstanciasPosesion to ElEstado.