law InitialComplaint
authority judicial
enacted 2023-06-22

vocabulary
    verb provide: provide

parties
    Plaintiff: Plaintiff Person, natural person
    Executor: Executor Person, natural person
    DeceasedSeller: DeceasedSeller Person, natural person
    Succession: Succession Corp, legal person

objects
    Property: nonmovable
    PurchasePrice: money
    PurchaseContract: service
    NotarialDeed: service

article 1 Generated
    fact Plaintiff owns Property
    fact asset ValidPurchaseContract is present
    fact liability FormalizeContract is present
    obligation Executor must provide NotarialDeed to Plaintiff.
    claim Plaintiff may demand NotarialDeed from Executor.
    rule ProformaActionRule
        If asset ValidPurchaseContract is present
        then Executor must provide NotarialDeed to Plaintiff.

scenario proforma_action_timeline:
    at Purchase contract signed
    at Purchase price paid
    at Property possession transferred
    at Seller died before deed execution
    at Proforma action filed