law ContratoServidumbrePaso
authority private
enacted 2024-06-25

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    ParteA: ParteA Corp, legal person
    ParteB: ParteB Corp, legal person

objects
    PredioSirviente: nonmovable
    PredioDominante: nonmovable
    ParqueManiobras: nonmovable
    Comedor: nonmovable
    ProductosAgricolas: movable
    PenaltyFee: money

article 1 Generated
    fact ParteA owns PredioSirviente
    fact ParteB owns PredioSirviente
    fact asset EasementRelation is present
    obligation ParteA must transfer ParqueManiobras to ParteA.
    obligation ParteB must transfer ParqueManiobras to ParteA.
    privilege ParteB may transfer ParqueManiobras to ParteB.
    rule MaintenanceObligationRule
        If asset EasementRelation is present
        then ParteA must transfer ParqueManiobras to ParteA.
    rule ProperUseObligationRule
        If asset EasementRelation is present
        then ParteB must transfer ParqueManiobras to ParteA.
    rule PenaltyForMisuseRule
        If ParteB fails to transfer ParqueManiobras to ParteA
        then ParteB must pay PenaltyFee to ParteA.