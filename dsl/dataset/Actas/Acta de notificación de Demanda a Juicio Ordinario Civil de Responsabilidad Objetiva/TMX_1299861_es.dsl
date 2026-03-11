law ActaNotificaciónDemanda
authority judicial
enacted 2024-01-03

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    Plaintiff: Plaintiff Corp, legal person
    DefendantCompany: DefendantCompany Corp, legal person
    CourtOfficer: CourtOfficer Person, natural person
    ReceivingPerson: ReceivingPerson Person, natural person

objects
    LawsuitDocuments: service
    AnswerToLawsuit: service

article 1 Generated
    fact certification LawsuitServed is present
    fact certification ObjectiveLiabilityCase is present
    obligation DefendantCompany must provide AnswerToLawsuit to Plaintiff.
    obligation DefendantCompany must perform Service to Plaintiff.
    rule AnswerDeadlineRule
        If certification LawsuitServed is present
        then DefendantCompany must provide AnswerToLawsuit to Plaintiff.
    procedure LawsuitServiceProcedure:
        CourtOfficer provides LawsuitDocuments to DefendantCompany.