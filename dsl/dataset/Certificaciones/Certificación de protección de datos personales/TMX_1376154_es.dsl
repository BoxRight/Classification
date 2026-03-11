law Certification
authority administrative
enacted 2024-01-12

vocabulary
    verb provide: provide

parties
    Notary: Notary Corp, legal person
    DataSubjects: DataSubjects Person, natural person

objects
    PersonalData: service
    PrivacyNotice: service

article 1 Generated
    fact certification PrivacyNoticeDisplayed is present
    fact certification PrivacyNoticeExplained is present
    obligation Notary must provide PrivacyNotice to DataSubjects.
    obligation Notary must provide PersonalData to DataSubjects.
    rule PrivacyComplianceRule
        If certification NotarialServiceProvision is present
        then Notary must provide PrivacyNotice to DataSubjects.