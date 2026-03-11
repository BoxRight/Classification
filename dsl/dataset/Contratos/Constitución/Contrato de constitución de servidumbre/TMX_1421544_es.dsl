law ContratoConstituciónServidumbre
authority private
enacted 2024-02-02

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    PropietarioA: PropietarioA Person, natural person
    PropietarioB: PropietarioB Person, natural person

objects
    PredioSirviente: nonmovable
    PredioDominante: nonmovable
    ParedMedianera: nonmovable
    Retribucion: money
    AreaColindante: nonmovable

article 1 Generated
    fact PropietarioA owns PredioSirviente
    fact PropietarioB owns PredioSirviente
    fact asset ServidumbreConstituida is present
    prohibition PropietarioA must not transfer ParedMedianera.
    prohibition PropietarioA must not transfer AreaColindante.
    obligation PropietarioB must pay Retribucion to PropietarioA.
    rule ObligacionesServidumbre
        If asset ServidumbreConstituida is present
        then PropietarioA must not transfer ParedMedianera.
    rule PagoRetribucion
        If asset ServidumbreConstituida is present
        then PropietarioB must pay Retribucion to PropietarioA.