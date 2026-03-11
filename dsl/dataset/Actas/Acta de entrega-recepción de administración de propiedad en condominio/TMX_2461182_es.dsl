law ActaEntregaRecepción
authority private
enacted 2024-02-05

vocabulary
    verb provide: provide

parties
    OutgoingAdministrator: OutgoingAdministrator Person, natural person
    IncomingAdministrator: IncomingAdministrator Person, natural person
    CondominiumPresident: CondominiumPresident Person, natural person
    CondominiumAssembly: CondominiumAssembly Corp, legal person

objects
    CondominiumDocumentation: service
    TechnicalPlans: service
    FinancialRecords: service
    ContractsAndAgreements: service
    InsurancePolicies: service
    LaborDocumentation: service
    MemberDirectory: service
    AccountStatements: service

article 1 Generated
    fact asset CondominiumAdministration is present
    obligation OutgoingAdministrator must provide CondominiumDocumentation to IncomingAdministrator.
    obligation IncomingAdministrator must provide CondominiumDocumentation to CondominiumAssembly.
    rule TransferAdministrationRule
        If asset CondominiumAdministration is present
        then OutgoingAdministrator must provide CondominiumDocumentation to IncomingAdministrator.
    procedure AdministrationTransferProcedure:
        Assembly agreement for transfer.
        OutgoingAdministrator provides TechnicalPlans to IncomingAdministrator.
        OutgoingAdministrator provides ContractsAndAgreements to IncomingAdministrator.
        OutgoingAdministrator provides InsurancePolicies to IncomingAdministrator.
        OutgoingAdministrator provides LaborDocumentation to IncomingAdministrator.
        OutgoingAdministrator provides MemberDirectory to IncomingAdministrator.
        OutgoingAdministrator provides AccountStatements to IncomingAdministrator.