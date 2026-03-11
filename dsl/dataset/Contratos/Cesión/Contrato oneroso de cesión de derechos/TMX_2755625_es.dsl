law ContratoOnerosoCesión
authority private
enacted 2024-11-20

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Assignor: Assignor Person, natural person
    Assignee: Assignee Person, natural person

objects
    AssignedRight: service
    CessationPrice: money
    AccessoryRights: service

article 1 Generated
    fact asset CessationContractRelation is present
    fact certification RightNotEncumbered is present
    obligation Assignor must provide AssignedRight to Assignee.
    obligation Assignee must pay CessationPrice to Assignor.
    obligation Assignor must provide AssignedRight to Assignee.
    prohibition Assignor must not fail AssignedRight.
    prohibition Assignor must not fail AssignedRight.
    prohibition Assignee must not fail AssignedRight.
    rule TransferObligationRule
        If asset CessationContractRelation is present
        then Assignor must provide AssignedRight to Assignee.
    rule NonInterferenceRule
        If asset CessationContractRelation is present
        then Assignor must not fail AssignedRight.
    procedure CessationProcess:
        Cedente provides AssignedRight to Cesionario.
        Cesionario pays CessationPrice to Cedente.