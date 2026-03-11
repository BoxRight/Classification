law ConstitutiveDeed
authority private
enacted 2024-01-29

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    AsociacionCivil: AsociacionCivil Corp, legal person
    AsociadosFundadores: AsociadosFundadores Person, natural person
    Director: Director Person, natural person
    ConsejoDirectores: ConsejoDirectores Corp, legal person
    AsambleaAsociados: AsambleaAsociados Corp, legal person
    Liquidadores: Liquidadores Person, natural person

objects
    PatrimonioSocial: money
    Aportaciones: money
    BienesAsociacion: movable
    TitulosCredito: movable
    EstadoFinanciero: service

article 1 Generated
    fact certification PersonalidadJuridica is present
    fact asset PatrimonioSocial is present
    fact certification CalidadAsociado is present
    obligation AsociacionCivil must perform DenominacionAc to Publico.
    obligation Director must perform RegistroAsociados to AsociacionCivil.
    obligation Director must provide EstadoFinanciero to AsociadosFundadores.
    prohibition AsociacionCivil must not perform EspeculacionComercial.
    privilege AsociadosFundadores may perform DerechoVoto to AsambleaAsociados.
    rule ExclusionPorIncapacidad
        If certification IncapacidadJudicial is present
        then AsambleaAsociados may perform Exclusion to Asociado.
    procedure ConstitucionAsociacion:
        AsociadosFundadores performs EscrituraConstitutiva to Notario.
        AsociadosFundadores performs RegistroPublico to AutoridadRegistral.
        AsambleaAsociados performs DesignacionDirector to Director.
    procedure CelebracionAsamblea:
        Director performs Convocatoria to AsociadosFundadores.
        AsociadosFundadores performs Comparecencia to Asamblea.
        AsambleaAsociados performs Votacion to Resoluciones.
        Secretario performs ActaAsamblea to LibroActas.
    procedure LiquidacionAsociacion:
        AsambleaAsociados performs AcuerdoDisolucion to AsociacionCivil.
        AsambleaAsociados performs NombramientoLiquidadores to Liquidadores.
        Liquidadores performs CobroCreditos to Deudores.
        Liquidadores performs PagoDeudas to Acreedores.
        Liquidadores performs DistribucionRemanente to AsociadosFundadores.