law LeyDelNotariado
authority administrative

vocabulary
    verb provide: provide

parties
    Notary: Notary Corp, legal person
    ForeignAppointee: ForeignAppointee Person, natural person
    SecretariaGobernacion: SecretariaGobernacion Corp, legal person
    Company: Company Corp, legal person

objects
    CorporatePosition: service
    Authorization: service

article 1 Generated
    fact certification ForeignerAppointment is present
    fact certification GovernmentAuthorization is present
    obligation Notary must provide Authorization to ForeignAppointee.
    rule ForeignAppointmentAuthorizationRule
        If certification ForeignerAppointment is present
        then ForeignAppointee must provide Authorization to SecretariaGobernacion.