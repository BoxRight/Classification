law ActaAudienciaConstitucional
authority judicial
enacted 2023-07-28

vocabulary
    verb provide: provide
    verb transfer: transfer

parties
    Judge: Judge Corp, legal person
    Complainant: Complainant Person, natural person
    ThirdPartyAffected: ThirdPartyAffected Person, natural person
    ComplainantAttorney: ComplainantAttorney Person, natural person
    ThirdPartyAttorney: ThirdPartyAttorney Person, natural person
    TribunalSuperiorPresident: TribunalSuperiorPresident Corp, legal person

objects
    ConstitutionalHearing: service
    DocumentaryEvidence: movable
    CertifiedCopy: movable
    JudicialFile: movable
    ProfessionalLicense: movable

article 1 Generated
    fact certification ProfessionalLicenseValidity is present
    fact certification ProfessionalLicenseValidity is present
    fact asset AmparoProceeding is present
    fact liability EvidencePresentationObligation is present
    obligation Complainant must transfer DocumentaryEvidence to Judge.
    privilege Judge may provide ConstitutionalHearing to Complainant.
    rule EvidenceAdmissionRule
        If asset AmparoProceeding is present
        then Complainant must transfer DocumentaryEvidence to Judge.
    procedure ConstitutionalHearingProcedure:
        Judge provides ConstitutionalHearing to Complainant.
        TribunalSuperiorPresident transfers JudicialFile to Judge.
        ComplainantAttorney transfers DocumentaryEvidence to Judge.
        Judge fail ConstitutionalHearing to ComplainantAttorney.

scenario amparo_hearing_scenario:
    at hearing_opened
    at evidence_offered
    at deferment_requested
    at deferment_denied
    at hearing_concluded