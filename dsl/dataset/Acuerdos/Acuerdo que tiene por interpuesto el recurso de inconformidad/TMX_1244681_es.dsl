law LeyAmparo
authority judicial

vocabulary
    verb transfer: transfer

parties
    ParteQuejosa: ParteQuejosa Person, natural person
    Judge: Judge Person, natural person
    TribunalColegiado: TribunalColegiado Corp, legal person
    Secretaria: Secretaria Person, natural person

objects
    RecursoInconformidad: service
    Expediente: movable
    CuadernoAntecedentes: movable

article 1 Generated
    fact certification RecursoInterpuesto is present
    fact asset CompetenciaJurisdiccional is present
    obligation Judge must transfer Expediente to TribunalColegiado.
    rule RecursoInconformidadRule
        If certification RecursoInterpuesto is present
        then Judge must transfer Expediente to TribunalColegiado.
    procedure ProcedimientoRecursoInconformidad:
        ParteQuejosa provides RecursoInconformidad to JuezDistrito.
        JuezDistrito transfers Expediente to TribunalColegiado.
        Secretaria transfers CuadernoAntecedentes to TribunalColegiado.