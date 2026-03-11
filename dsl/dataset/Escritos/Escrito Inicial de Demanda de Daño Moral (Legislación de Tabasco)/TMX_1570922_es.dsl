law InitialComplaint
authority judicial
enacted 2024-02-15

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Plaintiff: Plaintiff Person, natural person
    Defendant: Defendant Person, natural person
    CivilJudgeTabasco: CivilJudgeTabasco Corp, legal person

objects
    MoralDamage: service
    EconomicCompensation: money

article 1 Generated
    fact liability MoralDamageOccurred is present
    fact certification IllicitConduct is present
    obligation Defendant must pay EconomicCompensation to Plaintiff.
    obligation Defendant must provide MoralDamage to Plaintiff.
    rule MoralDamageCompensationRule
        If certification IllicitConduct is present and liability MoralDamageOccurred is present
        then Defendant must pay EconomicCompensation to Plaintiff.