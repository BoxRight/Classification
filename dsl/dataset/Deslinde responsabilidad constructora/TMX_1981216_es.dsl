law DeslindeResponsabilidadConstructora
authority private
enacted 2024-02-13

vocabulary
    verb transfer: transfer

parties
    Constructora: Constructora Corp, legal person
    Client: Client Person, natural person

objects
    MaterialConstruction: movable
    ConstructionProject: service

article 1 Generated
    fact asset MaterialChange is present
    fact certification ClientNotification is present
    fact certification ClientAcceptance is present
    privilege Constructora may perform LiabilityExemption to Client.
    rule LiabilityExemptionRule
        If asset MaterialChange is present and certification ClientNotification is present and certification ClientAcceptance is present
        then Constructora may perform CivilLiabilityExemption to Client.
    rule WaiverRule
        If certification ClientAcceptance is present
        then Client must not perform LegalClaim.