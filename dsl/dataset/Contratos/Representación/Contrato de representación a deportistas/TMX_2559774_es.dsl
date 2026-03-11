law ContratoRepresentaciónDeportistas
authority private
enacted 2023-06-02

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Deportista: Deportista Person, natural person
    Representante: Representante Person, natural person

objects
    ServiciosRepresentacion: service
    ContraprestacionMensual: money
    ConfidentialInformation: service
    DerechosPropiedadIntelectual: service

article 1 Generated
    fact asset SolvenciaFinanciera is present
    fact certification ProfesionistaIndependienteDeporte is present
    fact certification ExperienciaProfesionalRepresentacion is present
    fact asset ContratoRepresentacionVigente is present
    obligation Representante must provide ServiciosRepresentacion to Deportista.
    obligation Deportista must pay ContraprestacionMensual to Representante.
    obligation Representante must provide ConfidentialInformation to Deportista.
    prohibition Representante must not provide ConfidentialInformation.
    obligation Deportista must perform PoderNotarial to Representante.
    obligation Deportista must perform ExclusividadRepresentacion to Representante.
    rule ServiciosRepresentacionRule
        If asset ContratoRepresentacionVigente is present
        then Representante must provide ServiciosRepresentacion to Deportista.
    rule ConfidencialidadBreachRule
        If Representante fails to provide ConfidentialInformation to Terceros
        then Representante must perform PenaltyFee to Deportista.
    rule TerminacionAnticipadaRule
        If CualquierParte fails to perform ObligacionesContractuales to OtraParte
        then ParteAfectada may perform TerminacionContrato to Contrato.