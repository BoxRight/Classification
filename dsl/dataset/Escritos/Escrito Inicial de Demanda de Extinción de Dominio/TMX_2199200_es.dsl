law LeyNacionalExtinción
authority judicial

vocabulary
    verb transfer: transfer

parties
    MinisterioPublico: MinisterioPublico Corp, legal person
    DemandadoDesconocido: DemandadoDesconocido Person, natural person
    GobiernoFederal: GobiernoFederal Corp, legal person
    Indep: Indep Corp, legal person
    Denunciante: Denunciante Person, natural person
    Detenido: Detenido Person, natural person

objects
    InmuebleObjeto: nonmovable
    VehiculoRobado: movable
    Autopartes: movable
    DerechosPropiedad: service

article 1 Generated
    fact DemandadoDesconocido owns InmuebleObjeto
    fact asset StolenVehicle is present
    fact certification CriminalInvestigation is present
    prohibition Detenido must not transfer VehiculoRobado.
    prohibition DemandadoDesconocido must not transfer VehiculoRobado.

scenario caso_extincion_dominio:
    at robo_vehiculo
    at inicio_investigacion
    at detencion_sospechoso
    at cateo_inmueble
    at localizacion_bienes