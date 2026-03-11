law ConvenioConfidencialidad
authority private
enacted 2024-01-03

vocabulary
    verb provide: provide

parties
    Company: Company Corp, legal person
    Client: Client Person, natural person

objects
    ConfidentialInformation: service
    PersonalData: service

article 1 Generated
    fact asset ConfidentialityRelation is present
    fact certification RfcRegistration is present
    fact certification RfcRegistration is present
    obligation Company must provide ConfidentialInformation to Client.
    obligation Company must provide ConfidentialInformation to Client.
    prohibition Company must not fail ConfidentialInformation.
    obligation Company must provide ConfidentialInformation.
    rule ConfidentialityObligations
        If asset ConfidentialityRelation is present
        then Company must provide ConfidentialInformation to Client.
    rule PublicDomainException
        If asset PublicDomainInformation is present
        then Company may provide ConfidentialInformation.
    rule LegalMandateException
        If certification JudicialMandate is present
        then Company may provide ConfidentialInformation.