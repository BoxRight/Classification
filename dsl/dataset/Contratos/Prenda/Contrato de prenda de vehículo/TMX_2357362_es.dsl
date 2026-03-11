law ContratoPrendaVehículo
authority private
enacted 2024-04-30

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    ParteDeudora: ParteDeudora Person, natural person
    ParteAcreedora: ParteAcreedora Person, natural person

objects
    VehiculoGarantia: movable
    PrestamoDinero: money
    Intereses: money
    AutomovilComprado: movable
    AutomovilUsado: movable

article 1 Generated
    fact collateral PrendaVehicular is present
    fact liability DeudaPendiente is present
    obligation ParteDeudora must pay PrestamoDinero to ParteAcreedora.
    obligation ParteDeudora must pay Intereses to ParteAcreedora.
    obligation ParteDeudora must transfer VehiculoGarantia.
    prohibition ParteDeudora must not transfer VehiculoGarantia.
    rule ConservacionVehiculoRule
        If collateral PrendaVehicular is present
        then ParteDeudora must transfer VehiculoGarantia.
    procedure ConstitucionPrenda:
        ParteAcreedora pays PrestamoDinero to ParteDeudora.
        ParteDeudora transfers VehiculoGarantia to ParteAcreedora.
        ParteDeudora transfers VehiculoGarantia to ParteAcreedora.