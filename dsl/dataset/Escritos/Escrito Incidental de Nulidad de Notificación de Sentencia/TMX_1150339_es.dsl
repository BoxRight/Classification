law EscritoIncidentalNulidad
authority judicial
enacted 2024-04-16

vocabulary
    verb provide: provide

parties
    Defendant: Defendant Person, natural person
    Judge: Judge Person, natural person
    CourtOfficer: CourtOfficer Person, natural person
    Minor: Minor Person, natural person

objects
    DefinitiveSentence: service
    NotificationProceeding: service
    BirthCertificate: service

article 1 Generated
    fact certification BirthCertificateProof is present
    fact asset LeaseControversyCase is present
    obligation CourtOfficer must provide DefinitiveSentence to Defendant.
    prohibition CourtOfficer must not provide DefinitiveSentence.
    rule ProperNotificationRule
        If asset LeaseControversyCase is present
        then CourtOfficer must provide DefinitiveSentence to Defendant.

scenario notification_nullity_incident:
    at Court officer notifies definitive sentence to minor
    at Defendant files nullity incident
    at Court reviews notification procedure