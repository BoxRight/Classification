law JuicioSucesiónIntestamentaria
authority judicial
enacted 2024-08-08

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Creditor: Creditor Person, natural person
    Deceased: Deceased Person, natural person
    Judge: Judge Person, natural person
    LegalRepresentative: LegalRepresentative Person, natural person
    DeceasedFamily: DeceasedFamily Person, natural person

objects
    Debt: money
    Estate: movable
    Contract: service
    DeathCertificate: service

article 1 Generated
    fact liability OutstandingDebt is present
    fact asset InheritanceEstate is present
    fact certification DebtContract is present
    obligation Deceased must pay Debt to Creditor.
    claim Creditor may demand Debt from Estate.
    rule CreditorSuccessionRight
        If liability OutstandingDebt is present and DeceasedFamily fails to transfer Estate to Judge
        then Creditor may demand Estate from Judge.

scenario creditor_initiated_succession:
    at debtor_death
    at family_fails_to_initiate
    at creditor_files_petition