law ContratoNovaciónLicencia
authority private
enacted 2024-12-04

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Licenciante: Licenciante Corp, legal person
    Licenciatario: Licenciatario Corp, legal person

objects
    OriginalTrademark: service
    NewTrademark: service
    LicenseFee: money

article 1 Generated
    fact certification ImpiRegistration is present
    obligation Licenciatario must pay LicenseFee to Licenciante.
    privilege Licenciatario may provide NewTrademark.
    prohibition Licenciatario must not provide OriginalTrademark.
    obligation Licenciante must provide NewTrademark to Impi.
    rule PaymentDefaultRule
        If Licenciatario fails to pay LicenseFee to Licenciante
        then Licenciante may demand NewTrademark from Licenciatario.
    procedure TrademarkSubstitutionProcess:
        Licenciante provides NewTrademark to Licenciatario.
        Licenciatario pays LicenseFee to Licenciante.
        Licenciante provides NewTrademark to Impi.