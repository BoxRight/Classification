law AcuerdoSobreseimientoDel
authority judicial
enacted 2023-09-05

vocabulary
    verb provide: provide

parties
    Judge: Judge Corp, legal person
    Secretary: Secretary Corp, legal person
    AmparoParties: AmparoParties Corp, legal person

objects
    AmparoCase: service
    CaseFile: movable

article 1 Generated
    fact certification SecretaryCertification is present
    rule DismissalRule
        If certification SecretaryCertification is present
        then Judge must provide AmparoCase to AmparoParties.
    procedure DismissalProcedure:
        Judge provides AmparoCase to AmparoParties.
        Judge transfers CaseFile to Secretary.
        Judge provides AmparoCase to AmparoParties.