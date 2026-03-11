law InitialComplaint
authority administrative
enacted 2017-10-27

vocabulary
    verb provide: provide

parties
    Petitioner: Petitioner Person, natural person
    CivilRegistryOfficer: CivilRegistryOfficer Corp, legal person
    LegalRepresentative: LegalRepresentative Person, natural person

objects
    BirthCertificate: service
    CorrectionService: service
    SupportingDocuments: service

article 1 Generated
    fact certification IncorrectBirthRecord is present
    fact certification RequiredDocumentationSubmitted is present
    obligation CivilRegistryOfficer must provide CorrectionService to Petitioner.
    claim Petitioner may demand CorrectionService from CivilRegistryOfficer.
    procedure BirthCertificateCorrectionProcedure:
        Petitioner provides SupportingDocuments to CivilRegistryOfficer.
        Petitioner provides CorrectionService to CivilRegistryOfficer.
        CivilRegistryOfficer provides CorrectionService to LegalRepresentative.
        CivilRegistryOfficer provides BirthCertificate to Petitioner.