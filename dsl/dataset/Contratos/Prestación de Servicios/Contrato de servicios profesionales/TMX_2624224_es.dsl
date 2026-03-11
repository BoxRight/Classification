law ServiceContract
authority private
enacted 2023-10-03

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Comitente: Comitente Corp, legal person
    Comisionista: Comisionista Person, natural person

objects
    ProfessionalServices: service
    CommissionPayment: money
    ConfidentialInformation: service

article 1 Generated
    fact asset ServiceContract is present
    fact certification ProfessionalLicense is present
    obligation Comisionista must provide ProfessionalServices to Comitente.
    obligation Comitente must pay CommissionPayment to Comisionista.
    prohibition Comisionista must not provide ConfidentialInformation.
    obligation Comisionista must perform PriorNotice to Comitente.
    procedure ServicePerformance:
        Comisionista provides ProfessionalServices to Comitente.
        Comitente pays CommissionPayment to Comisionista.