law ServiceContract
authority private
enacted 2024-01-29

vocabulary
    verb pay: pay
    verb provide: provide

parties
    ServiceProvider: ServiceProvider Person, natural person
    ServiceRecipient: ServiceRecipient Person, natural person

objects
    Services: service
    Payment: money

article 1 Generated
    fact asset ServiceContract is present
    obligation ServiceProvider must provide Services to ServiceRecipient.
    obligation ServiceRecipient must pay Payment to ServiceProvider.
    rule ServiceProvisionRule
        If asset ServiceContract is present
        then ServiceProvider must provide Services to ServiceRecipient.
    rule PaymentRule
        If asset ServiceContract is present
        then ServiceRecipient must pay Payment to ServiceProvider.
    procedure PaymentSchedule:
        Payment via bank transfer to specified account.