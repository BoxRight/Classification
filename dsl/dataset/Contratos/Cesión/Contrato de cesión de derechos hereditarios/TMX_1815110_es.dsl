law ContratoCesiónDerechos
authority private
enacted 2024-01-29

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Assignor: Assignor Person, natural person
    Assignee: Assignee Person, natural person

objects
    DerechosHereditarios: service
    AssignmentPrice: money
    GastosHerencia: money

article 1 Generated
    fact certification CalidadHeredero is present
    fact certification DerechoTantoConcedido is present
    obligation Assignor must provide DerechosHereditarios to Assignee.
    obligation Assignee must pay AssignmentPrice to Assignor.
    obligation Assignor must provide DerechosHereditarios to Assignee.
    obligation Assignee must pay GastosHerencia to Assignor.
    rule DevolucionNulidad
        If certification ContratoDeclaradoNulo is present
        then Assignor must pay AssignmentPrice to Assignee.