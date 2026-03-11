law CódigoProcedimientosCiviles
authority judicial

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    Petitioner: Petitioner Person, natural person
    Judge: Judge Person, natural person

objects
    DivorcePetition: service
    PropertyDeeds: movable
    MarriageCertificate: movable
    ComplaintAppeal: service

article 1 Generated
    fact asset MaritalProperty is present
    obligation Petitioner must transfer PropertyDeeds to Judge.
    obligation Judge must provide ComplaintAppeal to Petitioner.
    rule PropertyDocumentationRequirement
        If asset MaritalProperty is present
        then Petitioner must transfer PropertyDeeds to Judge.
    rule VerbalWarningRequirement
        If Petitioner fails to transfer PropertyDeeds to Judge
        then Judge must provide ComplaintAppeal to Petitioner.
    procedure ComplaintAppealProcess:
        Petitioner provides ComplaintAppeal to Judge.