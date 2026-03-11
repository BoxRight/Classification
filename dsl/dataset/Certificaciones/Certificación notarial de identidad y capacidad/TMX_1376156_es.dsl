law Certification
authority administrative
enacted 2024-05-15

vocabulary
    verb provide: provide

parties
    Notario: Notario Corp, legal person
    Compareciente: Compareciente Person, natural person

objects
    Escritura: service
    DocumentoIdentificacion: service

article 1 Generated
    fact certification IdentidadVerificada is present
    fact certification ConocimientoCompareciente is present
    obligation Notario must provide DocumentoIdentificacion to Compareciente.
    obligation Notario must provide Escritura to Compareciente.
    rule CertificacionIdentidadRule
        If certification IdentidadVerificada is present
        then Notario may provide Escritura to Compareciente.
    procedure VerificacionIdentidadCapacidad:
        Notario provides DocumentoIdentificacion to Compareciente.
        Notario provides Escritura to Compareciente.
        Notario provides Escritura to Compareciente.