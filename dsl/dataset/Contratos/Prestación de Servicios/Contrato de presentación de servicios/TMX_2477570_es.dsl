law ServiceContract
authority private
enacted 2023-04-21

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    Client: Client Corp, legal person
    Lender: Lender Corp, legal person

objects
    ServiciosEstimulacion: service
    Honorarios: money

article 1 Generated
    fact asset ContractualRelation is present
    obligation Lender must provide ServiciosEstimulacion to Client.
    obligation Client must pay Honorarios to Lender.
    obligation Lender must perform ReciboHonorarios to Client.
    rule NoticeTermination
        If asset ContractualRelation is present and certification WrittenNotice15Days is present
        then Client may perform Contrato to Lender.
    procedure ContractExecution:
        Lender provides ServiciosEstimulacion to Client.
        Client pays Honorarios to Lender.
    procedure TerminationForBreach:
        Client performs Contrato to Lender.