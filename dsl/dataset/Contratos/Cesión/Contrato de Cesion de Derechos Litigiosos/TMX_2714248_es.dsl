law ContratoCesiónDerechos
authority private
enacted 2024-07-30

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Assignor: Assignor Person, natural person
    Assignee: Assignee Person, natural person

objects
    DerechosLitigiosos: service
    AssignmentPrice: money
    PenaltyFee: money
    Documentacion: movable
    InmuebleEmbargado: nonmovable

article 1 Generated
    fact asset ContratoCesion is present
    fact Assignor owns InmuebleEmbargado
    fact liability AdeudoJuicio is present
    obligation Assignor must provide DerechosLitigiosos to Assignee.
    obligation Assignee must pay AssignmentPrice to Assignor.
    obligation Assignor must transfer Documentacion to Assignee.
    rule CesionEfectiva
        If asset ContratoCesion is present
        then Assignee may demand DerechosLitigiosos from Assignor.
    rule IncumplimientoCedente
        If Assignor fails to provide DerechosLitigiosos to Assignee
        then Assignee may demand PenaltyFee from Assignor.
    rule IncumplimientoCesionario
        If Assignee fails to pay AssignmentPrice to Assignor
        then Assignor may demand PenaltyFee from Assignee.
    procedure ProcesoCesion:
        Cedente transfers Documentacion to Cesionario.