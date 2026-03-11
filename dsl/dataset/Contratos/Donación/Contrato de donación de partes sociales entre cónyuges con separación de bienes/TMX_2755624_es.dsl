law ContratoDonaciónPartes
authority private
enacted 2024-11-20

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Donante: Donante Person, natural person
    Donatario: Donatario Person, natural person
    Sociedad: Sociedad Corp, legal person

objects
    PartesSociales: movable
    DocumentosTransmision: movable
    GastosRegistro: money

article 1 Generated
    fact certification MatrimonioSeparacionBienes is present
    fact certification AprobacionAsambleaSocios is present
    fact asset LibreDisposicionPartesSociales is present
    obligation Donante must transfer DocumentosTransmision to Donatario.
    obligation Donatario must transfer PartesSociales to Sociedad.
    obligation Donante must pay GastosRegistro to RegistroPublico.
    prohibition Donante must not transfer PartesSociales.
    prohibition Donante must not perform DerechosPartesSociales.
    procedure FormalizacionDonacion:
        Donante transfers DocumentosTransmision to Donatario.
        Sociedad performs RegistroSocios to Donatario.
        Donante pays GastosRegistro to RegistroPublico.