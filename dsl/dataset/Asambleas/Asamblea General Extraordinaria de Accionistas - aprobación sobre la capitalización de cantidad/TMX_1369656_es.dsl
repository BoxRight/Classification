law AsambleaGeneralExtraordinaria
authority private
enacted 2018-02-01

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Company: Company Corp, legal person
    Shareholders: Shareholders Person, natural person
    President: President Person, natural person
    Secretary: Secretary Person, natural person
    Commissioner: Commissioner Person, natural person
    Delegate: Delegate Person, natural person

objects
    CapitalIncrease: money
    FixedCapitalShares: movable
    VariableCapitalShares: movable
    ShareCertificates: movable

article 1 Generated
    fact asset ShareholderAssembly is present
    fact asset FutureCapitalContributions is present
    obligation Company must perform ExtraordinaryAssembly to Shareholders.
    privilege Shareholders may perform CapitalIncreaseApproval to Company.
    rule CapitalIncreaseRule
        If asset LegallyConstitutedAssembly is present and asset FutureCapitalContributions is present
        then Company may pay CapitalIncrease to Shareholders.
    procedure ExtraordinaryAssemblyProcedure:
        Company performs ExtraordinaryAssembly to Shareholders.
        Shareholders performs ExtraordinaryAssembly to Company.
        Company pays CapitalIncrease to Shareholders.
        Company transfers ShareCertificates to Shareholders.
        Company transfers ShareCertificates to Shareholders.
        Delegate performs AssemblyMinutes to Notary.

scenario capital_increase_scenario:
    at assembly_convocation
    at shareholder_attendance
    at quorum_verification
    at capital_increase_approval
    at share_reallocation
    at delegate_appointment