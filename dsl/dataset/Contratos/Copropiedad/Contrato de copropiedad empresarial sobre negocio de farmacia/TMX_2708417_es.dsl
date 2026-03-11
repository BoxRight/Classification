law ContratoCopropiedadEmpresarial
authority private
enacted 2024-07-03

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    CopropietarioI: CopropietarioI Corp, legal person
    CopropietarioIi: CopropietarioIi Person, natural person

objects
    NegocioFarmacia: nonmovable
    AportacionInicial: money
    Utilidades: money
    ProductosFarmaceuticos: movable
    Participacion: service

article 1 Generated
    fact asset CopropiedadFarmacia is present
    fact CopropietarioI owns NegocioFarmacia
    fact CopropietarioIi owns NegocioFarmacia
    obligation CopropietarioI must pay AportacionInicial to NegocioFarmacia.
    obligation CopropietarioIi must pay AportacionInicial to NegocioFarmacia.
    privilege CopropietarioI may transfer NegocioFarmacia to CopropietarioIi.
    claim CopropietarioI may demand Utilidades from CopropietarioIi.
    claim CopropietarioIi may demand Utilidades from CopropietarioI.
    prohibition CopropietarioI must not transfer NegocioFarmacia.
    rule DistribucionUtilidades
        If asset CopropiedadFarmacia is present
        then CopropietarioI must pay Utilidades to CopropietarioIi.