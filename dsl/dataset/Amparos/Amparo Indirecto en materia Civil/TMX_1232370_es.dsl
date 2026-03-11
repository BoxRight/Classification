law LeyAmparo
authority judicial

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Petitioner: Petitioner Corp, legal person
    TerceroInteresado: TerceroInteresado Person, natural person
    SalaCivil: SalaCivil Corp, legal person
    Judge: Judge Corp, legal person

objects
    SentenciaImpugnada: service
    Costas: money
    Gastos: money

article 1 Generated
    fact certification PersonalidadAcreditada is present
    fact asset SentenciasConformes is present
    fact liability FaltaFundamentacion is present
    fact liability FaltaMotivacion is present
    obligation SalaCivil must pay Costas to Petitioner.
    claim Petitioner may demand Amparo from Judge.
    rule CondenaCostasSentenciasConformes
        If asset SentenciasConformes is present
        then SalaCivil must pay Costas to Petitioner.
    rule ViolacionArticulo14
        If liability FaltaFundamentacion is present and liability FaltaMotivacion is present
        then Petitioner may demand Amparo from Judge.

scenario antecedentes_juicio:
    at Demanda ejecutiva mercantil
    at Sentencia absolutoria primera instancia
    at Recurso de apelación
    at Confirmación sentencia segunda instancia
    at Omisión condena en costas