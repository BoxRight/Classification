law LeaseContract
authority private
enacted 2024-08-08

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Landlord: Landlord Corp, legal person
    Tenant: Tenant Person, natural person

objects
    DatosPersonales: service
    LeaseContract: service

article 1 Generated
    fact asset ContratoArrendamientoVigente is present
    fact asset ConsentimientoOtorgado is present
    fact certification DatosPersonalesRecopilados is present
    obligation Landlord must provide DatosPersonales.
    privilege Tenant may provide DatosPersonales to Landlord.
    privilege Tenant may provide DatosPersonales to Landlord.
    privilege Tenant may provide DatosPersonales to Landlord.
    privilege Tenant may provide DatosPersonales to Landlord.
    rule UsoDatosVerificacion
        If asset ContratoArrendamientoVigente is present and certification DatosPersonalesRecopilados is present
        then Landlord must provide DatosPersonales.
    rule ConservacionDatos
        If asset ContratoArrendamientoVigente is present
        then Landlord must provide DatosPersonales.
    rule EliminacionDatosPostContrato
        If Landlord fails to provide LeaseContract
        then Landlord must provide DatosPersonales.
    rule DerechoAcceso
        If certification DatosPersonalesRecopilados is present
        then Tenant may provide DatosPersonales to Landlord.
    rule RetiroConsentimiento
        If asset ConsentimientoOtorgado is present
        then Tenant may provide DatosPersonales to Landlord.
    procedure EjercicioDerechosArco:
        Arrendatario provides DatosPersonales to Arrendador.