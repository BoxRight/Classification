law LeyDelNotariado
authority administrative

vocabulary
    verb provide: provide

parties
    Notario: Notario Person, natural person
    Compareciente: Compareciente Person, natural person

objects
    ProtocoloNotarial: service
    EscrituraPublica: service
    ActaNotarial: service

article 1 Generated
    fact certification NotarioTitular is present
    fact certification NotarioAsociado is present
    fact certification NotarioSuplente is present
    fact certification NotarioAdscrito is present
    obligation Notario must provide ProtocoloNotarial to Compareciente.
    rule ComparecenciaRule
        If certification NotarioTitular is present
        then Notario may provide EscrituraPublica to Compareciente.