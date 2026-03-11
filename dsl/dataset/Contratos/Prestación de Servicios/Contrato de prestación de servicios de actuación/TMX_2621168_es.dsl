law ServiceContract
authority private
enacted 2023-09-06

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Actor: Actor Person, natural person
    Contratante: Contratante Corp, legal person

objects
    ActingServices: service
    MonthlyPayment: money
    ConfidentialInformation: service

article 1 Generated
    fact asset ServiceContract is present
    fact certification ProfessionalLicense is present
    obligation Actor must provide ActingServices to Contratante.
    obligation Contratante must pay MonthlyPayment to Actor.
    prohibition Actor must not provide ConfidentialInformation.
    obligation Contratante must perform SafetyMeasures to Actor.
    rule PaymentObligationRule
        If asset ServiceContract is present
        then Contratante must pay MonthlyPayment to Actor.
    rule ConfidentialityBreachPenalty
        If Actor fails to provide ConfidentialInformation to Contratante
        then Actor must perform PenaltyPayment to Contratante.