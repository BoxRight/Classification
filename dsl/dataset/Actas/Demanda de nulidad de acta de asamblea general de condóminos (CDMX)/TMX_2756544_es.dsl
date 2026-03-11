law LeyPropiedadCondominio
authority judicial

vocabulary
    verb provide: provide

parties
    Plaintiff: Plaintiff Person, natural person
    CondominiumAdministrators: CondominiumAdministrators Corp, legal person
    AbsentCondominiums: AbsentCondominiums Person, natural person
    DissentingCondominiums: DissentingCondominiums Person, natural person

objects
    AssemblyMinutes: service
    CondominiumUnit: nonmovable
    CondominiumFees: money
    LegalCosts: money

article 1 Generated
    fact Plaintiff owns CondominiumUnit
    fact certification AssemblyMinutesInvalid is present
    obligation CondominiumAdministrators must provide AssemblyMinutes to Plaintiff.
    prohibition CondominiumAdministrators must not provide AssemblyMinutes.
    rule NullityConsequenceRule
        If certification AssemblyMinutesInvalid is present
        then Plaintiff may demand AssemblyMinutes from CondominiumAdministrators.

scenario assembly_nullity_scenario:
    at Invalid assembly convocation
    at Assembly held without proper quorum
    at Unlisted topics discussed
    at Resolutions contrary to constitutive documents adopted
    at Rights of absent and dissenting condominiums violated