law CódigoNacionalProcedimientos
authority judicial

parties
    RequestingParty: RequestingParty Person, natural person
    Judge: Judge Person, natural person
    Secretary: Secretary Person, natural person
    Deceased: Deceased Person, natural person

objects
    SuccessionCase: service
    ConnectedCase: service
    AccumulationRequest: service

article 1 Generated
    fact certification IntestateSuccession is present
    procedure CaseAccumulationProcedure:
        RequestingParty provides AccumulationRequest to Judge.
        Judge provides AccumulationRequest to RequestingParty.