law ServiceContract
authority private
enacted 2024-02-05

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Landlord: Landlord Corp, legal person
    PrestadorServicios: PrestadorServicios Person, natural person

objects
    ServiciosEspecializados: service
    Honorarios: money
    PenaltyFee: money

article 1 Generated
    fact asset ContractRelation is present
    fact certification CedulaProfesional is present
    obligation PrestadorServicios must provide ServiciosEspecializados to Landlord.
    obligation Landlord must pay Honorarios to PrestadorServicios.
    prohibition PrestadorServicios must not perform ConfidentialInformation.
    rule SuspensionRule
        If asset ContractRelation is present
        then Landlord may demand SuspensionNotice from PrestadorServicios.