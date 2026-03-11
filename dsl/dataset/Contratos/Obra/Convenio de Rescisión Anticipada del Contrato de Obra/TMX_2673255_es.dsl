law ConvenioRescisiónAnticipada
authority private
enacted 2024-04-18

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Contractor: Contractor Corp, legal person
    Client: Client Corp, legal person

objects
    Obra: service
    MaterialesEquipos: movable
    PagosPendientes: money
    CompensacionRescision: money
    AnticiposExceso: money
    Penalizacion: money

article 1 Generated
    fact asset ContratoObraOriginal is present
    fact asset RescisionAcordada is present
    obligation Contractor must provide Obra to Client.
    obligation Client must pay PagosPendientes to Contractor.
    obligation Contractor must transfer MaterialesEquipos to Client.
    rule RescisionSinCausaContratista
        If asset RescisionSinCausaContratista is present
        then Client must pay CompensacionRescision to Contractor.
    rule AnticiposExcedenTrabajos
        If asset AnticiposExceden is present
        then Contractor must pay AnticiposExceso to Client.
    rule IncumplimientoContratista
        If asset IncumplimientoDocumentado is present
        then Contractor must pay Penalizacion to Client.
    procedure ProcesoRescision:
        Contratista provides Obra to Cliente.
        Cliente pays PagosPendientes to Contratista.
        Contratista transfers MaterialesEquipos to Cliente.