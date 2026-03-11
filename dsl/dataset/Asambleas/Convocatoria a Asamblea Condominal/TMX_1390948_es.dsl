law ConvocatoriaAsambleaCondominal
authority administrative
enacted 2024-02-14

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    CondominiumAdministrator: CondominiumAdministrator Person, natural person
    CondominiumOwners: CondominiumOwners Person, natural person
    AssemblySecretary: AssemblySecretary Person, natural person
    AssemblyScrutinizer: AssemblyScrutinizer Person, natural person
    AssemblyPresident: AssemblyPresident Person, natural person

objects
    GeneralAssembly: service
    ActivityReport: service
    FinancialSituationReview: service

article 1 Generated
    fact certification ConvocationAuthority is present
    obligation CondominiumAdministrator must provide GeneralAssembly to CondominiumOwners.
    obligation CondominiumOwners must perform AssemblySecretary to GeneralAssembly.
    obligation CondominiumAdministrator must provide ActivityReport to CondominiumOwners.
    rule AssemblyConvocationRule
        If certification ConvocationAuthority is present
        then CondominiumAdministrator must provide GeneralAssembly to CondominiumOwners.