law ServiceContract
authority private
enacted 2024-07-23

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Administration: Administration Corp, legal person
    ServiceProvider: ServiceProvider Person, natural person

objects
    ProfessionalFees: money
    ProfessionalServices: service
    AreasComunes: nonmovable
    CuotasMantenimiento: money
    InformesFinancieros: service
    ConfidentialInformation: service

article 1 Generated
    fact asset ContratoAdministracion is present
    obligation ServiceProvider must provide ProfessionalServices to Administration.
    obligation Administration must pay ProfessionalFees to ServiceProvider.
    obligation ServiceProvider must transfer AreasComunes to Administration.
    obligation ServiceProvider must pay CuotasMantenimiento to Administration.
    obligation ServiceProvider must provide InformesFinancieros to Administration.
    obligation ServiceProvider must provide ConfidentialInformation to Administration.
    obligation Administration must provide ConfidentialInformation to ServiceProvider.
    prohibition ServiceProvider must not fail ConfidentialInformation.
    procedure AdministracionCondominio:
        ServiceProvider transfers AreasComunes to Administration.
        ServiceProvider provides ProfessionalServices to Administration.
        ServiceProvider pays CuotasMantenimiento to Administration.
        ServiceProvider provides InformesFinancieros to Administration.