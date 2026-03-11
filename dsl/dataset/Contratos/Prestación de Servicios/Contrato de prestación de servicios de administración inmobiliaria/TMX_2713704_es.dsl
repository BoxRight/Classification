law ServiceContract
authority private
enacted 2024-07-23

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Administration: Administration Corp, legal person
    ServiceProvider: ServiceProvider Person, natural person

objects
    Property: nonmovable
    Honorarios: money
    ProfessionalServices: service
    Rentas: money
    ConfidentialInformation: service

article 1 Generated
    fact asset ContractRelation is present
    fact Administration owns Property
    fact certification CedulaProfesional is present
    obligation ServiceProvider must provide ProfessionalServices to Administration.
    obligation Administration must pay Honorarios to ServiceProvider.
    prohibition ServiceProvider must not provide ConfidentialInformation.
    rule PagoHonorariosMensual
        If asset ContractRelation is present
        then Administration must pay Honorarios to ServiceProvider.
    procedure PrestacionServicios:
         performs .
         performs .
         performs .
         performs .
        ServiceProvider pays Rentas to Administration.
         performs .
         performs .