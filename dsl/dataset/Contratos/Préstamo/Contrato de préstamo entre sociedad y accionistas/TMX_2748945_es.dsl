law ContratoPréstamoEntre
authority private
enacted 2024-11-06

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Sociedad: Sociedad Corp, legal person
    SociosAccionistas: SociosAccionistas Person, natural person
    RepresentanteLegal: RepresentanteLegal Person, natural person

objects
    PrestamoMonto: money
    Intereses: money
    InteresesMoratorios: money
    Garantias: service

article 1 Generated
    fact asset ContratoVigente is present
    fact asset AprobacionAsamblea is present
    fact asset CalidadAccionistas is present
    obligation Sociedad must pay PrestamoMonto to SociosAccionistas.
    obligation SociosAccionistas must pay PrestamoMonto to Sociedad.
    obligation SociosAccionistas must pay Intereses to Sociedad.
    prohibition SociosAccionistas must not provide Garantias.
    rule PrestamoOtorgamiento
        If asset ContratoVigente is present and asset AprobacionAsamblea is present
        then Sociedad must pay PrestamoMonto to SociosAccionistas.
    rule DevolucionPrestamo
        If asset ContratoVigente is present
        then SociosAccionistas must pay PrestamoMonto to Sociedad.
    procedure ProcesoPrestamo:
        Sociedad pays PrestamoMonto to SociosAccionistas.
        SociosAccionistas pays PrestamoMonto to Sociedad.
        SociosAccionistas pays Intereses to Sociedad.