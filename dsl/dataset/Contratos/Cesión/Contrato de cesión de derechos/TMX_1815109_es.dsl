law ContratoCesiónDerechos
authority private
enacted 2024-01-29

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Assignor: Assignor Person, natural person
    Assignee: Assignee Person, natural person
    Debtor: Debtor Person, natural person

objects
    DerechoCredito: service
    AssignmentPrice: money
    GarantiaHipoteca: nonmovable

article 1 Generated
    fact asset ContratoCesion is present
    fact Assignor owns GarantiaHipoteca
    fact collateral GarantiaHipoteca is present
    obligation Assignor must provide DerechoCredito to Assignee.
    obligation Assignee must pay AssignmentPrice to Assignor.
    obligation Assignee must provide DerechoCredito to Debtor.
    rule CesionOnerosaRule
        If asset ContratoCesion is present
        then Assignee must pay AssignmentPrice to Assignor.
    rule NotificacionRule
        If asset ContratoCesion is present
        then Assignee must provide DerechoCredito to Debtor.
    rule SaneamientoEviccionRule
        If Assignee fails to provide DerechoCredito to Debtor
        then Assignor must pay AssignmentPrice to Assignee.
    procedure ProcesoCesion:
        Assignor provides DerechoCredito to Assignee.
        Assignee pays AssignmentPrice to Assignor.
        Assignee provides DerechoCredito to Debtor.