law CesiónEjidal(legislación
authority private
enacted 2024-01-12

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Assignor: Assignor Person, natural person
    Assignee: Assignee Person, natural person

objects
    ParcelaEjidal: nonmovable
    DerechosParcelarios: service
    AssignmentPrice: money

article 1 Generated
    fact certification EjidatarioCedente is present
    fact certification EjidatarioCesionario is present
    fact Assignor owns ParcelaEjidal
    fact asset CertificadoParcelario is present
    obligation Assignor must provide DerechosParcelarios to Assignee.
    obligation Assignee must pay AssignmentPrice to Assignor.
    obligation Assignee must perform ObligacionesEjidales to Ejido.
    rule HerederosObligados
        If asset FallecimientoParte is present
        then Herederos must perform CumplimientoContrato to Contraparte.
    procedure ProcesoCesion:
        Assignor performs AvisoCesion to ConyugeHijos.
        Assignor performs AvisoCesion to AsambleaEjidal.
        Assignor provides DerechosParcelarios to Assignee.
        Assignee pays AssignmentPrice to Assignor.