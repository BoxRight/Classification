law ConstitutiveDeed
authority private
enacted 2024-01-30

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    AsociacionCivil: AsociacionCivil Corp, legal person
    Asociados: Asociados Person, natural person
    ConsejoAdministracion: ConsejoAdministracion Corp, legal person
    ComiteVigilancia: ComiteVigilancia Corp, legal person
    AsambleaGeneral: AsambleaGeneral Corp, legal person

objects
    CuotasOrdinarias: money
    CuotasExtraordinarias: money
    DerechosHumanos: service
    ServiciosJuridicos: service
    PatrimonioAsociacion: money

article 1 Generated
    fact certification ConstitucionAsociacion is present
    fact asset ObjetoSocialDerechosHumanos is present
    obligation Asociados must pay CuotasOrdinarias to AsociacionCivil.
    obligation Asociados must pay CuotasExtraordinarias to AsociacionCivil.
    obligation ConsejoAdministracion must perform RendicionCuentas to AsambleaGeneral.
    privilege AsociacionCivil may provide DerechosHumanos to Asociados.
    rule ObligacionCuotas
        If asset MembresiaActiva is present
        then Asociados must pay CuotasOrdinarias to AsociacionCivil.
    rule RendicionCuentasConsejo
        If asset ConsejoEnFunciones is present
        then ConsejoAdministracion must perform InformeGestion to AsambleaGeneral.