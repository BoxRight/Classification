law ServiceContract
authority private
enacted 2024-02-05

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Client: Client Corp, legal person
    ServiceProvider: ServiceProvider Corp, legal person

objects
    DigitalPlatformServices: service
    Website: service
    ContractPayment: money
    ConfidentialInformation: service

article 1 Generated
    fact asset ServiceContract is present
    obligation ServiceProvider must provide DigitalPlatformServices to Client.
    obligation Client must pay ContractPayment to ServiceProvider.
    obligation Client must provide ConfidentialInformation to ServiceProvider.
    prohibition ServiceProvider must not provide ConfidentialInformation.
    prohibition Client must not perform ContractRights.
    rule ServiceProvisionRule
        If asset ServiceContract is present
        then ServiceProvider must provide DigitalPlatformServices to Client.
    rule PaymentRule
        If asset ServiceContract is present
        then Client must pay ContractPayment to ServiceProvider.
    rule ConfidentialityRule
        If asset ServiceContract is present
        then ServiceProvider must not provide ConfidentialInformation.