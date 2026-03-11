law ContratoObraPor
authority private
enacted 2024-02-02

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Collaborator: Collaborator Person, natural person
    ProducerCompany: ProducerCompany Corp, legal person

objects
    GraphicWork: service
    Payment: money
    Modifications: service

article 1 Generated
    fact asset ContractRelation is present
    obligation Collaborator must provide GraphicWork to ProducerCompany.
    obligation Collaborator must provide Modifications to ProducerCompany.
    obligation ProducerCompany must pay Payment to Collaborator.
    prohibition Collaborator must not provide GraphicWork.
    privilege ProducerCompany may provide GraphicWork to ThirdParties.
    rule WorkCreationRule
        If asset ContractRelation is present
        then Collaborator must provide GraphicWork to ProducerCompany.
    procedure WorkDeliveryProcess:
        Collaborator provides GraphicWork to ProducerCompany.
        Collaborator provides GraphicWork to ProducerCompany.
        ProducerCompany pays Payment to Collaborator.